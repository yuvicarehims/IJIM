package com.ayurvedic.main.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.extractor.WordExtractor;
import org.apache.poi.xwpf.extractor.XWPFWordExtractor;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ayurvedic.main.entity.Submission;
import com.ayurvedic.main.entity.User;
import com.ayurvedic.main.entity.Submission.Status;
import com.ayurvedic.main.service.SubmissionService;
import com.ayurvedic.main.service.UserService;
// PDF Text Extraction imports
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.text.PDFTextStripper;

import java.time.ZonedDateTime;
import java.time.ZoneOffset;

@Controller
@RequestMapping("/author")
public class AuthorController {

    @Autowired
    private SubmissionService submissionService;

    @Autowired
    private UserService userService;

    // ✅ TEXT EXTRACTION METHOD - UPDATED WITH PDF SUPPORT
    private String extractTextFromFile(File file) {
        if (file == null || !file.exists()) {
            return "[File not found]";
        }

        String fileName = file.getName().toLowerCase();
        System.out.println("🔍 Extracting text from: " + fileName);

        try {
            if (fileName.endsWith(".docx")) {
                return extractDocxContent(file);
            } else if (fileName.endsWith(".doc")) {
                return extractDocContent(file);
            } else if (fileName.endsWith(".txt")) {
                return new String(Files.readAllBytes(file.toPath()));
            } else if (fileName.endsWith(".pdf")) {
                return extractPdfContent(file); // ✅ UPDATED TO EXTRACT PDF TEXT
            } else {
                return "[UNSUPPORTED_FILE_FORMAT]";
            }
        } catch (Exception e) {
            System.out.println("❌ Error extracting text: " + e.getMessage());
            return "[ERROR_EXTRACTING_CONTENT: " + e.getMessage() + "]";
        }
    }

    private String extractDocxContent(File file) {
        try (FileInputStream fis = new FileInputStream(file);
             XWPFDocument docx = new XWPFDocument(fis);
             XWPFWordExtractor extractor = new XWPFWordExtractor(docx)) {
            String content = extractor.getText().trim();
            return content.isEmpty() ? "[EMPTY_DOCX_FILE]" : content;
        } catch (Exception e) {
            return "[ERROR_READING_DOCX]";
        }
    }

    private String extractDocContent(File file) {
        try (FileInputStream fis = new FileInputStream(file)) {
            // Try to read as HWPFDocument (old .doc format)
            try {
                HWPFDocument doc = new HWPFDocument(fis);
                WordExtractor extractor = new WordExtractor(doc);
                String content = extractor.getText().trim();
                return content.isEmpty() ? "[EMPTY_DOC_FILE]" : content;
            } catch (Exception e) {
                System.out.println("❌ HWPFDocument failed, trying alternative approach: " + e.getMessage());
                
                // Reset the stream and try alternative approach
                fis.getChannel().position(0);
                
                // Try to read as raw text or basic extraction
                return extractDocContentAlternative(file);
            }
        } catch (Exception e) {
            System.out.println("❌ Final DOC extraction error: " + e.getMessage());
            return "[ERROR_READING_DOC: " + e.getMessage() + "]";
        }
    }

    // ✅ ALTERNATIVE DOC EXTRACTION METHOD
    private String extractDocContentAlternative(File file) {
        try {
            // Read file as binary and look for text content
            byte[] fileBytes = Files.readAllBytes(file.toPath());
            
            // Simple text extraction from binary (basic approach)
            String content = extractTextFromBinary(fileBytes);
            
            if (content != null && !content.trim().isEmpty()) {
                return "[BASIC_EXTRACTION]: " + content.trim();
            } else {
                return "[DOC_EXTRACTION_FAILED - File may be encrypted/corrupted]";
            }
        } catch (Exception e) {
            return "[ALTERNATIVE_DOC_EXTRACTION_FAILED: " + e.getMessage() + "]";
        }
    }

    // ✅ BASIC TEXT EXTRACTION FROM BINARY
    private String extractTextFromBinary(byte[] data) {
        StringBuilder text = new StringBuilder();
        
        // Simple approach: extract readable ASCII characters
        for (byte b : data) {
            if (b >= 32 && b <= 126) { // Printable ASCII range
                text.append((char) b);
            } else if (b == 10 || b == 13) { // Newline characters
                text.append("\n");
            } else if (b == 9) { // Tab characters
                text.append("\t");
            }
        }
        
        String result = text.toString();
        
        // Clean up excessive whitespace
        result = result.replaceAll("\\s+", " ").trim();
        
        return result.length() > 50 ? result : null; // Return only if substantial content found
    }
    
    // ✅ ADDED PROFESSIONAL PDF TEXT EXTRACTION METHOD
    private String extractPdfContent(File file) {
        try (PDDocument document = PDDocument.load(file)) {
            PDFTextStripper pdfStripper = new PDFTextStripper();
            String content = pdfStripper.getText(document).trim();
            return content.isEmpty() ? "[EMPTY_PDF_FILE]" : content;
        } catch (Exception e) {
            return "[ERROR_READING_PDF: " + e.getMessage() + "]";
        }
    }

    // ✅ ADDED: File path handler for live server (same as AdminController)
    private String getUploadBasePath() {
        // For Tomcat live server
        String tomcatBase = System.getProperty("catalina.base");
        if (tomcatBase != null && !tomcatBase.isEmpty()) {
            return tomcatBase + File.separator + "webapps" + File.separator + "uploads" + File.separator;
        }
        // Fallback for local development
        return System.getProperty("user.dir") + File.separator + "uploads" + File.separator;
    }

    // ✅ ADDED: Ensure directory exists
    private void ensureDirectoryExists(String path) {
        File directory = new File(path);
        if (!directory.exists()) {
            directory.mkdirs();
            System.out.println("✅ Created directory: " + path);
        }
    }

    @RequestMapping(value = "/dashboard", method = RequestMethod.GET)
    public String authorDashboard(Model model, Authentication authentication) {
        String email = authentication.getName();
        Optional<User> userOptional = userService.findByEmail(email);
        
        if (userOptional.isPresent()) {
            User author = userOptional.get();
            List<Submission> submissions = submissionService.getUserSubmissions(author);
            model.addAttribute("submissions", submissions);
            model.addAttribute("user", author);
        }
        
        return "author-dashboard";
    }

    @RequestMapping(value = "/submit", method = RequestMethod.POST)
    public String submitPaper(@RequestParam("title") String title,
                              @RequestParam("document") MultipartFile document,
                              @RequestParam(required = false) List<String> authorNames,
                              @RequestParam(required = false) List<String> authorDetails,
                              RedirectAttributes redirectAttributes,
                              Authentication authentication) {
        
        try {
            System.out.println("📤 Starting file upload...");
            System.out.println("📝 Title: " + title);
            System.out.println("📄 File name: " + (document != null ? document.getOriginalFilename() : "null"));
            System.out.println("📦 File size: " + (document != null ? document.getSize() : 0));
            
            // Get current user
            String email = authentication.getName();
            Optional<User> userOptional = userService.findByEmail(email);
            
            if (userOptional.isEmpty()) {
                redirectAttributes.addFlashAttribute("message", "User not found");
                redirectAttributes.addFlashAttribute("messageType", "danger");
                return "redirect:/author/dashboard";
            }
            
            User author = userOptional.get();
            
            // Validate file
            if (document == null || document.isEmpty()) {
                redirectAttributes.addFlashAttribute("message", "Please select a file to upload");
                redirectAttributes.addFlashAttribute("messageType", "danger");
                return "redirect:/author/dashboard";
            }
            
            // Validate file name
            String fileName = document.getOriginalFilename();
            if (fileName == null || fileName.isEmpty()) {
                redirectAttributes.addFlashAttribute("message", "Invalid file name");
                redirectAttributes.addFlashAttribute("messageType", "danger");
                return "redirect:/author/dashboard";
            }
            
            String fileExtension = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
            if (!Arrays.asList("doc", "docx", "pdf", "txt").contains(fileExtension)) {
                redirectAttributes.addFlashAttribute("message", "Only DOC, DOCX, PDF, and TXT files are allowed");
                redirectAttributes.addFlashAttribute("messageType", "danger");
                return "redirect:/author/dashboard";
            }
            
            // Validate file size
            if (document.getSize() > 10 * 1024 * 1024) {
                redirectAttributes.addFlashAttribute("message", "File size must be less than 10MB");
                redirectAttributes.addFlashAttribute("messageType", "danger");
                return "redirect:/author/dashboard";
            }
            
            // Get upload directory using same pattern as AdminController that works on live server
            String uploadDir = getUploadBasePath();
            ensureDirectoryExists(uploadDir);
            
            // Get file extension with dot for filename (e.g., ".pdf")
            int lastDotIndex = fileName.lastIndexOf(".");
            String fileExtensionWithDot = "";
            if (lastDotIndex > 0) {
                fileExtensionWithDot = fileName.substring(lastDotIndex); // includes the dot, e.g., ".pdf"
            } else {
                fileExtensionWithDot = "." + fileExtension; // fallback: add dot to existing extension
            }
            
            // Create submission object first to get the ID
            Submission submission = new Submission();
            submission.setTitle(title);
            submission.setFileSize(document.getSize());
            submission.setAuthor(author);
            submission.setStatus(Status.UNDER_REVIEW);

            // 👉 Save Authors & Details
            submission.setAuthorNames(
                    authorNames != null ? String.join("||", authorNames) : ""
            );
            submission.setAuthorDetails(
                    authorDetails != null ? String.join("||", authorDetails) : ""
            );

            // ✅ SET SYSTEM UTC TIME
            submission.setSubmittedAt(ZonedDateTime.now(ZoneOffset.UTC));
            submission.setUpdatedAt(ZonedDateTime.now(ZoneOffset.UTC));

            // Content extraction removed - only file is stored, not extracted text
            
            // Save submission first to get the ID (primary key)
            submission = submissionService.saveSubmission(submission);
            Long submissionId = submission.getId();
            
            // Get author's full name and clean it for filename
            String authorFullName = author.getFullName() != null ? author.getFullName() : "Author";
            String cleanFullName = authorFullName.replaceAll("[^a-zA-Z0-9]", "_").replaceAll("_+", "_");
            
            // Generate new filename: {fullName}_{submissionId}.{extension}
            String newFileName = cleanFullName + "_" + submissionId + fileExtensionWithDot;
            String newFilePath = uploadDir + newFileName;
            
            // Save file with new filename
            Path destinationPath = Paths.get(newFilePath).toAbsolutePath();
            Files.createDirectories(destinationPath.getParent());
            document.transferTo(destinationPath.toFile());
            
            // Update submission with new filename and file path
            submission.setFileName(newFileName);
            submission.setFilePath(newFilePath);
            submissionService.saveSubmission(submission);
            
            redirectAttributes.addFlashAttribute("message", "Article submitted successfully!");
            redirectAttributes.addFlashAttribute("messageType", "success");
            
        } catch (MaxUploadSizeExceededException e) {
            e.printStackTrace();
            System.out.println("❌ File size exceeded: " + e.getMessage());
            redirectAttributes.addFlashAttribute("message", "File size exceeds the maximum allowed size of 10MB");
            redirectAttributes.addFlashAttribute("messageType", "danger");
            return "redirect:/author/dashboard";
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("❌ IOException during file upload: " + e.getMessage());
            redirectAttributes.addFlashAttribute("message", "Error saving file: " + e.getMessage());
            redirectAttributes.addFlashAttribute("messageType", "danger");
            return "redirect:/author/dashboard";
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("❌ Exception during article submission: " + e.getMessage());
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("message", "Error submitting article: " + (e.getMessage() != null ? e.getMessage() : "Unknown error occurred"));
            redirectAttributes.addFlashAttribute("messageType", "danger");
            return "redirect:/author/dashboard";
        }
        
        return "redirect:/author/dashboard";
    }
}
