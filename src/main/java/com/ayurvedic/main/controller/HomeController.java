package com.ayurvedic.main.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
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
import com.ayurvedic.main.entity.TemplateData;
import com.ayurvedic.main.service.PageContentService;
import com.ayurvedic.main.service.SubmissionService;
import com.ayurvedic.main.service.TemplateDataService;

import jakarta.servlet.ServletContext;

@Controller
public class HomeController {

    @Autowired
    private SubmissionService submissionService;

    @Autowired
    private PageContentService pageContentService;

    @Autowired
    private ServletContext servletContext;
    
    @Autowired
    private TemplateDataService templateDataService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(Model model) {
        // Load dynamic content for home page
       // Map<String, String> content = pageContentService.getPageContentMap("home");
        //model.addAttribute("pageContent", content);
    	TemplateData data = templateDataService.gettempdata11(6L);
    	
    	List<Submission> publishedArticles = submissionService.getPublishedSubmissionsForCurrentQuarter();
    	model.addAttribute("publishedArticles", publishedArticles);
        model.addAttribute("pageContent", data.getContentArea());
        return "home";
    }

    @RequestMapping(value = "/editorial-board", method = RequestMethod.GET)
    public String editorialBoard(Model model) {
        // Load dynamic content for editorial board page
      //  Map<String, String> content = pageContentService.getPageContentMap("editorial-board");
        Map<String, String> contentWithImages = pageContentService.getPageContentMapWithImages("editorial-board");
       // model.addAttribute("pageContent", content);
        TemplateData data = templateDataService.gettempdata11(2L);
        model.addAttribute("pageContent", data.getContentArea());
        model.addAttribute("pageContentWithImages", contentWithImages);
        return "editorial-board1";
    }

    @RequestMapping(value = "/author-guideline", method = RequestMethod.GET)
    public String authorGuideline(Model model) {
        // Load dynamic content for author guideline page
        //Map<String, String> content = pageContentService.getPageContentMap("author-guideline");
        //model.addAttribute("pageContent", content);
    	TemplateData data = templateDataService.gettempdata11(5L);
        model.addAttribute("pageContent", data.getContentArea());
        return "author-guideline1";
    }

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String homePage(Model model) {
        // Load dynamic content for home page
        Map<String, String> content = pageContentService.getPageContentMap("home");
        model.addAttribute("pageContent", content);
        return "index";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        return "login";
    }

    @RequestMapping(value = "/about", method = RequestMethod.GET)
    public String about(Model model) {
        // Load dynamic content for about page
        //Map<String, String> content = pageContentService.getPageContentMap("about");
    	
    	TemplateData data = templateDataService.gettempdata11(1L);
        model.addAttribute("pageContent", data.getContentArea());
        return "about1";
    }

    @RequestMapping(value = "/contact", method = RequestMethod.GET)
    public String contact(Model model) {
    	TemplateData data = templateDataService.gettempdata11(3L);
        model.addAttribute("pageContent", data.getContentArea());
        return "contact1";
    }
    @RequestMapping(value = "/policy", method = RequestMethod.GET)
    public String policy(Model model) {
    	//Map<String, String> policy = pageContentService.getPageContentMap("policy");
       // model.addAttribute("pageContent", policy);
    	TemplateData data = templateDataService.gettempdata11(4L);
        model.addAttribute("pageContent", data.getContentArea());
		return "policy1";
    }
    // Endpoint to preview copyright form in browser
    @GetMapping("/preview/Copyright-form")
    public ResponseEntity<Resource> previewCopyrightForm() throws IOException {
        try {
            // Possible filenames to check
            String[] possibleFilenames = {
                    "Copyright form.pdf",
                    "Copyright form (1).pdf",
                    "Copyright form (2).pdf",
                    "Copyright form (3).pdf",
                    "Copyright form (4).pdf",
                    "Copyright form (5).pdf",
                    "copyright-form.pdf",
                    "Copyright_Form.pdf"
            };

            File file = null;
            String foundFilename = null;

            System.out.println("🔍 Searching for copyright form for preview...");
            System.out.println("Current working directory: " + System.getProperty("user.dir"));
            System.out.println("Catalina base: " + System.getProperty("catalina.base"));
            System.out.println("Catalina home: " + System.getProperty("catalina.home"));

            // Check 1: Try to find the file in various common locations
            String[] uploadPaths = {
                // Production: Standard Tomcat webapps directory (with proper WAR name)
                System.getProperty("catalina.base") + File.separator + "webapps" + File.separator + getWebAppName() + File.separator + "uploads" + File.separator,
                // Production: ROOT directory in Tomcat
                System.getProperty("catalina.base") + File.separator + "webapps" + File.separator + "ROOT" + File.separator + "uploads" + File.separator,
                // Alternative Tomcat location (with proper WAR name)
                System.getProperty("catalina.home") + File.separator + "webapps" + File.separator + getWebAppName() + File.separator + "uploads" + File.separator,
                // Alternative ROOT directory
                System.getProperty("catalina.home") + File.separator + "webapps" + File.separator + "ROOT" + File.separator + "uploads" + File.separator,
                // Development: Project uploads directory (most likely location for domain server)
                System.getProperty("user.dir") + File.separator + "uploads" + File.separator,
                // Deployment-specific: Common location where files are uploaded
                System.getProperty("catalina.base") + File.separator + "temp" + File.separator + "uploads" + File.separator,
                // Relative path (fallback)
                "uploads" + File.separator,
                // Source webapp directory
                System.getProperty("user.dir") + File.separator + "src" + File.separator + "main" + File.separator + "webapp" + File.separator + "uploads" + File.separator
            };
            
            for (String uploadPath : uploadPaths) {
                System.out.println("Checking path: " + uploadPath);
                for (String filename : possibleFilenames) {
                    File tempFile = new File(uploadPath + filename);
                    System.out.println("  -> Trying: " + tempFile.getAbsolutePath());
                    if (tempFile.exists()) {
                        file = tempFile;
                        foundFilename = filename;
                        System.out.println("✅ Found in path: " + uploadPath + filename);
                        break;
                    } else {
                        System.out.println("  -> NOT FOUND: " + tempFile.getAbsolutePath());
                    }
                }
                if (file != null) break;
            }

            // Final check - if still not found, try absolute path from project root
            if (file == null || !file.exists()) {
                System.out.println("❌ Copyright form NOT FOUND in standard locations!");
                System.out.println("Checked filenames: " + String.join(", ", possibleFilenames));

                // Try absolute path from project root (this should work for domain server)
                String projectRootUploads = new File(".").getAbsolutePath() + File.separator + ".." + File.separator + "uploads" + File.separator;
                System.out.println("Trying project root uploads path: " + projectRootUploads);
                
                for (String filename : possibleFilenames) {
                    File tempFile = new File(projectRootUploads + filename);
                    if (tempFile.exists()) {
                        file = tempFile;
                        foundFilename = filename;
                        System.out.println("✅ Found in project root uploads: " + projectRootUploads + filename);
                        break;
                    }
                }
            }

            // Final check - if still not found, try the actual location where the file exists
            if (file == null || !file.exists()) {
                System.out.println("Still not found, trying actual file locations...");
                
                // Check the actual location where we know the file exists (project root uploads)
                String actualUploadsPath = System.getProperty("user.dir").substring(0, System.getProperty("user.dir").lastIndexOf(File.separator)) + File.separator + "uploads" + File.separator;
                System.out.println("Trying actual uploads path: " + actualUploadsPath);
                
                for (String filename : possibleFilenames) {
                    File tempFile = new File(actualUploadsPath + filename);
                    if (tempFile.exists()) {
                        file = tempFile;
                        foundFilename = filename;
                        System.out.println("✅ Found in actual uploads path: " + actualUploadsPath + filename);
                        break;
                    }
                }
            }

            // Final check - if still not found, try current directory directly
            if (file == null || !file.exists()) {
                System.out.println("Still not found, trying current directory...");
                for (String filename : possibleFilenames) {
                    File tempFile = new File(filename); // Try in current working directory
                    if (tempFile.exists()) {
                        file = tempFile;
                        foundFilename = filename;
                        System.out.println("✅ Found in current directory: " + tempFile.getAbsolutePath());
                        break;
                    }
                }
            }

            // Final check - if still not found
            if (file == null || !file.exists()) {
                System.out.println("❌ Copyright form NOT FOUND in any location!");
                
                // List contents of common directories for debugging
                String[] checkDirs = {
                    System.getProperty("catalina.base") + File.separator + "webapps" + File.separator + getWebAppName(),
                    System.getProperty("catalina.base") + File.separator + "webapps" + File.separator + "ROOT",
                    System.getProperty("user.dir"),
                    "uploads"
                };
                
                for (String dirPath : checkDirs) {
                    File dir = new File(dirPath);
                    if (dir.exists() && dir.isDirectory()) {
                        System.out.println("Contents of " + dirPath + ":");
                        File[] files = dir.listFiles();
                        if (files != null) {
                            for (File f : files) {
                                if (f.getName().toLowerCase().contains("copyright")) {
                                    System.out.println("  - " + f.getName() + " (MATCHES!)");
                                } else {
                                    System.out.println("  - " + f.getName());
                                }
                            }
                        }
                    } else {
                        System.out.println("Directory does not exist: " + dirPath);
                    }
                }

                InputStream stream = null;
                for (String filename : possibleFilenames) {
                    String resourcePath = "/uploads/" + filename;
                    try {
                        stream = servletContext != null ? servletContext.getResourceAsStream(resourcePath) : null;
                    } catch (Exception ex) {
                        stream = null;
                    }
                    if (stream != null) {
                        HttpHeaders headers = new HttpHeaders();
                        headers.add(HttpHeaders.CONTENT_DISPOSITION, "inline; filename=\"Copyright form.pdf\"");
                        headers.add(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_PDF_VALUE);
                        headers.add(HttpHeaders.ACCESS_CONTROL_ALLOW_ORIGIN, "*");
                        return ResponseEntity.ok()
                                .headers(headers)
                                .contentType(MediaType.APPLICATION_PDF)
                                .body(new InputStreamResource(stream));
                    }
                }

                return ResponseEntity.notFound().build();
            }

            System.out
                    .println("✅ Successfully found copyright form for preview: " + foundFilename + " at " + file.getAbsolutePath());
            System.out.println("File size: " + file.length() + " bytes");

            // Create InputStreamResource
            InputStreamResource resource = new InputStreamResource(new FileInputStream(file));

            // Set headers - Use "inline" for preview in browser
            HttpHeaders headers = new HttpHeaders();
            headers.add(HttpHeaders.CONTENT_DISPOSITION, "inline; filename=\"Copyright form.pdf\"");
            headers.add(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_PDF_VALUE);
            headers.add(HttpHeaders.ACCESS_CONTROL_ALLOW_ORIGIN, "*");

            return ResponseEntity.ok()
                    .headers(headers)
                    .contentLength(file.length())
                    .contentType(MediaType.APPLICATION_PDF)
                    .body(resource);

        } catch (Exception e) {
            System.err.println("❌ Error serving copyright form preview: " + e.getMessage());
            e.printStackTrace();
            return ResponseEntity.internalServerError().build();
        }
    }

    // Endpoint to preview article PDF in browser
    @GetMapping("/preview/article/{id}")
    public ResponseEntity<Resource> previewArticlePdf(@PathVariable Long id) throws IOException {
        try {
            Submission submission = submissionService.getById(id);
            
            String path = submission.getReferencePdfPath();
            
            if (path == null) {
                throw new RuntimeException("PDF path not found for article ID: " + id);
            }
            
            File file = new File(path);
            
            if (!file.exists()) {
                throw new RuntimeException("PDF file not found on server for article ID: " + id);
            }
            
            System.out.println("✅ Found article PDF for preview: " + file.getAbsolutePath());
            System.out.println("File size: " + file.length() + " bytes");
            
            // Create InputStreamResource
            InputStreamResource resource = new InputStreamResource(new FileInputStream(file));
            
            // Set headers - Use "inline" for preview in browser
            HttpHeaders headers = new HttpHeaders();
            headers.add(HttpHeaders.CONTENT_DISPOSITION, "inline; filename=\"article_" + id + ".pdf\"");
            headers.add(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_PDF_VALUE);
            headers.add(HttpHeaders.ACCESS_CONTROL_ALLOW_ORIGIN, "*");
            
            return ResponseEntity.ok()
                    .headers(headers)
                    .contentLength(file.length())
                    .contentType(MediaType.APPLICATION_PDF)
                    .body(resource);
            
        } catch (Exception e) {
            System.err.println("❌ Error serving article PDF preview: " + e.getMessage());
            e.printStackTrace();
            return ResponseEntity.internalServerError().build();
        }
    }
    
    // Endpoint to serve copyright form
    @GetMapping("/download/Copyright-form")
    public ResponseEntity<Resource> downloadCopyrightForm() throws IOException {
        try {
            // Possible filenames to check
            String[] possibleFilenames = {
                    "Copyright form.pdf",
                    "Copyright form (1).pdf",
                    "Copyright form (2).pdf",
                    "Copyright form (3).pdf",
                    "Copyright form (4).pdf",
                    "Copyright form (5).pdf",
                    "copyright-form.pdf",
                    "Copyright_Form.pdf"
            };

            File file = null;
            String foundFilename = null;

            System.out.println("🔍 Searching for copyright form...");
            System.out.println("Current working directory: " + System.getProperty("user.dir"));
            System.out.println("Catalina base: " + System.getProperty("catalina.base"));
            System.out.println("Catalina home: " + System.getProperty("catalina.home"));

            // Check 1: Try to find the file in various common locations
            String[] uploadPaths = {
                // Production: Standard Tomcat webapps directory (with proper WAR name)
                System.getProperty("catalina.base") + File.separator + "webapps" + File.separator + getWebAppName() + File.separator + "uploads" + File.separator,
                // Production: ROOT directory in Tomcat
                System.getProperty("catalina.base") + File.separator + "webapps" + File.separator + "ROOT" + File.separator + "uploads" + File.separator,
                // Alternative Tomcat location (with proper WAR name)
                System.getProperty("catalina.home") + File.separator + "webapps" + File.separator + getWebAppName() + File.separator + "uploads" + File.separator,
                // Alternative ROOT directory
                System.getProperty("catalina.home") + File.separator + "webapps" + File.separator + "ROOT" + File.separator + "uploads" + File.separator,
                // Development: Project uploads directory (most likely location for domain server)
                System.getProperty("user.dir") + File.separator + "uploads" + File.separator,
                // Deployment-specific: Common location where files are uploaded
                System.getProperty("catalina.base") + File.separator + "temp" + File.separator + "uploads" + File.separator,
                // Relative path (fallback)
                "uploads" + File.separator,
                // Source webapp directory
                System.getProperty("user.dir") + File.separator + "src" + File.separator + "main" + File.separator + "webapp" + File.separator + "uploads" + File.separator
            };
            
            for (String uploadPath : uploadPaths) {
                System.out.println("Checking path: " + uploadPath);
                for (String filename : possibleFilenames) {
                    File tempFile = new File(uploadPath + filename);
                    System.out.println("  -> Trying: " + tempFile.getAbsolutePath());
                    if (tempFile.exists()) {
                        file = tempFile;
                        foundFilename = filename;
                        System.out.println("✅ Found in path: " + uploadPath + filename);
                        break;
                    } else {
                        System.out.println("  -> NOT FOUND: " + tempFile.getAbsolutePath());
                    }
                }
                if (file != null) break;
            }

            // Final check - if still not found, try absolute path from project root
            if (file == null || !file.exists()) {
                System.out.println("❌ Copyright form NOT FOUND in standard locations!");
                System.out.println("Checked filenames: " + String.join(", ", possibleFilenames));

                // Try absolute path from project root (this should work for domain server)
                String projectRootUploads = new File(".").getAbsolutePath() + File.separator + ".." + File.separator + "uploads" + File.separator;
                System.out.println("Trying project root uploads path: " + projectRootUploads);
                
                for (String filename : possibleFilenames) {
                    File tempFile = new File(projectRootUploads + filename);
                    if (tempFile.exists()) {
                        file = tempFile;
                        foundFilename = filename;
                        System.out.println("✅ Found in project root uploads: " + projectRootUploads + filename);
                        break;
                    }
                }
            }

            // Final check - if still not found, try the actual location where the file exists
            if (file == null || !file.exists()) {
                System.out.println("Still not found, trying actual file locations...");
                
                // Check the actual location where we know the file exists (project root uploads)
                String actualUploadsPath = System.getProperty("user.dir").substring(0, System.getProperty("user.dir").lastIndexOf(File.separator)) + File.separator + "uploads" + File.separator;
                System.out.println("Trying actual uploads path: " + actualUploadsPath);
                
                for (String filename : possibleFilenames) {
                    File tempFile = new File(actualUploadsPath + filename);
                    if (tempFile.exists()) {
                        file = tempFile;
                        foundFilename = filename;
                        System.out.println("✅ Found in actual uploads path: " + actualUploadsPath + filename);
                        break;
                    }
                }
            }

            // Final check - if still not found, try current directory directly
            if (file == null || !file.exists()) {
                System.out.println("Still not found, trying current directory...");
                for (String filename : possibleFilenames) {
                    File tempFile = new File(filename); // Try in current working directory
                    if (tempFile.exists()) {
                        file = tempFile;
                        foundFilename = filename;
                        System.out.println("✅ Found in current directory: " + tempFile.getAbsolutePath());
                        break;
                    }
                }
            }

            // Final check - if still not found
            if (file == null || !file.exists()) {
                System.out.println("❌ Copyright form NOT FOUND in any location!");
                
                // List contents of common directories for debugging
                String[] checkDirs = {
                    System.getProperty("catalina.base") + File.separator + "webapps" + File.separator + getWebAppName(),
                    System.getProperty("catalina.base") + File.separator + "webapps" + File.separator + "ROOT",
                    System.getProperty("user.dir"),
                    "uploads"
                };
                
                for (String dirPath : checkDirs) {
                    File dir = new File(dirPath);
                    if (dir.exists() && dir.isDirectory()) {
                        System.out.println("Contents of " + dirPath + ":");
                        File[] files = dir.listFiles();
                        if (files != null) {
                            for (File f : files) {
                                if (f.getName().toLowerCase().contains("copyright")) {
                                    System.out.println("  - " + f.getName() + " (MATCHES!)");
                                } else {
                                    System.out.println("  - " + f.getName());
                                }
                            }
                        }
                    } else {
                        System.out.println("Directory does not exist: " + dirPath);
                    }
                }

                InputStream stream = null;
                for (String filename : possibleFilenames) {
                    String resourcePath = "/uploads/" + filename;
                    try {
                        stream = servletContext != null ? servletContext.getResourceAsStream(resourcePath) : null;
                    } catch (Exception ex) {
                        stream = null;
                    }
                    if (stream != null) {
                        HttpHeaders headers = new HttpHeaders();
                        headers.add(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"Copyright form.pdf\"");
                        headers.add(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_PDF_VALUE);
                        headers.add(HttpHeaders.ACCESS_CONTROL_ALLOW_ORIGIN, "*");
                        return ResponseEntity.ok()
                                .headers(headers)
                                .contentType(MediaType.APPLICATION_PDF)
                                .body(new InputStreamResource(stream));
                    }
                }

                return ResponseEntity.notFound().build();
            }

            System.out
                    .println("✅ Successfully found copyright form: " + foundFilename + " at " + file.getAbsolutePath());
            System.out.println("File size: " + file.length() + " bytes");

            // Create InputStreamResource
            InputStreamResource resource = new InputStreamResource(new FileInputStream(file));

            // Set headers - ALWAYS use "Copyright form.pdf" as the download filename
            HttpHeaders headers = new HttpHeaders();
            headers.add(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"Copyright form.pdf\"");
            headers.add(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_PDF_VALUE);
            headers.add(HttpHeaders.ACCESS_CONTROL_ALLOW_ORIGIN, "*");

            return ResponseEntity.ok()
                    .headers(headers)
                    .contentLength(file.length())
                    .contentType(MediaType.APPLICATION_PDF)
                    .body(resource);

        } catch (Exception e) {
            System.err.println("❌ Error serving copyright form: " + e.getMessage());
            e.printStackTrace();
            return ResponseEntity.internalServerError().build();
        }
    }

    // Helper method to get the web application name
    private String getWebAppName() {
        try {
            String contextPath = System.getProperty("catalina.base");
            if (contextPath != null) {
                File webappsDir = new File(contextPath + File.separator + "webapps");
                if (webappsDir.exists()) {
                    File[] files = webappsDir.listFiles();
                    if (files != null) {
                        // Look for our specific application - try most specific match first
                        // Check for common deployment names in order of likelihood
                        String[] expectedNames = {"ayurvedic", "ayurvedic-1.0.0", "ayuscript", "ayuscript-1.0.0", "ROOT"};
                        
                        for (String expectedName : expectedNames) {
                            for (File file : files) {
                                if (file.isDirectory() && file.getName().toLowerCase().contains(expectedName)) {
                                    return file.getName();
                                }
                            }
                        }
                        
                        // If no specific match found, return the first directory that looks like an app
                        for (File file : files) {
                            if (file.isDirectory() && !file.getName().equals("ROOT") && !file.getName().startsWith("_")) {
                                return file.getName();
                            }
                        }
                    }
                }
            }
            
            // Fallback: try to get from the current working directory
            String currentDir = new File(".").getCanonicalPath();
            String[] parts = currentDir.split(File.separator);
            if (parts.length > 0) {
                String lastPart = parts[parts.length - 1];
                if (lastPart.toLowerCase().contains("ayuscript") || lastPart.toLowerCase().contains("ayurvedic")) {
                    return lastPart;
                }
            }
            
            // Default fallback name
            return "ayurvedic"; // Use the artifact ID from pom.xml
        } catch (Exception e) {
            System.out.println("Could not determine web app name, using default: ayurvedic");
            return "ayurvedic";
        }
    }

}
