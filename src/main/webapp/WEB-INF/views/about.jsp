<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>NATURE AYURVED | About Us</title>
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
	padding: 6px 0 !important;
	/* Smaller height */
	z-index: 1020;
}

/* MENU ITEMS */
.topbar .navbar-nav {
	display: flex;
	align-items: center;
	gap: 10px !important;
	/* 🔥 Reduce space between menu names */
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
	white-space: nowrap;
	/* Keep nav items on single line */
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
	gap: 10px !important;
	/* 🔥 reduce gap between Login & Register */
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
	padding: 25px 0 5px !important;
	/* very compact */
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

.justified-text {
	text-align: justify;
	line-height: 1.6; /* improves readability */
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
</style>
</head>
<script>
	function openPopup() {

		let text = document.getElementById("aboutContent").innerText;
		//let id = element.getAttribute("data-id");

		//document.getElementById("contentId").value = id;
		document.getElementById("popupTextarea").value = text;

		var modal = new bootstrap.Modal(document.getElementById('editModal'));

		modal.show();
	}

	function saveContent() {
		document.getElementById("aboutForm").submit();
	}
</script>
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
						<img src="${pageContext.request.contextPath}/images/nEWlOGO1.png"
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
					<li class="nav-item"><a class="nav-link active"
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
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/policy">Policy</a></li>
					<li class="nav-item"><a class="nav-link"
						href="https://www.vidyavishva.com/" target="_blank">VIDYAVISHVA</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- 🌿 Page Header -->
	<section class="page-header">
		<div class="container">
			<h1>${not empty pageContent['page_header_title'] ? pageContent['page_header_title'] : 'ABOUT US'}
			</h1>
			<nav aria-label="breadcrumb"></nav>
		</div>
	</section>

	<!-- 🌿 About Journal Section -->
	<section class="about-section">
		<div class="container">
			<div class="row align-items-center g-4">
				<div class="col-12 col-lg-6 order-2 order-lg-1">
					<h2>${not empty pageContent['about_title'] ? pageContent['about_title'] : 'ABOUT US'}</h2>
					<div id="aboutContent">
						<p class="justified-text">${not empty pageContent['about_content_1'] ? pageContent['about_content_1'] : 'Welcome
								to Nature Ayurved: International Journal of Ayurveda Science and Research, a premier
								platform dedicated to the advancement and dissemination of scientific knowledge in the
								field of Ayurveda.'}
						</p>
						<p class="justified-text">${not empty pageContent['about_content_2'] ? pageContent['about_content_2'] : 'Launched
								as a bimonthly, peer-reviewed, and indexed journal, Nature Ayurved focuses exclusively
								on publishing high-quality, original research work that bridges the gap between ancient
								Ayurvedic wisdom and contemporary scientific validation. We are proud to be published in
								partnership with Vidyavishva Publications, ensuring rigorous academic standards and a
								wide reach within the scholarly community.'}
						</p>
						<p class="justified-text">
							${not empty pageContent['about_content_3'] ? pageContent['about_content_3'] : 'We believe that knowledge should be barrier-free. 
								To support global education and research, the full text of our journal is accessible on our website at www.natureayurved.com.
								 Nature Ayurved operates under a strict Open Access model, allowing free, immediate access to all published contents. 
								 Furthermore, we actively encourage the dissemination of research by permitting authors to self-archive the final accepted 
								 version of their articles on any OAI-compliant institutional or subject-based repository.'}
							<i class="fa fa-pencil" data-id="${pageContent['id']}"
								style="cursor: pointer;" onclick="openPopup(this)"></i>
						</p>
					</div>
					<p>
						<b>ABOUT THE JOURNAL: </b><br> <b>JOURNAL PARTICULARS </b><br>

						Title : <b>Nature Ayurved: International Journal of Ayurved
							Science and Research </b><br> Frequency : Bio-monthly <br>
						ISSN : XXXX-XXXX <br> Publisher Name : Dr.Chetan Madhukar
						Gulhane <br> Publisher address : Flat no.301, Vinayak Vilas
						Apartment, Sanmarg nagar, Nagpur. <br> Starting Year : 2026 <br>

						Subject : Health Sciences <br> Subjects Language : English <br>

						Publication Format : Online <br> Email Id :
						vidyavishvapublications@gmail.com <br> Mobile No. :
						8767571175
					</p>
				</div>
				<div class="col-12 col-lg-6 order-1 order-lg-2">
					<img
						src="https://www.shutterstock.com/image-photo/natural-ingredients-cosmetic-medicine-assortment-600nw-2671103837.jpg"
						alt="Ayurvedic Herbs" class="img-fluid rounded shadow w-100">
				</div>
			</div>
		</div>
	</section>

	<!-- 🌿 Mission & Vision Section -->
	<section class="mission-vision">
		<div class="container">
			<div class="row">
				<div class="col-md-6 mb-4">
					<div class="mv-card">
						<i class="fas fa-bullseye"></i>
						<h3>${not empty pageContent['mission_title'] ? pageContent['mission_title'] : 'Our Aim'}
						</h3>
						<p class="justified-text">${not empty pageContent['mission_content'] ? pageContent['mission_content'] : 'The
									primary aims of Nature Ayurved are to:
									Promote Originality: Encourage and publish high-quality, original research, clinical
									trials, and systematic reviews in all disciplines of Ayurveda.
									Ensure Academic Rigor: Maintain the highest standards of scientific integrity
									through a rigorous, transparent, and timely double-blind peer-review process.
									Facilitate Global Access: Provide a completely free, open-access platform for
									researchers, academicians, students, and practitioners worldwide to read, download,
									and utilize published research.
									Empower Authors: Support researchers by allowing OAI-compliant self-archiving,
									maximizing the visibility and impact of their work.
									Bridge Traditions: Foster interdisciplinary research that connects Ayurvedic
									principles with modern medical sciences and technologies.'}
						</p>
					</div>
				</div>
				<div class="col-md-6 mb-4">
					<div class="mv-card">
						<i class="fas fa-eye"></i>
						<h3>${not empty pageContent['vision_title'] ? pageContent['vision_title'] : 'Our
									Vision'}</h3>
						<p class="justified-text">${not empty pageContent['vision_content'] ? pageContent['vision_content'] : 'To be a
									globally recognized, authoritative platform that elevates the scientific rigor of
									Ayurveda, fostering a future where traditional Indian medicine is seamlessly
									integrated with global healthcare through evidence-based research, innovation, and
									open knowledge sharing.'}
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- 🌿 History Timeline -->
	<section class="timeline-section">
		<div class="container">
			<h2 class="text-center mb-5"
				style="color: var(--deep-green); font-family: 'Georgia', serif;">${not
						empty pageContent['timeline_title'] ? pageContent['timeline_title'] : 'Scope of the Journal'}
			</h2>
			<p class="justified-text">${not empty pageContent['scope_journal_1'] ? pageContent['scope_journal_1'] : 'Nature Ayurved
						welcomes submissions
						that explore, validate, and innovate within the diverse branches of Ayurveda. The scope of the
						journal covers, but
						is not limited to, the following specialties:'}
			</p>
			<p class="justified-text">${not empty pageContent['scope_journal_2'] ? pageContent['scope_journal_2'] : '• Basic
						Principles: Samhita & Siddhanta (Fundamental Principles), Rachana Sharir (Anatomy), and Kriya
						Sharir (Physiology).'}
			</p>
			<p class="justified-text">${not empty pageContent['scope_journal_3'] ? pageContent['scope_journal_3'] : '• Pharmacology &
						Pharmaceutics: Dravyaguna (Materia Medica), Rasa Shastra & Bhaishajya Kalpana
						(Pharmaceuticals).'}
			</p>
			<p class="justified-text">${not empty pageContent['scope_journal_4'] ? pageContent['scope_journal_4'] : '• Clinical
						Specialties: Kayachikitsa (Internal Medicine), Panchakarma (Detoxification and
						Bio-purification), Shalya Tantra (Surgery), and Shalakya Tantra (ENT & Ophthalmology).'}
			</p>
			<p class="justified-text">${not empty pageContent['scope_journal_5'] ? pageContent['scope_journal_5'] : '• Preventive &
						Social Medicine and mental health: Swasthavritta (Preventive Medicine & Yoga) and Agad Tantra
						(Toxicology & Forensic Medicine).'}
			</p>
			<p class="justified-text">${not empty pageContent['scope_journal_6'] ? pageContent['scope_journal_6'] : '• Women & Child
						Health: Prasuti Tantra & Stri Roga (Obstetrics & Gynecology) and Kaumarbhritya (Pediatrics).'}
			</p>
			<p class="justified-text">${not empty pageContent['scope_journal_7'] ? pageContent['scope_journal_7'] : '•
						Interdisciplinary Research: Integration of Ayurveda with modern pharmacology, biotechnology,
						bioinformatics, and standardization of Ayurvedic drugs.'}
			</p>

			<br>
			<br>
			<h2 class="text-center mb-5"
				style="color: var(--deep-green); font-family: 'Georgia', serif;">${not
						empty pageContent['timeline_title1'] ? pageContent['timeline_title1'] : 'Disclaimer'}</h2>
			<p class="justified-text">${not empty pageContent['disclaimer'] ? pageContent['disclaimer'] : 'The views, opinions, and
						findings expressed in the articles published in Nature Ayurved: International Journal of
						Ayurveda Research are solely those of the individual authors and contributors. They do not
						necessarily reflect the official policy, views, or position of the journal, its Editorial Board,
						or our publication partner, Vidyavisha.
						While every effort is made to ensure the accuracy of the information published, the journal does
						not guarantee the efficacy or safety of the treatments, drugs, or therapies discussed. The
						content provided is for academic, educational, and informational purposes only and must not be
						construed as professional medical advice, diagnosis, or treatment. Readers and practitioners
						should always consult appropriate medical guidelines and professionals before applying any
						clinical data presented in the journal.
						'}
			</p>

			<br> <br>
			<h2 class="text-center mb-5"
				style="color: var(--deep-green); font-family: 'Georgia', serif;">${not
						empty
						pageContent['timeline_title2'] ? pageContent['timeline_title2'] : 'Journal Ethics'}</h2>
			<p class="justified-text">${not empty pageContent['ethics_journal_1'] ? pageContent['ethics_journal_1'] : 'Nature Ayurved
						is deeply committed
						to maintaining the highest standards of publication ethics and academic integrity. We adhere
						strictly to the
						guidelines set forth by international publication ethics committees to ensure a fair and
						transparent process.'}
			</p>

			<p class="justified-text">${not empty pageContent['ethics_journal_2'] ? pageContent['ethics_journal_2'] : '• Originality
						and Plagiarism: We
						maintain a zero-tolerance policy for plagiarism. All submitted manuscripts are screened using
						advanced
						plagiarism-detection software. Authors must ensure their work is entirely original and properly
						cites any referenced
						material.'}
			</p>
			<p class="justified-text">${not empty pageContent['ethics_journal_3'] ? pageContent['ethics_journal_3'] : '• Peer Review
						Integrity: All
						submissions undergo a strict double-blind peer-review process to ensure objective evaluation
						based solely on the
						manuscript\'s academic merit, relevance, and scientific soundness.'}
					</p>
					<p class="justified-text">
						${not empty pageContent['ethics_journal_4'] ? pageContent['ethics_journal_4'] : '• Authorship
						Criteria: Authorship
						should be limited to those who have made a significant contribution to the conception, design,
						execution, or
						interpretation of the reported study.'}
					</p>
					<p class="justified-text">
						${not empty pageContent['ethics_journal_5'] ? pageContent['ethics_journal_5'] : '• Conflict of
						Interest: Authors
						must disclose any financial, personal, or professional conflicts of interest that could be
						perceived to influence
						the results or interpretation of their manuscript.'}
					</p>
					<p class="justified-text">
						${not empty pageContent['ethics_journal_6'] ? pageContent['ethics_journal_6'] : '• Data
						Fabrication and
						Falsification: Any manipulation, fabrication, or falsification of research data is considered
						severe misconduct and
						will result in immediate rejection or retraction of the article.'}
					</p>
					<p class="justified-text">
						${not empty pageContent['ethics_journal_7'] ? pageContent['ethics_journal_7'] : '• Human and
						Animal Rights: Research
						involving human subjects or animals must explicitly state compliance with ethical standards,
						including obtaining
						necessary approvals from institutional ethics committees and informed consent from human
						participants.'}
					</p>
					<br><br>


					<h2 class="text-center mb-5" style="color: var(--deep-green); font-family: 'Georgia', serif;">${not
						empty
						pageContent['timeline_title3'] ? pageContent['timeline_title3'] : 'About Vidyavishva
						Publications:'}</h2>
					<p class="justified-text">
						${not empty pageContent['Publications_journal_1'] ? pageContent['Publications_journal_1'] :
						'Vidyavishva Publications is a dynamic and visionary publishing house dedicated to promoting
						excellence in education, research, and professional literature. With a strong commitment to
						quality, authenticity, and innovation, Vidyavishva Publications serves as a trusted platform for
						scholars, academicians, researchers, and authors seeking to share meaningful knowledge with the
						world. It focuses on publishing textbooks, reference books, edited volumes, journals,
						monographs, and scholarly resources across healthcare, Ayurveda, medical sciences, and allied
						disciplines. (vidyavishva.com)
						Driven by the belief that knowledge becomes powerful when shared responsibly, Vidyavishva
						Publications bridges the gap between intellectual creators and learners. The organization
						emphasizes transparent publishing practices, ethical standards, peer review systems, and
						academic integrity to ensure every publication meets high scholarly benchmarks. It also supports
						emerging researchers and young authors by providing opportunities to transform their ideas into
						impactful publications. (vidyavishva.com)
						Vidyavishva Publications is particularly recognized for its dedication to Indian knowledge
						systems, Ayurveda, and contemporary scientific education, while maintaining relevance to modern
						curricular and regulatory standards. With multilingual publishing support and a forward-looking
						vision, the organization aspires to create a global presence in academic publishing. Through its
						commitment to credibility, accessibility, and intellectual growth, Vidyavishva Publications
						continues to inspire a culture of learning and innovation for future generations.
						(vidyavishva.com)
						'}
					</p>
					<div class="timeline" hidden>
						<div class="timeline-item left">
							<div class="timeline-content">
								<span class="year">${not empty pageContent['timeline_2018_year'] ?
									pageContent['timeline_2018_year'] : '2018'}</span>
								<h4>${not empty pageContent['timeline_2018_title'] ? pageContent['timeline_2018_title']
									: 'Foundation'}</h4>
								<p>${not empty pageContent['timeline_2018_content'] ?
									pageContent['timeline_2018_content'] : 'AYUJOURNAL was established as the official
									publication of Ayurveda Research and Career Academy (ARCA) with a vision to promote
									empirical research in Ayurveda.'}</p>
							</div>
						</div>
						<div class="timeline-item right">
							<div class="timeline-content">
								<span class="year">${not empty pageContent['timeline_2019_year'] ?
									pageContent['timeline_2019_year'] : '2019'}</span>
								<h4>${not empty pageContent['timeline_2019_title'] ? pageContent['timeline_2019_title']
									: 'First Publication'}</h4>
								<p>${not empty pageContent['timeline_2019_content'] ?
									pageContent['timeline_2019_content'] : 'Launched our inaugural issue featuring
									groundbreaking research in Ayurvedic clinical trials and drug research
									methodologies.'}</p>
							</div>
						</div>
						<div class="timeline-item left">
							<div class="timeline-content">
								<span class="year">${not empty pageContent['timeline_2020_year'] ?
									pageContent['timeline_2020_year'] : '2020'}</span>
								<h4>${not empty pageContent['timeline_2020_title'] ? pageContent['timeline_2020_title']
									: 'International Recognition'}</h4>
								<p>${not empty pageContent['timeline_2020_content'] ?
									pageContent['timeline_2020_content'] : 'Gained recognition in the global Ayurvedic
									research community and established partnerships with international institutions.'}
								</p>
							</div>
						</div>
						<div class="timeline-item right">
							<div class="timeline-content">
								<span class="year">${not empty pageContent['timeline_2022_year'] ?
									pageContent['timeline_2022_year'] : '2022'}</span>
								<h4>${not empty pageContent['timeline_2022_title'] ? pageContent['timeline_2022_title']
									: 'Digital Transformation'}</h4>
								<p>${not empty pageContent['timeline_2022_content'] ?
									pageContent['timeline_2022_content'] : 'Implemented advanced digital publishing
									platform and open access model to increase global accessibility of Ayurvedic
									research.'}</p>
							</div>
						</div>
						<div class="timeline-item left">
							<div class="timeline-content">
								<span class="year">${not empty pageContent['timeline_2024_year'] ?
									pageContent['timeline_2024_year'] : '2024'}</span>
								<h4>${not empty pageContent['timeline_2024_title'] ? pageContent['timeline_2024_title']
									: 'Expanded Reach'}</h4>
								<p>${not empty pageContent['timeline_2024_content'] ?
									pageContent['timeline_2024_content'] : 'Reached milestone of publishing research
									from over 15 countries and established indexing in major academic databases.'}</p>
							</div>
						</div>
					</div>
				</div>
			</section>



			<!-- 🌿 Statistics Section -->
			<!--  <section class="stats-section">
        <div class="container">
            <h2 class="text-center mb-5">AYUJOURNAL by Numbers</h2>
            <div class="row">
                <div class="col-md-3 col-6">
                    <div class="stat-item">
                        <span class="stat-number">250+</span>
                        <span class="stat-label">Published Articles</span>
                    </div>
                </div>
                <div class="col-md-3 col-6">
                    <div class="stat-item">
                        <span class="stat-number">45+</span>
                        <span class="stat-label">Countries Reached</span>
                    </div>
                </div>
                <div class="col-md-3 col-6">
                    <div class="stat-item">
                        <span class="stat-number">1500+</span>
                        <span class="stat-label">Research Citations</span>
                    </div>
                </div>
                <div class="col-md-3 col-6">
                    <div class="stat-item">
                        <span class="stat-number">98%</span>
                        <span class="stat-label">Author Satisfaction</span>
                    </div>
                </div>
            </div>
        </div>
    </section>-->





			<!-- 🌿 Call to Action -->
			<!-- CTA Section (Smaller Only) -->
			<!-- <section class="cta-section" style="padding:35px 0;">
    <div class="container">
        <h3 style="font-size:24px; margin-bottom:10px;">Join Our Mission to Advance Ayurvedic Research</h3>
        <p class="mb-3" style="font-size:14px; margin-bottom:15px;">
            Contribute to the growing body of evidence-based Ayurvedic knowledge and help shape the future of traditional medicine.
        </p>

        <a href="${pageContext.request.contextPath}/submit-article" 
           class="btn btn-cta" 
           style="padding:8px 18px; font-size:14px; margin-right:10px;">
            Submit Your Research
        </a>

        <a href="${pageContext.request.contextPath}/contact" 
           class="btn btn-cta-outline" 
           style="padding:8px 18px; font-size:14px;">
            Contact Our Team
        </a>
    </div>
</section>-->

			<!-- ===== Footer ===== -->
			<footer class="footer" style="background:var(--deep-green); color:var(--cream); padding:60px 0 25px;">
				<div class="container">

					<div class="row">

						<!-- LOGO AND ADDRESS -->
						<div class="col-12 col-md-6 col-lg-4 mb-4 mb-lg-0">
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
						<!--	<p class="mb-2" style="font-size:14px; line-height:1.5;">
								${not empty pageContent['footer_address'] ? pageContent['footer_address'] : 'G1, Green
								park 6B, shanti park, Mira road E. 401107'}
							</p>
							<p class="mb-2" style="font-size:14px;">Email: ${not empty pageContent['footer_email'] ?
								pageContent['footer_email'] : 'natureayurvedjournal@gmail.com'}</p>
							<p class="mb-2" style="font-size:14px;">Mobile: ${not empty pageContent['footer_mobile'] ?
								pageContent['footer_mobile'] : '7710880622'}</p>
							<p class="mb-2 mt-3" style="font-size:14px;">Editor-in-Chief ${not empty
								pageContent['footer_editor_name'] ? pageContent['footer_editor_name'] : 'Dr.Chetan
								Madhukar Gulhane'}</p>
							<p class="mb-2" style="font-size:14px;">Email: ${not empty
								pageContent['footer_editor_email'] ? pageContent['footer_editor_email'] :
								'natureayurvedjournal@gmail.com'}</p>
							<p class="mb-2" style="font-size:14px;">Mobile: ${not empty pageContent['footer_mobile'] ?
								pageContent['footer_mobile'] : '8767571175'}</p>-->
						</div>

						<!-- Quick Links -->
						<div class="col-6 col-md-3 col-lg-2 mb-4 mb-lg-0">
							<h5
								style="color:var(--gold); font-family:Georgia, serif; margin-bottom:20px; font-size:16px;">
								Quick Links</h5>
							<ul class="footer-links">
								<li><a href="${pageContext.request.contextPath}/about">About Us</a></li>
								<li><a href="${pageContext.request.contextPath}/editorial-board">Editorial Board</a>
								</li>
								<li><a href="${pageContext.request.contextPath}/current-issue">Current Issue</a></li>
								<li><a href="${pageContext.request.contextPath}/archives">Archives</a></li>
							</ul>
						</div>

						<!-- Author Zone -->
						<div class="col-lg-2 mb-4">
							<h5
								style="color:var(--gold); font-family:Georgia, serif; margin-bottom:20px; font-size:16px;">
								Author Zone</h5>
							<ul class="footer-links">
								<li><a href="${pageContext.request.contextPath}/submit-article">Submit Article</a></li>
								<li><a href="${pageContext.request.contextPath}/author-guideline">Author Guideline</a>
								</li>
								<li><a href="${pageContext.request.contextPath}/login">Login / Register</a></li>
							</ul>
						</div>

						<!-- Contact -->
						<div class="col-lg-4 mb-4">
							<h5
								style="color:var(--gold); font-family:Georgia, serif; margin-bottom:20px; font-size:16px;">
								Contact</h5>
							<ul class="footer-links">
								<li><i class="fa fa-envelope me-2"></i> ${not empty pageContent['footer_contact_email']
									? pageContent['footer_contact_email'] : 'natureayurvedjournal@gmail.com'}</li>
								<li><i class="fa fa-globe me-2"></i> ${not empty pageContent['footer_contact_website'] ?
									pageContent['footer_contact_website'] : 'natureayurved.com'}</li>
								<li><i class="fa fa-barcode me-2"></i> ISSN: ${not empty
									pageContent['footer_contact_issn'] ? pageContent['footer_contact_issn'] :
									'0000-0000'}</li>
							</ul>
						</div>

					</div>

					<div class="footer-bottom mt-4 pt-3"
						style="border-top:1px solid rgba(255,255,255,0.15); text-align:center;">
						<p class="mb-0" style="font-size:14px;">
							${not empty pageContent['footer_copyright'] ? pageContent['footer_copyright'] : 'Copyright ©
							2025 NATURE AYURVED All Rights Reserved.'}
			</p>
		</div>

		</div>
		</footer>


		<!-- 🌿 Scripts -->
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
<div class="modal fade" id="editModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<form id="aboutForm" action="saveAboutContent" method="post">
				<input type="hidden" id="contentId" name="id">
				<div class="modal-header">
					<h5>Edit Content</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal">
					</button>
				</div>

				<div class="modal-body">
					<textarea id="popupTextarea" class="form-control" rows="6"
						data-id="${content.id}"></textarea>
				</div>

				<div class="modal-footer">
					<button class="btn btn-success" onclick="saveContent()">
						Update</button>
				</div>

			</form>

		</div>
	</div>
</div>


</html>