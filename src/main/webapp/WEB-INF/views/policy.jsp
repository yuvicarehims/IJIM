<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Policy</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap + Font Awesome -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

    <style>
        :root {
          --deep-green: rgb(30, 140, 193);
          --leaf: #2b8a5f;
          --rust: #7a4b3a;
          --gold: #c9a25a;
          --cream: #fbf6ee;
          --paper: #f7efe6;
          --text: #2d2d2d;
          --shadow: 0 10px 30px rgba(11,74,57,0.06);
          --radius: 12px;
        }

        * {
          box-sizing: border-box;
        }

        html, body {
          overflow-x: hidden;
          max-width: 100%;
        }

        body {
          font-family: 'Segoe UI', sans-serif;
          background-color: var(--cream);
          color: var(--text);
          margin: 0;
          padding: 0;
        }

        /* ===== Header Bar ===== */
        .brand-bar {
          background-color: var(--paper);
          box-shadow: var(--shadow);
          padding: 10px 0;
          border-bottom: 3px solid var(--deep-green);
        }
        .logo-text {
          font-family: 'Georgia', serif;
          font-weight: bold;
          color: var(--deep-green);
          font-size: 32px;
          text-shadow: 1px 1px 2px rgba(0,0,0,0.1);
        }

        /* ===== Navbar ===== */
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
    flex-wrap: nowrap;  /* Prevent wrapping to keep all nav on single line */
}

/* MENU LINKS */
.topbar .nav-link {
    color: #fff !important;
    font-weight: 600;
    text-transform: uppercase;
    font-size: 14px;
    padding: 10px 12px !important;   /* 🔥 Reduce padding so spacing decreases */
    position: relative;
    white-space: nowrap;  /* Keep nav items on single line */
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

/* Navbar Toggle Button */
.navbar-toggler {
    border: 1px solid rgba(255,255,255,0.3) !important;
    color: white !important;
    padding: 6px 10px;
}

.navbar-toggler:focus {
    box-shadow: 0 0 0 0.2rem rgba(255,255,255,0.25);
}

.navbar-toggler-icon {
    background-image: none;
}

.navbar-toggler i {
    font-size: 1.2rem;
}

/* MOBILE FIX */
@media (max-width: 991px) {
    .topbar .navbar-nav {
        gap: 0 !important;
        padding: 10px 0;
    }
    .nav-right {
        margin: 15px 0 !important;
    }
    .topbar .nav-link {
        padding: 10px 15px !important;
    }
}

        /* ===== Page Header ===== */
        .page-header {
  background: linear-gradient(rgba(11, 86, 51, 0.7), rgba(43, 138, 95, 0.7)),
              url('https://www.nimba.in/wp-content/uploads/2024/04/Ayurveda-For-Bronchitis-Proven-Natural-Remedies-To-Pacify-Lung-Inflammation-And-Breathe-Easy.jpg');
  background-size: cover;
  background-position: center;
  color: white;
  padding: 100px 0;
  text-align: center;
}

        .page-header h1 {
            font-family: 'Georgia', serif;
            font-size: 48px;
            margin-bottom: 20px;
            color: var(--gold);
            text-shadow: 2px 2px 4px rgba(0,0,0,0.5);
        }
        .page-header .breadcrumb {
            background: transparent;
            justify-content: center;
            margin-bottom: 0;
        }
        .page-header .breadcrumb-item a {
            color: var(--gold);
            text-decoration: none;
        }
        .page-header .breadcrumb-item.active {
            color: white;
        }

        /* ===== About Sections ===== */
        .about-section {
            padding: 80px 0;
            background-color: white;
        }
        .about-section h2 {
            color: var(--rust);
            font-family: 'Georgia', serif;
            font-weight: bold;
            margin-bottom: 30px;
            position: relative;
            padding-bottom: 15px;
        }
        .about-section h2::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 80px;
            height: 3px;
            background-color: var(--gold);
        }
        .about-section p {
            line-height: 1.8;
            font-size: 17px;
            margin-bottom: 20px;
        }

        /* ===== Mission Vision Section ===== */
        .mission-vision {
            padding: 80px 0;
            background-color: var(--paper);
        }
        .mv-card {
            background: white;
            border-radius: var(--radius);
            padding: 40px 30px;
            box-shadow: var(--shadow);
            height: 100%;
            text-align: center;
            transition: transform 0.3s ease;
            border-top: 4px solid var(--gold);
        }
        .mv-card:hover {
            transform: translateY(-10px);
        }
        .mv-card i {
            font-size: 48px;
            color: var(--deep-green);
            margin-bottom: 20px;
        }
        .mv-card h3 {
            color: var(--rust);
            font-family: 'Georgia', serif;
            margin-bottom: 20px;
        }

        /* ===== Timeline Section ===== */
        .timeline-section {
            padding: 80px 0;
            background-color: white;
        }
        .timeline {
            position: relative;
            max-width: 1200px;
            margin: 0 auto;
        }
        .timeline::after {
            content: '';
            position: absolute;
            width: 6px;
            background-color: var(--leaf);
            top: 0;
            bottom: 0;
            left: 50%;
            margin-left: -3px;
        }
        .timeline-item {
            padding: 10px 40px;
            position: relative;
            width: 50%;
            box-sizing: border-box;
        }
        .timeline-item::after {
            content: '';
            position: absolute;
            width: 25px;
            height: 25px;
            right: -13px;
            background-color: white;
            border: 4px solid var(--gold);
            top: 15px;
            border-radius: 50%;
            z-index: 1;
        }
        .left {
            left: 0;
        }
        .right {
            left: 50%;
        }
        .right::after {
            left: -13px;
        }
        .timeline-content {
            padding: 20px 30px;
            background-color: var(--paper);
            position: relative;
            border-radius: var(--radius);
            box-shadow: var(--shadow);
        }
        .timeline-content h4 {
            color: var(--deep-green);
            margin-bottom: 10px;
        }
        .timeline-content .year {
            color: var(--gold);
            font-weight: bold;
            font-size: 18px;
        }

        /* ===== Team Section ===== */
        .team-section {
            padding: 80px 0;
            background-color: var(--paper);
        }
        .team-card {
            background: white;
            border-radius: var(--radius);
            padding: 30px;
            box-shadow: var(--shadow);
            text-align: center;
            transition: transform 0.3s ease;
            margin-bottom: 30px;
        }
        .team-card:hover {
            transform: translateY(-10px);
        }
        .team-img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            border: 4px solid var(--gold);
            margin: 0 auto 20px;
        }
        .team-card h4 {
            color: var(--deep-green);
            margin-bottom: 5px;
        }
        .team-card .position {
            color: var(--rust);
            font-weight: 600;
            margin-bottom: 15px;
        }

        /* ===== Stats Section ===== */
        .stats-section {
            padding: 80px 0;
            background: linear-gradient(rgba(123, 75, 58, 0.85), rgba(123, 75, 58, 0.85)), url('https://img.freepik.com/premium-photo/blurred-vintage-paper-texture-background_10307-1536.jpg');
            color: white;
            text-align: center;
        }
        .stat-item {
            margin-bottom: 30px;
        }
        .stat-number {
            font-size: 48px;
            font-weight: bold;
            color: var(--gold);
            display: block;
        }
        .stat-label {
            font-size: 18px;
            text-transform: uppercase;
        }

        /* ===== Partners Section ===== */
        .partners-section {
            padding: 80px 0;
            background-color: white;
        }
        .partner-logo {
            max-width: 200px;
            filter: grayscale(100%);
            transition: filter 0.3s ease;
            margin: 0 auto;
        }
        .partner-logo:hover {
            filter: grayscale(0%);
        }

        /* ===== Call to Action ===== */
        .cta-section {
            background-color: var(--deep-green);
            padding: 60px 0;
            color: white;
            text-align: center;
        }
        .cta-section h3 {
            margin-bottom: 30px;
            font-family: 'Georgia', serif;
        }
        .btn-cta {
            background-color: var(--gold);
            color: var(--deep-green);
            font-weight: bold;
            padding: 12px 30px;
            border-radius: var(--radius);
            border: none;
            margin: 0 10px;
            transition: all 0.3s ease;
        }
        .btn-cta:hover {
            background-color: white;
            transform: translateY(-3px);
        }
        .btn-cta-outline {
            background-color: transparent;
            color: white;
            border: 2px solid white;
            font-weight: bold;
            padding: 10px 28px;
            border-radius: var(--radius);
            margin: 0 10px;
            transition: all 0.3s ease;
        }
        .btn-cta-outline:hover {
            background-color: white;
            color: var(--deep-green);
            transform: translateY(-3px);
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
.justified-text {
    text-align: justify;
    line-height: 1.6;   /* improves readability */
}
        /* ===== Header Brand Bar Responsive ===== */
        .brand-header {
            background: #fafafa;
            padding: 15px 0;
            border-bottom: 1px solid #e0e0e0;
        }
        .brand-header .logo-img {
            height: 90px;
            width: 180px;
            object-fit: contain;
        }
        .brand-header .brand-title {
            font-family: Georgia, serif;
            font-weight: 800;
            font-size: 48px;
            color: #6d3f1d;
            margin: 0;
            letter-spacing: 2px;
        }
        .brand-header .issn-text {
            font-size: 22px;
            font-weight: 700;
            color: #4a4a4a;
        }

        /* ===== Responsive Adjustments ===== */
        /* Extra Large Devices (Large Desktops, 1200px and up) */
        @media (min-width: 1200px) {
            .container {
                max-width: 1140px;
            }
        }

        /* Large Devices (Desktops, 992px and up) */
        @media (max-width: 1199px) {
            .brand-header .brand-title {
                font-size: 42px;
            }
            .brand-header .issn-text {
                font-size: 20px;
            }
        }

        /* Medium Devices (Tablets, 768px and up) */
        @media (max-width: 991px) {
            .brand-header {
                padding: 12px 0;
            }
            .brand-header .logo-img {
                height: 70px;
                width: 140px;
            }
            .brand-header .brand-title {
                font-size: 32px;
                letter-spacing: 1px;
            }
            .brand-header .issn-text {
                font-size: 16px;
            }
            .page-header {
                padding: 60px 0;
            }
            .page-header h1 {
                font-size: 36px;
            }
            .about-section {
                padding: 50px 0;
            }
            .about-section h2 {
                font-size: 28px;
            }
            .about-section p {
                font-size: 16px;
            }
            .mission-vision {
                padding: 50px 0;
            }
            .timeline-section {
                padding: 50px 0;
            }
            .topbar .navbar-nav {
                gap: 0 !important;
            }
            .topbar .nav-link {
                padding: 10px 15px !important;
                font-size: 13px;
            }
        }

        /* Small Devices (Landscape Phones, 576px and up) */
        @media (max-width: 767px) {
            .brand-header {
                padding: 10px 0;
            }
            .brand-header .logo-img {
                height: 60px;
                width: 120px;
            }
            .brand-header .brand-title {
                font-size: 24px;
                letter-spacing: 0.5px;
            }
            .brand-header .issn-text {
                font-size: 14px;
            }
            .page-header {
                padding: 50px 0;
            }
            .page-header h1 {
                font-size: 28px;
            }
            .about-section {
                padding: 40px 0;
            }
            .about-section h2 {
                font-size: 24px;
                margin-bottom: 20px;
            }
            .about-section p {
                font-size: 15px;
                line-height: 1.6;
            }
            .mission-vision {
                padding: 40px 0;
            }
            .mv-card {
                padding: 30px 20px;
                margin-bottom: 20px;
            }
            .mv-card i {
                font-size: 36px;
            }
            .mv-card h3 {
                font-size: 20px;
            }
            .timeline-section {
                padding: 40px 0;
            }
            .timeline::after {
                left: 31px;
            }
            .timeline-item {
                width: 100%;
                padding-left: 70px;
                padding-right: 15px;
            }
            .timeline-item::after {
                left: 18px;
            }
            .right {
                left: 0%;
            }
            .timeline-content {
                padding: 15px 20px;
            }
            .timeline-content h4 {
                font-size: 18px;
            }
            .timeline-content .year {
                font-size: 16px;
            }
            .btn-cta, .btn-cta-outline {
                display: block;
                margin: 10px auto;
                width: 80%;
                max-width: 300px;
            }
            .topbar .nav-link {
                padding: 8px 12px !important;
                font-size: 12px;
            }
            .footer {
                padding: 40px 0 20px !important;
            }
            .footer h5 {
                font-size: 14px !important;
                margin-bottom: 15px !important;
            }
            .footer-links li {
                margin-bottom: 8px;
                font-size: 13px;
            }
        }

        /* Extra Small Devices (Portrait Phones, less than 576px) */
        @media (max-width: 575px) {
            .brand-header {
                padding: 8px 0;
            }
            .brand-header .logo-img {
                height: 50px;
                width: 100px;
            }
            .brand-header .brand-title {
                font-size: 20px;
                letter-spacing: 0;
            }
            .brand-header .issn-text {
                font-size: 12px;
            }
            .page-header {
                padding: 40px 0;
            }
            .page-header h1 {
                font-size: 24px;
            }
            .about-section {
                padding: 30px 0;
            }
            .about-section h2 {
                font-size: 20px;
                margin-bottom: 15px;
            }
            .about-section p {
                font-size: 14px;
                line-height: 1.5;
            }
            .mission-vision {
                padding: 30px 0;
            }
            .mv-card {
                padding: 25px 15px;
            }
            .mv-card i {
                font-size: 32px;
                margin-bottom: 15px;
            }
            .mv-card h3 {
                font-size: 18px;
                margin-bottom: 15px;
            }
            .timeline-section {
                padding: 30px 0;
            }
            .timeline-item {
                padding-left: 60px;
                padding-right: 10px;
            }
            .timeline-content {
                padding: 12px 15px;
            }
            .timeline-content h4 {
                font-size: 16px;
            }
            .timeline-content p {
                font-size: 13px;
            }
            .topbar .nav-link {
                padding: 6px 10px !important;
                font-size: 11px;
            }
            .footer {
                padding: 30px 0 15px !important;
            }
            .footer h5 {
                font-size: 13px !important;
                margin-bottom: 12px !important;
            }
            .footer-links li {
                margin-bottom: 6px;
                font-size: 12px;
            }
        }
		.heading-responsive {
		          font-size: clamp(1.5rem, 4vw, 2.5rem);
		      }
			  .header-title {
			             flex: 1;
			             text-align: center;
			             min-width: 200px;
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
					 .header-logo img {
					            height: 90px;
					            width: 180px;
					            object-fit: contain;
					            max-width: 100%;
					        }
    </style>
</head>
<body>

    <!-- 🌿 Brand Bar -->
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


    <!-- 🌿 Navbar -->
    <nav class="navbar navbar-expand-lg topbar sticky-top">
        <div class="container-fluid px-3 px-md-4 px-lg-5">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navMain" 
                    aria-controls="navMain" aria-expanded="false" aria-label="Toggle navigation"
                    style="border: 1px solid rgba(255,255,255,0.3); color: white;">
                <i class="fas fa-bars"></i>
            </button>

            <!-- NAV MENU -->
            <div class="collapse navbar-collapse" id="navMain">
                <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/">Home</a></li>
                    <li class="nav-item"><a class="nav-link " href="${pageContext.request.contextPath}/about">About Us</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/editorial-board">Editorial Board</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/current-issue">Current Issue</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/archives">Archives</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/login">Submit Article</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/author-guideline">Author Guideline</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/contact">Contact</a></li>
                    <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/policy">Policy</a></li>
                    <li class="nav-item">
					<a class="nav-link" href="https://www.vidyavishva.com/" target="_blank">VIDYAVISHVA</a>
				</li>
                </ul>
            </div>
        </div>   
    </nav>

    <!-- 🌿 Page Header -->
    <section class="page-header">
        <div class="container">
            <h1>${not empty pageContent['policy_title'] ? pageContent['policy_title'] : 'POLICY'}</h1>
            <nav aria-label="breadcrumb">
                
            </nav>
        </div>
    </section>

    <!-- 🌿 About Journal Section -->
    <section class="about-section">
        <div class="container">
            <div class="row align-items-center g-4">
                <div class="col-12 col-lg-12 order-2 order-lg-1">
                    <h2>${not empty pageContent['policy_content_1'] ? pageContent['policy_content_1'] : 'PUBLICATION POLICY'}</h2>
                    <p class="justified-text">
                        ${not empty pageContent['policy_content_2'] ? pageContent['policy_content_2'] : 'Nature Ayurved is a peer-reviewed international journal committed to the timely dissemination of high-quality scholarly work in Ayurveda, integrative medicine, allied health sciences, and related interdisciplinary fields.
The journal follows a bi-monthly publication schedule, releasing six issues annually. Issues are ordinarily published in the months of: "January, March, May, July, September, November".'}
                    </p>
                     <p class="justified-text">
                        ${not empty pageContent['policy_content_3'] ? pageContent['policy_content_3'] : 'Manuscripts accepted for publication after successful peer review, editorial evaluation, and completion of all publication formalities will be scheduled for the next available issue based on editorial priority, thematic relevance, and date of final acceptance.
The journal reserves the right to publish special issues, supplementary issues, conference proceedings, or thematic editions whenever required.
All accepted articles may be made available online as “Articles in Press” or “Ahead of Print” prior to their inclusion in a scheduled issue, subject to editorial discretion.
While every effort is made to adhere to the declared publication timeline, the journal reserves the right to modify release dates, combine issues, or delay publication due to unforeseen editorial, technical, or administrative circumstances.
The editorial board maintains full authority over issue planning, article sequencing, pagination, and final publication decisions to ensure academic quality and publication integrity.
'}
                    </p>
                   <%--  <p>
                        ${not empty pageContent['about_content_4'] ? pageContent['about_content_4'] : 'Since our inception, AYUSCRIPT has continuously contributed to original research, education, and the propagation of Ayurvedic knowledge on both national and international platforms, bridging the gap between traditional wisdom and modern scientific validation.'}
                    </p>  --%>
                </div>
                <div class="col-12 col-lg-12 order-1 order-lg-2">
                     <h2>${not empty pageContent['policy_content_4'] ? pageContent['policy_content_4'] : 'PLAGIARISM POLICY'}</h2>
                     <h5>
                     ${not empty pageContent['policy_content_5'] ? pageContent['policy_content_5'] : 'Nature Ayurved: International Journal of Ayurved Science & Research'}
                     </h5>
                     <p class="justified-text">
                      ${not empty pageContent['policy_content_6'] ? pageContent['policy_content_6'] : 'At Nature Ayurved: International Journal of Ayurved Science & Research, we are committed to maintaining the highest standards of academic integrity, originality, and ethical publishing practices. Plagiarism in any form is considered a serious violation of scholarly ethics and is strictly prohibited.
Plagiarism includes, but is not limited to:
'}
                     </p>
                     
                      <p class="justified-text">
                     ${not empty pageContent['policy_content_7'] ? pageContent['policy_content_7'] : '•	Copying text, ideas, data, images, or results from another source without proper acknowledgment.'}
                     </p>
                     
                      <p class="justified-text">
                     ${not empty pageContent['policy_content_8'] ? pageContent['policy_content_8'] : '•	Presenting another person’s work as one’s own.'}
                     </p>
                     
                      <p class="justified-text">
                     ${not empty pageContent['policy_content_9'] ? pageContent['policy_content_9'] : '•	Using published or unpublished material without citation.'}
                     </p>
                      <p>
                     ${not empty pageContent['policy_content_10'] ? pageContent['policy_content_10'] : '• Paraphrasing another author’s work without appropriate reference.'}
                     </p>
                     <p class="justified-text">
                     ${not empty pageContent['policy_content_11'] ? pageContent['policy_content_11'] : '• Self-plagiarism, including reuse of one’s own previously published content without proper citation or permission.'}
                     </p>
                     
                      <p class="justified-text">
                     ${not empty pageContent['policy_content_12'] ? pageContent['policy_content_12'] : '• Submitting duplicate or substantially similar manuscripts to multiple journals.'}
                     </p>
                     
                      <h5>
                     ${not empty pageContent['policy_content_13'] ? pageContent['policy_content_13'] : 'Author Responsibilities'}
                     </h5>
                     
                        <p class="justified-text">
                     ${not empty pageContent['policy_content_14'] ? pageContent['policy_content_14'] : 'Authors are solely responsible for ensuring that their submitted manuscripts are original and free from plagiarism. All sources, references, and previously published materials used in the manuscript must be properly cited according to the journal guidelines. Authors should always present concepts, interpretations, and findings in their own words.'}
                     </p>
                      <h5>
                     ${not empty pageContent['policy_content_15'] ? pageContent['policy_content_15'] : 'Plagiarism Screening'}
                     </h5>
                     
                        <p class="justified-text">
                     ${not empty pageContent['policy_content_16'] ? pageContent['policy_content_16'] : 'All manuscripts submitted to the journal are subject to plagiarism detection screening using standard plagiarism checking tools before and during the peer-review process. The editorial board reserves the right to recheck manuscripts at any stage of review or publication.'}
                     </p>
                      <h5>
                     ${not empty pageContent['policy_content_17'] ? pageContent['policy_content_17'] : 'Actions in Case of Plagiarism'}
                     </h5>
                     
                        <p class="justified-text">
                     ${not empty pageContent['policy_content_18'] ? pageContent['policy_content_18'] : 'If plagiarism is identified at any stage, the journal may take the following actions depending on the severity of the misconduct:.'}
                     </p>
                      <h5>
                     ${not empty pageContent['policy_content_19'] ? pageContent['policy_content_19'] : 'Before Publication'}
                     </h5>
                     
                        <p class="justified-text">
                     ${not empty pageContent['policy_content_20'] ? pageContent['policy_content_20'] : '•	Immediate rejection of the manuscript.
•	Notification to the corresponding author with explanation.
•	Temporary or permanent restriction on future submissions.
'}
                     </p>
                      <h5>
                     ${not empty pageContent['policy_content_21'] ? pageContent['policy_content_21'] : 'After Publication'}
                     </h5>
                     
                        <p class="justified-text">
                     ${not empty pageContent['policy_content_22'] ? pageContent['policy_content_22'] : '•	Retraction of the published article.
•	Publication of an official retraction notice.
•	Notification to the author’s affiliated institution, funding agency, or regulatory authority.
•	Informing the original copyright holder or affected author(s).
'}
                     </p>
                      <h5>
                     ${not empty pageContent['policy_content_23'] ? pageContent['policy_content_23'] : 'Acceptable Similarity Limit'}
                     </h5>
                     
                        <p class="justified-text">
                     ${not empty pageContent['policy_content_24'] ? pageContent['policy_content_24'] : 'Authors are advised to maintain overall similarity below acceptable academic standards and ensure that no copied content is included without citation. High similarity due to references, common terminology, or methodology sections may be assessed separately by editors.'}
                     </p>
                      <h5>
                     ${not empty pageContent['policy_content_25'] ? pageContent['policy_content_25'] : 'Editorial Rights'}
                     </h5>
                     
                        <p class="justified-text">
                     ${not empty pageContent['policy_content_26'] ? pageContent['policy_content_26'] : 'The final decision regarding plagiarism, originality, and ethical suitability of a manuscript rests solely with the Editor-in-Chief and Editorial Board of the journal.'}
                     </p>
                      <h5>
                     ${not empty pageContent['policy_content_27'] ? pageContent['policy_content_27'] : 'Commitment to Ethical Publishing'}
                     </h5>
                     
                        <p class="justified-text">
                     ${not empty pageContent['policy_content_28'] ? pageContent['policy_content_28'] : 'The journal encourages all authors, reviewers, and editors to uphold transparency, honesty, and responsible research publication practices in order to promote the growth of authentic Ayurvedic scientific literature.'}
                     </p>
                     <h2>
                     ${not empty pageContent['policy_content_29'] ? pageContent['policy_content_29'] : 'REVIEW POLICY'}
                     </h2>
                      <h5>
                     ${not empty pageContent['policy_content_5'] ? pageContent['policy_content_5'] : 'Nature Ayurved: International Journal of Ayurved Science & Research'}
                     </h5>
                        <p class="justified-text">
                     ${not empty pageContent['policy_content_30'] ? pageContent['policy_content_30'] : 'At Nature Ayurved: International Journal of Ayurved Science & Research, we are committed to ensuring a fair, transparent, timely, and high-quality peer review process. Every manuscript submitted to the journal undergoes a structured editorial and peer-review procedure to maintain academic excellence and scientific integrity.'}
                     </p> 
                     
                     <h5>
                     ${not empty pageContent['policy_content_31'] ? pageContent['policy_content_31'] : 'Manuscript Review Process'}
                     </h5>
                     <h5>
                     ${not empty pageContent['policy_content_32'] ? pageContent['policy_content_32'] : 'Step 1: Submission by Author'}
                     </h5>
                        <p class="justified-text">
                     ${not empty pageContent['policy_content_33'] ? pageContent['policy_content_33'] : 'Authors may submit their original research articles, review papers, case studies, short communications, and other scholarly manuscripts through the journal’s official submission system or via the official editorial email as prescribed by the journal.
All submissions must comply with the journal’s author guidelines, formatting standards, and ethical policies.
'}

  <h5>
                     ${not empty pageContent['policy_content_34'] ? pageContent['policy_content_34'] : 'Step 2: Initial Editorial Screening'}
                     </h5>
                        <p class="justified-text">
                     ${not empty pageContent['policy_content_35'] ? pageContent['policy_content_35'] : 'Upon receipt, each manuscript is screened by the Editorial Office for:
•	Scope and relevance to Ayurveda and allied sciences
•	Basic formatting compliance
•	Grammar and language quality
•	Completeness of manuscript files
•	Ethical declarations and authorship details
•	Plagiarism screening
Manuscripts with excessive grammatical errors, poor formatting, or non-compliance with journal guidelines may be returned to the authors for correction before peer review.

'}
                     </p> 
                     
                     
                     <h5>
                     ${not empty pageContent['policy_content_36'] ? pageContent['policy_content_36'] : 'Step 3: Double-Blind Peer Review'}
                     </h5>
                        <p class="justified-text">
                     ${not empty pageContent['policy_content_37'] ? pageContent['policy_content_37'] : 'All eligible manuscripts are subjected to a double-blind peer review process, where both authors and reviewers remain anonymous.
Each manuscript is reviewed by at least two independent subject experts, and where necessary, three or more reviewers may be invited for specialized evaluation.
Reviewers assess manuscripts on the basis of:
•	Originality and novelty
•	Scientific quality and methodology
•	Relevance to journal scope
•	Clinical/research significance
•	Literature review and references
•	Ethical compliance
•	Clarity of presentation
•	Overall contribution to Ayurvedic science

'}</p>
                   
                   
                   <h5>
                     ${not empty pageContent['policy_content_38'] ? pageContent['policy_content_38'] : 'Step 4: Reviewer Recommendations'}
                     </h5>
                        <p class="justified-text">
                     ${not empty pageContent['policy_content_39'] ? pageContent['policy_content_39'] : 'Based on reviewer comments, the editorial decision may be one of the following:
1.	Accepted
2.	Rejected
3.	Accepted with Minor Revisions
4.	Accepted with Major Revisions
Authors receiving revision requests must submit the revised manuscript within the specified timeline along with point-by-point responses to reviewer comments.

'}

</p>

  <h5>
                     ${not empty pageContent['policy_content_40'] ? pageContent['policy_content_40'] : 'Step 5: Final Editorial Decision'}
                     </h5>
                        <p class="justified-text">
                     ${not empty pageContent['policy_content_41'] ? pageContent['policy_content_41'] : 'After satisfactory revision (if applicable), the Editor-in-Chief or Editorial Board makes the final decision regarding acceptance and forwards the manuscript for production.
'}

</p>
        <h5>
                     ${not empty pageContent['policy_content_42'] ? pageContent['policy_content_42'] : 'Step 6: Production and Publication'}
                     </h5>
                        <p class="justified-text">
                     ${not empty pageContent['policy_content_43'] ? pageContent['policy_content_43'] : 'Accepted manuscripts undergo copyediting, layout formatting, proof preparation, and issue scheduling before publication in the current or upcoming issue of the journal.
'}

</p>       


<h5>
                     ${not empty pageContent['policy_content_44'] ? pageContent['policy_content_44'] : 'Step 7: Author Notification'}
                     </h5>
                        <p class="justified-text">
                     ${not empty pageContent['policy_content_45'] ? pageContent['policy_content_45'] : 'Authors are informed of all major decisions, including acceptance, revision requests, rejection, and publication status through official email communication.
'}

</p>



					<h5>${not empty pageContent['policy_content_46'] ? pageContent['policy_content_46'] : 'Confidentiality and Ethics'}
					</h5>
					<p class="justified-text">${not empty pageContent['policy_content_47'] ? pageContent['policy_content_47'] : 'All submitted manuscripts are treated as confidential documents. Reviewers are expected to maintain confidentiality, avoid conflicts of interest, and provide objective, constructive, and timely reviews.
'}

					</p>
					<h5>${not empty pageContent['policy_content_48'] ? pageContent['policy_content_48'] : 'Editorial Rights'}
					</h5>
					<p class="justified-text">${not empty pageContent['policy_content_49'] ? pageContent['policy_content_49'] : 'The Editor-in-Chief reserves the right to accept, reject, or request modifications to any manuscript based on reviewer recommendations, journal policy, and academic standards.'}

					</p>
					
					<h5>${not empty pageContent['policy_content_50'] ? pageContent['policy_content_50'] : 'Commitment to Quality'}
					</h5>
					<p class="justified-text">${not empty pageContent['policy_content_51'] ? pageContent['policy_content_51'] : 'Nature Ayurved Journal is dedicated to promoting authentic, evidence-based, and high-quality research in Ayurveda through a rigorous and unbiased peer review system.'}

					</p>
					
					
					<h5>${not empty pageContent['policy_content_52'] ? pageContent['policy_content_52'] : 'Conflict of Interest Policy'}
					</h5>
					<p class="justified-text">${not empty pageContent['policy_content_53'] ? pageContent['policy_content_53'] : 'A conflict of interest exists when any financial, professional, personal, or academic relationship could influence, or appear to influence, the objectivity, integrity, or interpretation of the work submitted for publication. This may include direct or indirect financial support, commercial affiliations, institutional interests, personal relationships, or academic competition.
The corresponding author is responsible for obtaining relevant conflict of interest disclosures from all co-authors and ensuring that the copyright/authorship declaration form, duly signed by all authors, is submitted along with the manuscript.
It is the duty of the corresponding author to confirm with all co-authors whether any competing interests exist. Any such disclosures must be clearly stated in the title page or cover letter at the time of submission.
As part of our ethical publishing standards, all reviewers are required to decline review assignments where a potential conflict of interest exists or to declare any such conflict before accepting the manuscript for review.
Similarly, all editors must disclose any potential conflicts of interest in accordance with editorial ethics policies. Editors with a conflict related to a submitted manuscript will not participate in its review or decision-making process, and the manuscript will be reassigned to another qualified editor.
If any conflict of interest is identified after publication, authors, readers, or concerned parties are requested to notify the editorial office promptly.
All reported concerns will be investigated thoroughly, normally within seven (07) working days. If the claim is found to be valid, the journal reserves the right to take appropriate corrective action, including publication of corrections, expressions of concern, retraction of the article, and removal from journal platforms or indexing databases where applicable.
'}

					</p>
				</div>
            </div>
        </div>
    </section>

   

<!-- ===== Footer ===== -->
<footer class="footer" style="background:var(--deep-green); color:var(--cream); padding:60px 0 25px;">
    <div class="container">

        <div class="row">

            <!-- LOGO AND ADDRESS -->
            <div class="col-12 col-md-6 col-lg-4 mb-4 mb-lg-0">
                <div class="footer-logo mb-3">
                    <img src="${pageContext.request.contextPath}/images/Logo_1-removebg-preview.png" 
                         alt="logo" 
                         class="img-fluid mb-3" 
                         style="height:80px; max-width:180px;">
                    <div style="font-size:28px; font-family:Georgia, serif; color:var(--gold); font-weight:700; margin-bottom:10px;">
                        Nature Ayurved
                    </div>
                    <div style="font-size:11px; font-weight:600; color:#d4a96a; text-transform:uppercase; margin-bottom:20px;">
                        International Journal of Ayurved Science & Research 
                    </div>
                </div>
		          <%--  <p class="mb-2" style="font-size:14px; line-height:1.5;">
                    ${not empty pageContent['footer_address'] ? pageContent['footer_address'] : 'G1, Green park 6B, shanti park, Mira road E. 401107'}
                </p>
                <p class="mb-2" style="font-size:14px;">Email: ${not empty pageContent['footer_email'] ? pageContent['footer_email'] : 'natureayurvedjournal@gmail.com'}</p>
                <p class="mb-2" style="font-size:14px;">Mobile: ${not empty pageContent['footer_mobile'] ? pageContent['footer_mobile'] : '7710880622'}</p>
                <p class="mb-2 mt-3" style="font-size:14px;">Editor-in-Chief ${not empty pageContent['footer_editor_name'] ? pageContent['footer_editor_name'] : 'Dr.Chetan Madhukar Gulhane'}</p>
                <p class="mb-2" style="font-size:14px;">Email: ${not empty pageContent['footer_editor_email'] ? pageContent['footer_editor_email'] : 'natureayurvedjournal@gmail.com'}</p>
                <p class="mb-2" style="font-size:14px;">Mobile: ${not empty pageContent['footer_mobile'] ? pageContent['footer_mobile'] : '8767571175'}</p> --%>
            </div>

            <!-- Quick Links -->
            <div class="col-6 col-md-3 col-lg-2 mb-4 mb-lg-0">
                <h5 style="color:var(--gold); font-family:Georgia, serif; margin-bottom:20px; font-size:16px;">Quick Links</h5>
                <ul class="footer-links">
                    <li><a href="${pageContext.request.contextPath}/about">About Us</a></li>
                    <li><a href="${pageContext.request.contextPath}/editorial-board">Editorial Board</a></li>
                    <li><a href="${pageContext.request.contextPath}/current-issue">Current Issue</a></li>
                    <li><a href="${pageContext.request.contextPath}/archives">Archives</a></li>
                </ul>
            </div>

            <!-- Author Zone -->
           <div class="col-lg-2 mb-4">
                <h5 style="color:var(--gold); font-family:Georgia, serif; margin-bottom:20px; font-size:16px;">Author Zone</h5>
                <ul class="footer-links">
                    <li><a href="${pageContext.request.contextPath}/submit-article">Submit Article</a></li>
                    <li><a href="${pageContext.request.contextPath}/author-guideline">Author Guideline</a></li>
                    <li><a href="${pageContext.request.contextPath}/login">Login / Register</a></li>
                </ul>
            </div>

            <!-- Contact -->
           <div class="col-lg-4 mb-4">
                <h5 style="color:var(--gold); font-family:Georgia, serif; margin-bottom:20px; font-size:16px;">Contact</h5>
                <ul class="footer-links">
                    <li><i class="fa fa-envelope me-2"></i> ${not empty pageContent['footer_contact_email'] ? pageContent['footer_contact_email'] : 'natureayurvedjournal@gmail.com'}</li>
                    <li><i class="fa fa-globe me-2"></i> ${not empty pageContent['footer_contact_website'] ? pageContent['footer_contact_website'] : 'natureayurved.com'}</li>
                    <li><i class="fa fa-barcode me-2"></i> ISSN: ${not empty pageContent['footer_contact_issn'] ? pageContent['footer_contact_issn'] : '0000-0000'}</li>
                </ul>
            </div>

        </div>

        <div class="footer-bottom mt-4 pt-3" style="border-top:1px solid rgba(255,255,255,0.15); text-align:center;">
            <p class="mb-0" style="font-size:14px;">
                ${not empty pageContent['footer_copyright'] ? pageContent['footer_copyright'] : 'Copyright © 2026 NATURE AYURVED All Rights Reserved.'}
            </p>
        </div>

    </div>
</footer>
       

    <!-- 🌿 Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>