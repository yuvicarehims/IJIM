<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>${article.title} • NATURE AYURVED</title>

  <!-- Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&family=Cinzel:wght@600;700&display=swap" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

  <!-- Bootstrap (for header/footer/nav theme) -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

  <style>
    :root {
      --deep-green: rgb(30, 140, 193);;
      --leaf: #2b8a5f;
      --gold: #c9a25a;
      --cream: #fbf6ee;
      --paper: #f7efe6;
      --text: #2d2d2d;
      --rust: #7a4b3a;
      --radius: 12px;
      --shadow: 0 10px 30px rgba(11,74,57,0.06);
      --max-width: 1200px;
    }

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Poppins', sans-serif;
      background: var(--cream);
      color: var(--text);
      line-height: 1.7;
      -webkit-font-smoothing: antialiased;
    }

    .container {
      max-width: var(--max-width);
      margin: 0 auto;
      padding: 0 2rem;
    }

    /* ===== TOP BRAND HEADER (AYUSCRIPT) ===== */
    .brand-header {
      background:#fafafa;
      padding:15px 0;
      border-bottom:1px solid #e0e0e0;
      width:100%;
    }
    .brand-header-inner {
      display:flex;
      align-items:center;
      justify-content:space-between;
      width:100%;
      max-width:var(--max-width);
      margin:0 auto;
      padding:0 2rem;
      flex-wrap: wrap;
      gap: 15px;
    }
    .brand-logo {
      flex-shrink: 0;
      padding-left: 0;
    }
    .brand-header-inner img {
      height:90px;
      width:180px;
      object-fit:contain;
      max-width: 100%;
    }
    .brand-title {
      flex-grow:1;
      text-align:center;
      min-width: 200px;
      font-family: Georgia, serif;
      font-weight:800;
      font-size:48px;
      color:#6d3f1d;
      letter-spacing:2px;
      word-break: break-word;
    }
    .brand-issn {
      flex-shrink: 0;
      font-size:22px;
      font-weight:700;
      color:#4a4a4a;
      padding-right:0;
      text-align: right;
      white-space: nowrap;
    }

    /* ===== NAVBAR (AYUSCRIPT THEME, LOGIC SAME) ===== */
   .topbar {
    background-color: var(--deep-green);
    padding: 6px 0 !important;  /* Smaller height */
    z-index: 1020;
}

/* MENU ITEMS */
.topbar .navbar-nav {
    display: flex;
    align-items: center;
    gap: 10px !important;        /* 🔥 Reduce space between menu names */
    margin-right: auto !important;
}

/* MENU LINKS */
.topbar .nav-link {
    color: #fff !important;
    font-weight: 600;
    text-transform: uppercase;
    font-size: 14px;
    padding: 10px 12px !important;   /* 🔥 Reduce padding so spacing decreases */
    position: relative;
}

/* HOVER + ACTIVE */
.topbar .nav-link:hover,
.topbar .nav-link.active {
    color: var(--gold) !important;
    background-color: rgba(255,255,255,0.1);
}

/* UNDERLINE HOVER EFFECT */
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

/* BUTTONS ON RIGHT SIDE */
.nav-right {
    display: flex;
    align-items: center;
    gap: 10px !important;  /* 🔥 reduce gap between Login & Register */
    margin-left: auto !important;
}

/* LOGIN BUTTON */
.login-btn {
    padding: 8px 20px;
    font-size: 15px;
    border-radius: 10px;
    border: 2px solid #ffffff !important;
    color: #fff !important;
}

/* REGISTER BUTTON */
.register-btn {
    padding: 8px 20px;
    font-size: 15px;
    border-radius: 10px;
}

/* MOBILE FIX */
@media (max-width: 991px) {
    .topbar .navbar-nav {
        gap: 0 !important;
    }
    .nav-right {
        margin: 15px 0 !important;
    }
}
    /* Header */
    header {
      background: linear-gradient(135deg, rgba(11,86,51,0.1), rgba(201,162,90,0.15)), var(--paper);
      padding: 3rem 0;
      text-align: left;
      border-bottom: 1px solid rgba(11, 86, 51, 0.08);
    }

    .article-header-inner {
      max-width:var(--max-width);
      margin:0 auto;
      padding:0 2rem;
    }

    header h1 {
      font-family: 'Cinzel', serif;
      font-size: 2.4rem;
      color: var(--deep-green);
      margin-bottom: 1rem;
      line-height: 1.3;
      font-weight: 700;
      word-wrap: break-word;
    }

    header p {
      font-size: 1rem;
      color: var(--rust);
      opacity: 0.9;
      margin-bottom: 0.5rem;
      line-height: 1.6;
    }

    .article-tagline {
      font-size: 0.95rem;
      color:#555;
      margin-top:0.8rem;
      line-height: 1.5;
    }

    /* Main Content - professional spacing */
    section {
      padding: 3rem 0 2.5rem 0;
      background: var(--paper);
    }

    .article-layout {
      display:flex;
      gap:1.8rem;
      align-items:flex-start;
    }

    .article-main {
      flex:2.5;
    }

    .article-side {
      flex:1.1;
      position:sticky;
      top:100px;
    }

    .side-card {
      background:var(--cream);
      border-radius:var(--radius);
      padding:1.4rem 1.3rem;
      box-shadow:var(--shadow);
      border:1px solid rgba(11,86,51,0.12);
      margin-bottom:1.4rem;
    }

    .side-card h5 {
      font-family:'Cinzel', serif;
      font-size:1.05rem;
      margin-bottom:0.8rem;
      color:var(--deep-green);
      border-bottom:1px solid rgba(201,162,90,0.5);
      padding-bottom:0.4rem;
    }

    .side-meta-row {
      font-size:0.92rem;
      margin-bottom:0.4rem;
    }
    .side-meta-label {
      font-weight:600;
      color:#555;
    }
    .side-meta-value {
      color:#333;
    }

    .side-pill {
      display:inline-block;
      background:rgba(11,86,51,0.08);
      color:var(--deep-green);
      padding:0.25rem 0.6rem;
      border-radius:20px;
      font-size:0.8rem;
      margin-right:0.35rem;
      margin-bottom:0.3rem;
    }

    .side-download-box {
      text-align:center;
    }
    .side-download-box p {
      font-size:0.9rem;
      margin-bottom:0.9rem;
      color:#555;
    }

    /* Article Metadata (top block in main) - professional spacing */
    .article-meta-info {
      background: var(--cream);
      padding: 2rem 2rem;
      border-radius: var(--radius);
      margin-bottom: 2.5rem;
      box-shadow: var(--shadow);
      border: 1px solid rgba(11, 86, 51, 0.1);
    }

    /* Bootstrap grid will handle the layout now */
    .meta-row {
      margin-bottom: 0;
    }

    .meta-item {
      text-align: left;
      padding: 0;
      margin: 0;
      display: flex;
      flex-direction: column;
      justify-content: flex-start;
      min-height: 60px;
    }

    .meta-label {
      font-weight: 600;
      color: var(--deep-green);
      font-size: 0.8rem;
      text-transform: uppercase;
      letter-spacing: 0.5px;
      margin-bottom: 0.5rem;
      line-height: 1.4;
    }

    .meta-value {
      font-size: 1rem;
      color: var(--text);
      font-weight: 500;
      line-height: 1.5;
      word-wrap: break-word;
      min-height: 1.5rem;
    }

    /* Authors Section - professional spacing */
    .authors-list {
      background: var(--cream);
      padding: 2rem 1.8rem;
      border-radius: var(--radius);
      margin-bottom: 2.5rem;
      box-shadow: var(--shadow);
    }

    .authors-list h3 {
      color: var(--deep-green);
      margin-bottom: 1.2rem;
      margin-top: 0;
      font-family: 'Cinzel', serif;
      font-size: 1.6rem;
      border-bottom: 2px solid var(--gold);
      padding-bottom: 0.5rem;
      display: inline-block;
    }

    .author-item {
      background: var(--paper);
      padding: 1.2rem 1.3rem;
      border-radius: var(--radius);
      margin-bottom: 1rem;
      border-left: 4px solid var(--leaf);
      line-height: 1.6;
    }

    .author-item:last-child {
      margin-bottom: 0;
    }

    .author-item strong {
      color: var(--deep-green);
      font-size: 1.05rem;
    }

    /* Content Sections */
    /* Section Dividers - professional spacing */
    .section-divider {
      height: 2px;
      background: linear-gradient(90deg, transparent, var(--gold), transparent);
      margin: 2.5rem 0 1.5rem 0;
    }

    h3 {
      color: var(--deep-green);
      font-family: 'Cinzel', serif;
      font-size: 1.6rem;
      margin: 2rem 0 0.8rem 0;
      border-bottom: 2px solid var(--gold);
      padding-bottom: 0.5rem;
      font-weight: 600;
    }
    
    h3:first-of-type {
      margin-top: 0;
    }
    
    /* Consistent spacing after headings */
    h3 + * {
      margin-top: 0.6rem !important;
      padding-top: 0 !important;
    }
    
    h3 + .article-content-text {
      margin-top: 0.6rem !important;
      padding-top: 0 !important;
    }
    
    h3 + p {
      margin-top: 0.6rem !important;
      padding-top: 0 !important;
    }
    
    h3 + ul,
    h3 + ol {
      margin-top: 0.6rem !important;
      padding-top: 0 !important;
    }

    p {
      margin-bottom: 0.9rem;
      margin-top: 0;
      font-size: 1.05rem;
      line-height: 1.7;
      color: #333;
    }
    
    p:last-child {
      margin-bottom: 0;
    }

    /* Article Content Text - professional spacing */
    .article-content-text {
      white-space: normal !important; /* Override pre-line to prevent excessive spacing */
      word-wrap: break-word;
      line-height: 1.7;
      margin-bottom: 1.2rem;
      margin-top: 0;
      padding-top: 0;
      font-size: 1.05rem;
      color: #333;
    }
    
    /* Remove excessive line breaks */
    .article-content-text br + br {
      display: none;
    }
    
    /* Normalize spacing in all content areas */
    #content {
      line-height: 1.7;
    }
    
    #content p {
      margin-bottom: 0.9rem;
      line-height: 1.7;
      color: #333;
    }
    
    #content p:last-of-type {
      margin-bottom: 0;
    }
    
    /* Professional list spacing */
    #content ul,
    #content ol {
      margin-bottom: 1.2rem;
      margin-top: 0.6rem;
      padding-left: 2rem;
      line-height: 1.7;
    }
    
    #content li {
      margin-bottom: 0.5rem;
      line-height: 1.7;
      padding-left: 0.5rem;
      color: #333;
      font-size: 1.05rem;
    }
    
    #content li:last-child {
      margin-bottom: 0;
    }
    
    /* Consistent heading spacing */
    #content h3 {
      margin-top: 2rem;
      margin-bottom: 0.8rem;
      padding-bottom: 0.5rem;
    }
    
    #content h3:first-child {
      margin-top: 0;
    }
    
    /* Proper spacing after headings */
    #content h3 + .article-content-text,
    #content h3 + p {
      margin-top: 0.6rem !important;
      padding-top: 0 !important;
    }
    
    #content h3 + ul,
    #content h3 + ol {
      margin-top: 0.6rem !important;
    }
    
    /* Citation Box - professional spacing */
    .citation-box {
      background: var(--cream);
      padding: 2rem;
      border-radius: var(--radius);
      margin: 2.5rem 0;
      border-left: 4px solid var(--gold);
      box-shadow: var(--shadow);
      line-height: 1.7;
    }

    .citation-box strong {
      color: var(--deep-green);
      display: block;
      margin-bottom: 1rem;
      font-size: 1.1rem;
      font-weight: 600;
    }
    
    .citation-box p {
      margin-bottom: 0.9rem;
      line-height: 1.7;
    }

    /* Bottom Actions - professional spacing */
    .article-actions-bar {
      margin-top: 3.5rem;
      padding-top: 2rem;
      border-top:1px dashed rgba(11,86,51,0.3);
      display:flex;
      flex-wrap:wrap;
      gap:1rem;
      justify-content:space-between;
      align-items:center;
    }

    .download-btn-main {
      background: var(--leaf);
      color: var(--cream);
      border: none;
      padding: 0.9rem 1.9rem;
      border-radius: var(--radius);
      font-size: 1.02rem;
      font-weight: 600;
      cursor: pointer;
      transition: all 0.3s ease;
      display: inline-flex;
      align-items: center;
      gap: 0.7rem;
      box-shadow: var(--shadow);
      text-decoration:none;
    }

    .download-btn-main:hover {
      background: var(--deep-green);
      transform: translateY(-2px);
      box-shadow: 0 15px 30px rgba(11, 86, 51, 0.2);
      color:#fff;
    }

    .back-link {
      display: inline-flex;
      align-items: center;
      gap: 0.5rem;
      color: var(--rust);
      text-decoration: none;
      font-weight: 500;
      padding: 0.9rem 1.6rem;
      background: var(--cream);
      border-radius: var(--radius);
      transition: all 0.3s ease;
      border: 1px solid rgba(122, 75, 58, 0.2);
    }

    .back-link:hover {
      background: var(--rust);
      color: var(--cream);
      transform: translateX(-3px);
    }

   /* ===== Footer ===== */
       .footer-links {
    list-style: none;
    padding-left: 0;
}

.footer-links li {
    margin-bottom: 12px; 
}

.footer a {
    color: #fff;
    text-decoration: none;
}

.footer a:hover {
    color: var(--gold);
}
.footer {
    background-color: var(--deep-green);
    color: var(--cream);
    padding: 25px 0 5px !important;  /* very compact */
}




    /* Responsive Design */
    @media (max-width: 1200px) {
      .article-meta-info {
        padding: 1.8rem 1.5rem;
      }
      
      .meta-item {
        min-height: 55px;
      }
    }
    
    @media (max-width: 992px) {
      .meta-item {
        min-height: auto;
      }
    }

    @media (max-width: 992px) {
      .article-layout {
        flex-direction:column-reverse;
      }
      .article-side {
        position:static;
      }
      
      .article-meta-info {
        padding: 1.5rem 1.3rem;
      }
      
      /* Bootstrap handles responsive columns */
    }

    @media (max-width: 768px) {
      .container {
        padding: 0 1rem;
      }

      .article-header-inner {
        padding:0 1rem;
      }

      header h1 {
        font-size: 1.8rem;
        line-height: 1.4;
      }
      
      header p {
        font-size: 0.95rem;
      }
      
      .article-tagline {
        font-size: 0.9rem;
      }

      .article-meta-info {
        padding: 1.5rem 1rem;
      }

      /* Bootstrap handles responsive columns */
      
      .meta-item {
        margin-bottom: 0;
      }
      
      .meta-label {
        margin-bottom: 0.4rem;
      }
      
      .meta-value {
        font-size: 0.95rem;
      }

      section {
        padding: 2rem 0;
      }

      .brand-header-inner {
        flex-direction:column;
        align-items:center;
        gap:10px;
        padding: 0 1rem;
      }
      
      .brand-logo {
        padding-left: 0;
        width: 100%;
        text-align: center;
      }
      
      .brand-header-inner img {
        height: 70px;
        width: 140px;
      }
      
      .brand-title {
        margin-left:0;
        text-align:center;
        font-size:32px;
        width: 100%;
        order: -1;
      }
      
      .brand-issn {
        padding-right:0;
        text-align: center;
        width: 100%;
        font-size: 18px;
      }

      .article-actions-bar {
        flex-direction:column;
        align-items:flex-start;
      }
      
      .authors-list {
        padding: 1.5rem 1rem;
      }
      
      .author-item {
        padding: 1rem;
      }
    }

    @media (max-width: 576px) {
      header h1 {
        font-size: 1.8rem;
      }
      
      .article-meta-info {
        padding: 1.2rem 0.8rem;
      }
      
      .meta-row {
        gap: 0.8rem;
        margin-bottom: 0.8rem;
      }
      
      .meta-label {
        font-size: 0.75rem;
      }
      
      .meta-value {
        font-size: 0.9rem;
      }
    }
    
    @media (max-width: 480px) {
      header {
        padding: 2rem 0;
      }
      
      header h1 {
        font-size: 1.5rem;
        line-height: 1.3;
        margin-bottom: 0.8rem;
      }
      
      header p {
        font-size: 0.9rem;
      }
      
      .article-tagline {
        font-size: 0.85rem;
        margin-top: 0.6rem;
      }
      
      .article-meta-info {
        padding: 1rem 0.6rem;
        border-radius: 8px;
      }
      
      .article-header-inner {
        padding: 0 1rem;
      }
    }
  </style>
</head>
<body>

<!-- ===== AYUSCRIPT TOP BRAND HEADER ===== -->
<header class="brand-header">
    <div class="brand-header-inner">
        <!-- LEFT – LOGO -->
        <div class="brand-logo">
            <img src="${pageContext.request.contextPath}/images/Logo_1-removebg-preview.png"
                 alt="AYUSCRIPT Logo"
                 class="img-fluid">
        </div>

        <!-- CENTER – TITLE -->
        <div class="brand-title">
            <h1 class="mb-0">NATURE AYURVED</h1>
        </div>

        <!-- RIGHT – ISSN -->
        <div class="brand-issn">
            <span>ISSN: 0000-0000</span>
        </div>
    </div>
</header>


 <!-- 🌿 Navbar -->
    <nav class="navbar navbar-expand-lg topbar sticky-top">
    <div class="container d-flex justify-content-between align-items-center">

        <!-- NAV MENU -->
        <div class="collapse navbar-collapse" id="navMain">
            <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link " href="${pageContext.request.contextPath}/">Home</a></li>
                    <li class="nav-item"><a class="nav-link " href="${pageContext.request.contextPath}/about">About Us</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/editorial-board">Editorial Board</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/current-issue">Current Issue</a></li>
                   
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/login">Submit Article</a></li>
                    <li class="nav-item"><a class="nav-link " href="${pageContext.request.contextPath}/author-guideline">Author Guideline</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/contact">Contact</a></li>
                    
                </ul>

        </div>

        <!-- RIGHT SIDE BUTTONS 
        <div class="nav-buttons d-flex align-items-center">
            <a class="btn btn-outline-light login-btn me-3" 
               href="${pageContext.request.contextPath}/login">
                <i class="fas fa-sign-in-alt"></i> Login
            </a>

            <a class="btn btn-light register-btn" 
               href="${pageContext.request.contextPath}/register">
                <i class="fas fa-user-plus"></i> Register
            </a>
        </div>   -->

    </div>
</nav>


<!-- Article Header -->
<header>
  <div class="article-header-inner">
    <h1 class="mb-3">${article.title}</h1>
    <p class="mb-2">
      <c:if test="${not empty article.articleType}"><span class="badge bg-secondary me-2">${article.articleType}</span></c:if>
      <c:if test="${not empty article.volume}">Volume ${article.volume}</c:if>
      <c:if test="${not empty article.issue}">, Issue ${article.issue}</c:if>
      <c:if test="${not empty article.publicationDate}"> • Published: ${article.publicationDate}</c:if>
    </p>
    <div class="article-tagline">
      <i class="fas fa-book-open me-2" style="color: var(--deep-green);"></i>
      Full-text article view from AYUSCRIPT – International Journal for Empirical Research in Ayurveda.
    </div>
  </div>
</header>

<!-- Article Content -->
<section>
  <div class="container">
    <div class="article-layout">
      <!-- ===== MAIN CONTENT ===== -->
      <div class="article-main">
        <div id="content">
          <!-- Article Metadata -->
          <div class="article-meta-info">
            <div class="row g-3 mb-3">
              <div class="col-md-4 col-sm-6 col-12">
                <div class="meta-item">
                  <div class="meta-label">Article ID</div>
                  <div class="meta-value">${article.articleId}</div>
                </div>
              </div>
              <div class="col-md-4 col-sm-6 col-12">
                <div class="meta-item">
                  <div class="meta-label">Article Type</div>
                  <div class="meta-value">${article.articleType}</div>
                </div>
              </div>
              <div class="col-md-4 col-sm-6 col-12">
                <div class="meta-item">
                  <div class="meta-label">Volume & Issue</div>
                  <div class="meta-value">${article.volume}, ${article.issue}</div>
                </div>
              </div>
            </div>

            <div class="row g-3">
              <div class="col-md-4 col-sm-6 col-12">
                <div class="meta-item">
                  <div class="meta-label">Publication Date</div>
                  <div class="meta-value">
                    <c:choose>
                      <c:when test="${not empty article.publicationDate}">
                        ${article.publicationDate}
                      </c:when>
                      <c:otherwise>
                        <span style="color: #999; font-style: italic;">Not specified</span>
                      </c:otherwise>
                    </c:choose>
                  </div>
                </div>
              </div>
              <div class="col-md-4 col-sm-6 col-12">
                <div class="meta-item">
                  <div class="meta-label">Acceptance Date</div>
                  <div class="meta-value">
                    <c:choose>
                      <c:when test="${not empty article.acceptanceDate}">
                        ${article.acceptanceDate}
                      </c:when>
                      <c:otherwise>
                        <span style="color: #999; font-style: italic;">Not specified</span>
                      </c:otherwise>
                    </c:choose>
                  </div>
                </div>
              </div>
              <c:if test="${not empty article.numberOfPages}">
                <div class="col-md-4 col-sm-6 col-12">
                  <div class="meta-item">
                    <div class="meta-label">Pages</div>
                    <div class="meta-value">${article.numberOfPages}</div>
                  </div>
                </div>
              </c:if>
            </div>
          </div>

          <!-- Authors -->
          <c:if test="${not empty article.authorNames}">
            <div class="authors-list">
              <h3>Authors</h3>
              <c:set var="authorNames" value="${fn:split(article.authorNames, '||')}" />
              <c:set var="authorDetails" value="${fn:split(article.authorDetails, '||')}" />
              <c:forEach var="i" begin="0" end="${fn:length(authorNames) - 1}">
                <div class="author-item">
                  <strong>${authorNames[i]}</strong>
                  <c:if test="${not empty authorDetails[i]}">
                    <br><span style="color: #666; font-size: 0.9rem;">${authorDetails[i]}</span>
                  </c:if>
                </div>
              </c:forEach>
            </div>
          </c:if>

          <!-- Citation -->
          <c:if test="${not empty article.citation}">
            <div class="citation-box">
              <strong>How to cite this article:</strong>
              ${article.citation}
            </div>
          </c:if>

          <!-- Abstract -->
          <c:if test="${not empty article.abstractText}">
            <div class="section-divider"></div>
            <h3>Abstract</h3>
            <div class="article-content-text">${article.abstractText}</div>

            <c:if test="${not empty article.abstractKeywords}">
              <p class="mt-3 mb-0"><strong>Keywords:</strong> ${article.abstractKeywords}</p>
            </c:if>
          </c:if>

          <!-- Full Article -->
          <c:if test="${not empty article.introduction}">
            <div class="section-divider"></div>
            <h3>Full Article</h3>
            <div class="article-content-text">${article.introduction}</div>
          </c:if>

          <!-- Section Content -->
          <c:if test="${not empty article.sectionContent}">
            <div class="section-divider"></div>
            <h3>Methods</h3>
            <div class="article-content-text">${article.sectionContent}</div>
          </c:if>

          <!-- Discussion -->
          <c:if test="${not empty article.discussionContent}">
            <div class="section-divider"></div>
            <h3>Discussion</h3>
            <div class="article-content-text">${article.discussionContent}</div>
          </c:if>

          <!-- Conclusion -->
          <c:if test="${not empty article.conclusionContent}">
            <div class="section-divider"></div>
            <h3>Conclusion</h3>
            <div class="article-content-text">${article.conclusionContent}</div>
          </c:if>

          <!-- References -->
          <c:if test="${not empty article.referencesText}">
            <div class="section-divider"></div>
            <h3>References</h3>
            <div class="article-content-text">${article.referencesText}</div>
          </c:if>
        </div>

        <!-- ===== BOTTOM ACTION BAR (Download + Back) ===== -->
        <div class="article-actions-bar">
          <!-- Download PDF button moved DOWN (logic unchanged) -->
          <button class="download-btn-main" onclick="downloadPdf()">
            <i class="fas fa-file-pdf"></i>
            Download Full Article (PDF)
          </button>

          <a href="${pageContext.request.contextPath}/current-issue" class="back-link">
            <i class="fas fa-arrow-left"></i> Back to Published Articles
          </a>
        </div>
      </div>

      <!-- ===== SIDE PANEL (EXTRA INFO, NO LOGIC CHANGE) ===== -->
      <aside class="article-side">
        <!-- Quick Info -->
        <div class="side-card">
          <h5>Article Snapshot</h5>
          <div class="side-meta-row">
            <span class="side-meta-label">Type: </span>
            <span class="side-meta-value">${article.articleType}</span>
          </div>
          <div class="side-meta-row">
            <span class="side-meta-label">Volume / Issue: </span>
            <span class="side-meta-value">${article.volume}, ${article.issue}</span>
          </div>
          <div class="side-meta-row">
            <span class="side-meta-label">Publication: </span>
            <span class="side-meta-value">
              <c:choose>
                <c:when test="${not empty article.publicationDate}">
                  ${article.publicationDate}
                </c:when>
                <c:otherwise>
                  Not specified
                </c:otherwise>
              </c:choose>
            </span>
          </div>
          <c:if test="${not empty article.numberOfPages}">
            <div class="side-meta-row">
              <span class="side-meta-label">Pages: </span>
              <span class="side-meta-value">${article.numberOfPages}</span>
            </div>
          </c:if>
        </div>

        <!-- Keywords as Pills (if available) -->
        <c:if test="${not empty article.abstractKeywords}">
          <div class="side-card">
            <h5>Keywords</h5>
            <c:set var="kwStr" value="${article.abstractKeywords}" />
            <c:forEach var="kw" items="${fn:split(kwStr, ',')}">
              <span class="side-pill">${kw}</span>
            </c:forEach>
          </div>
        </c:if>

        <!-- Download Reminder -->
        <div class="side-card side-download-box">
          <h5>Full Article</h5>
          <p>Download the official PDF version of this article for offline reading and citation.</p>
          <button class="download-btn-main" style="font-size:0.95rem; padding:0.7rem 1.4rem;" onclick="downloadPdf()">
            <i class="fas fa-file-download"></i> Download PDF
          </button>
        </div>
      </aside>
    </div>
  </div>
</section>

<!-- ===== Footer ===== -->

<footer class="footer" style="background:var(--deep-green); color:var(--cream); padding:60px 0 25px;">
    <div class="container">

        <div class="row align-items-start">

            <!-- LEFT COLUMN -->
            <div class="col-lg-4 mb-4">
               <div class="footer-logo mb-3">
								<img src="${pageContext.request.contextPath}/images/Logo_1-removebg-preview.png" alt="logo"
									class="img-fluid mb-3" style="height:80px; max-width:180px;">
								<div
									style="font-size:28px; font-family:Georgia, serif; color:var(--gold); font-weight:700; margin-bottom:10px;">
									Nature Ayurved
								</div>
								<div
									style="font-size:11px; font-weight:600; color:#d4a96a; text-transform:uppercase; margin-bottom:20px;">
									International Journal of Ayurved Science & Research
								</div>
							</div>

               <!--  <p class="mb-2" style="font-size:14px; line-height:1.5;">
                    Flat No 604, Raut Arcade, Near Mohan Palms,<br>
                    Shirgaon, Badlapur, Thane 421 503
                </p>

                <p class="mb-2" style="font-size:14px;">Email: ayuscriptjournal@gmail.com</p>
                <p class="mb-2" style="font-size:14px;">Mobile: 9324737097</p>

                <p class="mb-2 mt-3" style="font-size:14px;">Editor-in-Chief: Dr. Vishnu Bawane</p>
                <p class="mb-2" style="font-size:14px;">Email: drvcbawane@gmail.com</p>
                <p class="mb-2" style="font-size:14px;">Mobile: 9324737097</p>

                <div class="social-icons mt-3">
                    <a href="#"><i class="fab fa-facebook-f me-3" style="color:white;"></i></a>
                    <a href="#"><i class="fab fa-twitter me-3" style="color:white;"></i></a>
                    <a href="#"><i class="fab fa-linkedin-in" style="color:white;"></i></a>
                </div> -->
            </div>

            <!-- Quick Links -->
            <div class="col-lg-2 mb-4">
                <h5 style="color:var(--gold); font-family:Georgia, serif; margin-bottom:20px;">Quick Links</h5>
                <ul class="footer-links">
                    <li><a href="${pageContext.request.contextPath}/about">About Us</a></li>
                    <li><a href="${pageContext.request.contextPath}/editorial-board">Editorial Board</a></li>
                    <li><a href="${pageContext.request.contextPath}/current-issue">Current Issue</a></li>
                </ul>
            </div>

            <!-- Author Zone -->
            <div class="col-lg-2 mb-4">
                <h5 style="color:var(--gold); font-family:Georgia, serif; margin-bottom:20px;">Author Zone</h5>
                <ul class="footer-links">
                    <li><a href="${pageContext.request.contextPath}/login">Submit Article</a></li>
                    <li><a href="${pageContext.request.contextPath}/author-guideline">Author Guideline</a></li>
                    <li><a href="${pageContext.request.contextPath}/login">Login / Register</a></li>
                </ul>
            </div>

            <!-- Contact -->
            <div class="col-lg-4 mb-4">
                <h5 style="color:var(--gold); font-family:Georgia, serif; margin-bottom:20px;">Contact</h5>
                <ul class="footer-links">
                    <li><i class="fa fa-envelope me-2"></i> natureayurvedjournal@gmail.com</li>
                    <li><i class="fa fa-globe me-2"></i> natureayurved.com</li>
                    <li><i class="fa fa-barcode me-2"></i> ISSN: 0000-0000</li>
                </ul>
            </div>

        </div>

        <div class="footer-bottom mt-4 pt-3" style="border-top:1px solid rgba(255,255,255,0.15); text-align:center;">
            <p class="mb-0" style="font-size:14px;">
                Copyrights © 2026 NATURE AYURVED All Rights Reserved.
            </p>
        </div>

    </div>
</footer>   


<!-- Bootstrap JS for navbar toggler (no logic change) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<script>
  // DOWNLOAD PDF FUNCTION (LOGIC UNCHANGED)
  function downloadPdf() {
      const articleId = "${article.id}";
      const url = "${pageContext.request.contextPath}/download/" + articleId;
      console.log("Downloading PDF from URL:", url);

      const link = document.createElement('a');
      link.href = url;
      link.target = '_blank';
      link.download = 'article_' + articleId + '.pdf';
      document.body.appendChild(link);
      link.click();
      document.body.removeChild(link);
  }
  
  // Professional content normalization - aggressive whitespace cleanup
  document.addEventListener('DOMContentLoaded', function() {
    const contentElements = document.querySelectorAll('.article-content-text');
    contentElements.forEach(function(element) {
      // Get the HTML content
      let html = element.innerHTML;
      
      // Remove ALL leading whitespace, line breaks, and tabs
      html = html.replace(/^[\s\n\r\t]+/, '');
      
      // Replace multiple consecutive <br> tags (2 or more) with single <br>
      html = html.replace(/(<br\s*\/?>){2,}/gi, '<br>');
      
      // Replace multiple consecutive line breaks (2 or more) with single space
      html = html.replace(/\n{2,}/g, ' ');
      
      // Replace multiple spaces (2 or more) with single space
      html = html.replace(/[ \t]{2,}/g, ' ');
      
      // Remove <br> tags that are at the start
      html = html.replace(/^(<br\s*\/?>)+/gi, '');
      
      // Replace <br> followed by whitespace with just space
      html = html.replace(/<br\s*\/?>\s+/gi, ' ');
      
      // Replace whitespace followed by <br> with just <br>
      html = html.replace(/\s+<br\s*\/?>/gi, '<br>');
      
      // Update the content
      element.innerHTML = html;
      
      // Force CSS to normalize whitespace
      element.style.whiteSpace = 'normal';
    });
    
    // Professional spacing for content after headings - force override
    const headings = document.querySelectorAll('h3');
    headings.forEach(function(heading) {
      const nextElement = heading.nextElementSibling;
      if (nextElement) {
        // Remove ALL leading whitespace from content
        if (nextElement.classList.contains('article-content-text')) {
          let content = nextElement.innerHTML;
          // Remove ALL leading whitespace including line breaks
          content = content.replace(/^[\s\n\r\t]+/, '');
          // Remove leading <br> tags
          content = content.replace(/^(<br\s*\/?>)+/gi, '');
          nextElement.innerHTML = content;
          nextElement.style.whiteSpace = 'normal';
        }
        // Force consistent spacing
        nextElement.style.marginTop = '0.6rem';
        nextElement.style.paddingTop = '0';
        nextElement.style.marginBottom = '';
      }
    });
    
    // Ensure consistent spacing for all paragraphs
    const paragraphs = document.querySelectorAll('#content p');
    paragraphs.forEach(function(p) {
      p.style.marginBottom = '0.9rem';
      p.style.lineHeight = '1.7';
      p.style.marginTop = '0';
    });
    
    // Ensure consistent spacing for all list items
    const listItems = document.querySelectorAll('#content li');
    listItems.forEach(function(li) {
      li.style.marginBottom = '0.5rem';
      li.style.lineHeight = '1.7';
    });
    
    // Remove excessive spacing from all lists
    const lists = document.querySelectorAll('#content ul, #content ol');
    lists.forEach(function(list) {
      list.style.marginTop = '0.6rem';
      list.style.marginBottom = '1.2rem';
    });
    
    // Force remove any inline styles that might add extra spacing
    const allContent = document.querySelectorAll('#content *');
    allContent.forEach(function(el) {
      // Don't override our intentional spacing, but remove any excessive margins
      if (el.tagName !== 'H3' && el.tagName !== 'P' && el.tagName !== 'UL' && el.tagName !== 'OL' && el.tagName !== 'LI') {
        if (el.style.marginTop && parseFloat(el.style.marginTop) > 1) {
          el.style.marginTop = '0';
        }
      }
    });
  });
</script>

</body>
</html>
