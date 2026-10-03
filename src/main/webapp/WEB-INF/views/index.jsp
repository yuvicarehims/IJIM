<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>IJIM | Home</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

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
            --max-width: 1200px;
            --radius: 12px;
            --shadow: 0 10px 30px rgba(11,74,57,0.06);
            --transition: all 0.3s ease;
        }

        * {
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', 'Helvetica Neue', Arial, sans-serif;
            background-color: var(--cream);
            color: var(--text);
            margin: 0;
            padding: 0;
            line-height: 1.6;
            overflow-x: hidden;
        }

        .container-main {
            max-width: var(--max-width);
            margin: 0 auto;
            padding: 0 15px;
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

        .header-issn {
            flex-shrink: 0;
            text-align: right;
        }

        .header-issn span {
            font-size: 22px;
            font-weight: 700;
            color: #4a4a4a;
            white-space: nowrap;
        }

        /* NAVBAR CUSTOM STYLES - Fully Responsive */
        .navbar-custom {
            background: rgb(30, 140, 193);
            padding-top: 6px !important;
            padding-bottom: 6px !important;
            font-size: 18px;
        }

        .navbar-custom .navbar-nav {
            gap: 10px;
        }

        .navbar-custom .nav-link {
            color: #fff !important;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 14px;
            padding: 10px 12px !important;
            position: relative;
            transition: all 0.3s ease;
            white-space: nowrap;
        }

        @media (max-width: 991.98px) {
            .navbar-custom .navbar-collapse {
                background: rgba(33, 79, 55, 0.98);
                margin-top: 10px;
                padding: 15px;
                border-radius: 8px;
            }
            
            .navbar-custom .nav-link {
                padding: 12px 15px !important;
                border-bottom: 1px solid rgba(255,255,255,0.1);
            }
            
            .navbar-custom .nav-link:last-child {
                border-bottom: none;
            }
            
            .navbar-custom .nav-link::after {
                display: none;
            }
        }

        .navbar-custom .nav-link:hover, 
        .navbar-custom .nav-link.active {
            color: var(--gold) !important;
            background-color: rgba(255,255,255,0.1);
        }
        
        .navbar-custom .nav-link::after {
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
        .navbar-custom .nav-link.active::after,
        .navbar-custom .nav-link:hover::after {
            transform: translateX(-50%) scaleX(1);
        }

        .navbar-custom .btn-outline-light {
            font-size: 15px;
            padding: 8px 20px;
            border-radius: 10px;
            border-width: 2px;
            font-weight: 600;
        }

        .navbar-custom .btn-light {
            background: #ffffff !important;         
            color: #000000 !important;             
            padding: 12px 28px !important;
            border-radius: 14px !important;
            font-weight: 700 !important;            
            font-size: 16px !important;
            border: none !important;                
            box-shadow: 0px 2px 8px rgba(0,0,0,0.18);
        }
        .navbar-custom .btn-light:hover {
            box-shadow: 0px 4px 12px rgba(0,0,0,0.25);
        }

        /* HERO SLIDER - Fully Responsive */
        #heroCarousel {
            position: relative;
            overflow: hidden;
        }

        #heroCarousel img {
            height: 60vh;
            min-height: 450px;
            max-height: 700px;
            object-fit: cover;
            filter: brightness(70%);
            width: 100%;
        }

        .hero-text-overlay {
            position: absolute;
            top: 50%;
            left: 5%;
            transform: translateY(-50%);
            z-index: 99;
            color: white;
            max-width: 600px;
            padding: 20px;
            background: rgba(0,0,0,0.3);
            border-radius: 10px;
        }

        .hero-title {
            font-size: 50px;
            font-weight: 700;
            line-height: 1.2;
            margin-bottom: 10px;
        }

        .hero-subtitle {
            font-size: 22px;
            font-weight: 600;
            margin-bottom: 15px;
        }

        .hero-desc {
            font-size: 17px;
            margin-bottom: 25px;
        }

        .hero-buttons {
            display: flex;
            flex-wrap: wrap;
            gap: 12px;
        }

        .hero-buttons .btn {
            margin-right: 0;
            padding: 12px 24px;
            font-weight: 600;
            border-radius: 6px;
            white-space: nowrap;
        }

        /* INVITATION SECTION */
        .invitation-section {
            background: var(--gold);
            border-top: 3px solid var(--deep-green);
            border-bottom: 3px solid var(--deep-green);
            overflow: hidden;
            white-space: nowrap;
            padding: 15px 0;
        }

        .invitation-text {
            display: inline-block;
            color: var(--deep-green);
            font-weight: 700;
            font-size: 16px;
            padding-left: 100%;
            animation: scroll-left 25s linear infinite;
        }

        /* SECTIONS */
        .section-padding {
            padding: 80px 0;
        }

        .section-heading {
            font-size: 2.5rem;
            margin-bottom: 30px;
        }

        .issue-block {
            background: rgba(255,255,255,0.1);
            padding: 25px;
            border-radius: 12px;
            border-left: 5px solid var(--gold);
            margin-bottom: 20px;
            transition: transform 0.3s ease;
        }

        .issue-block:hover {
            transform: translateX(5px);
        }

        /* BUTTONS */
        .btn-cta {
            background: var(--gold);
            color: var(--deep-green);
            padding: 12px 30px;
            border-radius: 6px;
            font-weight: 600;
            border: none;
            transition: all 0.3s ease;
        }

        .btn-cta:hover {
            background: var(--deep-green);
            color: var(--gold);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }

        .btn-cta-outline {
            border: 2px solid;
            padding: 10px 25px;
            border-radius: 6px;
            font-weight: 600;
            transition: all 0.3s ease;
            display: inline-block;
        }

        .btn-cta-outline:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }

        /* FOOTER */
        footer {
            background: var(--deep-green) !important;
        }
       .justified-text {
            text-align: justify;
            line-height: 1.6;   /* improves readability */
        }
        /* RESPONSIVE BREAKPOINTS */
        /* Extra Large Devices (Large Desktops, 1200px and up) */
        @media (min-width: 1200px) {
            .hero-text-overlay {
                max-width: 650px;
            }
        }

        /* Large Devices (Desktops, 992px and up) */
        @media (max-width: 1199.98px) {
            .header-title h1 {
                font-size: 42px;
            }
            .hero-title {
                font-size: 45px;
            }
            .section-heading {
                font-size: 2.2rem;
            }
        }

        /* Medium Devices (Tablets, 768px and up) */
        @media (max-width: 991.98px) {
            .header-content {
                justify-content: center;
            }
            
            .header-title {
                order: -1;
                width: 100%;
                margin: 10px 0;
            }
            
            .header-title h1 {
                font-size: 36px;
            }
            
            .header-logo {
                padding-left: 0;
            }
            
            .header-issn {
                width: 100%;
                text-align: center;
                padding-right: 0;
            }
            
            .header-issn span {
                font-size: 18px;
            }

            .hero-title {
                font-size: 38px;
            }
            
            .hero-subtitle {
                font-size: 20px;
            }
            
            .hero-desc {
                font-size: 16px;
            }

            .section-heading {
                font-size: 2rem;
            }

            .section-padding {
                padding: 60px 0;
            }

            .navbar-custom .nav-link {
                font-size: 13px;
                padding: 8px 10px !important;
            }
        }

        /* Small Devices (Landscape Phones, 576px and up) */
        @media (max-width: 767.98px) {
            .header-logo img {
                height: 70px;
                width: 140px;
            }
            
            .header-title h1 {
                font-size: 28px;
                letter-spacing: 1px;
            }
            
            .header-issn span {
                font-size: 16px;
            }

            #heroCarousel img {
                height: 50vh;
                min-height: 350px;
            }

            .hero-text-overlay {
                left: 50%;
                transform: translate(-50%, -50%);
                max-width: 90%;
                width: 90%;
                padding: 15px;
            }

            .hero-title {
                font-size: 28px;
                margin-bottom: 8px;
            }
            
            .hero-subtitle {
                font-size: 16px;
                margin-bottom: 12px;
            }
            
            .hero-desc {
                font-size: 14px;
                margin-bottom: 20px;
            }

            .hero-buttons .btn {
                padding: 10px 20px;
                font-size: 14px;
            }

            .section-heading {
                font-size: 1.75rem;
            }

            .section-padding {
                padding: 50px 0;
            }

            .container-main {
                padding: 0 20px;
            }

            .issue-block {
                padding: 20px;
            }

            .invitation-text {
                font-size: 14px;
            }
        }

        /* Extra Small Devices (Portrait Phones, less than 576px) */
        @media (max-width: 575.98px) {
            .header-logo img {
                height: 60px;
                width: 120px;
            }
            
            .header-title h1 {
                font-size: 24px;
                letter-spacing: 0.5px;
            }
            
            .header-issn span {
                font-size: 14px;
            }

            #heroCarousel img {
                height: 45vh;
                min-height: 300px;
            }

            .hero-text-overlay {
                padding: 12px;
            }

            .hero-title {
                font-size: 24px;
            }
            
            .hero-subtitle {
                font-size: 14px;
            }
            
            .hero-desc {
                font-size: 13px;
            }

            .hero-buttons {
                flex-direction: column;
                width: 100%;
            }

            .hero-buttons .btn {
                width: 100%;
                margin-bottom: 8px;
            }

            .section-heading {
                font-size: 1.5rem;
            }

            .section-padding {
                padding: 40px 0;
            }

            .container-main {
                padding: 0 15px;
            }

            .navbar-custom .nav-link {
                font-size: 12px;
                padding: 8px !important;
            }

            .issue-block h4 {
                font-size: 1.1rem;
            }

            .invitation-text {
                font-size: 12px;
            }

            footer .col-lg-4,
            footer .col-lg-2,
            footer .col-lg-3 {
                margin-bottom: 30px;
            }
        }

        /* Very Small Devices (less than 400px) */
        @media (max-width: 399.98px) {
            .header-title h1 {
                font-size: 20px;
            }
            
            .hero-title {
                font-size: 20px;
            }
            
            .hero-subtitle {
                font-size: 13px;
            }
            
            .section-heading {
                font-size: 1.3rem;
            }
        }

        /* Carousel Indicators for Mobile */
        .carousel-indicators {
            margin-bottom: 1rem;
        }

        .carousel-indicators button {
            width: 10px;
            height: 10px;
            border-radius: 50%;
            background-color: rgba(255,255,255,0.5);
            border: 2px solid rgba(255,255,255,0.8);
        }

        .carousel-indicators button.active {
            background-color: var(--gold);
            border-color: var(--gold);
        }

        /* Smooth Scrolling */
        html {
            scroll-behavior: smooth;
        }

        /* Image Responsiveness */
        img {
            max-width: 100%;
            height: auto;
        }

        @keyframes scroll-left {
            0% { transform: translateX(0); }
            100% { transform: translateX(-100%); }
        }

        /* Utility Classes */
        .text-responsive {
            font-size: clamp(14px, 2vw, 18px);
            text-align: justify;
            line-height: 1.6; 
        }

        .heading-responsive {
            font-size: clamp(1.5rem, 4vw, 2.5rem);
        }
    </style>
</head>
<body>

<%
    String username = (String) session.getAttribute("username");
    Boolean isLoggedIn = (Boolean) session.getAttribute("isLoggedIn");
%>

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


<nav class="navbar navbar-expand-lg navbar-dark sticky-top navbar-custom">

    <div class="container-fluid px-3 px-md-4 px-lg-5">

        <a class="navbar-brand d-lg-none" href="${pageContext.request.contextPath}/">
            <strong>IJIM</strong>
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navMain" aria-controls="navMain" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navMain">

            <ul class="navbar-nav mx-auto mb-2 mb-lg-0 text-center">
                <li class="nav-item">
                    <a class="nav-link ${page=='home'?'active':''}" href="${pageContext.request.contextPath}/">HOME</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link ${page=='about'?'active':''}" href="${pageContext.request.contextPath}/about">ABOUT US</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link ${page=='editorial'?'active':''}" href="${pageContext.request.contextPath}/editorial-board">EDITORIAL BOARD</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link ${page=='current'?'active':''}" href="${pageContext.request.contextPath}/current-issue">CURRENT ISSUE</a>
                </li>
                
                <li class="nav-item">
                    <a class="nav-link ${page=='archives'?'active':''}" href="${pageContext.request.contextPath}/archives">ARCHIVES</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link ${page=='submit'?'active':''}" href="${pageContext.request.contextPath}/login">SUBMIT ARTICLE</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link ${page=='guideline'?'active':''}" href="${pageContext.request.contextPath}/author-guideline">AUTHOR GUIDELINE</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link ${page=='contact'?'active':''}" href="${pageContext.request.contextPath}/contact">CONTACT</a>
                </li>
				
				<li class="nav-item">
					<a class="nav-link ${page=='policy'?'active':''}" href="${pageContext.request.contextPath}/policy">POLICY</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="https://www.vidyavishva.com/" target="_blank">VIDYAVISHVA</a>
				</li>
            </ul>

        </div>
    </div>
</nav>


<section id="heroCarousel" class="carousel slide position-relative" data-bs-ride="carousel" data-bs-interval="5000">

    <div class="hero-text-overlay">
        <h2 class="hero-title">${not empty pageContent['hero_title'] ? pageContent['hero_title'] : 'Welcome TO Nature Ayurved'}</h2>
        <h3 class="hero-subtitle d-none d-md-block">${not empty pageContent['hero_subtitle'] ? pageContent['hero_subtitle'] : 'INTERNATIONAL JOURNAL FOR EMPIRICAL RESEARCH IN AYURVEDA'}</h3>
        <h4 class="hero-subtitle d-md-none" style="font-size: 14px;">${not empty pageContent['hero_subtitle'] ? pageContent['hero_subtitle'] : 'INTERNATIONAL JOURNAL FOR EMPIRICAL RESEARCH IN AYURVEDA'}</h4>
        <p class="hero-desc">${not empty pageContent['hero_description'] ? pageContent['hero_description'] : 'To promote empirical research in Ayurveda e.g. Clinical trials, drug research.'}</p>

        <div class="hero-buttons">
            <a href="${pageContext.request.contextPath}/about" class="btn btn-cta">ABOUT US</a>
            <a href="${pageContext.request.contextPath}/contact" class="btn btn-cta-outline" style="border: 2px solid white; color: white;">GET IN TOUCH</a>
        </div>
    </div>

    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="${pageContext.request.contextPath}/images/Coverpage1.jpg" class="d-block w-100" alt="Ayurvedic Research">
        </div>

        <div class="carousel-item">
            <img src="https://images.stockcake.com/public/8/4/0/84033fb8-690b-4ae5-a1a6-7464577a4199_large/mystical-green-growth-stockcake.jpg" class="d-block w-100" alt="Ayurvedic Medicine">
        </div>

        <div class="carousel-item">
            <img src="https://modernayurvedaclinic.com/wp-content/uploads/2023/02/3030640.webp" class="d-block w-100" alt="Ayurvedic Practice">
        </div>
    </div>

    <button class="carousel-control-prev d-none d-md-flex" type="button" data-bs-target="#heroCarousel" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>

    <button class="carousel-control-next d-none d-md-flex" type="button" data-bs-target="#heroCarousel" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>

    <div class="carousel-indicators d-md-none position-absolute bottom-0 mb-3">
        <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
        <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
    </div>

</section>
<div class="invitation-section">
    <div class="invitation-text">
        <i class="fas fa-star me-2"></i> ${not empty pageContent['invitation_text'] ? pageContent['invitation_text'] : 'Article Invitation: Articles are invited for Jan – March 2025 issue | Submission Deadline: 15th March 2025'} <i class="fas fa-star ms-2"></i>
    </div>
</div>

<section class="about section-padding" style="background:white;">
        <div class="container-main">
            <div class="row">
                <div class="col-12">
                    <h2 class="section-heading text-center text-md-start" style="color: var(--rust); font-family: Georgia, serif; font-weight:700;">${not empty pageContent['welcome_title'] ? pageContent['welcome_title'] : 'Welcome To NATURE AYURVED'}</h2>
                </div>
            </div>
            
            <div class="row">
                <div class="col-12 col-lg-10 mx-auto">
                    <p class="text-responsive justified-text" style="line-height:1.7; margin-bottom:20px;">
                        ${not empty pageContent['welcome_content'] ? pageContent['welcome_content'] : 'an International Journal of Ayurved Science & Research dedicated to promoting authentic Ayurvedic wisdom, innovative research, clinical advancements, and integrative healthcare knowledge. Explore high-quality scholarly articles, reviews, case studies, and evidence-based insights shaping the future of Ayurveda.'}
                    </p>
     
                    <h4 style="color:var(--deep-green); margin-top:30px; margin-bottom:15px; font-size: clamp(1.2rem, 3vw, 1.5rem);">${not empty pageContent['arca_title'] ? pageContent['arca_title'] : 'About Vidyavishva Publications'}</h4>
                    <p class="text-responsive " style="line-height:1.7; margin-bottom:20px;">
                        ${not empty pageContent['arca_content_1'] ? pageContent['arca_content_1'] : 'Vidyavishva Publications is a dynamic and visionary publishing house dedicated to promoting excellence in education, research, and professional literature. With a strong commitment to quality, authenticity, and innovation, Vidyavishva Publications serves as a trusted platform for scholars, academicians, researchers, and authors seeking to share meaningful knowledge with the world. It focuses on publishing textbooks, reference books, edited volumes, journals, monographs, and scholarly resources across healthcare, Ayurveda, medical sciences, and allied disciplines. (vidyavishva.com).'}
                    </p>
     
                    <p class="text-responsive" style="line-height:1.7; margin-bottom:20px;">
                        ${not empty pageContent['arca_content_2'] ? pageContent['arca_content_2'] : 'Driven by the belief that knowledge becomes powerful when shared responsibly, Vidyavishva Publications bridges the gap between intellectual creators and learners. The organization emphasizes transparent publishing practices, ethical standards, peer review systems, and academic integrity to ensure every publication meets high scholarly benchmarks. It also supports emerging researchers and young authors by providing opportunities to transform their ideas into impactful publications. (vidyavishva.com).'}
                    </p>
     
                    <p class="text-responsive" style="line-height:1.7; margin-bottom:20px;">
                        ${not empty pageContent['arca_content_3'] ? pageContent['arca_content_3'] : 'Vidyavishva Publications is particularly recognized for its dedication to Indian knowledge systems, Ayurveda, and contemporary scientific education, while maintaining relevance to modern curricular and regulatory standards. With multilingual publishing support and a forward-looking vision, the organization aspires to create a global presence in academic publishing. Through its commitment to credibility, accessibility, and intellectual growth, Vidyavishva Publications continues to inspire a culture of learning and innovation for future generations. (vidyavishva.com).'}
                    </p>
     
                    <div class="text-center mt-4 mt-md-5">
                        <a href="${pageContext.request.contextPath}/about" class="btn btn-cta-outline" style="border:2px solid var(--deep-green); color:var(--deep-green); padding:10px 25px;">To know more about us click here <i class="fas fa-arrow-right ms-2"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </section>
 
<hr class="m-0">


<hr class="m-0">

<section class="current-issue section-padding" style="background:linear-gradient(rgba(122,75,58,0.9), rgba(122,75,58,0.9)), url('https://img.freepik.com/premium-photo/blurred-vintage-paper-texture-background_10307-1536.jpg'); background-size:cover; background-attachment: fixed; color:#fff;">
        <div class="container-main">
            <div class="row">
                <div class="col-12">
                    <h2 class="section-heading text-center text-md-start" style="color:white;">${not empty pageContent['current_issue_title'] ? pageContent['current_issue_title'] : 'Current Issue Highlights'}</h2>
                </div>
            </div>
            
            <div class="row">
                <div class="col-12 col-md-6 mb-3 mb-md-4">
                    <div class="issue-block h-100">
                        <h4 style="color:var(--gold); font-size: clamp(1.1rem, 2.5vw, 1.3rem);">${not empty pageContent['article_1_title'] ? pageContent['article_1_title'] : 'Udvartan with Kolkulathadi churna in management of Sthaulya: A case study'}</h4>
                        <p class="mb-0 mt-3"><strong>Author:</strong> ${not empty pageContent['article_1_author'] ? pageContent['article_1_author'] : 'Ajmera N.'}</p>
                    </div>
                </div>
 
                <div class="col-12 col-md-6 mb-3 mb-md-4">
                    <div class="issue-block h-100">
                        <h4 style="color:var(--gold); font-size: clamp(1.1rem, 2.5vw, 1.3rem);">${not empty pageContent['article_2_title'] ? pageContent['article_2_title'] : 'Pathogenesis of Mutraghata and Mutrashmari & its preventive Management'}</h4>
                        <p class="mb-0 mt-3"><strong>Author:</strong> ${not empty pageContent['article_2_author'] ? pageContent['article_2_author'] : 'Airi K.'}</p>
                    </div>
                </div>
            </div>
 
            <div class="row">
                <div class="col-12 text-center mt-4">
                    <a href="${pageContext.request.contextPath}/current-issue" class="btn btn-cta">Explore All Articles</a>
                </div>
            </div>
        </div>
    </section>
<hr class="m-0">

<section class="guidelines section-padding" style="background:white;">
        <div class="container-main">
            <div class="row">
                <div class="col-12">
                    <h2 class="section-heading text-center mb-4 mb-md-5" style="color:var(--deep-green); font-family: Georgia, serif; font-weight:700;">${not empty pageContent['guidelines_title'] ? pageContent['guidelines_title'] : 'Author Guidelines'}</h2>
                </div>
            </div>
            
            <div class="row">
                <div class="col-12 col-lg-10 mx-auto">
                    <div class="guideline-content text-center">
                        <p class="mb-4 text-responsive" style="line-height:1.8; color:var(--text);">
                            ${not empty pageContent['guidelines_content_1'] ? pageContent['guidelines_content_1'] : 'All submitted articles are read by the editorial staff. To save time for authors and peer-reviewers, only those papers that seem most likely to meet our editorial criteria are sent for double-blind review. The editors then make a decision based on the reviewers\' advice: Accept with or without editorial revisions or Reject.'}
                        </p>
                        
                        <p class="mb-4 text-responsive" style="line-height:1.8; color:var(--text);">
                            ${not empty pageContent['guidelines_content_2'] ? pageContent['guidelines_content_2'] : 'We therefore ask that reviewers should be willing to provide follow-up advice as requested. All manuscripts must follow our comprehensive formatting and submission guidelines to ensure smooth processing and timely review.'}
                        </p>
     
                        <div class="mt-4 mt-md-5">
                            <a href="${pageContext.request.contextPath}/author-guideline"
                               class="btn btn-cta"
                               style="background:var(--deep-green); color:white; padding:12px 35px; font-weight:600; border:none; border-radius:6px;">
                               For More Instructions Click Here <i class="fas fa-arrow-right ms-2"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
<hr class="m-0">


<footer class="bg-dark text-light pt-5 pb-3" style="background:var(--deep-green)!important;">
    <div class="container">

        <div class="row gy-4">

            <!-- Logo + About -->
            <div class="col-lg-4 col-md-6">
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

                <div class="mt-3">
                    <a href="#" class="text-light me-3"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" class="text-light me-3"><i class="fab fa-twitter"></i></a>
                    <a href="#" class="text-light"><i class="fab fa-linkedin-in"></i></a>
                </div>
            </div>

            <!-- Quick Links -->
            <div class="col-lg-2 col-md-6">
                <h6 class="fw-bold mb-3" style="color:var(--gold);">Quick Links</h6>
                <ul class="list-unstyled">
                    <li class="mb-2">
                        <a href="${pageContext.request.contextPath}/about" class="text-light text-decoration-none">About Us</a>
                    </li>
                    <li class="mb-2">
                        <a href="${pageContext.request.contextPath}/editorial-board" class="text-light text-decoration-none">Editorial Board</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/current-issue" class="text-light text-decoration-none">Current Issue</a>
                    </li>
                </ul>
            </div>

            <!-- Author Zone -->
            <div class="col-lg-3 col-md-6">
                <h6 class="fw-bold mb-3" style="color:var(--gold);">Author Zone</h6>
                <ul class="list-unstyled">
                    <li class="mb-2">
                        <a href="${pageContext.request.contextPath}/login" class="text-light text-decoration-none">Submit Article</a>
                    </li>
                    <li class="mb-2">
                        <a href="${pageContext.request.contextPath}/author-guideline" class="text-light text-decoration-none">Author Guideline</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/login" class="text-light text-decoration-none">Login / Register</a>
                    </li>
                </ul>
            </div>

            <!-- Contact -->
            <div class="col-lg-3 col-md-6">
                <h6 class="fw-bold mb-3" style="color:var(--gold);">Contact</h6>
                <ul class="list-unstyled small">
                    <li class="mb-2">
                        <i class="fas fa-envelope me-2"></i>
                        <a href="mailto:${not empty pageContent['footer_contact_email'] ? pageContent['footer_contact_email'] : 'editor@ayuscript.com'}" class="text-light text-decoration-none">
                            ${not empty pageContent['footer_contact_email'] ? pageContent['footer_contact_email'] : 'natureayurvedjournal@gmail.com'}
                        </a>
                    </li>
                    <li class="mb-2">
                        <i class="fas fa-globe me-2"></i>
                        <a href="http://${not empty pageContent['footer_contact_website'] ? pageContent['footer_contact_website'] : 'www.ayuscript.com'}/" class="text-light text-decoration-none">
                            ${not empty pageContent['footer_contact_website'] ? pageContent['footer_contact_website'] : 'natureayurved.com'}
                        </a>
                    </li>
                    <li>
                        <i class="fas fa-barcode me-2"></i> ISSN: ${not empty pageContent['footer_contact_issn'] ? pageContent['footer_contact_issn'] : '0000-0000'}
                    </li>
                </ul>
            </div>

        </div>

        <!-- Bottom -->
        <hr class="border-light mt-4">

        <div class="text-center small">
            ${not empty pageContent['footer_copyright'] ? pageContent['footer_copyright'] : '© 2025 NATURE AYURVED | All Rights Reserved'} |
            <a href="#" class="text-light text-decoration-none">Privacy Policy</a>
        </div>

    </div>
</footer>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>