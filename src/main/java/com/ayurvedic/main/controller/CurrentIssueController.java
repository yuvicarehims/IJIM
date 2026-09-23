package com.ayurvedic.main.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ayurvedic.main.entity.Submission;
import com.ayurvedic.main.service.SubmissionService;

@Controller
public class CurrentIssueController {

    @Autowired
    private SubmissionService submissionService;

    @RequestMapping(value = "/current-issue", method = RequestMethod.GET)
    public String currentIssue(Model model) {
        // Get articles from previous quarter for current quarter display
        List<Submission> publishedArticles = submissionService.getPublishedSubmissionsForCurrentQuarter();
        // Get current quarter information for display
        java.util.Map<String, Object> quarterInfo = submissionService.getCurrentQuarterInfo();

        model.addAttribute("publishedArticles", publishedArticles);
        model.addAttribute("quarterInfo", quarterInfo);
        return "current-issues";
    }

    // REMOVE THIS DUPLICATE METHOD - KEEP ONLY ONE METHOD FOR /article/{id}
    /*
     * @GetMapping("/article/{id}")
     * public String viewArticle(@PathVariable Long id, Model model) {
     * Optional<Submission> articleOpt = submissionService.getSubmissionById(id);
     * if (articleOpt.isPresent() &&
     * "PUBLISHED".equals(articleOpt.get().getStatus())) {
     * model.addAttribute("article", articleOpt.get());
     * return "article-view";
     * }
     * return "redirect:/current-issue";
     * }
     */

    // KEEP THIS METHOD FOR FULL ARTICLE VIEW
    @RequestMapping(value = "/article/{id}", method = RequestMethod.GET)
    public String viewFullArticle(@PathVariable Long id, Model model) {
        Optional<Submission> articleOpt = submissionService.getSubmissionById(id);
        if (articleOpt.isPresent()) {
            Submission article = articleOpt.get();
            // Check if article is UNDER_PUBLISHED (only these show on current issue)
            if (article.getStatus() != null && "UNDER_PUBLISHED".equals(article.getStatus().name())) {
                model.addAttribute("article", article);
                return "published_view"; // This will show full article with all fields
            }
        }
        return "redirect:/current-issue";
    }

    @RequestMapping(value = "/article/{id}/abstract", method = RequestMethod.GET)
    public String viewAbstract(@PathVariable Long id, Model model) {
        Optional<Submission> articleOpt = submissionService.getSubmissionById(id);
        if (articleOpt.isPresent()) {
            Submission article = articleOpt.get();
            // Check if article is UNDER_PUBLISHED (only these show on current issue)
            if (article.getStatus() != null && "UNDER_PUBLISHED".equals(article.getStatus().name())) {
                model.addAttribute("article", article);
                return "abstract-view"; // This will show only abstract
            }
        }
        return "redirect:/current-issue";
    }

    // ✅ PUBLIC DOWNLOAD ENDPOINT - Anyone can access
    @RequestMapping(value = "/download/{id}", method = RequestMethod.GET)
    public ResponseEntity<InputStreamResource> downloadPublishedArticle(@PathVariable Long id) throws IOException {
        Optional<Submission> articleOpt = submissionService.getSubmissionById(id);

        // Check if article exists and is published
        if (articleOpt.isEmpty() || !"UNDER_PUBLISHED".equals(articleOpt.get().getStatus().name())) {
            return ResponseEntity.notFound().build();
        }

        Submission article = articleOpt.get();
        File file = new File(article.getReferencePdfPath());

        // Check if file exists
        if (!file.exists()) {
            System.out.println("❌ File not found: " + article.getReferencePdfPath());
            return ResponseEntity.notFound().build();
        }

        String downloadFileName = "article_" + article.getId() + ".pdf";
        String contentType = Files.probeContentType(file.toPath());
        if (contentType == null) {
            contentType = "application/pdf";
        }

        InputStream inputStream = new FileInputStream(file);

        System.out.println(
                "✅ Serving file for download: " + downloadFileName + " from: " + article.getReferencePdfPath());

        return ResponseEntity.ok()
                .contentType(MediaType.parseMediaType(contentType))
                .header(HttpHeaders.CONTENT_DISPOSITION,
                        "attachment; filename=\"" + downloadFileName + "\"")
                .body(new InputStreamResource(inputStream));
    }

    // ✅ PUBLIC VIEW ENDPOINT - Display PDF directly in browser
    @RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
    public ResponseEntity<InputStreamResource> viewPublishedArticle(@PathVariable Long id) throws IOException {
        Optional<Submission> articleOpt = submissionService.getSubmissionById(id);

        // Check if article exists and is published
        if (articleOpt.isEmpty() || !"UNDER_PUBLISHED".equals(articleOpt.get().getStatus().name())) {
            return ResponseEntity.notFound().build();
        }

        Submission article = articleOpt.get();
        File file = new File(article.getReferencePdfPath());

        // Check if file exists
        if (!file.exists()) {
            System.out.println("❌ File not found: " + article.getReferencePdfPath());
            return ResponseEntity.notFound().build();
        }

        String downloadFileName = "article_" + article.getId() + ".pdf";
        String contentType = Files.probeContentType(file.toPath());
        if (contentType == null) {
            contentType = "application/pdf";
        }

        InputStream inputStream = new FileInputStream(file);

        System.out.println(
                "✅ Serving file for browser viewing: " + downloadFileName + " from: " + article.getReferencePdfPath());

        return ResponseEntity.ok()
                .contentType(MediaType.parseMediaType(contentType))
                .header(HttpHeaders.CONTENT_DISPOSITION,
                        "inline; filename=\"" + downloadFileName + "\"")
                .body(new InputStreamResource(inputStream));
    }

    // ✅ PDF VIEWER PAGE - Opens PDF in embedded viewer
    @RequestMapping(value = "/pdf-viewer/{id}", method = RequestMethod.GET)
    public String pdfViewer(@PathVariable Long id, Model model) {
        Optional<Submission> articleOpt = submissionService.getSubmissionById(id);

        // Check if article exists and is published
        if (articleOpt.isEmpty() || !"UNDER_PUBLISHED".equals(articleOpt.get().getStatus().name())) {
            return "redirect:/current-issue";
        }

        Submission article = articleOpt.get();
        model.addAttribute("article", article);
        model.addAttribute("pdfUrl", "/view/" + id);
        return "pdf-viewer";
    }

    @RequestMapping(value = "/preview/{id}", method = RequestMethod.GET)
    public ResponseEntity<Resource> previewPdf(@PathVariable Long id) throws IOException {

        Submission submission = submissionService.getById(id);

        String path = submission.getReferencePdfPath();

        if (path == null) {
            throw new RuntimeException("PDF path not found");
        }

        File file = new File(path);

        if (!file.exists()) {
            throw new RuntimeException("PDF file not found on server");
        }

        Resource resource = new UrlResource(file.toURI());

        return ResponseEntity.ok()
                .contentType(MediaType.APPLICATION_PDF)

                // ⭐ THIS LINE MAKES PREVIEW IN BROWSER
                .header(HttpHeaders.CONTENT_DISPOSITION,
                        "inline; filename=\"" + file.getName() + "\"")

                .body(resource);
    }

}