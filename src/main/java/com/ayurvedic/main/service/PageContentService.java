package com.ayurvedic.main.service;

import com.ayurvedic.main.entity.PageContent;
import com.ayurvedic.main.repository.PageContentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jakarta.annotation.PostConstruct;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
public class PageContentService {

    @Autowired
    private PageContentRepository pageContentRepository;

    /**
     * Get all content for a page as a Map (sectionKey -> content)
     * This is used in controllers to pass to JSP
     */
    public Map<String, String> getPageContentMap(String pageName) {
        List<PageContent> contents = pageContentRepository.findByPageNameOrderBySectionKeyAsc(pageName);
        Map<String, String> contentMap = new HashMap<>();
        for (PageContent pc : contents) {
            contentMap.put(pc.getSectionKey(), pc.getContent());
            // Also add image path if it exists
            if (pc.getImagePath() != null && !pc.getImagePath().isEmpty()) {
                contentMap.put(pc.getSectionKey() + "_imagePath", pc.getImagePath());
            }
        }
        return contentMap;
    }

    /**
     * Get all content for a page including image paths as a Map (sectionKey -> content/imagePath)
     * This is used in controllers to pass to JSP for pages that need image support
     */
    public Map<String, String> getPageContentMapWithImages(String pageName) {
        List<PageContent> contents = pageContentRepository.findByPageNameOrderBySectionKeyAsc(pageName);
        Map<String, String> contentMap = new HashMap<>();
        for (PageContent pc : contents) {
            contentMap.put(pc.getSectionKey(), pc.getContent());
            // Also add image path with _image_path suffix if it exists
            if (pc.getImagePath() != null && !pc.getImagePath().isEmpty()) {
                contentMap.put(pc.getSectionKey() + "_image_path", pc.getImagePath());
            }
        }
        return contentMap;
    }
    public List<PageContent> getPageContents(String pageName) {
        return pageContentRepository.findByPageNameOrderBySectionKeyAsc(pageName);
    }

    /**
     * Get all content entries (for admin)
     */
    public List<PageContent> getAllContents() {
        return pageContentRepository.findAll();
    }

    /**
     * Get content by ID
     */
    public Optional<PageContent> getContentById(Long id) {
        return pageContentRepository.findById(id);
    }

    /**
     * Save or update content
     */
    public PageContent saveContent(PageContent content) {
        return pageContentRepository.save(content);
    }

    /**
     * Update content by ID
     */
    public PageContent updateContent(Long id, String newContent) {
        Optional<PageContent> optionalContent = pageContentRepository.findById(id);
        if (optionalContent.isPresent()) {
            PageContent pc = optionalContent.get();
            pc.setContent(newContent);
            return pageContentRepository.save(pc);
        }
        return null;
    }

    /**
     * Update content with image path
     */
    public PageContent updateContentWithImage(Long id, String newContent, String imagePath) {
        Optional<PageContent> optionalContent = pageContentRepository.findById(id);
        if (optionalContent.isPresent()) {
            PageContent pc = optionalContent.get();
            pc.setContent(newContent);
            pc.setImagePath(imagePath);
            return pageContentRepository.save(pc);
        }
        return null;
    }

    /**
     * Save content only if it doesn't exist
     */
    private void saveIfNotExists(PageContent content) {
        boolean exists = pageContentRepository.existsByPageNameAndSectionKey(content.getPageName(), content.getSectionKey());
        if (!exists) {
            pageContentRepository.save(content);
        }
    }

    /**
     * Get content for a page ordered by display order (for admin panel)
     */
    public List<PageContent> getPageContentsOrdered(String pageName) {
        return pageContentRepository.findByPageNameOrderByDisplayOrderAsc(pageName);
    }

    /**
     * Reset all content - deletes everything and reinitializes
     */
    public void resetAllContent() {
        pageContentRepository.deleteAll();
        initializeDefaultContent();
    }

    /**
     * Initialize default content - adds missing content on startup
     * This runs when application starts
     */
    @PostConstruct
    public void initializeDefaultContent() {
        // Always check and add missing content
        if (true) {
            // ==================== HOME PAGE CONTENT (Order matches page layout) ====================
            
            // 1. Hero Section (Top of page)
            saveIfNotExists(new PageContent("home", "hero_title", "1. Hero Banner - Title", "Welcome TO Nature Ayurved", 1));
            saveIfNotExists(new PageContent("home", "hero_subtitle", "2. Hero Banner - Subtitle", "International Journal of Ayurved Science & Research", 2));
            saveIfNotExists(new PageContent("home", "hero_description", "3. Hero Banner - Description", "To promote empirical research in Ayurveda e.g. Clinical trials, drug research.", 3));
            
            // 2. Invitation Banner
            saveIfNotExists(new PageContent("home", "invitation_text", "4. Invitation Banner Text", 
                "Article Invitation: Articles are invited for Jan – March 2025 issue | Submission Deadline: 15th March 2025", 4));
            
            // 3. Welcome Section
            saveIfNotExists(new PageContent("home", "welcome_title", "5. Welcome Section - Title", "Welcome To Nature Ayurved", 5));
            saveIfNotExists(new PageContent("home", "welcome_content", "6. Welcome Section - Content", 
                "an International Journal of Ayurved Science & Research dedicated to promoting authentic Ayurvedic wisdom, innovative research, clinical advancements, and integrative healthcare knowledge. Explore high-quality scholarly articles, reviews, case studies, and evidence-based insights shaping the future of Ayurveda.", 6));
            
            // 4. ARCA Section
            saveIfNotExists(new PageContent("home", "arca_title", "7. About ARCA - Title", "About Vidyavishva Publications", 7));
            saveIfNotExists(new PageContent("home", "arca_content_1", "8. About ARCA - Paragraph 1", 
                "Vidyavishva Publications is a dynamic and visionary publishing house dedicated to promoting excellence in education, research, and professional literature. With a strong commitment to quality, authenticity, and innovation, Vidyavishva Publications serves as a trusted platform for scholars, academicians, researchers, and authors seeking to share meaningful knowledge with the world. It focuses on publishing textbooks, reference books, edited volumes, journals, monographs, and scholarly resources across healthcare, Ayurveda, medical sciences, and allied disciplines. (vidyavishva.com).", 8));
            saveIfNotExists(new PageContent("home", "arca_content_2", "9. About ARCA - Paragraph 2", 
                "Driven by the belief that knowledge becomes powerful when shared responsibly, Vidyavishva Publications bridges the gap between intellectual creators and learners. The organization emphasizes transparent publishing practices, ethical standards, peer review systems, and academic integrity to ensure every publication meets high scholarly benchmarks. It also supports emerging researchers and young authors by providing opportunities to transform their ideas into impactful publications. (vidyavishva.com).", 9));
            saveIfNotExists(new PageContent("home", "arca_content_3", "10. About ARCA - Paragraph 3", 
                "Vidyavishva Publications is particularly recognized for its dedication to Indian knowledge systems, Ayurveda, and contemporary scientific education, while maintaining relevance to modern curricular and regulatory standards. With multilingual publishing support and a forward-looking vision, the organization aspires to create a global presence in academic publishing. Through its commitment to credibility, accessibility, and intellectual growth, Vidyavishva Publications continues to inspire a culture of learning and innovation for future generations. (vidyavishva.com).", 10));

            // 5. Current Issue Section
            saveIfNotExists(new PageContent("home", "current_issue_title", "11. Current Issue - Section Title", "Current Issue Highlights", 11));
            saveIfNotExists(new PageContent("home", "article_1_title", "12. Current Issue - Article 1 Title", 
                "Udvartan with Kolkulathadi churna in management of Sthaulya: A case study", 12));
            saveIfNotExists(new PageContent("home", "article_1_author", "13. Current Issue - Article 1 Author", "Ajmera N.", 13));
            saveIfNotExists(new PageContent("home", "article_2_title", "14. Current Issue - Article 2 Title", 
                "Pathogenesis of Mutraghata and Mutrashmari & its preventive Management", 14));
            saveIfNotExists(new PageContent("home", "article_2_author", "15. Current Issue - Article 2 Author", "Airi K.", 15));

            // 6. Author Guidelines Section
            saveIfNotExists(new PageContent("home", "guidelines_title", "16. Author Guidelines - Title", "Author Guidelines", 16));
            saveIfNotExists(new PageContent("home", "guidelines_content_1", "17. Author Guidelines - Paragraph 1",
                "All submitted articles are read by the editorial staff. To save time for authors and peer-reviewers, " +
                "only those papers that seem most likely to meet our editorial criteria are sent for double-blind review. " +
                "The editors then make a decision based on the reviewers' advice: Accept with or without editorial revisions or Reject.", 17));
            saveIfNotExists(new PageContent("home", "guidelines_content_2", "18. Author Guidelines - Paragraph 2",
                "We therefore ask that reviewers should be willing to provide follow-up advice as requested. " +
                "All manuscripts must follow our comprehensive formatting and submission guidelines to ensure " +
                "smooth processing and timely review.", 18));

            // 7. Footer Content
            saveIfNotExists(new PageContent("home", "footer_description", "19. Footer - Description", 
                "International Journal for Empirical Research in Ayurveda, dedicated to open-access scholarly publishing.", 19));
            saveIfNotExists(new PageContent("home", "footer_contact_email", "20. Footer Contact - Email", 
                "natureayurvedjournal@gmail.com", 20));
            saveIfNotExists(new PageContent("home", "footer_contact_website", "21. Footer Contact - Website", 
                "natureayurved.com", 21));
            saveIfNotExists(new PageContent("home", "footer_contact_issn", "22. Footer Contact - ISSN", 
                "0000-0000", 22));
            saveIfNotExists(new PageContent("home", "footer_copyright", "23. Footer - Copyright", 
                "© 2025 NATURE AYURVED | All Rights Reserved", 23));

            // ==================== ABOUT PAGE CONTENT (Order matches page layout) ====================
            
            // 1. Page Header
            saveIfNotExists(new PageContent("about", "page_header_title", "1. Page Banner - Title", "ABOUT US1", 1));
            
            // 2. About Section
            saveIfNotExists(new PageContent("about", "about_title", "2. About Section - Title", "ABOUT US", 2));
            saveIfNotExists(new PageContent("about", "about_content_1", "3. About Section - Paragraph 1", 
                "Welcome to Nature Ayurved: International Journal of Ayurveda Science and Research, a premier platform dedicated to the advancement "
                + "and dissemination of scientific knowledge in the field of Ayurveda.", 3));
            saveIfNotExists(new PageContent("about", "about_content_2", "4. About Section - Paragraph 2", 
                "Launched as a bimonthly, peer-reviewed, and indexed journal, Nature Ayurved focuses exclusively on publishing high-quality, "
                + "original research work that bridges the gap between ancient Ayurvedic wisdom and contemporary scientific validation. We are proud to be "
                + "published in partnership with Vidyavishva  Publications, ensuring rigorous academic standards and a wide reach within the scholarly community.", 4));
            saveIfNotExists(new PageContent("about", "about_content_3", "5. About Section - Paragraph 3", 
                "We believe that knowledge should be barrier-free. To support global education and research, the full text of our journal is accessible on "
                + "our website at www.natureayurved.com. Nature Ayurved operates under a strict Open Access model, allowing free, immediate access to all published contents. "
                + "Furthermore, we actively encourage the dissemination of research by permitting authors to self-archive the final accepted version of their articles "
                + "on any OAI-compliant institutional or subject-based repository.", 5));

            // 3. Mission & Vision Section
            saveIfNotExists(new PageContent("about", "mission_title", "6. Mission Card - Title", "Our Aim", 6));
			saveIfNotExists(new PageContent("about", "mission_content", "7. Mission Card - Content",
					"The primary aims of Nature Ayurved are to:\r\n"
							+ "Promote Originality: Encourage and publish high-quality, original research, clinical trials, and systematic reviews in all disciplines of Ayurveda.\r\n"
							+ "Ensure Academic Rigor: Maintain the highest standards of scientific integrity through a rigorous, transparent, and timely double-blind peer-review process.\r\n"
							+ "Facilitate Global Access: Provide a completely free, open-access platform for researchers, academicians, students, and practitioners worldwide to read, download, and utilize published research.\r\n"
							+ "Empower Authors: Support researchers by allowing OAI-compliant self-archiving, maximizing the visibility and impact of their work.\r\n"
							+ "Bridge Traditions: Foster interdisciplinary research that connects Ayurvedic principles with modern medical sciences and technologies.\r\n"
							+ "",
					7));
            saveIfNotExists(new PageContent("about", "vision_title", "8. Vision Card - Title", "Our Vision", 8));
            saveIfNotExists(new PageContent("about", "vision_content", "9. Vision Card - Content", 
                "To be a globally recognized, authoritative platform that elevates the scientific rigor of Ayurveda, fostering a future where traditional Indian medicine "
                + "is seamlessly integrated with global healthcare through evidence-based research, innovation, and open knowledge sharing.", 9));

            // 4. Timeline Section
            saveIfNotExists(new PageContent("about", "timeline_title", "10. Timeline - Section Title", "Scope of the Journal", 10));
            
            saveIfNotExists(new PageContent("about", "timeline_2018_year", "11. Timeline 2018 - Year", "2018", 11));
            saveIfNotExists(new PageContent("about", "timeline_2018_title", "12. Timeline 2018 - Title", "Foundation", 12));
            saveIfNotExists(new PageContent("about", "timeline_2018_content", "13. Timeline 2018 - Content", 
                "AYUJOURNAL was established as the official publication of Ayurveda Research and Career Academy (ARCA) " +
                "with a vision to promote empirical research in Ayurveda.", 13));
            
            saveIfNotExists(new PageContent("about", "timeline_2019_year", "14. Timeline 2019 - Year", "2019", 14));
            saveIfNotExists(new PageContent("about", "timeline_2019_title", "15. Timeline 2019 - Title", "First Publication", 15));
            saveIfNotExists(new PageContent("about", "timeline_2019_content", "16. Timeline 2019 - Content", 
                "Launched our inaugural issue featuring groundbreaking research in Ayurvedic clinical trials and drug research methodologies.", 16));
            
            saveIfNotExists(new PageContent("about", "timeline_2020_year", "17. Timeline 2020 - Year", "2020", 17));
            saveIfNotExists(new PageContent("about", "timeline_2020_title", "18. Timeline 2020 - Title", "International Recognition", 18));
            saveIfNotExists(new PageContent("about", "timeline_2020_content", "19. Timeline 2020 - Content", 
                "Gained recognition in the global Ayurvedic research community and established partnerships with international institutions.", 19));
            
            saveIfNotExists(new PageContent("about", "timeline_2022_year", "20. Timeline 2022 - Year", "2022", 20));
            saveIfNotExists(new PageContent("about", "timeline_2022_title", "21. Timeline 2022 - Title", "Digital Transformation", 21));
            saveIfNotExists(new PageContent("about", "timeline_2022_content", "22. Timeline 2022 - Content", 
                "Implemented advanced digital publishing platform and open access model to increase global accessibility of Ayurvedic research.", 22));
            
            saveIfNotExists(new PageContent("about", "timeline_2024_year", "23. Timeline 2024 - Year", "2024", 23));
            saveIfNotExists(new PageContent("about", "timeline_2024_title", "24. Timeline 2024 - Title", "Expanded Reach", 24));
            saveIfNotExists(new PageContent("about", "timeline_2024_content", "25. Timeline 2024 - Content", 
                "Reached milestone of publishing research from over 15 countries and established indexing in major academic databases.", 25));
            
            saveIfNotExists(new PageContent("about", "scope_journal_1", "1. scope - journal1", "Nature Ayurved welcomes submissions that explore, validate, and innovate within the diverse branches of Ayurveda. The scope of the journal covers, but is not limited to, the following specialties:", 110));
            saveIfNotExists(new PageContent("about", "scope_journal_2", "2. scope - journal2", "•	Basic Principles: Samhita & Siddhanta (Fundamental Principles), Rachana Sharir (Anatomy), and Kriya Sharir (Physiology).", 111));
            saveIfNotExists(new PageContent("about", "scope_journal_3", "3. scope - journal3", "•	Pharmacology & Pharmaceutics: Dravyaguna (Materia Medica), Rasa Shastra & Bhaishajya Kalpana (Pharmaceuticals).", 112));
            saveIfNotExists(new PageContent("about", "scope_journal_4", "4. scope - journal4", "•	Clinical Specialties: Kayachikitsa (Internal Medicine), Panchakarma (Detoxification and Bio-purification), Shalya Tantra (Surgery), and Shalakya Tantra (ENT & Ophthalmology).", 113));
            saveIfNotExists(new PageContent("about", "scope_journal_5", "5. scope - journal5", "•	Preventive & Social Medicine and mental health: Swasthavritta (Preventive Medicine & Yoga) and Agad Tantra (Toxicology & Forensic Medicine).", 114));
            saveIfNotExists(new PageContent("about", "scope_journal_6", "6. scope - journal6", "•	Women & Child Health: Prasuti Tantra & Stri Roga (Obstetrics & Gynecology) and Kaumarbhritya (Pediatrics).", 115));
            saveIfNotExists(new PageContent("about", "scope_journal_7", "7. scope - journal7", "•	Interdisciplinary Research: Integration of Ayurveda with modern pharmacology, biotechnology, bioinformatics, and standardization of Ayurvedic drugs.", 116));

            saveIfNotExists(new PageContent("about", "timeline_title1", "8. Timeline - Section Title1", "Disclaimer", 117));
            saveIfNotExists(new PageContent("about", "disclaimer", "6. disclaimer - journal", "The views, opinions, and findings expressed in the articles published in Nature Ayurved: International Journal of Ayurveda Research are solely those of the individual authors and contributors. They do not necessarily reflect the official policy, views, or position of the journal, its Editorial Board, or our publication partner, Vidyavisha.\r\n"
            		+ "While every effort is made to ensure the accuracy of the information published, the journal does not guarantee the efficacy or safety of the treatments, drugs, or therapies discussed. The content provided is for academic, educational, and informational purposes only and must not be construed as professional medical advice, diagnosis, or treatment. Readers and practitioners should always consult appropriate medical guidelines and professionals before applying any clinical data presented in the journal.\r\n"
            		+ "", 118));
            
            saveIfNotExists(new PageContent("about", "timeline_title2", "8. Timeline - Section Title2", "Journal Ethics", 119));
            saveIfNotExists(new PageContent("about", "ethics_journal_1", "1. ethics - journal1", "Nature Ayurved is deeply committed to maintaining the highest standards of publication ethics and academic integrity. We adhere strictly to the guidelines set forth by international publication ethics committees to ensure a fair and transparent process.", 120));
            saveIfNotExists(new PageContent("about", "ethics_journal_2", "2. ethics - journal2", "•	Originality and Plagiarism: We maintain a zero-tolerance policy for plagiarism. All submitted manuscripts are screened using advanced plagiarism-detection software. Authors must ensure their work is entirely original and properly cites any referenced material.", 121));
            saveIfNotExists(new PageContent("about", "ethics_journal_3", "3. ethics - journal3", "•	Peer Review Integrity: All submissions undergo a strict double-blind peer-review process to ensure objective evaluation based solely on the manuscript's academic merit, relevance, and scientific soundness.", 122));
            saveIfNotExists(new PageContent("about", "ethics_journal_4", "4. ethics - journal4", "•	Authorship Criteria: Authorship should be limited to those who have made a significant contribution to the conception, design, execution, or interpretation of the reported study.", 123));
            saveIfNotExists(new PageContent("about", "ethics_journal_5", "5. ethics - journal5", "•	Conflict of Interest: Authors must disclose any financial, personal, or professional conflicts of interest that could be perceived to influence the results or interpretation of their manuscript.", 124));
            saveIfNotExists(new PageContent("about", "ethics_journal_6", "6. ethics - journal6", "•	Data Fabrication and Falsification: Any manipulation, fabrication, or falsification of research data is considered severe misconduct and will result in immediate rejection or retraction of the article.", 125));
            saveIfNotExists(new PageContent("about", "ethics_journal_7", "7. ethics - journal7", "•	Human and Animal Rights: Research involving human subjects or animals must explicitly state compliance with ethical standards, including obtaining necessary approvals from institutional ethics committees and informed consent from human participants.", 126));

            saveIfNotExists(new PageContent("about", "timeline_title3", "9. Timeline - Section Title3", "About Vidyavishva Publications:", 127));
            saveIfNotExists(new PageContent("about", "Publications_journal_1", "1. Publications - journal1", "Vidyavishva Publications is a dynamic and visionary publishing house dedicated to promoting excellence in education, research, and professional literature. With a strong commitment to quality, authenticity, and innovation, Vidyavishva Publications serves as a trusted platform for scholars, academicians, researchers, and authors seeking to share meaningful knowledge with the world. It focuses on publishing textbooks, reference books, edited volumes, journals, monographs, and scholarly resources across healthcare, Ayurveda, medical sciences, and allied disciplines. (vidyavishva.com)\r\n"
            		+ "Driven by the belief that knowledge becomes powerful when shared responsibly, Vidyavishva Publications bridges the gap between intellectual creators and learners. The organization emphasizes transparent publishing practices, ethical standards, peer review systems, and academic integrity to ensure every publication meets high scholarly benchmarks. It also supports emerging researchers and young authors by providing opportunities to transform their ideas into impactful publications. (vidyavishva.com)\r\n"
            		+ "Vidyavishva Publications is particularly recognized for its dedication to Indian knowledge systems, Ayurveda, and contemporary scientific education, while maintaining relevance to modern curricular and regulatory standards. With multilingual publishing support and a forward-looking vision, the organization aspires to create a global presence in academic publishing. Through its commitment to credibility, accessibility, and intellectual growth, Vidyavishva Publications continues to inspire a culture of learning and innovation for future generations. (vidyavishva.com)\r\n"
            		+ "", 128));

            
            
            // 5. Footer Content
            saveIfNotExists(new PageContent("about", "footer_address", "26. Footer - Address", 
                "G1, Green park 6B, shanti park, Mira road E. 401107", 26));
            saveIfNotExists(new PageContent("about", "footer_email", "27. Footer - Email", "natureayurvedjournal@gmail.com", 27));
            saveIfNotExists(new PageContent("about", "footer_mobile", "28. Footer - Mobile", "7710880622", 28));
            saveIfNotExists(new PageContent("about", "footer_editor_name", "29. Footer - Editor Name", "Dr.Chetan Madhukar Gulhane", 29));
            saveIfNotExists(new PageContent("about", "footer_editor_email", "30. Footer - Editor Email", "natureayurvedjournal@gmail.com", 30));
            saveIfNotExists(new PageContent("about", "footer_contact_email", "31. Footer Contact - Email", "natureayurvedjournal@gmail.com", 31));
            saveIfNotExists(new PageContent("about", "footer_contact_website", "32. Footer Contact - Website", "www.ayuscript.com", 32));
            saveIfNotExists(new PageContent("about", "footer_contact_issn", "33. Footer Contact - ISSN", "0000-0000", 33));
            saveIfNotExists(new PageContent("about", "footer_copyright", "34. Footer - Copyright", 
                "Copyright © 2025 AYUSCRIPT All Rights Reserved.", 34));

            // ==================== EDITORIAL BOARD PAGE CONTENT ====================
            // Banner Section
            saveIfNotExists(new PageContent("editorial-board", "banner_title", "1. Banner Title", "EDITORIAL BOARD", 1));

            // Meet Our Team Section
            saveIfNotExists(new PageContent("editorial-board", "meet_team_title", "2. Meet Our Team - Title", "Meet Our Team", 2));
            saveIfNotExists(new PageContent("editorial-board", "editor_in_chief_name", "3. Editor in Chief - Name", "Dr. Vishnu Bawane", 3));
            saveIfNotExists(new PageContent("editorial-board", "editor_in_chief_designation", "4. Editor in Chief - Designation", "EXECUTIVE EDITOR", 4));
            saveIfNotExists(new PageContent("editorial-board", "editor_in_chief_qualifications", "5. Editor in Chief - Qualifications", "M.D.(Prasutitantra-Striroga), Ph.D.(Sch), PGDCR, EMBA", 5));
            saveIfNotExists(new PageContent("editorial-board", "editor_in_chief_description", "6. Editor in Chief - Description", "(Healthcare & Clinical Research) Professor, b.R. Harne Ayurvedic Medical College, Vangani, Thane. Ex Member - Maharashtra Council of Indian Medicine (MCIM).", 6));
            saveIfNotExists(new PageContent("editorial-board", "editor_in_chief_email", "7. Editor in Chief - Email", "drvcbawane@gmail.com", 7));

            // Executive Editors
            saveIfNotExists(new PageContent("editorial-board", "executive_editors_title", "8. Executive Editors - Title", "EDITOR IN CHIEF", 8));
            saveIfNotExists(new PageContent("editorial-board", "executive_editor_1_name", "9. Executive Editor 1 - Name", "DR CHETHAN M. GULHANE", 9));
            saveIfNotExists(new PageContent("editorial-board", "executive_editor_1_designation", "10. Executive Editor 1 - Designation", "EDITOR IN CHIEF", 10));
            saveIfNotExists(new PageContent("editorial-board", "executive_editor_1_qualifications", "11. Executive Editor 1 - Qualifications", "M.D. PhD (Panchakarma), Professor Panchakarma NCT Ayurved College Amreli.", 11));
            saveIfNotExists(new PageContent("editorial-board", "executive_editor_1_email", "12. Executive Editor 1 - Email", "drchetanayu@gmail.com", 12));

            saveIfNotExists(new PageContent("editorial-board", "executive_editor_2_name", "13. Executive Editor 2 - Name", "DR. SUNDARSINGH DANGA", 13));
            saveIfNotExists(new PageContent("editorial-board", "executive_editor_2_designation", "14. Executive Editor 2 - Designation", "EXECUTIVE EDITOR", 14));
            saveIfNotExists(new PageContent("editorial-board", "executive_editor_2_qualifications", "15. Executive Editor 2 - Qualifications", "M.D. (Kayachikitsa), MPH,PDCR (Clinical Research),PGDMLS, MCRI, MIPHA, MEFI. Director ARCA, Nagpur.", 15));
            saveIfNotExists(new PageContent("editorial-board", "executive_editor_2_email", "16. Executive Editor 2 - Email", "sunder147@gmail.com", 16));

            // Editorial Board International
            saveIfNotExists(new PageContent("editorial-board", "editorial_board_international_title", "17. Editorial Board International - Title", "EDITORIAL BOARD INTERNATIONAL", 17));
            saveIfNotExists(new PageContent("editorial-board", "editorial_board_international_name", "18. Editorial Board International - Name", "Prof. Dr. Shekhar Annambhotla", 18));
            saveIfNotExists(new PageContent("editorial-board", "editorial_board_international_designation", "19. Editorial Board International - Designation", "EDITORIAL BOARD INTERNATIONAL", 19));
            saveIfNotExists(new PageContent("editorial-board", "editorial_board_international_qualifications", "20. Editorial Board International - Qualifications", "BAMS MD(Ayu), President, AAPNA AAPNA - Association of Ayurvedic Professionals of North America, Inc. 567 Thomas Street, Suite 400 Coopersburg, PA 18036 United States of America", 20));
            saveIfNotExists(new PageContent("editorial-board", "editorial_board_international_email", "21. Editorial Board International - Email", "aapnahelp@gmail.com", 21));

            // Editorial Board National
            saveIfNotExists(new PageContent("editorial-board", "editorial_board_national_title", "22. Editorial Board National - Title", "EDITORIAL BOARD NATIONAL", 22));
            saveIfNotExists(new PageContent("editorial-board", "editorial_board_national_1_name", "23. Editorial Board National 1 - Name", "Dr. Pradip Krishnaji Awale", 23));
            saveIfNotExists(new PageContent("editorial-board", "editorial_board_national_1_designation", "24. Editorial Board National 1 - Designation", "EDITORIAL BOARD NATIONAL", 24));
            saveIfNotExists(new PageContent("editorial-board", "editorial_board_national_1_qualifications", "25. Editorial Board National 1 - Qualifications", "Associate Professor, AYUSH Department, Maharashtra University of Health Sciences, Nashik. Mobile no. 93238 42361", 25));
            saveIfNotExists(new PageContent("editorial-board", "editorial_board_national_1_email", "26. Editorial Board National 1 - Email", "ayush@muhs.ac.in", 26));

            saveIfNotExists(new PageContent("editorial-board", "editorial_board_national_2_name", "27. Editorial Board National 2 - Name", "Dr.Sheetal Asutkar", 27));
            saveIfNotExists(new PageContent("editorial-board", "editorial_board_national_2_designation", "28. Editorial Board National 2 - Designation", "EDITORIAL BOARD NATIONAL", 28));
            saveIfNotExists(new PageContent("editorial-board", "editorial_board_national_2_qualifications", "29. Editorial Board National 2 - Qualifications", "M.S.,Ph.D. Head, Dept of Shalya tantra, Mahatma Gandhi Ayurveda College Hospital and Research Centre,Salod, Wardha Mobile no. 97668 11974", 29));
            saveIfNotExists(new PageContent("editorial-board", "editorial_board_national_2_email", "30. Editorial Board National 2 - Email", "sheetal.gujjanwar@dmimsu.edu.in", 30));

            saveIfNotExists(new PageContent("editorial-board", "editorial_board_national_3_name", "31. Editorial Board National 3 - Name", "Karanam Lakshmi Sireesha", 31));
            saveIfNotExists(new PageContent("editorial-board", "editorial_board_national_3_designation", "32. Editorial Board National 3 - Designation", "EDITORIAL BOARD NATIONAL", 32));
            saveIfNotExists(new PageContent("editorial-board", "editorial_board_national_3_qualifications", "33. Editorial Board National 3 - Qualifications", "B.A.M.S,M.S(Ayu),D.Y.Patil Deemed to be University School of Ayurveda & Hospital, Sector -7, Nerul, Maharashtra -4", 33));
            saveIfNotExists(new PageContent("editorial-board", "editorial_board_national_3_email", "34. Editorial Board National 3 - Email", "karanam.sireesha@dypatil.edu", 34));

            saveIfNotExists(new PageContent("editorial-board", "editorial_board_national_4_name", "35. Editorial Board National 4 - Name", "DR. SWAPNIL AUTI", 35));
            saveIfNotExists(new PageContent("editorial-board", "editorial_board_national_4_designation", "36. Editorial Board National 4 - Designation", "EDITORIAL BOARD NATIONAL", 36));
            saveIfNotExists(new PageContent("editorial-board", "editorial_board_national_4_qualifications", "37. Editorial Board National 4 - Qualifications", "M.D. Ph.D.,(Ayu) PGDYN, Asso. Prof. Department of Panchakarma, Faculty of Indian Medical System, SGT University, Gurugram.", 37));
            saveIfNotExists(new PageContent("editorial-board", "editorial_board_national_4_email", "38. Editorial Board National 4 - Email", "swapnil_fims@sgtuniversity.org", 38));

            saveIfNotExists(new PageContent("editorial-board", "editorial_board_national_5_name", "39. Editorial Board National 5 - Name", "DR. DHIRAJSINGH RAJPUT", 39));
            saveIfNotExists(new PageContent("editorial-board", "editorial_board_national_5_designation", "40. Editorial Board National 5 - Designation", "EDITORIAL BOARD NATIONAL", 40));
            saveIfNotExists(new PageContent("editorial-board", "editorial_board_national_5_qualifications", "41. Editorial Board National 5 - Qualifications", "M.D. Ph.D. (Ras shastra Bhaishyajyakalpna), Asso. Prof. Department of Rasashastra, Mahatma Gandhi Ayurved Medical College Hospital, Wardha, Maharashtra", 41));
            saveIfNotExists(new PageContent("editorial-board", "editorial_board_national_5_email", "42. Editorial Board National 5 - Email", "dhiraj.rajput@ccras.nic.in", 42));

            // Associate Editor International
            saveIfNotExists(new PageContent("editorial-board", "associate_editor_international_title", "43. Associate Editor International - Title", "ASSOCIATE EDITOR INTERNATIONAL", 43));
            saveIfNotExists(new PageContent("editorial-board", "associate_editor_international_name", "44. Associate Editor International - Name", "Dr. Prashant Prakash Shivgunde", 44));
            saveIfNotExists(new PageContent("editorial-board", "associate_editor_international_designation", "45. Associate Editor International - Designation", "ASSOCIATE EDITORIAL NATIONAL", 45));
            saveIfNotExists(new PageContent("editorial-board", "associate_editor_international_qualifications", "46. Associate Editor International - Qualifications", "Assistant Professor, URD, MUHS, Nashik", 46));
            saveIfNotExists(new PageContent("editorial-board", "associate_editor_international_email", "47. Associate Editor International - Email", "urd@muhs.ac.in", 47));

            // Associate Editors
            saveIfNotExists(new PageContent("editorial-board", "associate_editors_title", "48. Associate Editors - Title", "ASSOCIATE EDITORS", 48));
            saveIfNotExists(new PageContent("editorial-board", "associate_editor_name", "49. Associate Editor - Name", "Dr. Snehal Rathod", 49));
            saveIfNotExists(new PageContent("editorial-board", "associate_editor_designation", "50. Associate Editor - Designation", "ASSOCIATE EDITORS", 50));
            saveIfNotExists(new PageContent("editorial-board", "associate_editor_qualifications", "51. Associate Editor - Qualifications", "Professor, Dept of Prasutitantra-Striroga, Ayurved Mahavidyalya, Pusad", 51));
            saveIfNotExists(new PageContent("editorial-board", "associate_editor_email", "52. Associate Editor - Email", "drsnehalrathod@gmail.com", 52));

            // Image fields for Editorial Board
            saveIfNotExists(new PageContent("editorial-board", "editor_in_chief_image", "53. Editor in Chief - Image", "/images/image1.jpg", 53));
            saveIfNotExists(new PageContent("editorial-board", "executive_editor_1_image", "54. Executive Editor 1 - Image", "/images/image2.jpg", 54));
            saveIfNotExists(new PageContent("editorial-board", "executive_editor_2_image", "55. Executive Editor 2 - Image", "/images/image3.jpg", 55));
            saveIfNotExists(new PageContent("editorial-board", "editorial_board_international_image", "56. Editorial Board International - Image", "/images/angelica.jpg", 56));
            saveIfNotExists(new PageContent("editorial-board", "editorial_board_national_1_image", "57. Editorial Board National 1 - Image", "/images/punam_suple.jpg", 57));
            saveIfNotExists(new PageContent("editorial-board", "editorial_board_national_2_image", "58. Editorial Board National 2 - Image", "/images/image6.jpg", 58));
            saveIfNotExists(new PageContent("editorial-board", "editorial_board_national_3_image", "59. Editorial Board National 3 - Image", "/images/image7.jpg", 59));
            saveIfNotExists(new PageContent("editorial-board", "editorial_board_national_4_image", "60. Editorial Board National 4 - Image", "/images/image8.jpg", 60));
            saveIfNotExists(new PageContent("editorial-board", "editorial_board_national_5_image", "61. Editorial Board National 5 - Image", "/images/image9.jpg", 61));
            saveIfNotExists(new PageContent("editorial-board", "associate_editor_international_image", "62. Associate Editor International - Image", "/images/image10.jpg", 62));
            saveIfNotExists(new PageContent("editorial-board", "associate_editor_image", "63. Associate Editor - Image", "/images/image11.jpg", 63));

            // ==================== AUTHOR GUIDELINE PAGE CONTENT ====================
            // Banner Section
            saveIfNotExists(new PageContent("author-guideline", "banner_title", "1. Banner Title", "Author Guidelines", 1));
            saveIfNotExists(new PageContent("author-guideline", "banner_subtitle", "2. Banner Subtitle", "Comprehensive instructions for preparing and submitting your research manuscripts to Nature Ayurved", 2));

            // Action Buttons
            saveIfNotExists(new PageContent("author-guideline", "copyright_form_text", "3. Copyright Form Button Text", "DOWNLOAD COPYRIGHT FORM", 3));
            saveIfNotExists(new PageContent("author-guideline", "become_author_text", "4. Become Author Button Text", "BECOME AN AUTHOR", 4));

            // Main Content
            saveIfNotExists(new PageContent("author-guideline", "instructions_title", "5. Instructions Title", "INSTRUCTIONS OR AUTHOR GUIDELINES", 5));
            saveIfNotExists(new PageContent("author-guideline", "submission_checklist_title", "6. Submission Checklist Title", "Submission Preparation Checklist", 6));
            saveIfNotExists(new PageContent("author-guideline", "submission_checklist_content", "7. Submission Checklist Content", "As part of the submission process, authors are required to check off their submission\'s compliance with all of the following items, and submissions may be returned to authors that do not adhere to these guidelines. The submission has not been previously published, nor is it before another journal for consideration.", 7));

            saveIfNotExists(new PageContent("author-guideline", "manuscript_types_title", "8. Manuscript Types Title", "Types of Manuscripts to be submitted-", 8));
            saveIfNotExists(new PageContent("author-guideline", "manuscript_type_1", "9. Manuscript Type 1", "Editorial (Only for Editors or Invited Experts)", 9));
            saveIfNotExists(new PageContent("author-guideline", "manuscript_type_2", "10. Manuscript Type 2", "Original Research Article (Experimental study / Clinical study / Observational study)", 10));
            saveIfNotExists(new PageContent("author-guideline", "manuscript_type_3", "11. Manuscript Type 3", "Review Article (Literary review / Conceptual review)", 11));
            saveIfNotExists(new PageContent("author-guideline", "manuscript_type_4", "12. Manuscript Type 4", "Case Study (Case Report / Case series)", 12));
            saveIfNotExists(new PageContent("author-guideline", "manuscript_type_5", "13. Manuscript Type 5", "Book Review, Product Review, Metanalysis", 13));

            saveIfNotExists(new PageContent("author-guideline", "author_guidelines_title", "14. Author Guidelines Title", "Author Guidelines", 14));
            saveIfNotExists(new PageContent("author-guideline", "author_guidelines_content_1", "15. Author Guidelines Content 1", "Authors are asked to write their manuscripts in English in A4 size page with margins 2.5 cm from all four sides, Source Sans Pro font using a font size of 12. Page numbers included at bottom.", 15));
            saveIfNotExists(new PageContent("author-guideline", "author_guidelines_content_2", "16. Author Guidelines Content 2", "Ayurvedic terms and other Latin terms must be Italicized and its equivalent English terminology should be mentioned in first instance in a bracket, for example: Urdhwaga Amlapitta (Non ulcer dyspepsia).", 16));
            saveIfNotExists(new PageContent("author-guideline", "author_guidelines_content_3", "17. Author Guidelines Content 3", "Total number of authors may be 01 to maximum 05., for multicentric clinical trials it may be more.", 17));
            saveIfNotExists(new PageContent("author-guideline", "author_guidelines_content_4", "18. Author Guidelines Content 4", "Headings in title case (not ALL CAPITALS), bold face capitals, single-spaced.", 18));
            saveIfNotExists(new PageContent("author-guideline", "author_guidelines_content_5", "19. Author Guidelines Content 5", "The references cited in the text should be after punctuation marks, in superscript with square bracket.", 19));
            saveIfNotExists(new PageContent("author-guideline", "author_guidelines_content_6", "20. Author Guidelines Content 6", "Standard International Units could be used throughout the text.", 20));
            saveIfNotExists(new PageContent("author-guideline", "author_guidelines_content_7", "21. Author Guidelines Content 7", "All named authors have agreed to its submission.", 21));
            saveIfNotExists(new PageContent("author-guideline", "author_guidelines_content_8", "22. Author Guidelines Content 8", "Authors have obtained permission from their employers or institution to publish, if they have a contractual or moral obligation to do so.", 22));

            saveIfNotExists(new PageContent("author-guideline", "original_articles_title", "23. Original Articles Title", "Preparation Of Original Articles", 23));
            saveIfNotExists(new PageContent("author-guideline", "original_articles_url", "24. Original Articles URL", "https://www.mayoclinic.org/diseases-conditions/high-blood-pressure/diagnosis-treatment/drc-20373417", 24));

            saveIfNotExists(new PageContent("author-guideline", "references_title", "25. References Title", "References from Ayurvedic Classical Texts and Samhitas:", 25));
            saveIfNotExists(new PageContent("author-guideline", "reference_1", "26. Reference 1", "Tripathi B, editor, (1st ed.). Ashtanga Samgraha of Vagbhata, Sootra Sthana; Ayushkamiya Adhyaya: Chapter 1, Verse 10-16. Varanasi: Chowkhambha Sanskrit Series, 2010; p. 2-3.", 26));
            saveIfNotExists(new PageContent("author-guideline", "reference_2", "27. Reference 2", "Tripathi B, editor, (1st ed.). Commentary Shashilekha of Indu on Ashtanga Samgraha of Vagbhata, Sootra Sthana; Ayushkamiya Adhyaya: Chapter 1, Verse 10-16. Varanasi: Chowkhambha Sanskrit Series, 2006; p. 7-8.", 27));

            saveIfNotExists(new PageContent("author-guideline", "article_structure_title", "28. Article Structure Title", "Structure of Research Articles", 28));
            saveIfNotExists(new PageContent("author-guideline", "article_structure_1", "29. Article Structure 1", "1. Title page (excluding acknowledgements) with Abstract", 29));
            saveIfNotExists(new PageContent("author-guideline", "article_structure_2", "30. Article Structure 2", "2. Introduction", 30));
            saveIfNotExists(new PageContent("author-guideline", "article_structure_3", "31. Article Structure 3", "3. Materials (or patients) and methods", 31));
            saveIfNotExists(new PageContent("author-guideline", "article_structure_4", "32. Article Structure 4", "4. Results", 32));
            saveIfNotExists(new PageContent("author-guideline", "article_structure_5", "33. Article Structure 5", "5. Discussion", 33));
            saveIfNotExists(new PageContent("author-guideline", "article_structure_6", "34. Article Structure 6", "6. Conclusion", 34));
            saveIfNotExists(new PageContent("author-guideline", "article_structure_7", "35. Article Structure 7", "7. Acknowledgements", 35));
            saveIfNotExists(new PageContent("author-guideline", "article_structure_8", "36. Article Structure 8", "8. Conflict of Interest", 36));
            saveIfNotExists(new PageContent("author-guideline", "article_structure_9", "37. Article Structure 9", "9. References", 37));

            saveIfNotExists(new PageContent("author-guideline", "title_page_title", "38. Title Page Title", "1. Title page", 38));
            saveIfNotExists(new PageContent("author-guideline", "title_page_content_1", "39. Title Page Content 1", "1. Title: Concise and informative. Running title not more than 25 letters.", 39));
            saveIfNotExists(new PageContent("author-guideline", "title_page_content_2", "40. Title Page Content 2", "2. Author names and affiliations: Number authors with superscript.", 40));

            saveIfNotExists(new PageContent("author-guideline", "abstract_title", "41. Abstract Title", "Abstract", 41));
            saveIfNotExists(new PageContent("author-guideline", "abstract_content_1", "42. Abstract Content 1", "Well structured abstract, not more than 200 words, covering background, aims and objectives, methods, statistical tests, results, and conclusion. No references.", 42));
            saveIfNotExists(new PageContent("author-guideline", "abstract_content_2", "43. Abstract Content 2", "Key words: 3 to 6 key words.", 43));

            saveIfNotExists(new PageContent("author-guideline", "introduction_title", "44. Introduction Title", "2. Introduction", 44));
            saveIfNotExists(new PageContent("author-guideline", "introduction_content", "45. Introduction Content", "Introduction should assume that the reader is knowledgeable. Include aims and objectives.", 45));

            saveIfNotExists(new PageContent("author-guideline", "materials_methods_title", "46. Materials and Methods Title", "3. Materials and Methods", 46));
            saveIfNotExists(new PageContent("author-guideline", "materials_methods_content", "47. Materials and Methods Content", "Provide manufacturer name, trade name, and drug details. Follow ICMR & Govt. guidelines.", 47));

            saveIfNotExists(new PageContent("author-guideline", "tables_figures_title", "48. Tables and Figures Title", "Tables And Figure", 48));
            saveIfNotExists(new PageContent("author-guideline", "tables_figures_content", "49. Tables and Figures Content", "Only MS Word table format. Number tables consecutively. Avoid vertical rules. Figures in JPEG. Graphs generated in Excel.", 49));

            saveIfNotExists(new PageContent("author-guideline", "peer_review_title", "50. Peer Review Title", "Peer review policy :", 50));
            saveIfNotExists(new PageContent("author-guideline", "peer_review_content_1", "51. Peer Review Content 1", "Journal uses double-blind peer review. Reviewers and authors remain anonymous.", 51));
            saveIfNotExists(new PageContent("author-guideline", "peer_review_content_2", "52. Peer Review Content 2", "Review process takes 03 weeks. Additional reviews may be requested.", 52));

            saveIfNotExists(new PageContent("author-guideline", "plagiarism_title", "53. Plagiarism Title", "Plagiarism Policy:", 53));
            saveIfNotExists(new PageContent("author-guideline", "plagiarism_content", "54. Plagiarism Content", "Journal respects intellectual property. Plagiarism is strictly prohibited. Author must respond within two weeks if plagiarism found. PDF removed if rejected. Author account may be disabled for 3/5/10 years or permanently.", 54));

            saveIfNotExists(new PageContent("author-guideline", "publication_fee_title", "55. Publication Fee Title", "Publication Fee:", 55));
            saveIfNotExists(new PageContent("author-guideline", "publication_fee_content", "56. Publication Fee Content", "Article Processing Fees payable after acceptance:  Technical charges: 2500 INR (Indian Author), 100 USD (Foreign Author)", 56));
        
            //policy content
            saveIfNotExists(new PageContent("policy", "policy_title", "1. policy - Title", "POLICY", 57));
            saveIfNotExists(new PageContent("policy", "policy_content_1", "2. policy Section - Title", "PUBLICATION POLICY", 58));
            saveIfNotExists(new PageContent("policy", "policy_content_2", "3. policy Section - Paragraph 1", 
                "Nature Ayurved is a peer-reviewed international journal committed to the timely dissemination of high-quality scholarly work in Ayurveda, integrative medicine, allied health sciences, and related interdisciplinary fields.\r\n"
                + "The journal follows a bi-monthly publication schedule, releasing six issues annually. Issues are ordinarily published in the months of: January, March, May, July, September, November.", 59));
            saveIfNotExists(new PageContent(
            	    "policy",
            	    "policy_content_3",
            	    "4. Policy Section - Paragraph 2",
            	    "Manuscripts accepted for publication after successful peer review, editorial evaluation, and completion of all publication formalities will be scheduled for the next available issue based on editorial priority, thematic relevance, and date of final acceptance.\r\n"
            	    + "The journal reserves the right to publish special issues, supplementary issues, conference proceedings, or thematic editions whenever required.\r\n"
            	    + "All accepted articles may be made available online as “Articles in Press” or “Ahead of Print” prior to their inclusion in a scheduled issue, subject to editorial discretion.\r\n"
            	    + "While every effort is made to adhere to the declared publication timeline, the journal reserves the right to modify release dates, combine issues, or delay publication due to unforeseen editorial, technical, or administrative circumstances.\r\n"
            	    + "The editorial board maintains full authority over issue planning, article sequencing, pagination, and final publication decisions to ensure academic quality and publication integrity.\r\n"
            	    + "",
            	    60
            	));
            saveIfNotExists(new PageContent("policy", "policy_content_4", "2. policy Section - Title", "Plagiarism Policy", 61));
            saveIfNotExists(new PageContent("policy", "policy_content_5", "3. policy Section - Paragraph 1", "Nature Ayurved: International Journal of Ayurved Science & Research", 62));
            saveIfNotExists(new PageContent("policy", "policy_content_6", "4. policy Section - Paragraph 2", "At Nature Ayurved: International Journal of Ayurved Science & Research, we are committed to maintaining the highest standards of academic integrity, originality, and ethical publishing practices. Plagiarism in any form is considered a serious violation of scholarly ethics and is strictly prohibited.\r\n"
            		+ "Plagiarism includes, but is not limited to:\r\n"
            		+ "", 63));
            saveIfNotExists(new PageContent("policy", "policy_content_7", "5. policy Section - Paragraph 3", "•	Copying text, ideas, data, images, or results from another source without proper acknowledgment.", 64));
            saveIfNotExists(new PageContent("policy", "policy_content_8", "6. policy Section - Paragraph 4", "•	Presenting another person’s work as one’s own.", 65));
            saveIfNotExists(new PageContent("policy", "policy_content_9", "7. policy Section - Paragraph 5", "•	Using published or unpublished material without citation.", 66));
            saveIfNotExists(new PageContent("policy", "policy_content_10", "8. policy Section - Paragraph 6", "• Paraphrasing another author’s work without appropriate reference.", 67));
            saveIfNotExists(new PageContent("policy", "policy_content_11", "9. policy Section - Paragraph 7", "• Self-plagiarism, including reuse of one’s own previously published content without proper citation or permission.", 68));
            saveIfNotExists(new PageContent("policy", "policy_content_12", "10. policy Section - Paragraph 8", "• Submitting duplicate or substantially similar manuscripts to multiple journals.", 69));
           
            saveIfNotExists(new PageContent("policy", "policy_content_13", "11. policy Section - Title1", "Author Responsibilities", 70));
            saveIfNotExists(new PageContent("policy", "policy_content_14", "12. policy Section - Paragraph 9", "Authors are solely responsible for ensuring that their submitted manuscripts are original and free from plagiarism. All sources, references, and previously published materials used in the manuscript must be properly cited according to the journal guidelines. Authors should always present concepts, interpretations, and findings in their own words.", 71));
        
            saveIfNotExists(new PageContent("policy", "policy_content_15", "13. policy Section - Title2", "Plagiarism Screening", 72));
            saveIfNotExists(new PageContent("policy", "policy_content_16", "14. policy Section - Paragraph 9", "All manuscripts submitted to the journal are subject to plagiarism detection screening using standard plagiarism checking tools before and during the peer-review process. The editorial board reserves the right to recheck manuscripts at any stage of review or publication.", 73));
           
            saveIfNotExists(new PageContent("policy", "policy_content_17", "15. policy Section - Title3", "Actions in Case of Plagiarism", 74));
            saveIfNotExists(new PageContent("policy", "policy_content_18", "16. policy Section - Paragraph 10", "If plagiarism is identified at any stage, the journal may take the following actions depending on the severity of the misconduct:", 75));
           
            saveIfNotExists(new PageContent("policy", "policy_content_19", "17. policy Section - Title4", "Before Publication", 76));
            saveIfNotExists(new PageContent("policy", "policy_content_20", "18. policy Section - Paragraph 11", "•	Immediate rejection of the manuscript.\r\n"
            		+ "•	Notification to the corresponding author with explanation.\r\n"
            		+ "•	Temporary or permanent restriction on future submissions.\r\n"
            		+ "", 77));
            
            saveIfNotExists(new PageContent("policy", "policy_content_21", "19. policy Section - Title5", "After Publication", 78));
            saveIfNotExists(new PageContent("policy", "policy_content_22", "20. policy Section - Paragraph 12", "•	Retraction of the published article.\r\n"
            		+ "•	Publication of an official retraction notice.\r\n"
            		+ "•	Notification to the author’s affiliated institution, funding agency, or regulatory authority.\r\n"
            		+ "•	Informing the original copyright holder or affected author(s).\r\n"
            		+ "", 79));
           
            saveIfNotExists(new PageContent("policy", "policy_content_23", "21. policy Section - Title6", "Acceptable Similarity Limit", 80));
            saveIfNotExists(new PageContent("policy", "policy_content_24", "22. policy Section - Paragraph 13", "Authors are advised to maintain overall similarity below acceptable academic standards and ensure that no copied content is included without citation. High similarity due to references, common terminology, or methodology sections may be assessed separately by editors.", 81));
            
            saveIfNotExists(new PageContent("policy", "policy_content_25", "23. policy Section - Title7", "Editorial Rights", 82));
            saveIfNotExists(new PageContent("policy", "policy_content_26", "24. policy Section - Paragraph 14", "The final decision regarding plagiarism, originality, and ethical suitability of a manuscript rests solely with the Editor-in-Chief and Editorial Board of the journal.", 83));
            
            saveIfNotExists(new PageContent("policy", "policy_content_27", "25. policy Section - Title8", "Commitment to Ethical Publishing", 84));
            saveIfNotExists(new PageContent("policy", "policy_content_28", "26. policy Section - Paragraph 15", "The journal encourages all authors, reviewers, and editors to uphold transparency, honesty, and responsible research publication practices in order to promote the growth of authentic Ayurvedic scientific literature.", 85));

           
            saveIfNotExists(new PageContent("policy", "policy_content_29", "2. policy Section - Title9", "Review Policy", 86));
            saveIfNotExists(new PageContent("policy", "policy_content_5", "3. policy Section - Paragraph 1", "Nature Ayurved: International Journal of Ayurved Science & Research", 62));
            saveIfNotExists(new PageContent("policy", "policy_content_30", "4. policy Section - Paragraph 16", "At Nature Ayurved: International Journal of Ayurved Science & Research,"
            		+ " we are committed to ensuring a fair, transparent, timely, and high-quality peer review process."
            		+ " Every manuscript submitted to the journal undergoes a structured editorial and peer-review procedure to maintain academic excellence and scientific integrity.", 87));
       
            saveIfNotExists(new PageContent("policy", "policy_content_31", "23. policy Section - Title10", "Manuscript Review Process", 88));
            saveIfNotExists(new PageContent("policy", "policy_content_32", "24. policy Section - Title11", "Step 1: Submission by Author", 89));
            saveIfNotExists(new PageContent("policy", "policy_content_33", "25. policy Section - Paragraph 17", "Authors may submit their original research articles, review papers, case studies, short communications, and other scholarly manuscripts through the journal’s official submission system or via the official editorial email as prescribed by the journal.\r\n"
            		+ "All submissions must comply with the journal’s author guidelines, formatting standards, and ethical policies.\r\n"
            		+ "", 90));
            saveIfNotExists(new PageContent("policy", "policy_content_34", "26. policy Section - Title12", "Step 2: Initial Editorial Screening", 91));
            saveIfNotExists(new PageContent("policy", "policy_content_35", "27. policy Section - Paragraph 18", "Upon receipt, each manuscript is screened by the Editorial Office for:\r\n"
            		+ "•	Scope and relevance to Ayurveda and allied sciences\r\n"
            		+ "•	Basic formatting compliance\r\n"
            		+ "•	Grammar and language quality\r\n"
            		+ "•	Completeness of manuscript files\r\n"
            		+ "•	Ethical declarations and authorship details\r\n"
            		+ "•	Plagiarism screening\r\n"
            		+ "Manuscripts with excessive grammatical errors, poor formatting, or non-compliance with journal guidelines may be returned to the authors for correction before peer review.\r\n"
            		
            		+ "", 92));
            saveIfNotExists(new PageContent("policy", "policy_content_36", "28. policy Section - Title13", "Step 3: Double-Blind Peer Review", 93));
            saveIfNotExists(new PageContent("policy", "policy_content_37", "29. policy Section - Paragraph 19", "All eligible manuscripts are subjected to a double-blind peer review process, where both authors and reviewers remain anonymous.\r\n"
            		+ "Each manuscript is reviewed by at least two independent subject experts, and where necessary, three or more reviewers may be invited for specialized evaluation.\r\n"
            		+ "Reviewers assess manuscripts on the basis of:\r\n"
            		+ "•	Originality and novelty\r\n"
            		+ "•	Scientific quality and methodology\r\n"
            		+ "•	Relevance to journal scope\r\n"
            		+ "•	Clinical/research significance\r\n"
            		+ "•	Literature review and references\r\n"
            		+ "•	Ethical compliance\r\n"
            		+ "•	Clarity of presentation\r\n"
            		+ "•	Overall contribution to Ayurvedic science\r\n"
            		+ ""
            		+ "", 94));
            saveIfNotExists(new PageContent("policy", "policy_content_38", "30. policy Section - Title14", "Step 4: Reviewer Recommendations", 95));
            saveIfNotExists(new PageContent("policy", "policy_content_39", "31. policy Section - Paragraph 20", "Based on reviewer comments, the editorial decision may be one of the following:\r\n"
            		+ "1.	Accepted\r\n"
            		+ "2.	Rejected\r\n"
            		+ "3.	Accepted with Minor Revisions\r\n"
            		+ "4.	Accepted with Major Revisions\r\n"
            		+ "Authors receiving revision requests must submit the revised manuscript within the specified timeline along with point-by-point responses to reviewer comments.\r\n"
            		+ ""
            		+ "", 96));
            saveIfNotExists(new PageContent("policy", "policy_content_40", "32. policy Section - Title15", "Step 5: Final Editorial Decision", 97));
            saveIfNotExists(new PageContent("policy", "policy_content_41", "33. policy Section - Paragraph 21", "After satisfactory revision (if applicable), the Editor-in-Chief or Editorial Board makes the final decision regarding acceptance and forwards the manuscript for production."
            		+ "", 98));
            saveIfNotExists(new PageContent("policy", "policy_content_42", "34. policy Section - Title16", "Step 6: Production and Publication", 99));
            saveIfNotExists(new PageContent("policy", "policy_content_43", "35. policy Section - Paragraph 22", "Accepted manuscripts undergo copyediting, layout formatting, proof preparation, and issue scheduling before publication in the current or upcoming issue of the journal."
            		+ "", 100));
            saveIfNotExists(new PageContent("policy", "policy_content_44", "36. policy Section - Title17", "Step 7: Author Notification", 101));
            saveIfNotExists(new PageContent("policy", "policy_content_45", "37. policy Section - Paragraph 23", "Authors are informed of all major decisions, including acceptance, revision requests, rejection, and publication status through official email communication."
            		+ "", 102));
            
            saveIfNotExists(new PageContent("policy", "policy_content_46", "38. policy Section - Title18", "Confidentiality and Ethics", 103));
            saveIfNotExists(new PageContent("policy", "policy_content_47", "39. policy Section - Paragraph 24", "All submitted manuscripts are treated as confidential documents. Reviewers are expected to maintain confidentiality, avoid conflicts of interest, and provide objective, constructive, and timely reviews.", 104));
        
            saveIfNotExists(new PageContent("policy", "policy_content_48", "40. policy Section - Title19", "Editorial Rights", 105));
            saveIfNotExists(new PageContent("policy", "policy_content_49", "41. policy Section - Paragraph 25", "The Editor-in-Chief reserves the right to accept, reject, or request modifications to any manuscript based on reviewer recommendations, journal policy, and academic standards.", 106));
     
            saveIfNotExists(new PageContent("policy", "policy_content_50", "42. policy Section - Title20", "Commitment to Quality", 107));
            saveIfNotExists(new PageContent("policy", "policy_content_51", "43. policy Section - Paragraph 26", "Nature Ayurved Journal is dedicated to promoting authentic, evidence-based, and high-quality research in Ayurveda through a rigorous and unbiased peer review system.", 108));

            saveIfNotExists(new PageContent("policy", "policy_content_52", "44. policy Section - Title21", "Conflict of Interest Policy", 109));
            saveIfNotExists(new PageContent("policy", "policy_content_53", "45. policy Section - Paragraph 27", "A conflict of interest exists when any financial, professional, personal, or academic relationship could influence, or appear to influence, the objectivity, integrity, or interpretation of the work submitted for publication. This may include direct or indirect financial support, commercial affiliations, institutional interests, personal relationships, or academic competition.\r\n"
            		+ "The corresponding author is responsible for obtaining relevant conflict of interest disclosures from all co-authors and ensuring that the copyright/authorship declaration form, duly signed by all authors, is submitted along with the manuscript.\r\n"
            		+ "It is the duty of the corresponding author to confirm with all co-authors whether any competing interests exist. Any such disclosures must be clearly stated in the title page or cover letter at the time of submission.\r\n"
            		+ "As part of our ethical publishing standards, all reviewers are required to decline review assignments where a potential conflict of interest exists or to declare any such conflict before accepting the manuscript for review.\r\n"
            		+ "Similarly, all editors must disclose any potential conflicts of interest in accordance with editorial ethics policies. Editors with a conflict related to a submitted manuscript will not participate in its review or decision-making process, and the manuscript will be reassigned to another qualified editor.\r\n"
            		+ "If any conflict of interest is identified after publication, authors, readers, or concerned parties are requested to notify the editorial office promptly.\r\n"
            		+ "All reported concerns will be investigated thoroughly, normally within seven (07) working days. If the claim is found to be valid, the journal reserves the right to take appropriate corrective action, including publication of corrections, expressions of concern, retraction of the article, and removal from journal platforms or indexing databases where applicable.\r\n"
            		+ "", 110));

        }
    }
}

