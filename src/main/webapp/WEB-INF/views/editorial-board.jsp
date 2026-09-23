<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="en">

<head>

 <meta charset="UTF-8">

 <title>NATURE AYURVED | Editorial Board</title>

 <meta name="viewport" content="width=device-width, initial-scale=1">
 
 <!-- Bootstrap + Font Awesome -->

 <!-- Bootstrap CSS (LOCAL FILE) -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Font Awesome CDN (OK to keep CDN) -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">


 <style>

 :root {

 --deep-green:rgb(30, 140, 193);

 --leaf:#2b8a5f;

 --rust:#7a4b3a;

 --gold:#c9a25a;

 --cream:#fbf6ee;

 --paper:#f7efe6;

 --text:#2d2d2d;

 --shadow: 0 10px 30px rgba(11,74,57,0.06);

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
   font-family: 'Segoe UI', sans-serif;
   color: var(--text);
   margin: 0;
   padding: 0;
 }



 /* ===== Top Header (White) ===== */

 .brand-bar {

 background-color: white;

 color: var(--text);

 padding: 15px 0;

 box-shadow: var(--shadow);

 }

 .logo-text {

 font-size: 34px;

 font-weight: 700;

 color: var(--rust);

 font-family: Georgia, serif;

 }

 .brand-bar .fw-bold {

 color: var(--deep-green);

 }




 /* Login & Register Button Styling */
.auth-buttons .btn {
    display: flex;
    align-items: center;
    gap: 8px;               /* space between icon and text */
    padding: 8px 18px;      /* button height and width */
    font-size: 16px;
    font-weight: 600;
    border-radius: 8px;
    text-decoration: none;
    transition: 0.3s ease;
}

/* LOGIN BUTTON – White border (transparent background) */
.login-btn {
    border: 2px solid #fff;
    color: #fff !important;
    background: transparent;
}

.login-btn:hover {
    background: rgba(255,255,255,0.1);
}

/* REGISTER BUTTON – White background + black text */
.register-btn {
    background: #fff;
    color: #000 !important;
    border: 2px solid #fff;
}

.register-btn:hover {
    background: #f1f1f1;
}



  /* nav bar */
        /* NAVBAR MAIN */
  /* NAVBAR FIX — FINAL WORKING VERSION */
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


 /* ===== Banner ===== */
 .inner-banner {
     position: relative;
     background: linear-gradient(rgba(11,86,51,0.6), rgba(11,86,51,0.6)),
                 url('https://seeevernaturals.com/wp-content/uploads/2022/05/Natural-Ayurvedic-min.jpg') 
                 center/cover no-repeat;
     text-align: center;
     color: white;
     padding: 100px 0;
 }
 
 .inner-banner h1 {
     position: relative;
     z-index: 2;
     font-family: 'Georgia', serif;
     font-size: 42px;
     letter-spacing: 1.5px;
     color: var(--gold);
     text-shadow: 2px 2px 4px rgba(0,0,0,0.4);
 }



 /* ===== Section Titles ===== */

 .section-title {

 text-align: center;

 color: var(--deep-green);

 font-family: 'Georgia', serif;

 margin-top: 50px;

 margin-bottom: 30px;

 font-weight: bold;

 }



 /* ===== Team Card ===== */

 .team-card {

 background-color: white;

 border-radius: 10px;

 box-shadow: var(--shadow);

 padding: 20px;

 text-align: center;

 transition: transform 0.3s;

 }

 .team-card:hover {

 transform: translateY(-5px);

 }

 .team-card img {

 width: 220px;

 height: 220px;

 border-radius: 8px;

 object-fit: cover;

 }
 
 .team-card {
    margin-bottom: 40px;  /* fixed clean space below card */
}

.team-card p:last-child {
    margin-bottom: 20px !important;
}
.editor-section {
    margin-top: 40px !important;
}

 

 .team-card h5 {

 margin-top: 15px;

 color: var(--deep-green);

 font-weight: 700;

 }

 .team-card p {

 font-size: 14px;

 margin-bottom: 5px;

 }



 /* ===== Horizontal Cards ===== */
 .horizontal-card {
     border: 1px solid #ddd;
     border-radius: 10px;
     background-color: white;
     padding: 20px;
     margin-bottom: 20px;
     display: flex;
     align-items: center;
     gap: 20px;
     box-shadow: var(--shadow);
 }
 
 .horizontal-card img {
     width: 160px;
     height: 160px;
     border-radius: 8px;
     object-fit: cover;
     flex-shrink: 0;
 }
 
 .horizontal-card h5 {
     color: var(--deep-green);
     font-weight: 700;
 }
 
 .horizontal-card > div {
     flex: 1;
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




 /* ===== Scroll Top ===== */

 .scroll-top {
     position: fixed;
     bottom: 20px;
     right: 20px;
     background-color: var(--deep-green);
     border: none;
     color: white;
     border-radius: 50%;
     padding: 10px 12px;
     box-shadow: 0 4px 8px rgba(0,0,0,0.2);
     z-index: 1000;
     cursor: pointer;
     transition: all 0.3s ease;
 }
 
 .scroll-top:hover {
     background-color: var(--leaf);
     transform: translateY(-3px);
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
     .inner-banner {
         padding: 60px 0;
     }
     .inner-banner h1 {
         font-size: 36px;
     }
     .section-title {
         font-size: 28px;
         margin-top: 30px;
         margin-bottom: 20px;
     }
     .team-card {
         margin-bottom: 30px;
     }
     .team-card img {
         width: 180px;
         height: 180px;
     }
     .horizontal-card {
         flex-direction: column;
         text-align: center;
     }
     .horizontal-card img {
         width: 140px;
         height: 140px;
         margin: 0 auto;
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
     .inner-banner {
         padding: 50px 0;
     }
     .inner-banner h1 {
         font-size: 28px;
         letter-spacing: 1px;
     }
     .section-title {
         font-size: 24px;
         margin-top: 25px;
         margin-bottom: 15px;
     }
     .team-card {
         padding: 15px;
         margin-bottom: 25px;
     }
     .team-card img {
         width: 150px;
         height: 150px;
     }
     .team-card h5 {
         font-size: 18px;
         margin-top: 12px;
     }
     .team-card p {
         font-size: 13px;
     }
     .horizontal-card {
         padding: 15px;
         gap: 15px;
     }
     .horizontal-card img {
         width: 120px;
         height: 120px;
     }
     .horizontal-card h5 {
         font-size: 18px;
     }
     .horizontal-card p {
         font-size: 13px;
     }
     .scroll-top {
         bottom: 15px;
         right: 15px;
         padding: 8px 10px;
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
     .inner-banner {
         padding: 40px 0;
     }
     .inner-banner h1 {
         font-size: 24px;
         letter-spacing: 0.5px;
     }
     .section-title {
         font-size: 20px;
         margin-top: 20px;
         margin-bottom: 15px;
     }
     .team-card {
         padding: 12px;
         margin-bottom: 20px;
     }
     .team-card img {
         width: 120px;
         height: 120px;
     }
     .team-card h5 {
         font-size: 16px;
         margin-top: 10px;
     }
     .team-card p {
         font-size: 12px;
     }
     .horizontal-card {
         padding: 12px;
         gap: 12px;
     }
     .horizontal-card img {
         width: 100px;
         height: 100px;
     }
     .horizontal-card h5 {
         font-size: 16px;
     }
     .horizontal-card p {
         font-size: 12px;
     }
     .topbar .nav-link {
         padding: 6px 10px !important;
         font-size: 11px;
     }
     .scroll-top {
         bottom: 10px;
         right: 10px;
         padding: 6px 8px;
         font-size: 14px;
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



<!-- ===== Header (White) ===== -->
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


<!-- ===== Navbar (Green Only) ===== -->
<nav class="navbar navbar-expand-lg topbar sticky-top">
    <div class="container-fluid px-3 px-md-4 px-lg-5">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navMain" 
                aria-controls="navMain" aria-expanded="false" aria-label="Toggle navigation">
            <i class="fas fa-bars"></i>
        </button>

        <!-- NAV MENU -->
        <div class="collapse navbar-collapse" id="navMain">
            <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/about">About Us</a></li>
                <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/editorial-board">Editorial Board</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/current-issue">Current Issue</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/archives">Archives</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/login">Submit Article</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/author-guideline">Author Guideline</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/contact">Contact</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/policy">Policy</a></li>
				<li class="nav-item">
					<a class="nav-link" href="https://www.vidyavishva.com/" target="_blank">VIDYAVISHVA</a>
				</li>
            </ul>
        </div>
    </div>
</nav>


<!-- ===== Banner ===== -->

<section class="inner-banner">

 <h1>${pageContent['banner_title'] != null ? pageContent['banner_title'] : 'EDITORIAL BOARD'}</h1>

</section>



<!-- ===== Become Author Button ===== -->
<div class="container">
    <div class="row">
        <div class="col-12 text-center text-md-end p-3">
            <a href="${pageContext.request.contextPath}/authorLogin" class="btn btn-outline-success fw-bold">
                <i class="fa fa-arrow-circle-right"></i> Become an Author
            </a>
        </div>
    </div>
</div>



<!-- ===== Meet Our Team ===== -->

<section class="container">

 <h2 class="section-title">${pageContent['meet_team_title'] != null ? pageContent['meet_team_title'] : 'Meet Our Team'}</h2>

 <div class="row justify-content-center">

 <div class="col-md-4">
 
 
 <div class="team-card">

<img src="${pageContext.request.contextPath}${pageContentWithImages['executive_editor_1_image_image_path'] != null ? pageContentWithImages['executive_editor_1_image_image_path'] : '/images/image2.jpg'}" alt="Executive Editor Photo">

 <h5>${pageContent['executive_editor_1_name'] != null ? pageContent['executive_editor_1_name'] : 'DR CHETHAN M. GULHANE'}</h5>

 <p><b>${pageContent['executive_editor_1_designation'] != null ? pageContent['executive_editor_1_designation'] : 'EDITOR IN CHIEF'}</b></p>

 <p>${pageContent['executive_editor_1_qualifications'] != null ? pageContent['executive_editor_1_qualifications'] : 'M.D. PhD (Panchakarma), Associate Professor Panchakarma NCT Ayurved College Amreli.'}</p>

 <P>${pageContent['executive_editor_1_email'] != null ? pageContent['executive_editor_1_email'] : 'drchetanayu@gmail.com'}</p>

 </div>
 

 
 </div>

 </div>

</section>



<!-- Executive Editors -->

<section class="container editor-section">

 <div class="row text-center justify-content-center">

 <div class="col-md-4">

 <div class="team-card">

 <img src="${pageContext.request.contextPath}${pageContentWithImages['executive_editor_2_image_image_path'] != null ? pageContentWithImages['executive_editor_2_image_image_path'] : '/images/image3.jpg'}" alt="Executive Editor Photo">

 <h5>${pageContent['executive_editor_2_name'] != null ? pageContent['executive_editor_2_name'] : 'DR. SUNDARSINGH DANGA'}</h5>

 <p><b>${pageContent['executive_editor_2_designation'] != null ? pageContent['executive_editor_2_designation'] : 'EXECUTIVE EDITOR'}</b></p>

 <p> ${pageContent['executive_editor_2_qualifications'] != null ? pageContent['executive_editor_2_qualifications'] : 'M.D. (Kayachikitsa), MPH,PDCR (Clinical Research),PGDMLS, MCRI, MIPHA, MEFI.Director ARCA, Nagpur.'}</p>

 <p>${pageContent['executive_editor_2_email'] != null ? pageContent['executive_editor_2_email'] : 'sunder147@gmail.com'}</p>

 </div>

 </div>

 <div class="col-md-4">

 <div class="team-card">

 
  <img src="${pageContext.request.contextPath}${pageContentWithImages['editor_in_chief_image_image_path'] != null ? pageContentWithImages['editor_in_chief_image_image_path'] : '/images/image1.jpg'}"
                 

 alt="Editor Profile Photo">

 <h5>${pageContent['editor_in_chief_name'] != null ? pageContent['editor_in_chief_name'] : 'Dr. Vishnu Bawane'}</h5>

 <p><b>${pageContent['editor_in_chief_designation'] != null ? pageContent['editor_in_chief_designation'] : 'EXECUTIVE EDITOR'}</b></p>

 <p>${pageContent['editor_in_chief_qualifications'] != null ? pageContent['editor_in_chief_qualifications'] : 'M.D.(Prasutitantra-Striroga), Ph.D.(Sch), PGDCR, EMBA'}</p>

 <p>${pageContent['editor_in_chief_description'] != null ? pageContent['editor_in_chief_description'] : '(Healthcare & Clinical Research) Associate Professor, b.R. Harne Ayurvedic Medical College, Vangani, Thane. Ex Member - Maharashtra Council of Indian Medicine (MCIM).'}

<p>${pageContent['editor_in_chief_email'] != null ? pageContent['editor_in_chief_email'] : 'drvcbawane@gmail.com'}</p>

 </div>
 

 </div>

 </div>

</section>



<!-- Editorial Board International -->

<section class="container editor-section">

 <h2 class="section-title">${pageContent['editorial_board_international_title'] != null ? pageContent['editorial_board_international_title'] : 'EDITORIAL BOARD INTERNATIONAL'}</h2>

 <div class="horizontal-card">

 <img src="${pageContext.request.contextPath}${pageContentWithImages['editorial_board_international_image_image_path'] != null ? pageContentWithImages['editorial_board_international_image_image_path'] : '/images/angelica.jpg'}" alt="Editorial Board International Photo">

 <div>

 <h5>${pageContent['editorial_board_international_name'] != null ? pageContent['editorial_board_international_name'] : 'Prof. Dr. Shekhar Annambhotla'}</h5>
 
 <p>${pageContent['editorial_board_international_designation'] != null ? pageContent['editorial_board_international_designation'] : 'EDITORIAL BOARD INTERNATIONAL'}</p>

 <p> ${pageContent['editorial_board_international_qualifications'] != null ? pageContent['editorial_board_international_qualifications'] : 'BAMS MD(Ayu), President, AAPNA AAPNA - Association of Ayurvedic Professionals of North America, Inc. 567 Thomas Street, Suite 400 Coopersburg, PA 18036 United States of America'}</p>

 <a href="mailto:${pageContent['editorial_board_international_email'] != null ? pageContent['editorial_board_international_email'] : 'aapnahelp@gmail.com'}">${pageContent['editorial_board_international_email'] != null ? pageContent['editorial_board_international_email'] : 'aapnahelp@gmail.com'}</a>

 </div>

 </div>

</section>



<!-- Editorial Board National -->

<section class="container editor-section">

 <h2 class="section-title">${pageContent['editorial_board_national_title'] != null ? pageContent['editorial_board_national_title'] : 'EDITORIAL BOARD NATIONAL'}</h2>

 <div class="horizontal-card">

 <img src="${pageContext.request.contextPath}${pageContentWithImages['editorial_board_national_1_image_image_path'] != null ? pageContentWithImages['editorial_board_national_1_image_image_path'] : '/images/punam_suple.jpg'}" alt="Editorial Board National Photo">

 <div>

 <h5>${pageContent['editorial_board_national_1_name'] != null ? pageContent['editorial_board_national_1_name'] : 'Dr. Punam Suple'}</h5>
 
  <p>${pageContent['editorial_board_national_1_designation'] != null ? pageContent['editorial_board_national_1_designation'] : 'EDITORIAL BOARD NATIONAL'}</p>

 <p> ${pageContent['editorial_board_national_1_qualifications'] != null ? pageContent['editorial_board_national_1_qualifications'] : 'Professor, AYUSH Department, Maharashtra University of Health Sciences, Nashik. Mobile no. 93238 42361'}</p>

 <a href="mailto:${pageContent['editorial_board_national_1_email'] != null ? pageContent['editorial_board_national_1_email'] : 'ayush@muhs.ac.in'}">${pageContent['editorial_board_national_1_email'] != null ? pageContent['editorial_board_national_1_email'] : 'ayush@muhs.ac.in'}</a>

 </div>

 </div>
 
 <div class="horizontal-card">

 <img src="${pageContext.request.contextPath}${pageContentWithImages['editorial_board_national_2_image_image_path'] != null ? pageContentWithImages['editorial_board_national_2_image_image_path'] : (pageContent['editorial_board_national_2_image'] != null ? pageContent['editorial_board_national_2_image'] : '/images/image6.jpg')}" alt="Editorial Board National Photo">

 <div>

 <h5>${pageContent['editorial_board_national_2_name'] != null ? pageContent['editorial_board_national_2_name'] : 'Dr.Sheetal Asutkar'}</h5>
 
 <p>${pageContent['editorial_board_national_2_designation'] != null ? pageContent['editorial_board_national_2_designation'] : 'EDITORIAL BOARD NATIONAL'}</p>
 
 <p>${pageContent['editorial_board_national_2_qualifications'] != null ? pageContent['editorial_board_national_2_qualifications'] : 'M.S.,Ph.D. Head, Dept of Shalya tantra, Mahatma Gandhi Ayurveda College Hospital and Research Centre,Salod, Wardha Mobile no. 97668 11974'}</p>

 <a href="mailto:${pageContent['editorial_board_national_2_email'] != null ? pageContent['editorial_board_national_2_email'] : 'sheetal.gujjanwar@dmimsu.edu.in'}">${pageContent['editorial_board_national_2_email'] != null ? pageContent['editorial_board_national_2_email'] : 'sheetal.gujjanwar@dmimsu.edu.in'}</a>

 </div>

 </div>
 
 <div class="horizontal-card">

 <img src="${pageContext.request.contextPath}${pageContentWithImages['editorial_board_national_3_image_image_path'] != null ? pageContentWithImages['editorial_board_national_3_image_image_path'] : (pageContent['editorial_board_national_3_image'] != null ? pageContent['editorial_board_national_3_image'] : '/images/image7.jpg')}" alt="Editorial Board National Photo">

 <div>

 <h5>${pageContent['editorial_board_national_3_name'] != null ? pageContent['editorial_board_national_3_name'] : 'Karanam Lakshmi Sireesha'}</h5>
 
 <p>${pageContent['editorial_board_national_3_designation'] != null ? pageContent['editorial_board_national_3_designation'] : 'EDITORIAL BOARD NATIONAL'}</p>
 
 <p>${pageContent['editorial_board_national_3_qualifications'] != null ? pageContent['editorial_board_national_3_qualifications'] : 'B.A.M.S,M.S(Ayu),D.Y.Patil Deemed to be University School of Ayurveda & Hospital, Sector -7, Nerul, Maharashtra -4'}</p>
 <a href="mailto:${pageContent['editorial_board_national_3_email'] != null ? pageContent['editorial_board_national_3_email'] : 'karanam.sireesha@dypatil.edu'}">${pageContent['editorial_board_national_3_email'] != null ? pageContent['editorial_board_national_3_email'] : 'karanam.sireesha@dypatil.edu'}</a>

 </div>

 </div>
 
 <div class="horizontal-card">

<img src="${pageContext.request.contextPath}${pageContentWithImages['editorial_board_national_4_image_image_path'] != null ? pageContentWithImages['editorial_board_national_4_image_image_path'] : (pageContent['editorial_board_national_4_image'] != null ? pageContent['editorial_board_national_4_image'] : '/images/image8.jpg')}" alt="Editorial Board National Photo">

 <div>

 <h5>${pageContent['editorial_board_national_4_name'] != null ? pageContent['editorial_board_national_4_name'] : 'DR. SWAPNIL AUTI'}</h5>
 
 <p>${pageContent['editorial_board_national_4_designation'] != null ? pageContent['editorial_board_national_4_designation'] : 'EDITORIAL BOARD NATIONAL'}</p>
 
 <p> ${pageContent['editorial_board_national_4_qualifications'] != null ? pageContent['editorial_board_national_4_qualifications'] : 'M.D. Ph.D.,(Ayu) PGDYN, Asso. Prof. Department of Panchakarma, Faculty of Indian Medical System, SGT University, Gurugram.'}</p>
 <a href="mailto:${pageContent['editorial_board_national_4_email'] != null ? pageContent['editorial_board_national_4_email'] : 'swapnil_fims@sgtuniversity.org'}">${pageContent['editorial_board_national_4_email'] != null ? pageContent['editorial_board_national_4_email'] : 'swapnil_fims@sgtuniversity.org'}</a>

 </div>

 </div>
 
 <div class="horizontal-card">

 <img src="${pageContext.request.contextPath}${pageContentWithImages['editorial_board_national_5_image_image_path'] != null ? pageContentWithImages['editorial_board_national_5_image_image_path'] : (pageContent['editorial_board_national_5_image'] != null ? pageContent['editorial_board_national_5_image'] : '/images/image9.jpg')}" alt="Editorial Board National Photo">

 <div>

 <h5>${pageContent['editorial_board_national_5_name'] != null ? pageContent['editorial_board_national_5_name'] : 'DR. DHIRAJSINGH RAJPUT'}</h5>
 
 <p>${pageContent['editorial_board_national_5_designation'] != null ? pageContent['editorial_board_national_5_designation'] : 'EDITORIAL BOARD NATIONAL'}</p>
 
 <p>${pageContent['editorial_board_national_5_qualifications'] != null ? pageContent['editorial_board_national_5_qualifications'] : 'M.D. Ph.D. (Ras shastra Bhaishyajyakalpna), Asso. Prof. Department of Rasashastra, Mahatma Gandhi Ayurved Medical College Hospital, Wardha, Maharashtra'}</p>
 <a href="mailto:${pageContent['editorial_board_national_5_email'] != null ? pageContent['editorial_board_national_5_email'] : 'dhiraj.rajput@ccras.nic.in'}">${pageContent['editorial_board_national_5_email'] != null ? pageContent['editorial_board_national_5_email'] : 'dhiraj.rajput@ccras.nic.in'}</a>

 </div>

 </div>
 
 
 

</section>



<!-- Associate Editor International -->

<section class="container editor-section">

 <h2 class="section-title">${pageContent['associate_editor_international_title'] != null ? pageContent['associate_editor_international_title'] : 'ASSOCIATE EDITOR INTERNATIONAL'}</h2>

 <div class="horizontal-card">

 <img src="${pageContext.request.contextPath}${pageContentWithImages['associate_editor_international_image_image_path'] != null ? pageContentWithImages['associate_editor_international_image_image_path'] : (pageContent['associate_editor_international_image'] != null ? pageContent['associate_editor_international_image'] : '/images/image10.jpg')}" alt="Associate Editor International Photo">

 <div>

 <h5>${pageContent['associate_editor_international_name'] != null ? pageContent['associate_editor_international_name'] : 'Dr. Prashant Prakash Shivgunde'}</h5>
 
  <p>${pageContent['associate_editor_international_designation'] != null ? pageContent['associate_editor_international_designation'] : 'ASSOCIATE EDITORIAL NATIONAL'}</p>

 <p>${pageContent['associate_editor_international_qualifications'] != null ? pageContent['associate_editor_international_qualifications'] : 'Assistant Professor, URD, MUHS, Nashik'}</p>

 <a href="mailto:${pageContent['associate_editor_international_email'] != null ? pageContent['associate_editor_international_email'] : 'urd@muhs.ac.in'}">${pageContent['associate_editor_international_email'] != null ? pageContent['associate_editor_international_email'] : 'urd@muhs.ac.in'}</a>

 </div>

 </div>

</section>



<!-- Associate Editors -->

<section class="container editor-section">

 <h2 class="section-title">${pageContent['associate_editors_title'] != null ? pageContent['associate_editors_title'] : 'ASSOCIATE EDITORS'}</h2>

 <div class="horizontal-card">

  <img src="${pageContext.request.contextPath}${pageContentWithImages['associate_editor_image_image_path'] != null ? pageContentWithImages['associate_editor_image_image_path'] : (pageContent['associate_editor_image'] != null ? pageContent['associate_editor_image'] : '/images/image11.jpg')}" alt="Associate Editor Photo">

 <div>

 <h5>${pageContent['associate_editor_name'] != null ? pageContent['associate_editor_name'] : 'Dr. Snehal Rathod'}</h5>

<p>${pageContent['associate_editor_designation'] != null ? pageContent['associate_editor_designation'] : 'ASSOCIATE EDITORS'}</p>
 <p>${pageContent['associate_editor_qualifications'] != null ? pageContent['associate_editor_qualifications'] : 'Professor, Dept of Prasutitantra-Striroga, Ayurved Mahavidyalya, Pusad'}</p>

 <a href="mailto:${pageContent['associate_editor_email'] != null ? pageContent['associate_editor_email'] : 'drsnehalrathod@gmail.com'}">${pageContent['associate_editor_email'] != null ? pageContent['associate_editor_email'] : 'drsnehalrathod@gmail.com'}</a>

 </div>

 </div>

</section>





<!-- ===== Footer ===== -->

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
				<%-- <p class="mb-2" style="font-size:14px; line-height:1.5;">
				                  ${not empty pageContent['footer_address'] ? pageContent['footer_address'] : 'G1, Green park 6B, shanti park, Mira road E. 401107'}
				              </p>
				              <p class="mb-2" style="font-size:14px;">Email: ${not empty pageContent['footer_email'] ? pageContent['footer_email'] : 'natureayurvedjournal@gmail.com'}</p>
				              <p class="mb-2" style="font-size:14px;">Mobile: ${not empty pageContent['footer_mobile'] ? pageContent['footer_mobile'] : '7710880622'}</p>
				              <p class="mb-2 mt-3" style="font-size:14px;">Editor-in-Chief ${not empty pageContent['footer_editor_name'] ? pageContent['footer_editor_name'] : 'Dr.Chetan Madhukar Gulhane'}</p>
				              <p class="mb-2" style="font-size:14px;">Email: ${not empty pageContent['footer_editor_email'] ? pageContent['footer_editor_email'] : 'natureayurvedjournal@gmail.com'}</p>
				              <p class="mb-2" style="font-size:14px;">Mobile: ${not empty pageContent['footer_mobile'] ? pageContent['footer_mobile'] : '8767571175'}</p>
 --%>           
 
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
                    <li><i class="fa fa-envelope me-2"></i> natureayurvedjournal@gmail.com</li>
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


<button class="scroll-top" onclick="window.scrollTo({top:0, behavior:'smooth'})">

 <i class="fa fa-angle-up"></i>

</button>


<!-- Bootstrap JS (LOCAL FILE) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>



</body>

</html>