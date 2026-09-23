<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit & Publish Article - AYUSCRIPT Admin</title>

    <!-- Bootstrap 5.3.3 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <!-- nicEdit (only load for editable files) -->
    <c:if test="${canEdit}">
        <script src="https://js.nicedit.com/nicEdit-latest.js" type="text/javascript"></script>
        <script type="text/javascript">
            bkLib.onDomLoaded(function() {
                new nicEditor({
                    fullPanel : true,
                    iconsPath : 'https://js.nicedit.com/nicEditorIcons.gif'
                }).panelInstance('htmlContent');
            });
        </script>
    </c:if>

    <style>
        :root {
            --deep-green: #0b5633;
            --leaf: #2b8a5f;
            --rust: #7a4b3a;
            --gold: #c9a25a;
            --cream: #fbf6ee;
            --paper: #f7efe6;
            --text: #2d2d2d;
            --primary-dark: #083c23;
            --light-gray: #e8e0d5;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        html, body {
            overflow-x: hidden;
            max-width: 100%;
        }

        body {
            background: var(--cream);
            font-family: Arial;
            display: flex;
            min-height: 100vh;
        }

        /* Sidebar */
        .sidebar {
            width: 250px;
            background: var(--deep-green);
            color: var(--cream);
            height: 100vh;
            position: fixed;
            left: 0;
            top: 0;
            transition: all 0.3s ease;
            z-index: 1000;
            box-shadow: 2px 0 10px rgba(0, 0, 0, 0.1);
            overflow-y: auto;
            overflow-x: hidden;
        }

        .sidebar-header {
            padding: 1.5rem 1rem;
            border-bottom: 1px solid rgba(251, 246, 238, 0.1);
            text-align: center;
            background: var(--primary-dark);
        }

        .sidebar-header h2 {
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--gold);
        }

        .sidebar-menu {
            padding: 1rem 0;
            height: calc(100vh - 80px);
            overflow-y: auto;
        }

        .sidebar-menu ul {
            list-style: none;
        }

        .sidebar-menu li {
            margin-bottom: 0.5rem;
        }

        .sidebar-menu a {
            display: flex;
            align-items: center;
            padding: 0.8rem 1.5rem;
            color: rgba(251, 246, 238, 0.9);
            text-decoration: none;
            transition: all 0.3s;
        }

        .sidebar-menu a:hover, .sidebar-menu a.active {
            background: rgba(201, 162, 90, 0.15);
            color: var(--gold);
            border-left: 4px solid var(--gold);
        }

        .sidebar-menu i {
            margin-right: 0.8rem;
            font-size: 1.2rem;
            width: 20px;
            text-align: center;
        }

        /* Main Content */
        .main-content {
            flex: 1;
            margin-left: 250px;
            padding: 1.5rem;
            transition: all 0.3s ease;
            width: calc(100% - 250px);
            min-height: 100vh;
            overflow-x: hidden;
        }

        /* Mobile menu toggle */
        .menu-toggle {
            display: none;
            position: fixed;
            top: 1rem;
            left: 1rem;
            z-index: 3000;
            background: var(--deep-green);
            color: var(--gold);
            border: none;
            border-radius: 8px;
            padding: 0.7rem 0.9rem;
            font-size: 1.2rem;
            cursor: pointer;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            transition: all 0.3s;
        }

        .menu-toggle:hover {
            background: var(--primary-dark);
            transform: scale(1.05);
        }

        /* Sidebar Overlay for Mobile */
        .sidebar-overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: 999;
            opacity: 0;
            transition: opacity 0.3s;
        }

        .sidebar-overlay.active {
            display: block;
            opacity: 1;
        }

        .container {
            background: #ffffff;
            padding: 25px;
            border-radius: 10px;
            width: 100%;
            max-width: 1000px;
            margin: 0 auto;
            box-shadow: 0 0 10px #cfcfcf;
        }
        label {
            font-weight: bold;
            margin-top: 15px;
            display: block;
        }
        input, textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 15px;
        }
        button {
            margin-top: 20px;
            background: #0f7a40;
            color: white;
            border: none;
            padding: 12px 25px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover {
            background: #0c5e30;
        }
        .author-info {
            background: #f8f9fa;
            padding: 15px;
            border-radius: 6px;
            margin-bottom: 20px;
            border-left: 4px solid #0f7a40;
        }
        .file-info {
            background: #e3f2fd;
            padding: 15px;
            border-radius: 6px;
            margin: 10px 0;
        }
        .warning-box {
            background: #fff3cd;
            border: 1px solid #ffeaa7;
            padding: 15px;
            border-radius: 6px;
            margin: 15px 0;
        }
        .success-box {
            background: #d1ecf1;
            border: 1px solid #bee5eb;
            padding: 15px;
            border-radius: 6px;
            margin: 15px 0;
        }
        
        /* Abstract textarea specific styling */
        textarea[name="abstractText"] {
            background: #f8f9fa;
            border: 2px solid #e9ecef;
            font-size: 14px;
            line-height: 1.5;
        }
        textarea[name="abstractText"]:focus {
            border-color: #0f7a40;
            background: #fff;
        }

        /* Responsive Design */
        @media (max-width: 992px) {
            .sidebar {
                width: 70px;
                overflow: hidden;
                transform: translateX(0);
            }
            .sidebar-header h2, .sidebar-menu span {
                display: none;
            }
            .sidebar-menu a {
                justify-content: center;
                padding: 1rem 0.5rem;
            }
            .sidebar-menu i {
                margin-right: 0;
                font-size: 1.5rem;
            }
            .main-content {
                margin-left: 70px;
                width: calc(100% - 70px);
            }
        }

        @media (max-width: 768px) {
            body {
                overflow-x: hidden;
            }
            
            .sidebar {
                width: 0;
                transform: translateX(-100%);
                z-index: 2000;
            }
            
            .sidebar.active {
                width: 250px;
                transform: translateX(0);
            }
            
            .sidebar.active .sidebar-header h2, 
            .sidebar.active .sidebar-menu span {
                display: block;
            }
            
            .sidebar.active .sidebar-menu a {
                justify-content: flex-start;
                padding: 0.8rem 1.5rem;
            }
            
            .sidebar.active .sidebar-menu i {
                margin-right: 0.8rem;
                font-size: 1.2rem;
            }
            
            .main-content {
                margin-left: 0;
                width: 100%;
                padding: 1rem;
            }
            
            .menu-toggle {
                display: block;
            }
            
            .container {
                padding: 20px;
            }
        }

        @media (min-width: 769px) {
            .menu-toggle {
                display: none;
            }
            .sidebar-overlay {
                display: none !important;
            }
        }

        /* Better scrollbar for sidebar */
        .sidebar-menu {
            scrollbar-width: thin;
            scrollbar-color: rgba(201, 162, 90, 0.3) transparent;
        }

        .sidebar-menu::-webkit-scrollbar {
            width: 6px;
        }

        .sidebar-menu::-webkit-scrollbar-track {
            background: transparent;
        }

        .sidebar-menu::-webkit-scrollbar-thumb {
            background: rgba(201, 162, 90, 0.3);
            border-radius: 3px;
        }

        .sidebar-menu::-webkit-scrollbar-thumb:hover {
            background: rgba(201, 162, 90, 0.5);
        }
    </style>
</head>

<body>
    <!-- Sidebar Overlay for Mobile -->
    <div class="sidebar-overlay" id="sidebarOverlay"></div>

    <!-- Mobile Menu Toggle -->
    <button class="menu-toggle" id="menuToggle" aria-label="Toggle Menu">
        <i class="fas fa-bars"></i>
    </button>

    <!-- Sidebar -->
    <div class="sidebar" id="sidebar">
        <div class="sidebar-header">
            <h2>AYUSCRIPT</h2>
        </div>

        <nav class="sidebar-menu">
            <ul>
                <li><a href="${pageContext.request.contextPath}/admin/dashboard"> 
                    <i class="fas fa-home"></i> 
                    <span>Dashboard</span>
                </a></li>
                
                <li><a href="${pageContext.request.contextPath}/admin/submissions"> 
                    <i class="fas fa-file"></i> <span>Submissions</span>
                </a></li>
                
                <li><a href="${pageContext.request.contextPath}/admin/submissions1"> 
                    <i class="fas fa-file-alt"></i> <span>Paper Review</span> 
                </a></li>

               <%--  <li><a href="${pageContext.request.contextPath}/admin/conferences"> 
                    <i class="fas fa-calendar"></i> <span>Conferences</span>
                </a></li> --%>

                <li><a href="${pageContext.request.contextPath}/editorial-board" target="_blank"> 
                    <i class="fas fa-users"></i> <span>Editorial Board</span>
                </a></li>

                <li><a href="${pageContext.request.contextPath}/about" target="_blank"> 
                    <i class="fas fa-info-circle"></i> <span>About & Contact Us</span>
                </a></li>

                <li><a href="${pageContext.request.contextPath}/admin/author-login-details"> 
                    <i class="fas fa-user-lock"></i> <span>Author Login Details</span>
                </a></li>

                <%-- <li><a href="${pageContext.request.contextPath}/admin/manage-content"> 
                    <i class="fas fa-edit"></i> <span>Page Content</span>
                </a></li>

                <li><a href="${pageContext.request.contextPath}/submitArticle" target="_blank"> 
                    <i class="fas fa-upload"></i> <span>Submit Article</span>
                </a></li> --%>
                
                <li><a href="${pageContext.request.contextPath}/admin/manage-template"> 
					<i class="fas fa-edit"></i> <span>PAGE EDIT</span>
				</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/gallery"> 
					<i class="fas fa-edit"></i> <span>Gallery</span>
				</a></li>

                <li><a href="${pageContext.request.contextPath}/admin/previous-volumes-issues"> 
                    <i class="fas fa-book"></i> <span>Previous Volumes And Issues</span>
                </a></li>

                <li><a href="${pageContext.request.contextPath}/admin/contact-enquiries"> 
                    <i class="fas fa-envelope-open"></i> <span>Contact Enquires</span>
                </a></li>

                <li><a href="${pageContext.request.contextPath}/" target="_blank"> 
                    <i class="fas fa-globe"></i> <span>Visit Website</span>
                </a></li>

                <li><a href="${pageContext.request.contextPath}/logout"> 
                    <i class="fas fa-sign-out-alt"></i> <span>Logout</span>
                </a></li>
            </ul>
        </nav>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="container">
    <h2>Edit & Publish Article</h2>
    
    <!-- Author Information -->
    <div class="author-info">
        <strong>Author:</strong> ${submission.author.fullName}<br>
        <strong>Email:</strong> ${submission.author.email}<br>
        <strong>Submitted:</strong> ${submission.submittedAt}
    </div>
    
    <!-- File Information -->
    <div class="file-info">
        <strong>Original File:</strong> ${submission.fileName}<br>
        <strong>File Type:</strong> 
        <c:choose>
            <c:when test="${fileType == 'editable'}">Word Document/Text File (Editable)</c:when>
            <c:when test="${fileType == 'pdf'}">PDF Document</c:when>
            <c:when test="${fileType == 'image'}">Image File</c:when>
            <c:otherwise>Unknown Format</c:otherwise>
        </c:choose>
    </div>

    <c:choose>
        <c:when test="${canEdit}">
            <!-- ✅ EDITABLE FILES: DOC, DOCX, TXT -->
            <div class="success-box">
                ✅ <strong>This file can be edited</strong> - You can modify the content below and publish.
            </div>
            
            <form method="post" action="${pageContext.request.contextPath}/admin/publish">
                <input type="hidden" name="submissionId" value="${submission.id}"/>

                <label>Title:</label>
                <input type="text" name="title" value="${submission.title}" required/>

                <!-- ADDED: Abstract Text Field -->
                <label>Abstract (Brief Summary):</label>
                <textarea name="abstractText" rows="4" placeholder="Enter a brief abstract/summary of the article..." required>
                    <c:choose>
                        <c:when test="${not empty fileContent and fileContent.length() > 300}">
                            ${fileContent.substring(0, 300)}...
                        </c:when>
                        <c:when test="${not empty fileContent}">
                            ${fileContent}
                        </c:when>
                        <c:otherwise>
                            Abstract for ${submission.title}
                        </c:otherwise>
                    </c:choose>
                </textarea>

                <label>Article Content (Editable):</label>
                <textarea id="htmlContent" name="htmlContent" rows="18">${fileContent}</textarea>

                <button type="submit">PUBLISH TO CURRENT ISSUE</button>
            </form>
        </c:when>
        
        <c:otherwise>
            <!-- ❌ NON-EDITABLE FILES: PDF, IMAGES, etc. -->
            <div class="warning-box">
                ⚠️ <strong>This file format cannot be edited directly</strong><br><br>
                
                <c:choose>
                    <c:when test="${fileType == 'pdf'}">
                        • <strong>PDF files</strong> cannot be edited in this system<br>
                        • Please download the original file and use PDF editing software<br>
                    </c:when>
                    <c:when test="${fileType == 'image'}">
                        • <strong>Image files</strong> cannot be edited as text<br>
                        • Please download the original file and use image editing software<br>
                    </c:when>
                    <c:otherwise>
                        • <strong>Unsupported file format</strong><br>
                        • This file type cannot be edited in the system<br>
                    </c:otherwise>
                </c:choose>
                <br>
                <a href="/admin/download/${submission.id}" class="btn btn-download" 
                   style="background: #2196f3; color: white; padding: 10px 15px; text-decoration: none; border-radius: 4px;">
                   📥 Download Original File
                </a>
            </div>
            
            <!-- Show file content preview for non-editable files -->
            <div style="margin-top: 20px;">
                <label>File Content Preview:</label>
                <textarea rows="6" readonly style="background: #f5f5f5;">${fileContent}</textarea>
            </div>
        </c:otherwise>
    </c:choose>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Mobile menu toggle with overlay
        const menuToggle = document.getElementById('menuToggle');
        const sidebar = document.getElementById('sidebar');
        const sidebarOverlay = document.getElementById('sidebarOverlay');
        
        function toggleSidebar() {
            sidebar.classList.toggle('active');
            sidebarOverlay.classList.toggle('active');
        }
        
        if (menuToggle) {
            menuToggle.addEventListener('click', toggleSidebar);
        }
        
        if (sidebarOverlay) {
            sidebarOverlay.addEventListener('click', toggleSidebar);
        }
        
        document.addEventListener('click', function(event) {
            const isClickInsideSidebar = sidebar.contains(event.target);
            const isClickOnToggle = menuToggle && menuToggle.contains(event.target);
            
            if (window.innerWidth <= 768 && sidebar.classList.contains('active')) {
                if (!isClickInsideSidebar && !isClickOnToggle) {
                    toggleSidebar();
                }
            }
        });
        
        window.addEventListener('resize', function() {
            if (window.innerWidth > 768) {
                sidebar.classList.remove('active');
                sidebarOverlay.classList.remove('active');
            }
        });
    </script>
</body>
</html>