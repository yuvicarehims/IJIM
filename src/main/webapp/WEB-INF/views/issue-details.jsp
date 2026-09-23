<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Issue • AYUSCRIPT</title>

  <!-- Fonts & Bootstrap (same as current-issue.jsp) -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&family=Cinzel:wght@600&display=swap" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

  <style>
    :root {
      --deep-green:rgb(30, 140, 193);
      --leaf: #2b8a5f;
      --gold: #c9a25a;
      --cream: #fbf6ee;
      --paper: #f7efe6;
      --text: #2d2d2d;
      --radius: 12px;
      --shadow: 0 10px 30px rgba(11,74,57,0.06);
      --max-width: 1200px;
    }

    body {
      margin: 0;
      font-family: 'Poppins', sans-serif;
      background: var(--paper);
      color: var(--text);
      -webkit-font-smoothing: antialiased;
    }

    .container-main {
      max-width: var(--max-width);
      margin: 0 auto;
      padding: 0 20px;
    }

    /* HERO header: same bg as current-issue.jsp (Option A) */
    header.issue-hero {
      background: linear-gradient(180deg, rgba(11,74,57,0.8), rgba(11,74,57,0.4)),
                  url('${pageContext.request.contextPath}/images/contact.png') center/cover no-repeat;
      color: white;
      padding: 60px 20px 65px;
      text-align: center;
      position: relative;
      border-bottom: 4px solid rgba(201,162,90,0.25);
      box-shadow: 0 6px 18px rgba(0,0,0,0.25);
    }

    header.issue-hero::after {
      content: "";
      position: absolute;
      bottom: 0;
      left: 50%;
      transform: translateX(-50%);
      width: 90px;
      height: 3px;
      background: var(--gold);
      border-radius: 2px;
    }

    header.issue-hero h1 {
      font-family: 'Cinzel', serif;
      font-size: 30px;
      margin: 0;
      color: var(--gold);
      text-shadow: 0 3px 14px rgba(0, 0, 0, 0.6);
      letter-spacing: 0.5px;
    }

    header.issue-hero p {
      margin-top: 10px;
      font-size: 15px;
      color: rgba(255,255,255,0.92);
      text-shadow: 0 1px 6px rgba(0,0,0,0.3);
    }

    section {
      padding: 50px 0;
    }

    .current-issue-section {
      padding: 40px 0;
    }

    .issue-header {
      text-align: center;
      margin-bottom: 40px;
    }

    .issue-header h1 {
      color: var(--deep-green);
      margin-bottom: 10px;
    }

    .issue-header .lead {
      color: var(--leaf);
      font-size: 1.2rem;
      font-weight: 500;
    }

    .articles-section {
      margin-top: 40px;
    }

    .section-title {
      color: var(--deep-green);
      border-bottom: 2px solid var(--gold);
      padding-bottom: 10px;
      margin-bottom: 30px;
    }

    .article-list {
      display: flex;
      flex-direction: column;
      gap: 25px;
    }

    .article-item {
      background: white;
      border-radius: 12px;
      padding: 25px;
      box-shadow: 0 4px 12px rgba(0,0,0,0.08);
      border-left: 4px solid var(--gold);
      transition: transform 0.3s, box-shadow 0.3s;
    }

    .article-item:hover {
      transform: translateY(-2px);
      box-shadow: 0 8px 25px rgba(0,0,0,0.12);
    }

    .article-title {
      font-size: 1.3rem;
      font-weight: 600;
      color: var(--deep-green);
      margin-bottom: 12px;
      line-height: 1.4;
    }

    .article-meta {
      display: flex;
      gap: 20px;
      margin-bottom: 15px;
      flex-wrap: wrap;
      font-size: 0.9rem;
      color: #666;
    }

    .article-authors {
      font-weight: 500;
      color: var(--leaf);
    }

    .article-type-badge {
      background: var(--deep-green);
      color: white;
      padding: 4px 12px;
      border-radius: 20px;
      font-size: 0.8rem;
      font-weight: 500;
    }

    .article-abstract {
      color: #555;
      line-height: 1.6;
      margin-bottom: 20px;
    }

    .article-actions {
      display: flex;
      gap: 12px;
      flex-wrap: wrap;
    }

    .btn-abstract, .btn-pdf, .btn-view {
      padding: 8px 16px;
      border-radius: 6px;
      text-decoration: none;
      font-weight: 500;
      font-size: 0.9rem;
      transition: all 0.3s;
      border: none;
      cursor: pointer;
    }

    .btn-abstract {
      background: var(--leaf);
      color: white;
      display: inline-block;
    }
    .btn-abstract:hover { background: var(--deep-green); }

    .btn-view {
      background: #6c757d;
      color: white;
    }
    .btn-view:hover { background: #5a6268; }

    .btn-pdf {
      background: var(--gold);
      color: white;
    }
    .btn-pdf:hover { background: #b8934a; }

    .no-articles {
      text-align: center;
      padding: 60px 20px;
      color: #666;
    }

    /* navbar, footer css copied from current-issue.jsp */
    .topbar {
        background-color: var(--deep-green);
        padding: 6px 0 !important;
        z-index: 1020;
    }
    .topbar .navbar-nav {
        display: flex;
        align-items: center;
        gap: 10px !important;
        margin-right: auto !important;
    }
    .topbar .nav-link {
        color: #fff !important;
        font-weight: 600;
        text-transform: uppercase;
        font-size: 14px;
        padding: 10px 12px !important;
        position: relative;
    }
    .topbar .nav-link:hover,
    .topbar .nav-link.active {
        color: var(--gold) !important;
        background-color: rgba(255,255,255,0.1);
    }
    .topbar .nav-link::after {
        content: '';
        position: absolute;
        bottom: 0;
        left: 50%;
        transform: translateX(-50%) scaleX(0);
        width: 60%;
        height: 3px;
        background-color: var(--gold);
        transition: transform 0.3s ease;
    }
    .topbar .nav-link:hover::after,
    .topbar .nav-link.active::after {
        transform: translateX(-50%) scaleX(1);
    }

    .login-btn {
        padding: 8px 20px;
        font-size: 15px;
        border-radius: 10px;
        border: 2px solid #ffffff !important;
        color: #fff !important;
    }
    .register-btn {
        padding: 8px 20px;
        font-size: 15px;
        border-radius: 10px;
    }

    .footer-links { list-style: none; padding-left: 0; }
    .footer-links li { margin-bottom: 12px; }
    .footer a { color: #fff; text-decoration: none; }
    .footer a:hover { color: var(--gold); }
    .footer { background-color: var(--deep-green); color: var(--cream); padding: 25px 0 5px !important; }

    @media (max-width: 768px) {
      header.issue-hero h1 { font-size: 24px; }
      header.issue-hero { padding: 45px 15px 55px; }
      .article-meta { flex-direction: column; gap: 8px; }
      .article-actions { flex-direction: column; }
      .btn-view, .btn-pdf { text-align: center; }
    }
    
    
    	/* HEADER - Fully Responsive */
			.header-top {
			    background: #fafafa;
			    padding: 10px 0;
			    border-bottom: 1px solid #e0e0e0;
			    width: 100%;
			}

			.header-content {
			    display: flex;
			    align-items: center;
			    justify-content: space-between;
			    flex-wrap: wrap;
			    gap: 15px;
			}

			.header-logo {
			    flex-shrink: 0;
			}

			.header-logo img {
			    height: 90px;
			    width: 180px;
			    object-fit: contain;
			    max-width: 100%;
			}

			.header-title {
			    flex: 1;
			    text-align: center;
			    min-width: 200px;
			}

			.header-title h1 {
			    font-family: Georgia, serif;
			    font-weight: 800;
			    font-size: 48px;
			    color: #6d3f1d;
			    margin: 0;
			    letter-spacing: 2px;
			    word-break: break-word;
			}
  </style>
</head>
<body>

<!-- top logo header (same as current issue) -->
<%-- <header style="background:#fafafa; padding:15px 0; border-bottom:1px solid #e0e0e0; width:100%;">
    <div style="display:flex; align-items:center; justify-content:space-between; width:100%;">
        <div style="padding-left:25px;">
            <img src="${pageContext.request.contextPath}/images/Logonew.jpg"
                 alt="AYUSCRIPT Logo"
                 style="height:90px; width:180px; object-fit:contain;">
        </div>
        <div style="flex-grow:1; text-align:center; margin-left:-100px;">
            <h1 style="font-family: Georgia, serif;font-weight: 800;font-size: 48px;color: #6d3f1d;margin: 0;letter-spacing: 2px;">
                AYUSCRIPT
            </h1>
        </div>
        <div style="padding-right:35px;">
            <span style="font-size: 22px;font-weight: 700;color: #4a4a4a;">
                ISSN: 2583-3677
            </span>
        </div>
    </div>
</header> --%>

		  <header class="header-top">
		      <div class="container-fluid">
		          <div class="header-content">
		              <div class="header-logo px-3 px-md-4 px-lg-5">
		                  <img src="${pageContext.request.contextPath}/images/Logo_1-removebg-preview.png"
		                       alt="AYUSCRIPT Logo"
		                       class="header-logo img-fluid">
		              </div>

		              <div class="header-title">
		                  <h1 class="heading-responsive">				
		  					<img src="${pageContext.request.contextPath}/images/nEWlOGO1.png"
		  				                     alt="AYUSCRIPT Logo"
		  				                     class="header-logo img-fluid"></h1>
		              </div>

		              <div class="header-issn px-3 px-md-4 px-lg-5">
		                  <span class="d-none d-md-inline">ISSN: 0000-0000</span>
		                  <span class="d-md-none">ISSN: 0000-0000</span>
		              </div>
		          </div>
		      </div>
		  </header>

<!-- navbar: Archives active -->
<nav class="navbar navbar-expand-lg topbar sticky-top">
    <div class="container d-flex justify-content-between align-items-center">
        <div class="collapse navbar-collapse" id="navMain">
            <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/about">About Us</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/editorial-board">Editorial Board</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/current-issue">Current Issue</a></li>
                <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/archives">Archives</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/login">Submit Article</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/author-guideline">Author Guideline</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/contact">Contact</a></li>
            </ul>
        </div>

      <!--    <div class="nav-buttons d-flex align-items-center">
            <a class="btn btn-outline-light login-btn me-3"
               href="${pageContext.request.contextPath}/login">
                <i class="fas fa-sign-in-alt"></i> Login
            </a>
            <a class="btn btn-light register-btn"
               href="${pageContext.request.contextPath}/register">
                <i class="fas fa-user-plus"></i> Register
            </a>
        </div>  -->
   
    </div>
</nav>

<!-- HERO for this issue -->
<header class="issue-hero">
  <h1>
      Year: ${year}
      |
      Volume:
      <c:choose>
          <c:when test="${fn:startsWith(volume, 'Volume ')}">
              ${fn:replace(volume, 'Volume ', '')}
          </c:when>
          <c:otherwise>${volume}</c:otherwise>
      </c:choose>
      |
      Issue:
      <c:choose>
          <c:when test="${fn:startsWith(issue, 'Issue ')}">
              ${fn:replace(issue, 'Issue ', '')}
          </c:when>
          <c:otherwise>${issue}</c:otherwise>
      </c:choose>
  </h1>
  <p>Articles published in this issue of AYUSCRIPT.</p>
</header>

<section class="current-issue-section">
  <div class="container-main">

    <div class="issue-header">
      <h1>Articles in this Issue</h1>
      
      <h3>nature Ayurved-International Journal of Ayurved Science and Research</h3>
      <p class="lead">
          Volume
          <c:choose>
              <c:when test="${fn:startsWith(volume, 'Volume ')}">
                  ${fn:replace(volume, 'Volume ', '')}
              </c:when>
              <c:otherwise>${volume}</c:otherwise>
          </c:choose>
          ,
          Issue
          <c:choose>
              <c:when test="${fn:startsWith(issue, 'Issue ')}">
                  ${fn:replace(issue, 'Issue ', '')}
              </c:when>
              <c:otherwise>${issue}</c:otherwise>
          </c:choose>
          &nbsp;|&nbsp; Year ${year}
      </p>
      <p>Total Articles Published: <strong>${not empty publishedArticles ? publishedArticles.size() : 0}</strong></p>
    </div>

    <div class="articles-section">
      <h2 class="section-title">Published Articles</h2>

      <c:choose>
        <c:when test="${not empty publishedArticles}">
          <div class="article-list">
            <c:forEach var="article" items="${publishedArticles}">
              <div class="article-item">
                <div class="article-title">${article.title}</div>

                <div class="article-meta">
                  <span class="article-authors">
                    <i class="fas fa-user me-1"></i>
                    <c:choose>
                      <c:when test="${not empty article.authorNames}">
                        ${fn:split(article.authorNames, '||')[0]}
                        <c:if test="${fn:length(fn:split(article.authorNames, '||')) > 1}">
                          et al.
                        </c:if>
                      </c:when>
                      <c:otherwise>No Author</c:otherwise>
                    </c:choose>
                  </span>

                  <span>
                    <i class="fas fa-calendar me-1"></i>
                    <c:choose>
                      <c:when test="${not empty article.publicationDate}">
                        ${article.publicationDate.month} ${article.publicationDate.dayOfMonth}, ${article.publicationDate.year}
                      </c:when>
                      <c:otherwise>
                        <c:if test="${not empty article.updatedAt}">
                          ${article.updatedAt.month} ${article.updatedAt.dayOfMonth}, ${article.updatedAt.year}
                        </c:if>
                      </c:otherwise>
                    </c:choose>
                  </span>

                  <span class="article-type-badge">${article.articleType}</span>
                </div>

                <p class="article-abstract">
                  <c:if test="${not empty article.abstractText}">
                    <c:set var="abstractText" value="${article.abstractText}" />
                    <c:choose>
                      <c:when test="${fn:length(abstractText) > 200}">
                        ${fn:substring(abstractText, 0, 200)}...
                      </c:when>
                      <c:otherwise>${abstractText}</c:otherwise>
                    </c:choose>
                  </c:if>
                  <c:if test="${empty article.abstractText}">
                    No abstract available.
                  </c:if>
                </p>

                <div class="article-actions">
                  <a href="${pageContext.request.contextPath}/article/${article.id}/abstract"
                     class="btn-abstract" target="_blank">
                    <i class="fas fa-eye me-1"></i> View Abstract
                  </a>

                  <a href="${pageContext.request.contextPath}/article/${article.id}"
                     class="btn-view" target="_blank">
                    <i class="fas fa-file-alt me-1"></i> View Full Article
                  </a>

                  <c:if test="${not empty article.referencePdfPath}">
                    <button type="button" class="btn-pdf" onclick="previewPdf('${article.id}')">
                      <i class="fas fa-eye me-1"></i> Preview PDF
                    </button>
                  </c:if>
                </div>
              </div>
            </c:forEach>
          </div>
        </c:when>
        <c:otherwise>
          <div class="no-articles">
            <h3>No articles in this issue yet.</h3>
          </div>
        </c:otherwise>
      </c:choose>
    </div>
  </div>
</section>

<!-- Footer (same as current-issue.jsp) -->
<footer class="footer">
    <div class="container">
        <!-- … exactly same footer content as current-issue.jsp … -->
        <!-- (you can copy the footer block directly, unchanged) -->
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<script>
    function previewPdf(articleId) {
        // Show loading state
        const btn = event.target;
        const originalText = btn.innerHTML;
        btn.innerHTML = '<i class="fas fa-spinner fa-spin me-1"></i> Opening Preview...';
        btn.disabled = true;
        
        // Use the preview endpoint to open PDF in new tab
        const previewUrl = '${pageContext.request.contextPath}/preview/article/' + articleId;
        
        // Open PDF in new tab for preview
        const newWindow = window.open(previewUrl, '_blank');
        
        // If popup blocked, show error
        if (!newWindow) {
            alert('Please allow popups to preview the PDF.');
            btn.innerHTML = originalText;
            btn.disabled = false;
            return;
        }
        
        // Reset button after a short delay
        setTimeout(function() {
            btn.innerHTML = originalText;
            btn.disabled = false;
        }, 2000);
    }
</script>

</body>
</html>
