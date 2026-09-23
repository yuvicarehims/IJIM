<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>NATURE AYURVED : Contact Us</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

    <style>
        /* ================= GREEN THEME ================= */

        :root {
            --primary-green:#064425;
            --secondary-green:#0b5633;
            --leaf-green:#2b8a5f;
            --accent-green:#9bd4b0;
            --cream:#fbf6ee;
            --paper:#f7efe6;
            --text:#ffffff; /* ALL TEXT WHITE */
            --gold: #c9a25a; /* Added missing gold variable */
            --deep-green: rgb(30, 140, 193); /* Added missing deep-green for footer */
        }

        * {
            box-sizing: border-box;
        }

        html, body {
            overflow-x: hidden;
            max-width: 100%;
        }

        body {
            background-color: var(--cream);
            color: var(--text);
            font-family:'Segoe UI',Arial,sans-serif;
            margin: 0;
            padding: 0;
        }

        /* HEADER */
        .brand-bar {
            background: var(--paper);
            border-bottom: 3px solid var(--primary-green);
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        }
        .logo-text { 
            color: var(--primary-green); 
            font-family: Georgia, serif;
            font-weight: 800;
            font-size: 35px !important;   /* Increased Size */
            letter-spacing: 2px;          /* Optional – cleaner look */
        }

        /* ⭐ NAVBAR CUSTOM STYLES (To match index page exactly) ⭐ */
        .navbar-custom {
            background:rgb(30, 140, 193);
            /* Match the original padding of 15px top/bottom, overridden by link padding */
            padding-top: 6px !important;
            padding-bottom: 6px !important;
            font-size:18px;
        }

        .navbar-custom .navbar-nav {
            /* Control spacing between links */
            gap: 10px;
            flex-wrap: nowrap;  /* Prevent wrapping to keep all nav on single line */
        }

        .navbar-custom .nav-link {
            color: #fff !important;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 14px; /* Exact size from index page */
            padding: 10px 12px !important; /* Exact padding from index page */
            position: relative;
            transition: all 0.3s ease;
            white-space: nowrap;  /* Keep nav items on single line */
        }

        .navbar-custom .nav-link:hover, 
        .navbar-custom .nav-link.active {
            color: var(--gold) !important;
            background-color: rgba(255,255,255,0.1); /* Hover background */
        }
        
        /* Underline/Active Indicator */
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

        /* Login/Register Buttons Styling to Match Index Page */
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
        /* ⭐ END NAVBAR CUSTOM STYLES ⭐ */


        /* HERO */
     .page-header {
            background: linear-gradient(rgba(6,68,37,0.45), rgba(6,68,37,0.45)),
                        url('${pageContext.request.contextPath}/images/contact1.png');
            background-size: cover;
            background-position: center;
            padding: 100px 0 60px;
            text-align: center;
        }

        .page-header h1 {
            color: #ffffff;
            font-family: Georgia, serif;
            font-weight: 800;
            font-size: 54px;
            letter-spacing: 2px;
        }


        /* BREADCRUMB */
        .breadcrumb-wrap {
            background:#fff;
            border-bottom:1px solid #ccc;
            padding:18px 0;
        }
        .breadcrumb a { color:#000; font-weight:700; }
        .breadcrumb span { color:#000; }

        /* CONTACT SECTION */
        .contact-section {
            padding:60px 0;
            background:#fff;
            color:#000;
        }
        .section-title {
            text-align:center;
            color:var(--primary-green);
            font-family:Georgia,serif;
            font-weight:700;
            margin-bottom:30px;
            padding-bottom:10px;
            position:relative;
        }
        .section-title::after {
            content:"";
            width:110px;
            height:4px;
            background:var(--accent-green);
            position:absolute;
            left:50%;
            bottom:-2px;
            transform:translateX(-50%);
        }

        /* CONTACT FORM */
        .contact-form {
            background:var(--paper);
            border-radius:10px;
            padding:30px;
            border-top:4px solid var(--secondary-green);
            color:#000;
        }
        .form-label { color:#000; font-weight:700; }
        .form-control {
            border:2px solid var(--accent-green);
            border-radius:30px;
            padding:14px;
            color:#000;
        }
        textarea.form-control {
            border-radius:14px;
            min-height:130px;
        }
        .submit-btn {
            background:var(--primary-green);
            color:white;
            border:none;
            padding:12px 40px;
            border-radius:30px;
            font-weight:700;
            font-size:16px;
        }

        /* RIGHT SIDE BOX */
        .pub-box {
            background:#f5faf5;
            border:1px solid var(--accent-green);
            border-radius:8px;
            padding:25px;
            color:#000;
        }

        /* MAP */
        .map-section {
            margin:0;
            padding:0;
            width:100%;
            margin-bottom:40px;
        }
        .map-frame {
            width:100%;
            height:530px;
            border:none;
            display:block;
        }

      /* ===== Footer ===== */
        .footer {
            background-color: var(--deep-green) !important;   /* Deep Green */
            color: var(--cream) !important;             /* Cream Text */
            padding: 45px 0 20px !important;
            width: 100% !important;
        }

        .footer-logo img {
            height: 80px;
        }

        .footer-title {
            font-family: Georgia, serif;
            font-size: 32px;
            font-weight: 700;
            color: var(--gold);
            margin-top: 10px;
        }

        .footer-info p {
            font-size: 14px;
            margin-bottom: 8px;
        }

        .footer-col h5 {
            color: var(--gold);
            font-family: Georgia, serif;
            font-size: 20px;
            margin-bottom: 18px;
        }

        .footer-col ul {
            list-style: none;
            padding-left: 0;
        }

        .footer-col ul li {
            margin-bottom: 10px;
            font-size: 15px;
        }

        .footer a {
            color: var(--cream) !important;
            text-decoration: none;
        }

        .footer a:hover {
            color: var(--gold) !important;
        }

        .social-icons i {
            color: white;
            margin-right: 12px;
            font-size: 18px;
        }

        .footer-bottom {
            border-top: 1px solid rgba(255,255,255,0.25);
            padding-top: 15px;
            font-size: 14px;
        }

        .footer-top {
            display: flex;
            align-items: flex-start;
        }

        /* Header Brand Bar Responsive */
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

        /* Enhanced Contact Form */
        .contact-form {
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .contact-form:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.12);
        }

        .form-control:focus {
            border-color: var(--secondary-green);
            box-shadow: 0 0 0 0.2rem rgba(11, 86, 51, 0.15);
        }

        .submit-btn {
            transition: all 0.3s ease;
        }

        .submit-btn:hover {
            background: var(--leaf-green);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(6, 68, 37, 0.3);
        }

        /* Enhanced Pub Box */
        .pub-box {
            box-shadow: 0 3px 15px rgba(0,0,0,0.08);
            transition: transform 0.3s ease;
        }

        .pub-box:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 20px rgba(0,0,0,0.12);
        }

        /* Scroll to Top Button */
        #scrollTopBtn {
            z-index: 1000;
            transition: all 0.3s ease;
        }

        #scrollTopBtn:hover {
            background: var(--secondary-green) !important;
            transform: translateY(-3px);
        }

        #scrollTopBtn i {
            transition: color 0.3s ease;
        }

        #scrollTopBtn:hover i {
            color: white !important;
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
            .page-header h1 {
                font-size: 48px;
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
                padding: 70px 0 50px;
            }
            .page-header h1 {
                font-size: 38px;
            }
            .contact-section {
                padding: 50px 0;
            }
            .section-title {
                font-size: 28px;
            }
            .contact-form {
                padding: 25px;
            }
            .pub-box {
                padding: 20px;
                margin-top: 20px;
            }
            .map-frame {
                height: 400px;
            }
            .navbar-custom .nav-link {
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
                padding: 50px 0 40px;
            }
            .page-header h1 {
                font-size: 32px;
            }
            .breadcrumb-wrap {
                padding: 12px 0;
            }
            .breadcrumb-wrap .d-flex {
                flex-direction: column;
                gap: 10px;
                align-items: flex-start !important;
            }
            .contact-section {
                padding: 40px 0;
            }
            .section-title {
                font-size: 24px;
                margin-bottom: 25px;
            }
            .contact-form {
                padding: 20px;
            }
            .contact-form h3 {
                font-size: 1.3rem;
                margin-bottom: 20px;
            }
            .form-label {
                font-size: 0.9rem;
            }
            .form-control {
                padding: 12px;
                font-size: 0.9rem;
            }
            .submit-btn {
                padding: 10px 35px;
                font-size: 15px;
                width: 100%;
                max-width: 200px;
            }
            .pub-box {
                padding: 18px;
                margin-top: 15px;
            }
            .pub-box h5 {
                font-size: 1.1rem;
            }
            .pub-box p {
                font-size: 0.9rem;
            }
            .map-section {
                margin-bottom: 30px;
            }
            .map-frame {
                height: 350px;
            }
            #scrollTopBtn {
                bottom: 20px;
                right: 20px;
                padding: 12px;
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
                padding: 40px 0 30px;
            }
            .page-header h1 {
                font-size: 26px;
            }
            .breadcrumb-wrap {
                padding: 10px 0;
            }
            .breadcrumb {
                font-size: 0.85rem;
            }
            .contact-section {
                padding: 30px 0;
            }
            .section-title {
                font-size: 20px;
                margin-bottom: 20px;
            }
            .contact-form {
                padding: 15px;
            }
            .contact-form h3 {
                font-size: 1.1rem;
                margin-bottom: 15px;
            }
            .form-label {
                font-size: 0.85rem;
            }
            .form-control {
                padding: 10px;
                font-size: 0.85rem;
            }
            textarea.form-control {
                min-height: 100px;
            }
            .submit-btn {
                padding: 10px 30px;
                font-size: 14px;
            }
            .pub-box {
                padding: 15px;
            }
            .pub-box h5 {
                font-size: 1rem;
            }
            .pub-box p {
                font-size: 0.85rem;
            }
            .map-frame {
                height: 300px;
            }
            #scrollTopBtn {
                bottom: 15px;
                right: 15px;
                padding: 10px;
            }
            #scrollTopBtn i {
                font-size: 16px;
            }
            .navbar-custom .nav-link {
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
	                <span class="d-none d-md-inline">ISSN: 2583-3677</span>
	                <span class="d-md-none">ISSN: 2583-3677</span>
	            </div>
	        </div>
	    </div>
	</header>


<nav class="navbar navbar-expand-lg navbar-dark sticky-top navbar-custom">
    <div class="container-fluid px-3 px-md-4 px-lg-5">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navMain" 
                aria-controls="navMain" aria-expanded="false" aria-label="Toggle navigation">
            <i class="fas fa-bars"></i>
        </button>

        <div class="collapse navbar-collapse" id="navMain">
            <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
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
                	<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/policy">Policy</a></li>
                	<li class="nav-item">
					<a class="nav-link" href="https://www.vidyavishva.com/" target="_blank">VIDYAVISHVA</a>
				</li>
            </ul>
        </div>
    </div>
</nav>


<section class="page-header">
    <h1>CONTACT US</h1>
</section>

<section class="breadcrumb-wrap">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-12 col-md-6 mb-2 mb-md-0">
                <div class="breadcrumb mb-0">
                    <a href="${pageContext.request.contextPath}/">Home</a> /
                    <span>Contact Us</span>
                </div>
            </div>
            <div class="col-12 col-md-6 text-md-end">
                <a href="${pageContext.request.contextPath}/submit-article" 
                   style="color:#000; font-weight:700; text-decoration:none;">
                    BECOME AN AUTHOR
                </a>
            </div>
        </div>
    </div>
</section>

<section class="contact-section">
    <div class="container">

        <h2 class="section-title">Get in touch with us.</h2>

        <div class="row g-4">

            <div class="col-lg-8">
                <div class="contact-form">
                    <h3 style="color:#000; margin-bottom:25px;">
                        <i class="fas fa-envelope me-2" style="color:var(--secondary-green);"></i>
                        Send us a Message
                    </h3>

                    <form action="contactCreate" method="post">
                        <div class="row g-3">

                            <div class="col-md-6">
                                <label class="form-label">
                                    <i class="fas fa-user me-2" style="color:var(--secondary-green);"></i>
                                    Enter Name
                                </label>
                                <input type="text" class="form-control" name="form_name" placeholder="Your full name" required>
                            </div>

                            <div class="col-md-6">
                                <label class="form-label">
                                    <i class="fas fa-envelope me-2" style="color:var(--secondary-green);"></i>
                                    Enter Email
                                </label>
                                <input type="email" class="form-control" name="form_email" placeholder="your.email@example.com" required>
                            </div>

                            <div class="col-md-6">
                                <label class="form-label">
                                    <i class="fas fa-phone me-2" style="color:var(--secondary-green);"></i>
                                    Enter Phone
                                </label>
                                <input type="text" class="form-control" name="form_phone" placeholder="Your phone number">
                            </div>

                            <div class="col-md-6">
                                <label class="form-label">
                                    <i class="fas fa-tag me-2" style="color:var(--secondary-green);"></i>
                                    Enter Subject
                                </label>
                                <input type="text" class="form-control" name="form_subject" placeholder="Subject of your message" required>
                            </div>

                            <div class="col-12">
                                <label class="form-label">
                                    <i class="fas fa-comment me-2" style="color:var(--secondary-green);"></i>
                                    Your Message
                                </label>
                                <textarea class="form-control" name="form_message" placeholder="Type your message here..." required></textarea>
                            </div>

                            <div class="col-12 text-center">
                                <button type="submit" class="submit-btn">
                                    <i class="fas fa-paper-plane me-2"></i>
                                    SEND MESSAGE
                                </button>
                            </div>

                        </div>
                    </form>
                </div>
            </div>

            <div class="col-lg-4">
                <div class="pub-box">
                    <h5 style="color:var(--secondary-green); margin-bottom:20px;">
                        <i class="fas fa-map-marker-alt me-2"></i>
                        Publications Address
                    </h5>
                    <p style="margin-bottom:20px;">
                        <strong><i class="fas fa-building me-2"></i>Publisher:</strong><br>
                        Vidyavishva Publications<br>
                        <i class="fas fa-home me-2"></i>G1, Green park 6B, shanti park, Mira
					road E. 401107<br>
                        <strong><i class="fas fa-envelope me-2"></i>Email:</strong> natureayurvedjournal@gmail.com<br>
                        <strong><i class="fas fa-phone me-2"></i>Mobile:</strong> 8767571175
                    </p>

                    <hr style="margin:20px 0; border-color:#ddd;">

                    <p style="margin-bottom:0;">
                        <strong><i class="fas fa-user-md me-2"></i>Editor-in-Chief:</strong><br>
                        DR CHETHAN M. GULHANE<br>
                        <i class="fas fa-envelope me-2"></i>Email: drchetanayu@gmail.com<br>
                        <i class="fas fa-phone me-2"></i>Mobile: 7710880622
                    </p>
                </div>
            </div>

        </div>
    </div>
</section>

<section class="map-section">
    <iframe class="map-frame"
            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3767.123456789012!2d73.12345678901234!3d19.123456789012345!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zMTnCsDA3JzI0LjQiTiA3M8KwMDcnMjQuNiJF!5e0!3m2!1sen!2sin!4v1234567890123"
            allowfullscreen loading="lazy"></iframe>
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
			<%-- 	<p class="mb-2" style="font-size:14px; line-height:1.5;">
					${not empty pageContent['footer_address'] ? pageContent['footer_address'] : 'G1, Green park 6B, shanti park, Mira
					road E. 401107'}
				</p>
				<p class="mb-2" style="font-size:14px;">Email: ${not empty pageContent['footer_email'] ? pageContent['footer_email'] :
					'natureayurvedjournal@gmail.com'}</p>
				<p class="mb-2" style="font-size:14px;">Mobile: ${not empty pageContent['footer_mobile'] ? pageContent['footer_mobile']
					: '7710880622'}</p>
				<p class="mb-2 mt-3" style="font-size:14px;">Editor-in-Chief ${not empty pageContent['footer_editor_name'] ?
					pageContent['footer_editor_name'] : 'Dr.Chetan Madhukar Gulhane'}</p>
				<p class="mb-2" style="font-size:14px;">Email: ${not empty pageContent['footer_editor_email'] ?
					pageContent['footer_editor_email'] : 'natureayurvedjournal@gmail.com'}</p>
				<p class="mb-2" style="font-size:14px;">Mobile: ${not empty pageContent['footer_mobile'] ? pageContent['footer_mobile']
					: '8767571175'}</p> --%>
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
                    <li><i class="fa fa-envelope me-2"></i>natureayurvedjournal@gmail.com</li>
                    <li><i class="fa fa-globe me-2"></i> natureayurved.com</li>
                    <li><i class="fa fa-barcode me-2"></i> ISSN: 0000-0000</li>
                </ul>
            </div>

        </div>

        <div class="footer-bottom mt-4 pt-3" style="border-top:1px solid rgba(255,255,255,0.15); text-align:center;">
            <p class="mb-0" style="font-size:14px;">
                Copyright © 2026 NATURE AYURVED All Rights Reserved.
            </p>
        </div>

    </div>
</footer>
<button id="scrollTopBtn" 
        style="position:fixed;bottom:30px;right:30px;background:#9bd4b0;padding:15px;border:none;border-radius:4px;cursor:pointer;display:none;">
    <i class="fa fa-arrow-up" style="color:#000; font-size:20px;"></i>
</button>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<script>
window.addEventListener("scroll",()=>{
    document.getElementById("scrollTopBtn").style.display=
        window.scrollY>300?"block":"none";
});
document.getElementById("scrollTopBtn").onclick=()=>{
    window.scrollTo({top:0,behavior:"smooth"});
};
</script>

</body>
</html>