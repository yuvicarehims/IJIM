package com.ayurvedic.main.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.time.LocalDate;
import java.time.ZoneOffset;
import java.time.ZonedDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

// PDF Text Extraction imports
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.text.PDFTextStripper;
import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.extractor.WordExtractor;
import org.apache.poi.xwpf.extractor.XWPFWordExtractor;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import jakarta.transaction.Transactional;

import com.ayurvedic.main.entity.ArticleType;
import com.ayurvedic.main.entity.ContentTemplate;
import com.ayurvedic.main.entity.Issue;
import com.ayurvedic.main.entity.PublishedArticle;
import com.ayurvedic.main.entity.Submission;
import com.ayurvedic.main.entity.Submission.Status;
import com.ayurvedic.main.entity.TemplateData;
import com.ayurvedic.main.entity.Volume;
import com.ayurvedic.main.repository.ArticleTypeRepository;
import com.ayurvedic.main.repository.IssueRepository;
import com.ayurvedic.main.repository.PublishedArticleRepository;
import com.ayurvedic.main.repository.SubmissionRepository;
import com.ayurvedic.main.repository.VolumeRepository;
import com.ayurvedic.main.service.ContentTemplateService;
import com.ayurvedic.main.service.EmailService;
import com.ayurvedic.main.service.SubmissionService;
import com.ayurvedic.main.service.TemplateDataService;
import com.ayurvedic.main.entity.User;
import com.ayurvedic.main.entity.PageContent;
import com.ayurvedic.main.service.PageContentService;
// PDF imports
import com.lowagie.text.Document;
import com.lowagie.text.Font;
import com.lowagie.text.Paragraph;
import com.lowagie.text.pdf.PdfWriter;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private SubmissionService submissionService;
	@Autowired
	private PublishedArticleRepository publishedRepo;
	@Autowired
	private EmailService emailService;
	@Autowired
	ArticleTypeRepository atRepo;
	@Autowired
	VolumeRepository volRepo;
	@Autowired
	IssueRepository issueRepo;
	@Autowired
	private SubmissionRepository submissionRepository;
	@Autowired
	private com.ayurvedic.main.service.UserService userService;
	@Autowired
	private com.ayurvedic.main.repository.ContactEnquiryRepository contactEnquiryRepository;
	
	@Autowired
	private PageContentService pageContentService;
	
	@Autowired
	private ContentTemplateService contentTemplateService;
	
	@Autowired
	private TemplateDataService templateDataService;

	// ✅ TEXT EXTRACTION METHODS - UPDATED WITH PDF SUPPORT
	private String extractTextFromFile(File file) {
		if (file == null || !file.exists()) {
			return "File not found";
		}

		String fileName = file.getName().toLowerCase();

		try {
			if (fileName.endsWith(".docx")) {
				return extractDocxContent(file);
			} else if (fileName.endsWith(".doc")) {
				return extractDocContent(file);
			} else if (fileName.endsWith(".txt")) {
				return new String(Files.readAllBytes(file.toPath()));
			} else if (fileName.endsWith(".pdf")) {
				return extractPdfContent(file); // ✅ ADDED PDF SUPPORT
			} else {
				return "Unsupported file format";
			}
		} catch (Exception e) {
			return "Error reading file: " + e.getMessage();
		}
	}

	private String extractDocxContent(File file) {
		try (FileInputStream fis = new FileInputStream(file);
				XWPFDocument docx = new XWPFDocument(fis);
				XWPFWordExtractor extractor = new XWPFWordExtractor(docx)) {

			String content = extractor.getText().trim();
			return content.isEmpty() ? "Empty document" : content;

		} catch (Exception e) {
			return "Error reading DOCX file";
		}
	}

	private String extractDocContent(File file) {
		try (FileInputStream fis = new FileInputStream(file)) {
			// Try to read as HWPFDocument (old .doc format)
			try {
				HWPFDocument doc = new HWPFDocument(fis);
				WordExtractor extractor = new WordExtractor(doc);
				String content = extractor.getText().trim();
				return content.isEmpty() ? "Empty document" : content;
			} catch (Exception e) {
				System.out.println("❌ HWPFDocument failed, trying alternative approach: " + e.getMessage());

				// Reset the stream and try alternative approach
				fis.getChannel().position(0);

				// Try to read as raw text or basic extraction
				return extractDocContentAlternative(file);
			}
		} catch (Exception e) {
			System.out.println("❌ Final DOC extraction error: " + e.getMessage());
			return "Error reading DOC file: " + e.getMessage();
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
				return "Extracted text (basic method):\n" + content.trim();
			} else {
				return "DOC file detected but text extraction failed. File may be encrypted, corrupted, or in an unsupported format.";
			}
		} catch (Exception e) {
			return "Alternative DOC extraction failed: " + e.getMessage();
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
			return content.isEmpty() ? "Empty PDF document" : content;
		} catch (Exception e) {
			return "Error reading PDF file: " + e.getMessage();
		}
	}

	// ===========================
	// 🔹 ADMIN DASHBOARD
	// ===========================
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String adminLogin() {
		return "admin-login";
	}

	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public String adminDashboard(Model model) {
		List<Submission> submissions = submissionService.getAllSubmissions();

		long totalSubmissions = submissions.size();
		long pendingSubmissions = submissions.stream()
				.filter(s -> s.getStatus() == Submission.Status.SUBMITTED)
				.count();
		long reviewedSubmissions = submissions.stream()
				.filter(s -> s.getStatus() == Submission.Status.REVIEWED)
				.count();

		// ✅ FIX: Published count should come from PublishedArticleRepository, not
		// submissions
		long publishedSubmissions = submissions.stream()
				.filter(s -> s.getStatus() == Submission.Status.PUBLISHED)
				.count();
		model.addAttribute("submissions", submissions);
		model.addAttribute("totalSubmissions", totalSubmissions);
		model.addAttribute("pendingSubmissions", pendingSubmissions);
		model.addAttribute("reviewedSubmissions", reviewedSubmissions);
		model.addAttribute("publishedSubmissions", publishedSubmissions);

		return "admin-dashboard";
	}

	@RequestMapping(value = "/submissions", method = RequestMethod.GET)
	public String viewSubmissions(Model model) {

		List<Submission> submissions = submissionService.getAllSubmissions();

		long total = submissions.size();

		long reviewCount = submissions.stream()
				.filter(s -> s.getStatus() == Submission.Status.UNDER_REVIEW
						|| s.getStatus() == Submission.Status.SUBMITTED
						|| s.getStatus() == Submission.Status.REVIEWED)
				.count();
		long editingCount = submissions.stream().filter(s -> s.getStatus() == Submission.Status.UNDER_EDITING).count();
		long acceptedCount = submissions.stream()
				.filter(s -> s.getStatus() == Submission.Status.UNDER_ACCEPTED
						|| s.getStatus() == Submission.Status.APPROVED)
				.count();
		long publishedCount = submissions.stream()
				.filter(s -> s.getStatus() == Submission.Status.UNDER_PUBLISHED
						|| s.getStatus() == Submission.Status.PUBLISHED)
				.count();
		long rejectedCount = submissions.stream()
				.filter(s -> s.getStatus() == Submission.Status.UNDER_REJECTED
						|| s.getStatus() == Submission.Status.REJECTED)
				.count();

		model.addAttribute("submissions", submissions);
		model.addAttribute("totalSubmissions", total);
		model.addAttribute("reviewSubmissions", reviewCount);
		model.addAttribute("editingSubmissions", editingCount);
		model.addAttribute("acceptedSubmissions", acceptedCount);
		model.addAttribute("publishedSubmissions", publishedCount);
		model.addAttribute("rejectedSubmissions", rejectedCount);

		return "admin_submissions";
	}

	@RequestMapping(value = "/submissions1", method = RequestMethod.GET)
	public String viewSubmissions1(Model model) {

		List<Submission> submissions = submissionService.getAllSubmissions();

		long total = submissions.size();

		long reviewCount = submissions.stream()
				.filter(s -> s.getStatus() == Submission.Status.UNDER_REVIEW
						|| s.getStatus() == Submission.Status.SUBMITTED
						|| s.getStatus() == Submission.Status.REVIEWED)
				.count();
		long editingCount = submissions.stream().filter(s -> s.getStatus() == Submission.Status.UNDER_EDITING).count();
		long acceptedCount = submissions.stream()
				.filter(s -> s.getStatus() == Submission.Status.UNDER_ACCEPTED
						|| s.getStatus() == Submission.Status.APPROVED)
				.count();
		long publishedCount = submissions.stream()
				.filter(s -> s.getStatus() == Submission.Status.UNDER_PUBLISHED
						|| s.getStatus() == Submission.Status.PUBLISHED)
				.count();
		long rejectedCount = submissions.stream()
				.filter(s -> s.getStatus() == Submission.Status.UNDER_REJECTED
						|| s.getStatus() == Submission.Status.REJECTED)
				.count();

		model.addAttribute("submissions", submissions);
		model.addAttribute("totalSubmissions", total);
		model.addAttribute("reviewSubmissions", reviewCount);
		model.addAttribute("editingSubmissions", editingCount);
		model.addAttribute("acceptedSubmissions", acceptedCount);
		model.addAttribute("publishedSubmissions", publishedCount);
		model.addAttribute("rejectedSubmissions", rejectedCount);

		return "paperSubmission";
	}

	// ===========================
	// 🔹 DOWNLOAD FILE (EDITED PDF OR ORIGINAL) - FIXED STATUS CHANGE
	// ===========================
	@RequestMapping(value = "/download/{id}", method = RequestMethod.GET)
	public ResponseEntity<InputStreamResource> downloadFile(@PathVariable Long id) throws IOException {
		Optional<Submission> submissionOpt = submissionService.getSubmissionById(id);
		if (submissionOpt.isEmpty()) {
			return ResponseEntity.notFound().build();
		}

		Submission submission = submissionOpt.get();

		// ✅ FIX: Use enum comparison instead of string
		if (submission.getStatus() == Submission.Status.SUBMITTED) {
			submission.setStatus(Submission.Status.REVIEWED);
			submissionService.saveSubmission(submission);
		}

		File file = new File(submission.getFilePath());
		if (!file.exists()) {
			return ResponseEntity.notFound().build();
		}

		String downloadFileName = submission.getFileName();
		String contentType = Files.probeContentType(file.toPath());
		if (contentType == null) {
			contentType = "application/octet-stream";
		}

		InputStream inputStream = new FileInputStream(file);

		return ResponseEntity.ok()
				.contentType(MediaType.parseMediaType(contentType))
				.header(HttpHeaders.CONTENT_DISPOSITION,
						"attachment; filename=\"" + downloadFileName + "\"")
				.body(new InputStreamResource(inputStream));
	}

	// ===========================
	// 🔹 EDIT SUBMISSION PAGE - UPDATED WITH PDF SUPPORT
	// ===========================
	@RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
	public String editSubmissionPage(@PathVariable Long id, Model model) {
		Submission submission = submissionService.getSubmissionById(id)
				.orElseThrow(() -> new RuntimeException("Submission not found"));

		String content = "";
		boolean canEdit = false;

		File file = new File(submission.getFilePath());

		if (file.exists()) {
			content = extractTextFromFile(file);
			String fileName = submission.getFileName().toLowerCase();
			// ✅ UPDATED TO INCLUDE PDF FILES FOR EDITING
			if (fileName.endsWith(".docx") || fileName.endsWith(".doc") || fileName.endsWith(".txt")
					|| fileName.endsWith(".pdf")) {
				canEdit = true;
			}
		} else {
			content = "File not found";
		}

		model.addAttribute("submission", submission);
		model.addAttribute("fileContent", content);
		model.addAttribute("canEdit", canEdit);

		return "admin-edit";
	}

	// ===========================
	// 🔹 UPDATE & PUBLISH WITH PDF CREATION
	// ===========================
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updateAndPublishSubmission(@RequestParam Long id,
			@RequestParam String title,
			@RequestParam String content,
			Authentication authentication) {

		String editedBy = authentication != null ? authentication.getName() : "Admin";

		Submission submission = submissionService.getSubmissionById(id)
				.orElseThrow(() -> new RuntimeException("Submission not found"));

		try {
			// ✅ CREATE PDF FILE WITH EDITED CONTENT
			String originalFilePath = submission.getFilePath();
			String pdfFilePath = createPdfFile(originalFilePath, content, title, editedBy);

			// ✅ UPDATE SUBMISSION WITH EDITED CONTENT AND PDF FILE
			submission.setTitle(title);
			submission.setContent(content);
			submission.setEditedContent(content);
			submission.setEditedBy(editedBy);
			submission.setEditedAt(ZonedDateTime.now());

			// ✅ UPDATE FILE PATH TO POINT TO PDF VERSION
			submission.setFilePath(pdfFilePath);
			submission.setFileName("PUBLISHED_" + title.replaceAll("[^a-zA-Z0-9]", "_") + ".pdf");

			// ✅ PUBLISH to Current-issue
			submission.setStatus(Status.PUBLISHED);

			submissionService.saveSubmission(submission);

			System.out.println("✅ Published with PDF file: " + pdfFilePath);

		} catch (Exception e) {
			System.out.println("❌ Error creating PDF file: " + e.getMessage());
			// Fallback: update without PDF creation
			submission.setTitle(title);
			submission.setContent(content);
			submission.setEditedContent(content);
			submission.setEditedBy(editedBy);
			submission.setEditedAt(ZonedDateTime.now());
			submission.setStatus(Status.PUBLISHED);
			submissionService.saveSubmission(submission);
		}

		return "redirect:/admin/dashboard?published=true";
	}

	// ✅ PROFESSIONAL PDF CREATION METHOD
	private String createPdfFile(String originalFilePath, String content, String title, String editedBy)
			throws IOException {
		File originalFile = new File(originalFilePath);
		String originalDir = originalFile.getParent();

		// Create PDF filename
		String pdfFileName = "AYUSCRIPT_" + System.currentTimeMillis() + "_" +
				title.replaceAll("[^a-zA-Z0-9.-]", "_") + ".pdf";
		String pdfFilePath = originalDir + File.separator + pdfFileName;

		// Create PDF document
		try {
			Document document = new Document();
			PdfWriter.getInstance(document, new FileOutputStream(pdfFilePath));
			document.open();

			// ===== PROFESSIONAL HEADER =====
			// Journal Title
			Font journalFont = new Font(Font.HELVETICA, 16, Font.BOLD);
			Paragraph journalPara = new Paragraph("AYUSCRIPT", journalFont);
			journalPara.setAlignment(Paragraph.ALIGN_CENTER);
			journalPara.setSpacingAfter(5);
			document.add(journalPara);

			// Journal Subtitle
			Font subtitleFont = new Font(Font.HELVETICA, 10, Font.ITALIC);
			Paragraph subtitlePara = new Paragraph("International Journal for Empirical Research in Ayurveda",
					subtitleFont);
			subtitlePara.setAlignment(Paragraph.ALIGN_CENTER);
			subtitlePara.setSpacingAfter(15);
			document.add(subtitlePara);

			// Separator line
			Paragraph separator = new Paragraph("____________________________________________________________");
			separator.setAlignment(Paragraph.ALIGN_CENTER);
			separator.setSpacingAfter(20);
			document.add(separator);

			// ===== ARTICLE TITLE =====
			Font titleFont = new Font(Font.HELVETICA, 18, Font.BOLD);
			Paragraph titlePara = new Paragraph(title, titleFont);
			titlePara.setAlignment(Paragraph.ALIGN_CENTER);
			titlePara.setSpacingAfter(30);
			document.add(titlePara);

			// ===== CLEAN CONTENT =====
			String cleanContent = cleanHtmlContent(content);

			Font contentFont = new Font(Font.TIMES_ROMAN, 12);
			Paragraph contentPara = new Paragraph(cleanContent, contentFont);
			contentPara.setAlignment(Paragraph.ALIGN_JUSTIFIED);
			contentPara.setSpacingBefore(10);
			document.add(contentPara);

			// ===== PROFESSIONAL FOOTER =====
			document.newPage(); // New page for footer

			Font footerFont = new Font(Font.HELVETICA, 9, Font.ITALIC);
			Paragraph footerPara = new Paragraph(
					"Published in AYUSCRIPT - International Journal for Empirical Research in Ayurveda\n" +
							"ISSN: 2583-3677 | www.ayuscript.com");
			footerPara.setAlignment(Paragraph.ALIGN_CENTER);
			footerPara.setSpacingBefore(20);
			document.add(footerPara);

			document.close();

			System.out.println("✅ Created professional PDF file: " + pdfFilePath);
			return pdfFilePath;

		} catch (Exception e) {
			System.out.println("❌ Error creating PDF: " + e.getMessage());
			throw new IOException("Failed to create PDF: " + e.getMessage());
		}
	}

	// ✅ METHOD TO CLEAN HTML CONTENT
	private String cleanHtmlContent(String htmlContent) {
		if (htmlContent == null) {
			return "";
		}

		// Remove HTML tags but keep the text content
		String cleanText = htmlContent
				.replaceAll("<[^>]*>", "") // Remove all HTML tags
				.replaceAll("&nbsp;", " ") // Replace HTML spaces
				.replaceAll("&amp;", "&") // Replace HTML entities
				.replaceAll("&lt;", "<")
				.replaceAll("&gt;", ">")
				.replaceAll("&quot;", "\"")
				.replaceAll("&#39;", "'")
				.replaceAll("\\s+", " ") // Normalize multiple spaces
				.trim();

		// Remove editor metadata if present
		cleanText = cleanText
				.replaceAll("Edited and Published by:.*?\\|.*?\\d{4}-\\d{2}-\\d{2}T\\d{2}:\\d{2}:\\d{2}\\.\\d+", "");

		return cleanText;
	}

	// ===========================
	// 🔹 PUBLISH TO CURRENT ISSUE - UPDATED WITH PDF FIX
	// ===========================
	@RequestMapping(value = "/publish", method = RequestMethod.POST)
	public String publish(@RequestParam Long submissionId,
			@RequestParam String title,
			@RequestParam String htmlContent,
			@RequestParam String abstractText,
			Model model) {

		try {
			// Get the submission
			Submission submission = submissionService.getSubmissionWithContent(submissionId).orElseThrow();

			PublishedArticle pa = new PublishedArticle();
			pa.setTitle(title);
			pa.setHtmlContent(htmlContent);
			pa.setAbstractText(abstractText);

			// ✅ ALWAYS CREATE PDF FOR CURRENT ISSUE
			try {
				String pdfFilePath = createPdfFile(submission.getFilePath(), htmlContent, title, "System");

				// ✅ FIX: Store the absolute file path properly
				pa.setPdfPath(pdfFilePath);
				System.out.println("✅ PDF created for current issue: " + pdfFilePath);
				System.out.println("✅ PDF path stored in database: " + pdfFilePath);

			} catch (Exception e) {
				System.out.println("❌ PDF creation failed: " + e.getMessage());
				pa.setPdfPath(""); // Set empty if PDF creation fails
			}

			publishedRepo.save(pa);

			Submission s = submissionService.getSubmissionWithContent(submissionId).orElseThrow();
			s.setStatus(Submission.Status.PUBLISHED);
			submissionService.saveSubmission(s);

			return "redirect:/admin/previous-volumes-issues?message=Published+Successfully";

		} catch (Exception e) {
			System.out.println("❌ Error during publishing: " + e.getMessage());
			return "redirect:/admin/previous-volumes-issues?error=Publishing+Failed";
		}
	}

	// ===========================
	// 🔹 SEND EMAIL TO AUTHOR WITH ATTACHMENTS - UPDATED
	// ===========================
	@RequestMapping(value = "/send-mail", method = RequestMethod.POST)
	public String sendEmailToAuthor(@RequestParam Long id,
			@RequestParam String to,
			@RequestParam String subject,
			@RequestParam String message,
			@RequestParam(value = "attachments", required = false) List<MultipartFile> attachments,
			Model model) {

		try {
			Submission submission = submissionService.getSubmissionById(id)
					.orElseThrow(() -> new RuntimeException("Submission not found"));

			List<File> tempFiles = new ArrayList<>();

			// Process attachments if any
			if (attachments != null && !attachments.isEmpty()) {
				for (MultipartFile multipartFile : attachments) {
					if (!multipartFile.isEmpty()) {
						// Create temporary file
						File tempFile = File.createTempFile("attachment_", "_" + multipartFile.getOriginalFilename());
						multipartFile.transferTo(tempFile);
						tempFiles.add(tempFile);
						System.out.println("✅ Processed attachment: " + multipartFile.getOriginalFilename());
					}
				}
			}

			// Send email with attachments
			emailService.sendEmailToAuthorWithAttachment(
					to,
					submission.getAuthor().getFullName(),
					subject,
					message,
					submission.getTitle(),
					tempFiles);

			// Clean up temporary files
			for (File tempFile : tempFiles) {
				tempFile.delete();
			}

			return "redirect:/admin/submissions?message=Email+sent+successfully";

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("❌ Error sending email: " + e.getMessage());
			return "redirect:/admin/submissions?error=Failed+to+send+email:+" + e.getMessage().replace(" ", "+");
		}
	}

	// ===================================================
	// UPDATED PAPER REVIEW GET MAPPING (IMPORTANT)
	// ===================================================
	@GetMapping("/paper-review")
	public String paperReview(
			@RequestParam(required = false) Long submissionId,
			@RequestParam(required = false) Long authorId,
			Model model) {

		// ✅ Load from master tables
		List<ArticleType> articleTypes = atRepo.findAll();
		List<Volume> volumes = volRepo.findAll();
		List<Issue> issues = issueRepo.findAll();

		// ✅ If DB empty (first time), seed defaults
		if (articleTypes.isEmpty()) {
			ArticleType t1 = new ArticleType();
			t1.setName("Original Article");
			atRepo.save(t1);

			ArticleType t2 = new ArticleType();
			t2.setName("Review Article");
			atRepo.save(t2);

			ArticleType t3 = new ArticleType();
			t3.setName("Case Report");
			atRepo.save(t3);

			ArticleType t4 = new ArticleType();
			t4.setName("Short Communication");
			atRepo.save(t4);

			ArticleType t5 = new ArticleType();
			t5.setName("Editorial");
			atRepo.save(t5);

			ArticleType t6 = new ArticleType();
			t6.setName("Letter to Editor");
			atRepo.save(t6);

			// reload from DB so model gets full list
			articleTypes = atRepo.findAll();
		}
		if (volumes.isEmpty()) {
			Volume v1 = new Volume();
			v1.setName("Volume 1");
			volRepo.save(v1);
			Volume v2 = new Volume();
			v2.setName("Volume 2");
			volRepo.save(v2);
			Volume v3 = new Volume();
			v3.setName("Volume 3");
			volRepo.save(v3);
			Volume v4 = new Volume();
			v4.setName("Volume 4");
			volRepo.save(v4);
			Volume v5 = new Volume();
			v5.setName("Volume 5");
			volRepo.save(v5);
			Volume v6 = new Volume();
			v6.setName("Volume 6");
			volRepo.save(v6);

			volumes = volRepo.findAll();
		}

		if (issues.isEmpty()) {
			Issue i1 = new Issue();
			i1.setName("Issue 1");
			issueRepo.save(i1);
			Issue i2 = new Issue();
			i2.setName("Issue 2");
			issueRepo.save(i2);
			Issue i3 = new Issue();
			i3.setName("Issue 3");
			issueRepo.save(i3);
			Issue i4 = new Issue();
			i4.setName("Issue 4");
			issueRepo.save(i4);

			issues = issueRepo.findAll();
		}

		model.addAttribute("articleTypes", articleTypes);
		model.addAttribute("volumes", volumes);
		model.addAttribute("issues", issues);

		// 🔽 your existing submissionId / authorId logic
		if (submissionId != null) {
			Submission sub = submissionService.getSubmissionById(submissionId).orElse(null);

			if (sub != null) {
				// ✅ Block access if article is PUBLISHED (allow UNDER_PUBLISHED)
				if (sub.getStatus() == Submission.Status.PUBLISHED) {
					return "redirect:/admin/submissions?error=Article+already+published.+Please+change+status+to+edit";
				}

				// ✅ Convert old SUBMITTED status to UNDER_REVIEW
				if (sub.getStatus() == Submission.Status.SUBMITTED) {
					sub.setStatus(Submission.Status.UNDER_REVIEW);
					sub.setUpdatedAt(ZonedDateTime.now(ZoneOffset.UTC));
					submissionService.saveSubmission(sub);
				}

				// Pre-fill all submission fields
				model.addAttribute("submission", sub);
				model.addAttribute("submissionId", submissionId);
				model.addAttribute("selectedArticleType", sub.getArticleType());
				model.addAttribute("selectedVolume", sub.getVolume());
				model.addAttribute("selectedIssue", sub.getIssue());
				model.addAttribute("authorId", sub.getAuthor().getId());

				// Convert authors string → multiple rows
				if (sub.getAuthorNames() != null)
					model.addAttribute("authorNamesList", sub.getAuthorNames().split("\\|\\|"));

				if (sub.getAuthorDetails() != null)
					model.addAttribute("authorDetailsList", sub.getAuthorDetails().split("\\|\\|"));
			}
		}

		if (authorId != null)
			model.addAttribute("authorId", authorId);
		if (!model.containsAttribute("authorId"))
			model.addAttribute("authorId", 0L);

		return "paper-review";
	}

	@PostMapping("/paper-review/save")
	public String savePaperReview(
			@RequestParam(required = false) Long submissionId,

			@RequestParam String articleId,
			@RequestParam String articleType,
			@RequestParam String volume,
			@RequestParam String issue,
			@RequestParam String title,
			@RequestParam String citation,
			@RequestParam("authorNames") List<String> authorNames,
			@RequestParam("authorDetails") List<String> authorDetails,

			@RequestParam String abstractText,
			@RequestParam(required = false) String abstractKeywords,
			@RequestParam String fullArticle,

			@RequestParam(required = false) MultipartFile referencePdf,
			@RequestParam(required = false) String numberOfPages,
			@RequestParam(required = false) String references,

			@RequestParam(required = false) String publicationDate,
			@RequestParam(required = false) String acceptanceDate,
			@RequestParam(required = false) String clearPublicationDate,
			@RequestParam(required = false) String clearAcceptanceDate) {
		try {
			Submission submission;

			// 1️⃣ If editing existing submission
			if (submissionId != null) {
				submission = submissionService.getSubmissionById(submissionId)
						.orElseThrow(() -> new RuntimeException("Submission not found"));
			} else {
				submission = new Submission();
			}

			// 2️⃣ Basic Fields (your existing code)
			submission.setArticleId(articleId);
			submission.setArticleType(articleType);
			submission.setVolume(volume);
			submission.setIssue(issue);
			submission.setTitle(title);
			submission.setCitation(citation);

			// 3️⃣ Authors (your existing code)
			submission.setAuthorNames(String.join("||", authorNames));
			submission.setAuthorDetails(String.join("||", authorDetails));

			// 4️⃣ Abstract (your existing code)
			submission.setAbstractText(abstractText);
			submission.setAbstractKeywords(abstractKeywords);

			// 5️⃣ Full Article - save to introduction field (combining all article content)
			submission.setIntroduction(fullArticle);
			submission.setSectionContent(null);
			submission.setDiscussionContent(null);
			submission.setConclusionContent(null);

			// 6️⃣ Publication Dates - Handle clearing dates
			if (clearPublicationDate != null && clearPublicationDate.equals("true")) {
				submission.setPublicationDate(null);
			} else if (publicationDate != null && !publicationDate.isEmpty()) {
				submission.setPublicationDate(LocalDate.parse(publicationDate));
			}

			if (clearAcceptanceDate != null && clearAcceptanceDate.equals("true")) {
				submission.setAcceptanceDate(null);
			} else if (acceptanceDate != null && !acceptanceDate.isEmpty()) {
				submission.setAcceptanceDate(LocalDate.parse(acceptanceDate));
			}

			// 7️⃣ Reference PDF Upload - FIXED FOR LIVE SERVER
			if (referencePdf != null && !referencePdf.isEmpty()) {
				String uploadDir = getUploadBasePath() + "reference-pdfs/";
				ensureDirectoryExists(uploadDir);

				String pdfPath = uploadDir + referencePdf.getOriginalFilename();
				File dest = new File(pdfPath);
				referencePdf.transferTo(dest);

				submission.setReferencePdfPath(pdfPath);
			}

			submission.setNumberOfPages(numberOfPages);
			submission.setReferencesText(references);

			// ✅ Set status as UNDER_PUBLISHED (will show on home page current issue)
			submission.setStatus(Submission.Status.UNDER_PUBLISHED);

			// ✅ UPDATED SYSTEM TIME (UTC)
			submission.setUpdatedAt(ZonedDateTime.now(ZoneOffset.UTC));

			submissionService.saveSubmission(submission);

			// Redirect to previous-volumes-issues page with success message
			return "redirect:/admin/previous-volumes-issues?message=Published+Successfully";

		} catch (Exception e) {
			e.printStackTrace();
			// Redirect to previous-volumes-issues page with error message
			return "redirect:/admin/previous-volumes-issues?error=Failed+to+Publish";
		}
	}

	@GetMapping("/paper-review/edit")
	public String editPaperReview(@RequestParam Long submissionId, Model model) {

		Submission sub = submissionService.getSubmissionById(submissionId)
				.orElseThrow(() -> new RuntimeException("Submission not found"));

		// ✅ Block access if article is PUBLISHED (allow UNDER_PUBLISHED)
		if (sub.getStatus() == Submission.Status.PUBLISHED) {
			return "redirect:/admin/submissions1?error=Article+already+published.+Please+change+status+to+edit";
		}

		// Load dropdown values
		List<ArticleType> articleTypes = atRepo.findAll();
		List<Volume> volumes = volRepo.findAll();
		List<Issue> issues = issueRepo.findAll();

		model.addAttribute("articleTypes", articleTypes);
		model.addAttribute("volumes", volumes);
		model.addAttribute("issues", issues);

		// Pre-fill all submission fields
		model.addAttribute("submission", sub);
		model.addAttribute("submissionId", submissionId);
		model.addAttribute("authorId", sub.getAuthor().getId());

		model.addAttribute("selectedArticleType", sub.getArticleType());
		model.addAttribute("selectedVolume", sub.getVolume());
		model.addAttribute("selectedIssue", sub.getIssue());

		// Convert authors string → multiple rows
		if (sub.getAuthorNames() != null)
			model.addAttribute("authorNamesList", sub.getAuthorNames().split("\\|\\|"));

		if (sub.getAuthorDetails() != null)
			model.addAttribute("authorDetailsList", sub.getAuthorDetails().split("\\|\\|"));

		return "paper-review"; // SAME JSP
	}

	@GetMapping("/dropdown/add")
	@ResponseBody
	public String addDropdown(
			@RequestParam String type,
			@RequestParam String value) {

		switch (type) {
			case "articleTypes":
				ArticleType at = new ArticleType();
				at.setName(value);
				atRepo.save(at);

				break;

			case "volumes":
				Volume v = new Volume();
				v.setName(value);
				volRepo.save(v);
				break;

			case "issues":
				Issue i = new Issue();
				i.setName(value);
				issueRepo.save(i);
				break;
		}

		return "OK";
	}

	// ✅ NEW: Update existing dropdown value
	@PostMapping("/dropdown/update")
	@ResponseBody
	public String updateDropdown(
			@RequestParam String type,
			@RequestParam String oldValue,
			@RequestParam String newValue) {

		try {
			switch (type) {
				case "articleTypes":
					ArticleType at = atRepo.findByName(oldValue);
					if (at != null) {
						at.setName(newValue);
						atRepo.save(at);
						// Update all submissions with this article type
						submissionRepository.updateArticleType(oldValue, newValue);
					}
					break;

				case "volumes":
					Volume v = volRepo.findByName(oldValue);
					if (v != null) {
						v.setName(newValue);
						volRepo.save(v);
						// Update all submissions with this volume
						submissionRepository.updateVolume(oldValue, newValue);
					}
					break;

				case "issues":
					Issue i = issueRepo.findByName(oldValue);
					if (i != null) {
						i.setName(newValue);
						issueRepo.save(i);
						// Update all submissions with this issue
						submissionRepository.updateIssue(oldValue, newValue);
					}
					break;
			}

			return "OK";
		} catch (Exception e) {
			System.out.println("❌ Error updating dropdown value: " + e.getMessage());
			e.printStackTrace();
			return "ERROR: " + e.getMessage();
		}
	}

	// ✅ NEW: Delete dropdown value
	@PostMapping("/dropdown/delete")
	@ResponseBody
	public String deleteDropdown(
			@RequestParam String type,
			@RequestParam String value) {

		try {
			switch (type) {
				case "articleTypes":
					ArticleType at = atRepo.findByName(value);
					if (at != null) {
						// Check if any submissions are using this article type
						long count = submissionRepository.countByArticleType(value);
						if (count > 0) {
							return "ERROR: Cannot delete. This article type is used by " + count + " submission(s).";
						}
						atRepo.delete(at);
					}
					break;

				case "volumes":
					Volume v = volRepo.findByName(value);
					if (v != null) {
						// Check if any submissions are using this volume
						long count = submissionRepository.countByVolume(value);
						if (count > 0) {
							return "ERROR: Cannot delete. This volume is used by " + count + " submission(s).";
						}
						volRepo.delete(v);
					}
					break;

				case "issues":
					Issue i = issueRepo.findByName(value);
					if (i != null) {
						// Check if any submissions are using this issue
						long count = submissionRepository.countByIssue(value);
						if (count > 0) {
							return "ERROR: Cannot delete. This issue is used by " + count + " submission(s).";
						}
						issueRepo.delete(i);
					}
					break;
			}

			return "OK";
		} catch (Exception e) {
			System.out.println("❌ Error deleting dropdown value: " + e.getMessage());
			e.printStackTrace();
			return "ERROR: " + e.getMessage();
		}
	}

	// ✅ ADDED: Ensure directory exists
	private void ensureDirectoryExists(String path) {
		File directory = new File(path);
		if (!directory.exists()) {
			directory.mkdirs();
			System.out.println("✅ Created directory: " + path);
		}
	}

	// ✅ ADDED: File path handler for live server
	private String getUploadBasePath() {
		// For Tomcat live server
		String tomcatBase = System.getProperty("catalina.base");
		if (tomcatBase != null && !tomcatBase.isEmpty()) {
			return tomcatBase + File.separator + "webapps" + File.separator + "uploads" + File.separator;
		}
		// Fallback for local development
		return System.getProperty("user.dir") + File.separator + "uploads" + File.separator;
	}

	// ✅ NEW: Update submission status via AJAX
	@PostMapping("/update-status")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> updateSubmissionStatus(
			@RequestParam Long submissionId,
			@RequestParam String status) {
		Map<String, Object> response = new HashMap<>();
		try {
			System.out.println("🔍 Updating status for submission ID: " + submissionId + " to status: " + status);

			Optional<Submission> submissionOpt = submissionService.getSubmissionById(submissionId);
			if (submissionOpt.isEmpty()) {
				System.out.println("❌ Submission not found: " + submissionId);
				response.put("success", false);
				response.put("message", "Submission not found");
				return ResponseEntity.badRequest().body(response);
			}

			Submission submission = submissionOpt.get();
			Submission.Status oldStatus = submission.getStatus();
			System.out.println("📝 Current status: " + oldStatus + ", New status: " + status);

			// Validate required fields are not null (title is required)
			if (submission.getTitle() == null || submission.getTitle().trim().isEmpty()) {
				System.out.println("❌ Submission title is null or empty");
				response.put("success", false);
				response.put("message", "Cannot update status: Submission title is required but missing.");
				return ResponseEntity.badRequest().body(response);
			}

			// Convert string to enum
			try {
				Submission.Status newStatus = Submission.Status.valueOf(status);

				// Validate that only the allowed statuses are used
				List<String> allowedStatuses = new ArrayList<>();
				allowedStatuses.add("UNDER_REVIEW");
				allowedStatuses.add("UNDER_EDITING");
				allowedStatuses.add("UNDER_ACCEPTED");
				allowedStatuses.add("UNDER_PUBLISHED");
				allowedStatuses.add("UNDER_REJECTED");

				if (!allowedStatuses.contains(status)) {
					System.out.println("❌ Invalid status - not in allowed list: " + status);
					response.put("success", false);
					response.put("message",
							"Invalid status. Only Under Review, Under Editing, Under Accepted, Under Published, and Under Rejected are allowed.");
					return ResponseEntity.badRequest().body(response);
				}

				// Allow status update regardless of current status (including PUBLISHED)
				// Use direct SQL update to avoid entity state issues
				ZonedDateTime now = ZonedDateTime.now(ZoneOffset.UTC);

				// Use repository's update method to update only status field
				int updatedRows = submissionService.updateStatusOnly(submissionId, newStatus, now);

				if (updatedRows > 0) {
					System.out.println("✅ Status updated from " + oldStatus + " to " + newStatus);
					response.put("success", true);
					response.put("message", "Status updated successfully from " + oldStatus + " to " + newStatus);
					response.put("oldStatus", oldStatus != null ? oldStatus.name() : "");
					response.put("newStatus", newStatus.name());
					return ResponseEntity.ok().body(response);
				} else {
					System.out.println("❌ Status update failed - no rows updated");
					response.put("success", false);
					response.put("message", "Status update failed - no rows were updated in database");
					return ResponseEntity.internalServerError().body(response);
				}
			} catch (IllegalArgumentException e) {
				System.out.println("❌ Invalid status value: " + status);
				e.printStackTrace();
				response.put("success", false);
				response.put("message", "Invalid status: " + status);
				response.put("errorDetails", e.getMessage());
				return ResponseEntity.badRequest().body(response);
			} catch (Exception e) {
				System.out.println("❌ Error in status conversion or save: " + e.getMessage());
				e.printStackTrace();
				response.put("success", false);
				response.put("message", "Error updating status: " + e.getMessage());
				response.put("errorDetails", e.getClass().getSimpleName() + ": " + e.getMessage());
				return ResponseEntity.internalServerError().body(response);
			}
		} catch (Exception e) {
			System.out.println("❌ Error updating status (outer catch): " + e.getMessage());
			e.printStackTrace();
			response.put("success", false);
			response.put("message", "Error updating status: " + e.getMessage());
			response.put("errorDetails", e.getClass().getSimpleName() + ": " + e.getMessage());
			return ResponseEntity.internalServerError().body(response);
		}
	}

	// ===========================
	// PREVIOUS VOLUMES AND ISSUES (Admin Management Page)
	// ===========================
	@GetMapping("/previous-volumes-issues")
	public String previousVolumesIssues(Model model) {
		try {
			// Get all UNDER_PUBLISHED submissions (same as archives)
			List<Submission> allSubmissions = submissionService.getPublishedSubmissions();

			model.addAttribute("submissions", allSubmissions);
			model.addAttribute("totalCount", allSubmissions.size());

			return "admin-previous-volumes-issues";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", "Failed to load previous volumes and issues");
			return "admin-previous-volumes-issues";
		}
	}

	// Delete article from previous volumes and issues
	@PostMapping("/previous-volumes-issues/delete/{id}")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> deleteArticle(@PathVariable Long id) {
		Map<String, Object> response = new HashMap<>();
		try {
			Optional<Submission> submissionOpt = submissionService.getSubmissionById(id);
			if (submissionOpt.isEmpty()) {
				response.put("success", false);
				response.put("message", "Article not found");
				return ResponseEntity.notFound().build();
			}

			submissionService.deleteSubmission(id);

			response.put("success", true);
			response.put("message", "Article deleted successfully");
			return ResponseEntity.ok().body(response);
		} catch (Exception e) {
			e.printStackTrace();
			response.put("success", false);
			response.put("message", "Error deleting article: " + e.getMessage());
			return ResponseEntity.internalServerError().body(response);
		}
	}

	// ===========================
	// AUTHOR LOGIN DETAILS
	// ===========================
	@GetMapping("/author-login-details")
	public String authorLoginDetails(Model model, @RequestParam(required = false) String search) {
		try {
			List<User> authors;

			if (search != null && !search.trim().isEmpty()) {
				authors = userService.searchAuthors(search);
				model.addAttribute("searchTerm", search);
			} else {
				authors = userService.getAllAuthors();
			}

			// Get submission count for each author
			Map<Long, Long> submissionCounts = new HashMap<>();
			for (User author : authors) {
				long count = submissionRepository.countByAuthor(author);
				submissionCounts.put(author.getId(), count);
			}

			model.addAttribute("authors", authors);
			model.addAttribute("submissionCounts", submissionCounts);
			model.addAttribute("totalAuthors", authors.size());

			return "author-login-details";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", "Failed to load author details");
			model.addAttribute("authors", new ArrayList<>());
			return "author-login-details";
		}
	}

	// ===========================
	// CONTACT ENQUIRIES
	// ===========================
	@GetMapping("/contact-enquiries")
	public String contactEnquiries(Model model) {
		try {
			List<com.ayurvedic.main.entity.ContactEnquiry> enquiries = contactEnquiryRepository
					.findAllByOrderByCreatedAtDesc();
			long unreadCount = contactEnquiryRepository.countByIsReadFalse();

			model.addAttribute("enquiries", enquiries);
			model.addAttribute("totalEnquiries", enquiries.size());
			model.addAttribute("unreadCount", unreadCount);

			return "admin-contact-enquiries";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", "Failed to load contact enquiries");
			model.addAttribute("enquiries", new ArrayList<>());
			return "admin-contact-enquiries";
		}
	}

	@PostMapping("/contact-enquiries/mark-read/{id}")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> markEnquiryAsRead(@PathVariable Long id) {
		Map<String, Object> response = new HashMap<>();
		try {
			com.ayurvedic.main.entity.ContactEnquiry enquiry = contactEnquiryRepository.findById(id)
					.orElseThrow(() -> new RuntimeException("Enquiry not found"));

			enquiry.setIsRead(true);
			contactEnquiryRepository.save(enquiry);

			response.put("success", true);
			response.put("message", "Enquiry marked as read");
			return ResponseEntity.ok().body(response);
		} catch (Exception e) {
			e.printStackTrace();
			response.put("success", false);
			response.put("message", "Error marking enquiry as read: " + e.getMessage());
			return ResponseEntity.internalServerError().body(response);
		}
	}

	// ===========================
	// 🔹 CMS - MANAGE PAGE CONTENT
	// ===========================
	@GetMapping("/manage-content")
	public String managePageContent(@RequestParam(required = false, defaultValue = "home") String page, Model model) {
		try {
			List<PageContent> contents = pageContentService.getPageContentsOrdered(page);
			model.addAttribute("contents", contents);
			model.addAttribute("selectedPage", page);
			model.addAttribute("totalContents", contents.size());
			return "admin-manage-content";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", "Failed to load page content");
			model.addAttribute("contents", new ArrayList<>());
			model.addAttribute("selectedPage", page);
			return "admin-manage-content";
		}
	}

	@GetMapping("/manage-content/edit/{id}")
	public String editPageContent(@PathVariable Long id, Model model) {
		try {
			Optional<PageContent> contentOpt = pageContentService.getContentById(id);
			if (contentOpt.isEmpty()) {
				return "redirect:/admin/manage-content?error=Content+not+found";
			}
			model.addAttribute("content", contentOpt.get());
			return "admin-edit-content";
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/admin/manage-content?error=Failed+to+load+content";
		}
	}

	@PostMapping("/manage-content/update")
	public String updatePageContent(
			@RequestParam Long id,
			@RequestParam String content,
			Model model) {
		try {
			PageContent updated = pageContentService.updateContent(id, content);
			if (updated != null) {
				return "redirect:/admin/manage-content?page=" + updated.getPageName() + "&message=Content+updated+successfully";
			}
			return "redirect:/admin/manage-content?error=Content+not+found";
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/admin/manage-content?error=Failed+to+update+content";
		}
	}

	@PostMapping("/manage-content/update-ajax")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> updatePageContentAjax(
			@RequestParam Long id,
			@RequestParam String content) {
		Map<String, Object> response = new HashMap<>();
		try {
			PageContent updated = pageContentService.updateContent(id, content);
			if (updated != null) {
				response.put("success", true);
				response.put("message", "Content updated successfully");
				response.put("updatedAt", updated.getUpdatedAt().toString());
				return ResponseEntity.ok().body(response);
			}
			response.put("success", false);
			response.put("message", "Content not found");
			return ResponseEntity.badRequest().body(response);
		} catch (Exception e) {
			e.printStackTrace();
			response.put("success", false);
			response.put("message", "Error updating content: " + e.getMessage());
			return ResponseEntity.internalServerError().body(response);
		}
	}

	@PostMapping("/manage-content/reset")
	public String resetAllContent() {
		try {
			pageContentService.resetAllContent();
			return "redirect:/admin/manage-content?message=All+content+has+been+reset+to+defaults";
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/admin/manage-content?error=Failed+to+reset+content";
		}
	}

	@PostMapping("/manage-content/upload-image")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> uploadImage(
			@RequestParam Long id,
			@RequestParam("image") MultipartFile imageFile) {
		Map<String, Object> response = new HashMap<>();
		try {
			// Validate file
			if (imageFile.isEmpty()) {
				response.put("success", false);
				response.put("message", "Please select an image file");
				return ResponseEntity.badRequest().body(response);
			}

			// Check file type
			String contentType = imageFile.getContentType();
			if (contentType == null || !contentType.startsWith("image/")) {
				response.put("success", false);
				response.put("message", "Only image files are allowed");
				return ResponseEntity.badRequest().body(response);
			}

			// Create upload directory if it doesn't exist
			String uploadDir = "src/main/webapp/uploads/";
			File uploadDirFile = new File(uploadDir);
			if (!uploadDirFile.exists()) {
				uploadDirFile.mkdirs();
			}

			// Generate unique filename
			String originalFilename = imageFile.getOriginalFilename();
			String fileExtension = originalFilename != null ? 
				originalFilename.substring(originalFilename.lastIndexOf(".")) : ".jpg";
			String uniqueFilename = UUID.randomUUID().toString() + fileExtension;
			String filePath = uploadDir + uniqueFilename;

			// Save file
			Path path = Paths.get(filePath);
			Files.write(path, imageFile.getBytes());

			// Update database with image path
			String imagePath = "/uploads/" + uniqueFilename;
			Optional<PageContent> contentOpt = pageContentService.getContentById(id);
			if (contentOpt.isPresent()) {
				PageContent content = contentOpt.get();
				content.setImagePath(imagePath);
				pageContentService.saveContent(content);
				
				response.put("success", true);
				response.put("message", "Image uploaded successfully");
				response.put("imagePath", imagePath);
				return ResponseEntity.ok().body(response);
			} else {
				// If content doesn't exist, delete the uploaded file
				Files.deleteIfExists(path);
				response.put("success", false);
				response.put("message", "Content not found");
				return ResponseEntity.badRequest().body(response);
			}
		} catch (IOException e) {
			e.printStackTrace();
			response.put("success", false);
			response.put("message", "Error uploading image: " + e.getMessage());
			return ResponseEntity.internalServerError().body(response);
		} catch (Exception e) {
			e.printStackTrace();
			response.put("success", false);
			response.put("message", "Error: " + e.getMessage());
			return ResponseEntity.internalServerError().body(response);
		}
	}
	
	@PostMapping("/saveAboutContent")
	public String saveAboutContent(
	        @RequestParam("aboutContent") String aboutContent,@RequestParam("contentId") Long contentId) {

	    // DB save
		PageContent updated = pageContentService.updateContent(contentId, aboutContent);

	    // page reload ke liye redirect
	    return "redirect:/about";
	}
	
	@GetMapping("/manage-template")
	public String manageTemplateContent(
	        @RequestParam(required = false, defaultValue = "home") String page,
	        Model model) {

	    try {
	        List<PageContent> contents =
	                pageContentService.getPageContentsOrdered(page);

	        List<ContentTemplate> templatelist =
	                contentTemplateService.getTemplateContent(page);

	        model.addAttribute("contents", contents);
	        model.addAttribute("selectedPage", page);
	        model.addAttribute("totalContents", contents.size());
	        model.addAttribute("templatelist", templatelist);

	        return "admin-template-content";

	    } catch (Exception e) {
	        e.printStackTrace();

	        model.addAttribute("error", "Failed to load page content");
	        model.addAttribute("contents", new ArrayList<>());
	        model.addAttribute("selectedPage", page);
	        model.addAttribute("templatelist", new ArrayList<>());

	        return "admin-template-content";
	    }
	}
	 
	
	/*
	 * @GetMapping("/manage-template") public String manageTemplateContent(
	 * 
	 * @RequestParam(name = "page", required = false, defaultValue = "home") String
	 * page, Model model) {
	 * 
	 * try { List<PageContent> contents =
	 * pageContentService.getPageContentsOrdered(page);
	 * 
	 * List<ContentTemplate> templatelist =
	 * contentTemplateService.getTemplateContent(page);
	 * 
	 * model.addAttribute("contents", contents); model.addAttribute("selectedPage",
	 * page); model.addAttribute("totalContents", contents.size());
	 * model.addAttribute("templatelist", templatelist);
	 * 
	 * return "admin-template-content";
	 * 
	 * } catch (Exception e) { e.printStackTrace();
	 * 
	 * model.addAttribute("error", "Failed to load page content");
	 * model.addAttribute("contents", new ArrayList<>());
	 * model.addAttribute("selectedPage", page); model.addAttribute("templatelist",
	 * new ArrayList<>());
	 * 
	 * return "admin-template-content"; } }
	 */

	
	@PostMapping("/savetemplatecontent")
	public String saveTemplateContent(@ModelAttribute TemplateData temp) {
		 // DB save
		TemplateData templateData=new TemplateData();
		 boolean check=templateDataService.templateidPresent(temp.getTemplate());
		 if(check) {
			 templateData=templateDataService.updateContent(temp);
		 }else {
		     templateData=templateDataService.saveContent(temp);
		 }
		 return "redirect:/admin/manage-template";
	}
	
	@GetMapping("/getTemplateContent")
	@ResponseBody
	public String getTemplateContent(@RequestParam Long id){

		Optional<TemplateData> template =templateDataService.gettempdata(id);

	    return template.get().getContentArea();
	}
	
	
	/*
	 * @RequestMapping(value = "/gallery", method = RequestMethod.GET) public String
	 * openGallerry(Model model) { return "gallery_page"; }
	 */
	@PostMapping("/submit")
	public String submitArticle(
	        @RequestParam("document") MultipartFile file,
	        Model model) {

	    try {

			
			/*
			 * String uploadDir = System.getProperty("user.dir") + File.separator + "src" +
			 * File.separator + "main" + File.separator + "webapp" + File.separator +
			 * "uploads";
			 */
			 
	        
	        String uploadDir = "/opt/tomcat10/webapps/natureuploads/";

	        File dir = new File(uploadDir);

	        if (!dir.exists()) {
	            dir.mkdirs();
	        }

	        String fileName =
	                System.currentTimeMillis()
	                + "_"
	                + file.getOriginalFilename().replace(" ", "_");

	        Path path = Paths.get(uploadDir, fileName);

	        System.out.println(path);

	        Files.write(path, file.getBytes());

	        System.out.println("File uploaded successfully");

	    } catch (Exception e) {

	        e.printStackTrace();
	    }

	    return "redirect:/admin/gallery";
	}
	
	@GetMapping("/gallery")
	public String gallery(Model model) {

		/*
		 * String uploadDir = System.getProperty("user.dir") + File.separator + "src" +
		 * File.separator + "main" + File.separator + "webapp" + File.separator +
		 * "uploads";
		 */
	    
	    String uploadDir = "/opt/tomcat10/webapps/natureuploads/";

	    File folder = new File(uploadDir);

	    File[] files = folder.listFiles();

	    List<String> imageList = new ArrayList<>();
	    
	    

	    if(files != null) {

	        for(File file : files) {

	            imageList.add(file.getName());
	        }
	    }

	    model.addAttribute("images", imageList);

	    return "gallery_page";
	}
}