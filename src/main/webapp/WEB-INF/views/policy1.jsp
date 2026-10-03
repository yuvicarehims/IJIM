<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Policy</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap + Font Awesome -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"
	rel="stylesheet">

<style>
:root {
	--deep-green: rgb(30, 140, 193);
	--leaf: #2b8a5f;
	--rust: #7a4b3a;
	--gold: #c9a25a;
	--cream: #fbf6ee;
	--paper: #f7efe6;
	--text: #2d2d2d;
	--shadow: 0 10px 30px rgba(11, 74, 57, 0.06);
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
	text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
}

/* ===== Navbar ===== */
.topbar {
	background-color: var(--deep-green);
	padding: 6px 0 !important; /* Smaller height */
	z-index: 1020;
}

/* MENU ITEMS */
.topbar .navbar-nav {
	display: flex;
	align-items: center;
	gap: 10px !important; /* 🔥 Reduce space between menu names */
	margin-right: auto !important;
	flex-wrap: nowrap;
	/* Prevent wrapping to keep all nav on single line */
}

/* MENU LINKS */
.topbar .nav-link {
	color: #fff !important;
	font-weight: 600;
	text-transform: uppercase;
	font-size: 14px;
	padding: 10px 12px !important;
	/* 🔥 Reduce padding so spacing decreases */
	position: relative;
	white-space: nowrap; /* Keep nav items on single line */
}

/* HOVER + ACTIVE */
.topbar .nav-link:hover, .topbar .nav-link.active {
	color: var(--gold) !important;
	background-color: rgba(255, 255, 255, 0.1);
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

.topbar .nav-link:hover::after, .topbar .nav-link.active::after {
	transform: translateX(-50%) scaleX(1);
}

/* BUTTONS ON RIGHT SIDE */
.nav-right {
	display: flex;
	align-items: center;
	gap: 10px !important; /* 🔥 reduce gap between Login & Register */
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
	border: 1px solid rgba(255, 255, 255, 0.3) !important;
	color: white !important;
	padding: 6px 10px;
}

.navbar-toggler:focus {
	box-shadow: 0 0 0 0.2rem rgba(255, 255, 255, 0.25);
}

.navbar-toggler-icon {
	background-image: none;
}

.navbar-toggler i {
	font-size: 1.2rem;
}

/* MOBILE FIX */
@media ( max-width : 991px) {
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
	background: linear-gradient(rgba(11, 86, 51, 0.7),
		rgba(43, 138, 95, 0.7)),
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
	text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
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
	background: linear-gradient(rgba(123, 75, 58, 0.85),
		rgba(123, 75, 58, 0.85)),
		url('https://img.freepik.com/premium-photo/blurred-vintage-paper-texture-background_10307-1536.jpg');
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
	padding: 25px 0 5px !important; /* very compact */
}

.justified-text {
	text-align: justify;
	line-height: 1.6; /* improves readability */
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
@media ( min-width : 1200px) {
	.container {
		max-width: 1140px;
	}
}

/* Large Devices (Desktops, 992px and up) */
@media ( max-width : 1199px) {
	.brand-header .brand-title {
		font-size: 42px;
	}
	.brand-header .issn-text {
		font-size: 20px;
	}
}

/* Medium Devices (Tablets, 768px and up) */
@media ( max-width : 991px) {
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
@media ( max-width : 767px) {
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
@media ( max-width : 575px) {
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
</style>
</head>
<body>

	<!-- 🌿 Brand Bar -->
	<header class="header-top">
		<div class="container-fluid">
			<div class="header-content">
				<div class="header-logo px-3 px-md-4 px-lg-5">
					<img
						src="${pageContext.request.contextPath}/images/Logo_1-removebg-preview.png"
						alt="AYUSCRIPT Logo" class="header-logo img-fluid">
				</div>

				<div class="header-title">
					<h1 class="heading-responsive">
						<img src="${pageContext.request.contextPath}/images/Logo_1-removebg-previewfooter.png"
							alt="AYUSCRIPT Logo" class="header-logo img-fluid">
					</h1>
				</div>

				<div class="header-issn px-3 px-md-4 px-lg-5">
					<span class="d-none d-md-inline">ISSN: 3139-8871</span> <span
						class="d-md-none">ISSN: 3139-8871</span>
				</div>
			</div>
		</div>
	</header>


	<!-- 🌿 Navbar -->
	<nav class="navbar navbar-expand-lg topbar sticky-top">
		<div class="container-fluid px-3 px-md-4 px-lg-5">
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navMain"
				aria-controls="navMain" aria-expanded="false"
				aria-label="Toggle navigation"
				style="border: 1px solid rgba(255, 255, 255, 0.3); color: white;">
				<i class="fas fa-bars"></i>
			</button>

			<!-- NAV MENU -->
			<div class="collapse navbar-collapse" id="navMain">
				<ul class="navbar-nav mx-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/">Home</a></li>
					<li class="nav-item"><a class="nav-link "
						href="${pageContext.request.contextPath}/about">About Us</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/editorial-board">Editorial
							Board</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/current-issue">Current
							Issue</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/archives">Archives</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/login">Submit Article</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/author-guideline">Author
							Guideline</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/contact">Contact</a></li>
					<%-- <li class="nav-item"><a class="nav-link active"
						href="${pageContext.request.contextPath}/policy">Policy</a></li>
					<li class="nav-item"><a class="nav-link"
						href="https://www.vidyavishva.com/" target="_blank">VIDYAVISHVA</a>
					</li> --%>
				</ul>
			</div>
		</div>
	</nav>

	${pageContent}
	<!-- ===== Footer ===== -->
	<footer class="footer"
		style="background:rgb(17, 23, 9); color: var(--cream); padding: 60px 0 25px;">
		<div class="container">

			<div class="row">

				<!-- LOGO AND ADDRESS -->
				<div class="col-12 col-md-6 col-lg-4 mb-4 mb-lg-0">
					<div class="footer-logo mb-3">
						<img
							src="${pageContext.request.contextPath}/images/Logo_1-removebg-preview.png"
							alt="logo" class="img-fluid mb-3"
							style="height: 80px; max-width: 180px;">
						<div
							style="font-size: 28px; font-family: Georgia, serif; color: var(--gold); font-weight: 700; margin-bottom: 10px;">
							Nature Ayurved</div>
						<div
							style="font-size: 11px; font-weight: 600; color: #d4a96a; text-transform: uppercase; margin-bottom: 20px;">
							International Journal of Ayurved Science And Research</div>
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
					<h5
						style="color: var(--gold); font-family: Georgia, serif; margin-bottom: 20px; font-size: 16px;">Quick
						Links</h5>
					<ul class="footer-links">
						<li><a href="${pageContext.request.contextPath}/about">About
								Us</a></li>
						<li><a
							href="${pageContext.request.contextPath}/editorial-board">Editorial
								Board</a></li>
						<li><a
							href="${pageContext.request.contextPath}/current-issue">Current
								Issue</a></li>
						<li><a href="${pageContext.request.contextPath}/archives">Archives</a></li>
					</ul>
				</div>

				<!-- Author Zone -->
				<div class="col-lg-2 mb-4">
					<h5
						style="color: var(--gold); font-family: Georgia, serif; margin-bottom: 20px; font-size: 16px;">Author
						Zone</h5>
					<ul class="footer-links">
						<li><a
							href="${pageContext.request.contextPath}/submit-article">Submit
								Article</a></li>
						<li><a
							href="${pageContext.request.contextPath}/author-guideline">Author
								Guideline</a></li>
						<li><a href="${pageContext.request.contextPath}/login">Login
								/ Register</a></li>
					</ul>
				</div>

				<!-- Contact -->
				<div class="col-lg-4 mb-4">
					<h5
						style="color: var(--gold); font-family: Georgia, serif; margin-bottom: 20px; font-size: 16px;">Contact</h5>
					<ul class="footer-links">
						<li><i class="fa fa-envelope me-2"></i>
							natureayurvedjournal@gmail.com</li>
						<li><i class="fa fa-globe me-2"></i> natureayurved.com</li>
						<li><i class="fa fa-barcode me-2"></i> ISSN: 0000-0000</li>
					</ul>
				</div>

			</div>

			<div class="footer-bottom mt-4 pt-3"
				style="border-top: 1px solid rgba(255, 255, 255, 0.15); text-align: center;">
				<p class="mb-0" style="font-size: 14px;">Copyright © 2026 NATURE
					AYURVED All Rights Reserved.</p>
			</div>

		</div>
	</footer>

	<!-- 🌿 Scripts -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>