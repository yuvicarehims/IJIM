<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="en">

<head>

<meta charset="UTF-8">

<title>IJIM | Editorial Board</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap + Font Awesome -->

<!-- Bootstrap CSS (LOCAL FILE) -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Font Awesome CDN (OK to keep CDN) -->
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
	gap: 8px; /* space between icon and text */
	padding: 8px 18px; /* button height and width */
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
	background: rgba(255, 255, 255, 0.1);
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

/* ===== Banner ===== */
.inner-banner {
	position: relative;
	background: linear-gradient(rgba(11, 86, 51, 0.6), rgba(11, 86, 51, 0.6)),
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
	text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.4);
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
	margin-bottom: 40px; /* fixed clean space below card */
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

.horizontal-card>div {
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
	padding: 25px 0 5px !important; /* very compact */
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
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
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
	font-size: 31px;
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

.text-responsive {
	font-size: clamp(14px, 2vw, 18px);
	text-align: justify;
	line-height: 1.6;
}

.heading-responsive {
	font-size: clamp(1.5rem, 4vw, 2.5rem);
}

.heading-responsive {
	text-align: center;
	font-size: 22px;
	margin: 0;
}

.impact-factor {
	display: block;
	font-size: 20px;
	margin-top: 5px;
}
</style>

</head>



<body>



	<!-- ===== Header (White) ===== -->
	<header class="header-top">
		<div class="container-fluid">
			<div class="header-content">
				<div class="header-logo px-3 px-md-4 px-lg-5">
					<img src="${pageContext.request.contextPath}/images/IJIMlogo.png"
						alt="AYUSCRIPT Logo" class="header-logo img-fluid">
				</div>

				<div class="header-title">
					<h1 class="heading-responsive">

						International Journal of Indian Medicine <span
							class="impact-factor"> IIFS Impact Factor: 4.125 </span>

					</h1>
				</div>

				<div class="header-issn px-3 px-md-4 px-lg-5">
					<span class="d-none d-md-inline">ISSN: 2582-7634</span> <span
						class="d-md-none">ISSN: 2582-7634 </span>
				</div>
			</div>
		</div>
	</header>


	<!-- ===== Navbar (Green Only) ===== -->
	<nav class="navbar navbar-expand-lg topbar sticky-top">
		<div class="container-fluid px-3 px-md-4 px-lg-5">
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navMain"
				aria-controls="navMain" aria-expanded="false"
				aria-label="Toggle navigation">
				<i class="fas fa-bars"></i>
			</button>

			<!-- NAV MENU -->
			<div class="collapse navbar-collapse" id="navMain">
				<ul class="navbar-nav mx-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/">Home</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/about">About Us</a></li>
					<li class="nav-item"><a class="nav-link active"
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
					<%-- <li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/policy">Policy</a></li>
					<li class="nav-item"><a class="nav-link"
						href="https://www.vidyavishva.com/" target="_blank">VIDYAVISHVA</a>
					</li> --%>
				</ul>
			</div>
		</div>
	</nav>


	<!-- ===== Banner ===== -->

	<section class="inner-banner">

		<h1>EDITORIAL BOARD</h1>

	</section>



	<!-- ===== Become Author Button ===== -->
	<div class="container">
		<div class="row">
			<div class="col-12 text-center text-md-end p-3">
				<a href="${pageContext.request.contextPath}/authorLogin"
					class="btn btn-outline-success fw-bold"> <i
					class="fa fa-arrow-circle-right"></i> Become an Author
				</a>
			</div>
		</div>
	</div>


	<div id="editorial1">${pageContent}</div>
	<footer class="bg-dark text-light pt-5 pb-3"
		style="background:rgb(17, 23, 9) !important;">
		<div class="container">

			<div class="row gy-4">

				<!-- Logo + About -->
				<div class="col-lg-4 col-md-6">
					<div class="footer-logo mb-3">

						<img src="${pageContext.request.contextPath}/images/IJIMlogo.png"
							alt="logo" class="img-fluid mb-3"
							style="height: 120px; max-width: 280px;">

						<!-- Address -->
						<div
							style="font-size: 13px; line-height: 1.6; margin-bottom: 8px;">
							<i class="fas fa-map-marker-alt me-2"></i> 8A, Wandhare Child
							Care Hospital,<br> Dubey Nagar, Hudkeshwar Road,<br>
							Nagpur, Maharashtra 440034, India
						</div>

						<!-- Phone -->
						<div style="font-size: 13px; margin-bottom: 5px;">
							<i class="fas fa-phone me-2"></i> (+91) 9404 233 935
						</div>

						<!-- Email -->
						<div style="font-size: 13px;">
							<i class="fas fa-envelope me-2"></i> arcaexperts@gmail.com
						</div>

					</div>

					<div class="mt-3">
						<a href="#" class="text-light me-3"><i
							class="fab fa-facebook-f"></i></a> <a href="#"
							class="text-light me-3"><i class="fab fa-twitter"></i></a> <a
							href="#" class="text-light"><i class="fab fa-linkedin-in"></i></a>
					</div>
				</div>

				<!-- Quick Links -->
				<div class="col-lg-2 col-md-6">
					<h6 class="fw-bold mb-3" style="color: var(--gold);">Quick
						Links</h6>
					<ul class="list-unstyled">
						<li class="mb-2"><a
							href="${pageContext.request.contextPath}/about"
							class="text-light text-decoration-none">About Us</a></li>
						<li class="mb-2"><a
							href="${pageContext.request.contextPath}/editorial-board"
							class="text-light text-decoration-none">Editorial Board</a></li>
						<li class="mb-2"><a
							href="${pageContext.request.contextPath}/current-issue"
							class="text-light text-decoration-none">Current Issue</a></li>
						<li class="mb-2"><a
							href="${pageContext.request.contextPath}/uploads/IJIMindexing.pdf"
							target="_blank" class="text-light text-decoration-none">Index</a>
						</li>
					</ul>
				</div>

				<!-- Author Zone -->
				<div class="col-lg-3 col-md-6">
					<h6 class="fw-bold mb-3" style="color: var(--gold);">Author
						Zone</h6>
					<ul class="list-unstyled">
						<li class="mb-2"><a
							href="${pageContext.request.contextPath}/login"
							class="text-light text-decoration-none">Submit Article</a></li>
						<li class="mb-2"><a
							href="${pageContext.request.contextPath}/author-guideline"
							class="text-light text-decoration-none">Author Guideline</a></li>
						<li><a href="${pageContext.request.contextPath}/login"
							class="text-light text-decoration-none">Login / Register</a></li>
					</ul>
				</div>

				<!-- Contact -->
				<div class="col-lg-3 col-md-6">
					<h6 class="fw-bold mb-3" style="color: var(--gold);">Contact</h6>
					<ul class="list-unstyled small">
						<li class="mb-2"><i class="fas fa-envelope me-2"></i> <a
							href="mailto:editor@ayuscript.com"
							class="text-light text-decoration-none">
								natureayurvedjournal@gmail.com </a></li>
						<li class="mb-2"><i class="fas fa-globe me-2"></i> <a
							href="http://www.ayuscript.com'}/"
							class="text-light text-decoration-none"> natureayurved.com </a></li>
						<li><i class="fas fa-barcode me-2"></i> ISSN: 2582-7634</li>
					</ul>
				</div>

			</div>

			<!-- Bottom -->
			<hr class="border-light mt-4">

			<div class="text-center small">
				Copyright © 2026 IJIM | All Rights Reserved | <a href="#"
					class="text-light text-decoration-none">Privacy Policy</a>
			</div>

		</div>
	</footer>
	<button class="scroll-top"
		onclick="window.scrollTo({top:0, behavior:'smooth'})">

		<i class="fa fa-angle-up"></i>

	</button>


	<!-- Bootstrap JS (LOCAL FILE) -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>



</body>

</html>