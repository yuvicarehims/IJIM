package com.ayurvedic.main.controller;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;



import com.ayurvedic.main.entity.PublishedArticle;
import com.ayurvedic.main.service.PublishedArticleService;

@RestController
@RequestMapping("/article")

public class PublishedArticleController {
@Autowired
    private  PublishedArticleService service;

    @GetMapping("/preview/{id}")
    public ResponseEntity<Resource> previewPdf(@PathVariable Long id) throws IOException {

        PublishedArticle article = service.getById(id);

        File file = new File(article.getPdfPath());

        if (!file.exists()) {
            throw new RuntimeException("PDF not found");
        }

        Resource resource = new UrlResource(file.toURI());

        return ResponseEntity.ok()
                .contentType(MediaType.APPLICATION_PDF)

                // ⭐ THIS ENABLES PREVIEW (NOT DOWNLOAD)
                .header(HttpHeaders.CONTENT_DISPOSITION,
                        "inline; filename=\"" + file.getName() + "\"")

                .body(resource);
    }
}
