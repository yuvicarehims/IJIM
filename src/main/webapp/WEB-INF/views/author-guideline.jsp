<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Author Guidelines - NATURE AYURVED</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

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
	--max-width: 1200px;
	--radius: 12px;
	--shadow: 0 10px 30px rgba(11, 74, 57, 0.06);
	--transition: all 0.3s ease;
}

* {
	box-sizing: border-box;
}

html, body {
	overflow-x: hidden;
	max-width: 100%;
}

body {
	font-family: 'Segoe UI', 'Helvetica Neue', Arial, sans-serif;
	background-color: var(--cream);
	color: var(--text);
	margin: 0;
	padding: 0;
	line-height: 1.6;
}

/* Utility Classes */
.container-main {
	max-width: var(--max-width);
	margin: 0 auto;
	padding: 0 15px;
}

/* ===== Header Bar & Logo ===== */
.brand-bar {
	background-color: var(--paper);
	box-shadow: var(--shadow);
	padding: 10px 0;
	border-bottom: 4px solid var(--deep-green);
}

.logo-text {
	font-family: 'Georgia', serif;
	font-weight: 700;
	color: var(--deep-green);
	font-size: 34px;
	letter-spacing: 1px;
	text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
}

.logo-subtitle {
	font-size: 11px;
	font-weight: 600;
	color: var(--rust);
	text-transform: uppercase;
	display: block;
	margin-top: -5px;
}

/* ===== User Info & Alerts ===== */
.user-info {
	background: #e8f5e9;
	padding: 8px 18px;
	border-radius: 25px;
	border: 1px solid var(--leaf);
	color: var(--deep-green);
	font-weight: 600;
	font-size: 15px;
	white-space: nowrap;
}

.alert {
	padding: 15px 25px;
	border-radius: var(--radius);
	margin: 1.5rem 0;
	font-weight: 500;
	border: none;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
}

.alert-success {
	background: #e8f5e9;
	color: var(--deep-green);
	border-left: 5px solid var(--leaf);
}

.alert-error {
	background: #ffebee;
	color: #c62828;
	border-left: 5px solid #f44336;
}

.alert-info {
	background: #e3f2fd;
	color: #1565c0;
	border-left: 5px solid #2196f3;
}

/* ===== Navbar (Top Bar) ===== */
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

/* REGISTER BUTTON — EXACT LIKE YOUR 2nd IMAGE */
.register-btn {
	background: #ffffff !important;
	color: #000000 !important;
	padding: 12px 28px !important; /* Same size as screenshot */
	border-radius: 14px !important; /* Smooth rounded shape */
	font-weight: 700 !important; /* Bold text */
	font-size: 16px !important; /* Clear readable text */
	border: none !important; /* No border */
	display: flex;
	align-items: center;
	gap: 8px; /* Space between icon & text */
	box-shadow: 0px 2px 8px rgba(0, 0, 0, 0.18);
	/* Very soft shadow like screenshot */
}

.register-btn i {
	color: #000000 !important; /* Make icon black */
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

/* ===== Hero Banner ===== */
.guideline-hero {
	background: linear-gradient(rgba(11, 86, 51, 0.8), rgba(11, 86, 51, 0.8)),
		url('https://media.post.rvohealth.io/wp-content/uploads/2024/02/Ayurvedic-header.jpg')
		no-repeat center center/cover;
	color: white;
	padding: 100px 0;
	text-align: center;
	margin-bottom: 40px;
}

.guideline-hero h1 {
	font-family: 'Georgia', serif;
	font-weight: 700;
	font-size: 3rem;
	margin-bottom: 20px;
	color: var(--gold);
}

.guideline-hero p {
	font-size: 1.2rem;
	max-width: 600px;
	margin: 0 auto;
	color: var(--cream);
}

/* Content Section Responsive */
.content-section {
	background: #ffffff;
	padding: 40px 0;
}

.content-section h2 {
	font-size: 32px;
	font-weight: 700;
	margin-bottom: 5px;
	text-transform: uppercase;
	font-family: 'Times New Roman', serif;
	color: #000;
}

.content-section h3 {
	font-size: 22px;
	font-weight: 700;
	margin-bottom: 20px;
	font-family: 'Times New Roman', serif;
	color: #000;
}

.content-section p {
	font-size: 17px;
	line-height: 1.7;
	font-family: 'Times New Roman', serif;
	color: #000;
}

.content-section ol, .content-section ul {
	font-size: 17px;
	padding-left: 25px;
	line-height: 1.7;
	font-family: 'Times New Roman', serif;
	color: #000;
}

/* ===== Action Bar ===== */
.action-bar {
	background: var(--paper);
	padding: 25px 0;
	border-bottom: 1px solid rgba(0, 0, 0, 0.1);
	margin-bottom: 40px;
}

.action-buttons {
	display: flex;
	gap: 20px;
	justify-content: center;
	flex-wrap: wrap;
}

.action-btn {
	background: var(--deep-green);
	color: white;
	padding: 15px 30px;
	border-radius: var(--radius);
	text-decoration: none;
	font-weight: 600;
	transition: var(--transition);
	display: flex;
	align-items: center;
	gap: 10px;
	border: none;
}

.action-btn:hover {
	background: var(--leaf);
	color: white;
	transform: translateY(-2px);
	box-shadow: 0 5px 15px rgba(11, 86, 51, 0.3);
}

.action-btn.secondary {
	background: var(--rust);
}

.action-btn.secondary:hover {
	background: #8a5a4a;
}

/* ===== Content Section ===== */
.guideline-section {
	padding: 60px 0;
	background: white;
}

.section-heading {
	text-align: center;
	font-family: 'Georgia', serif;
	font-weight: 700;
	margin-bottom: 40px;
	position: relative;
	padding-bottom: 15px;
}

.section-heading::after {
	content: '';
	position: absolute;
	bottom: 0;
	left: 50%;
	transform: translateX(-50%);
	width: 120px;
	height: 4px;
	background-color: var(--gold);
	border-radius: 2px;
}

.content-card {
	background: var(--paper);
	padding: 40px;
	border-radius: var(--radius);
	box-shadow: var(--shadow);
	margin-bottom: 30px;
	border-left: 5px solid var(--gold);
}

.content-card h3 {
	color: var(--deep-green);
	font-family: 'Georgia', serif;
	font-weight: 600;
	margin-bottom: 20px;
	font-size: 1.8rem;
}

.content-card h4 {
	color: var(--rust);
	font-weight: 600;
	margin: 25px 0 15px 0;
	font-size: 1.3rem;
}

.content-card p {
	line-height: 1.7;
	margin-bottom: 15px;
	font-size: 1.05rem;
}

.content-card ul, .content-card ol {
	margin-left: 20px;
	margin-bottom: 20px;
}

.content-card li {
	margin-bottom: 10px;
	line-height: 1.6;
	font-size: 1.05rem;
}

.content-card strong {
	color: var(--deep-green);
}

.content-card em {
	color: var(--rust);
}

/* ===== Info Boxes ===== */
.info-box {
	background: #e8f5e9;
	border-left: 4px solid var(--leaf);
	padding: 20px;
	border-radius: var(--radius);
	margin: 25px 0;
}

.info-box.warning {
	background: #fff3e0;
	border-left-color: var(--gold);
}

.info-box.important {
	background: #ffebee;
	border-left-color: #d32f2f;
}

/* ===== Reference Examples ===== */
.reference-example {
	background: var(--cream);
	border: 1px solid #e0e0e0;
	border-radius: var(--radius);
	padding: 20px;
	margin: 15px 0;
	font-family: 'Courier New', monospace;
	font-size: 0.9rem;
}

/* ===== Fee Section ===== */
.fee-section {
	background: linear-gradient(135deg, var(--rust), var(--gold));
	color: white;
	padding: 40px;
	border-radius: var(--radius);
	text-align: center;
	margin: 40px 0;
}

.fee-section h3 {
	color: white;
	margin-bottom: 20px;
	font-family: 'Georgia', serif;
}

.fee-amount {
	font-size: 2rem;
	font-weight: 700;
	margin: 10px 0;
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

/* ===== Responsive Adjustments ===== */
/* Extra Large Devices (Large Desktops, 1200px and up) */
@media ( min-width : 1200px) {
	.container-main {
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
	.guideline-hero h1 {
		font-size: 2.5rem;
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
	.guideline-hero {
		padding: 70px 0;
	}
	.guideline-hero h1 {
		font-size: 2.3rem;
	}
	.guideline-hero p {
		font-size: 1.1rem;
	}
	.content-section {
		padding: 30px 0;
	}
	.content-section h2 {
		font-size: 28px;
	}
	.content-section h3 {
		font-size: 20px;
	}
	.content-section p {
		font-size: 16px;
	}
	.content-section ol, .content-section ul {
		font-size: 16px;
	}
	.action-bar {
		padding: 20px 0;
	}
	.action-buttons {
		flex-direction: column;
		align-items: center;
		gap: 15px;
	}
	.action-btn {
		width: 100%;
		max-width: 350px;
		justify-content: center;
	}
	.guideline-section {
		padding: 50px 0;
	}
	.content-card {
		padding: 30px;
	}
	.content-card h3 {
		font-size: 1.6rem;
	}
	.content-card h4 {
		font-size: 1.2rem;
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
	.guideline-hero {
		padding: 50px 0;
	}
	.guideline-hero h1 {
		font-size: 1.8rem;
	}
	.guideline-hero p {
		font-size: 1rem;
		padding: 0 15px;
	}
	.content-section {
		padding: 25px 0;
	}
	.content-section h2 {
		font-size: 24px;
	}
	.content-section h3 {
		font-size: 18px;
		margin-bottom: 15px;
	}
	.content-section p {
		font-size: 15px;
	}
	.content-section ol, .content-section ul {
		font-size: 15px;
		padding-left: 20px;
	}
	.action-bar {
		padding: 15px 0;
	}
	.action-btn {
		padding: 12px 20px;
		font-size: 0.9rem;
	}
	.guideline-section {
		padding: 30px 0;
	}
	.section-heading {
		font-size: 1.8rem;
		margin-bottom: 30px;
	}
	.content-card {
		padding: 20px;
		margin-bottom: 20px;
	}
	.content-card h3 {
		font-size: 1.4rem;
		margin-bottom: 15px;
	}
	.content-card h4 {
		font-size: 1.1rem;
		margin: 20px 0 12px 0;
	}
	.content-card p {
		font-size: 0.95rem;
		margin-bottom: 12px;
	}
	.content-card ul, .content-card ol {
		font-size: 0.95rem;
	}
	.content-card li {
		font-size: 0.95rem;
		margin-bottom: 8px;
	}
	.info-box {
		padding: 15px;
		margin: 20px 0;
	}
	.reference-example {
		padding: 15px;
		font-size: 0.85rem;
	}
	.fee-section {
		padding: 30px 20px;
	}
	.fee-amount {
		font-size: 1.6rem;
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
	.guideline-hero {
		padding: 40px 0;
	}
	.guideline-hero h1 {
		font-size: 1.5rem;
	}
	.guideline-hero p {
		font-size: 0.9rem;
	}
	.content-section {
		padding: 20px 0;
	}
	.content-section h2 {
		font-size: 20px;
	}
	.content-section h3 {
		font-size: 16px;
		margin-bottom: 12px;
	}
	.content-section p {
		font-size: 14px;
	}
	.content-section ol, .content-section ul {
		font-size: 14px;
		padding-left: 18px;
	}
	.action-bar {
		padding: 12px 0;
	}
	.action-btn {
		padding: 10px 18px;
		font-size: 0.85rem;
	}
	.guideline-section {
		padding: 25px 0;
	}
	.section-heading {
		font-size: 1.5rem;
		margin-bottom: 25px;
	}
	.content-card {
		padding: 15px;
		margin-bottom: 15px;
	}
	.content-card h3 {
		font-size: 1.2rem;
		margin-bottom: 12px;
	}
	.content-card h4 {
		font-size: 1rem;
		margin: 15px 0 10px 0;
	}
	.content-card p {
		font-size: 0.9rem;
		margin-bottom: 10px;
	}
	.content-card ul, .content-card ol {
		font-size: 0.9rem;
		margin-left: 15px;
	}
	.content-card li {
		font-size: 0.9rem;
		margin-bottom: 6px;
	}
	.info-box {
		padding: 12px;
		margin: 15px 0;
	}
	.reference-example {
		padding: 12px;
		font-size: 0.8rem;
	}
	.fee-section {
		padding: 25px 15px;
	}
	.fee-section h3 {
		font-size: 1.2rem;
	}
	.fee-amount {
		font-size: 1.4rem;
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
	<%
	// JSP Logic - Session and Application Data
	String username = (String) session.getAttribute("username");
	Boolean isLoggedIn = (Boolean) session.getAttribute("isLoggedIn");
	String userRole = (String) session.getAttribute("userRole");

	// Message handling
	String message = (String) request.getAttribute("message");
	String messageType = (String) request.getAttribute("messageType");
	%>
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
					<span class="d-none d-md-inline">ISSN: 0000-0000</span> <span
						class="d-md-none">ISSN: 0000-0000</span>
				</div>
			</div>
		</div>
	</header>


	<div class="container-main">
		<c:if test="${not empty requestScope.message}">
			<div class="alert alert-${requestScope.messageType} fade show"
				role="alert">
				<i class="fas fa-info-circle me-2"></i> ${requestScope.message}
			</div>
		</c:if>
	</div>

	<nav class="navbar navbar-expand-lg navbar-dark topbar sticky-top">
		<div class="container-fluid px-3 px-md-4 px-lg-5">
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navMain"
				aria-controls="navMain" aria-expanded="false"
				aria-label="Toggle navigation">
				<i class="fas fa-bars"></i>
			</button>

			<div class="collapse navbar-collapse" id="navMain">
				<ul class="navbar-nav mx-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/">Home</a></li>
					<li class="nav-item"><a class="nav-link"
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
					<li class="nav-item"><a class="nav-link active"
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

	<!-- Hero Banner -->
	<section class="guideline-hero">
		<div class="container-main">
			<h1>${pageContent['banner_title'] != null ? pageContent['banner_title'] : 'Author Guidelines'}</h1>
			<p>${pageContent['banner_subtitle'] != null ? pageContent['banner_subtitle'] : 'Comprehensive instructions for preparing and submitting your research manuscripts to Nature Ayurved'}</p>
		</div>
	</section>

	<!-- Action Bar -->
	<section class="action-bar">
		<div class="container-main">
			<div class="action-buttons">
				<a href="#" class="action-btn" id="downloadCopyrightBtnGuideline">
					<i class="fas fa-download"></i>
					${pageContent['copyright_form_text'] != null ? pageContent['copyright_form_text'] : 'DOWNLOAD COPYRIGHT FORM'}
				</a> <a href="${pageContext.request.contextPath}/register"
					class="action-btn secondary"> <i class="fas fa-user-plus"></i>
					${pageContent['become_author_text'] != null ? pageContent['become_author_text'] : 'BECOME AN AUTHOR'}
				</a>
			</div>
		</div>
	</section>

	<!-- Main Content -->
	<section style="background: #ffffff; padding: 40px 0;">
		<div class="container">
			<div class="row">
				<div class="col-12">

					<h2
						style="font-size: 32px; font-weight: 700; margin-bottom: 5px; text-transform: uppercase;">
						${pageContent['instructions_title'] != null ? pageContent['instructions_title'] : 'INSTRUCTIONS OR AUTHOR GUIDELINES'}
					</h2>

					<h3 style="font-size: 22px; font-weight: 700; margin-bottom: 20px;">
						${pageContent['submission_checklist_title'] != null ? pageContent['submission_checklist_title'] : 'Submission Preparation Checklist'}
					</h3>

					<p style="font-size: 17px; line-height: 1.7;">
						${pageContent['submission_checklist_content'] != null ? pageContent['submission_checklist_content'] : 'As part of the submission process, authors are required to check off their submission\'s compliance with all of the following items, and submissions may be returned to authors that do not adhere to these guidelines. The submission has not been previously published, nor is it before another journal for consideration.'}
        </p>

        <h3 style="font-size:20px; font-weight:700; margin-top:25px;">
            ${pageContent['manuscript_types_title'] != null ? pageContent['manuscript_types_title'] : 'Types of Manuscripts to be submitted-'}
        </h3>

        <ol style="font-size:17px; padding-left:25px; line-height:1.7;">
            <li>${pageContent['manuscript_type_1'] != null ? pageContent['manuscript_type_1'] : 'Editorial (Only for Editors or Invited Experts)'}</li>
            <li>${pageContent['manuscript_type_2'] != null ? pageContent['manuscript_type_2'] : 'Original Research Article (Experimental study / Clinical study / Observational study)'}</li>
            <li>${pageContent['manuscript_type_3'] != null ? pageContent['manuscript_type_3'] : 'Review Article (Literary review / Conceptual review)'}</li>
            <li>${pageContent['manuscript_type_4'] != null ? pageContent['manuscript_type_4'] : 'Case Study (Case Report / Case series)'}</li>
            <li>${pageContent['manuscript_type_5'] != null ? pageContent['manuscript_type_5'] : 'Book Review, Product Review, Metanalysis'}</li>
        </ol>

        <h3 style="font-size:20px; font-weight:700; margin-top:25px;">
            ${pageContent['author_guidelines_title'] != null ? pageContent['author_guidelines_title'] : 'Author Guidelines'}
        </h3>

        <p style="font-size:17px; line-height:1.7;">
            ${pageContent['author_guidelines_content_1'] != null ? pageContent['author_guidelines_content_1'] : 'Authors are asked to write their manuscripts in English in A4 size page with margins 2.5 cm from all four sides, Source Sans Pro font using a font size of 12. Page numbers included at bottom.'}
        </p>

        <p style="font-size:17px;">
            ${pageContent['author_guidelines_content_2'] != null ? pageContent['author_guidelines_content_2'] : 'Ayurvedic terms and other Latin terms must be Italicized and its equivalent English terminology should be mentioned in first instance in a bracket, for example: Urdhwaga Amlapitta (Non ulcer dyspepsia).'}
        </p>

        <p style="font-size:17px;">
            ${pageContent['author_guidelines_content_3'] != null ? pageContent['author_guidelines_content_3'] : 'Total number of authors may be 01 to maximum 05., for multicentric clinical trials it may be more.'}
        </p>

        <p style="font-size:17px;">
            ${pageContent['author_guidelines_content_4'] != null ? pageContent['author_guidelines_content_4'] : 'Headings in title case (not ALL CAPITALS), bold face capitals, single-spaced.'}
        </p>

        <p style="font-size:17px;">
            ${pageContent['author_guidelines_content_5'] != null ? pageContent['author_guidelines_content_5'] : 'The references cited in the text should be after punctuation marks, in superscript with square bracket.'}
        </p>

        <p style="font-size:17px;">
            ${pageContent['author_guidelines_content_6'] != null ? pageContent['author_guidelines_content_6'] : 'Standard International Units could be used throughout the text.'}
        </p>

        <p style="font-size:17px;">
            ${pageContent['author_guidelines_content_7'] != null ? pageContent['author_guidelines_content_7'] : 'All named authors have agreed to its submission.'}
        </p>

        <p style="font-size:17px;">
            ${pageContent['author_guidelines_content_8'] != null ? pageContent['author_guidelines_content_8'] : 'Authors have obtained permission from their employers or institution to publish, if they have a contractual or moral obligation to do so.'}
        </p>

        <h2 style="font-size:26px; font-weight:700; margin-top:30px;">
            ${pageContent['original_articles_title'] != null ? pageContent['original_articles_title'] : 'Preparation Of Original Articles'}
        </h2>

        <p style="font-size:17px; word-break:break-all;">
            ${pageContent['original_articles_url'] != null ? pageContent['original_articles_url'] : 'https://www.mayoclinic.org/diseases-conditions/high-blood-pressure/diagnosis-treatment/drc-20373417'}
        </p>

        <h3 style="font-size:20px; font-weight:700;">
            ${pageContent['references_title'] != null ? pageContent['references_title'] : 'References from Ayurvedic Classical Texts and Samhitas:'}
        </h3>

        <p style="font-size:17px;">
            ${pageContent['reference_1'] != null ? pageContent['reference_1'] : 'Tripathi B, editor, (1st ed.). Ashtanga Samgraha of Vagbhata, Sootra Sthana; Ayushkamiya Adhyaya: Chapter 1, Verse 10-16. Varanasi: Chowkhambha Sanskrit Series, 2010; p. 2-3.'}
        </p>

        <p style="font-size:17px;">
            ${pageContent['reference_2'] != null ? pageContent['reference_2'] : 'Tripathi B, editor, (1st ed.). Commentary Shashilekha of Indu on Ashtanga Samgraha of Vagbhata, Sootra Sthana; Ayushkamiya Adhyaya: Chapter 1, Verse 10-16. Varanasi: Chowkhambha Sanskrit Series, 2006; p. 7-8.'}
        </p>

        <ol style="font-size:17px; padding-left:25px; line-height:1.7;">
            <li>${pageContent['article_structure_1'] != null ? pageContent['article_structure_1'] : '1. Title page (excluding acknowledgements) with Abstract'}</li>
            <li>${pageContent['article_structure_2'] != null ? pageContent['article_structure_2'] : '2. Introduction'}</li>
            <li>${pageContent['article_structure_3'] != null ? pageContent['article_structure_3'] : '3. Materials (or patients) and methods'}</li>
            <li>${pageContent['article_structure_4'] != null ? pageContent['article_structure_4'] : '4. Results'}</li>
            <li>${pageContent['article_structure_5'] != null ? pageContent['article_structure_5'] : '5. Discussion'}</li>
            <li>${pageContent['article_structure_6'] != null ? pageContent['article_structure_6'] : '6. Conclusion'}</li>
            <li>${pageContent['article_structure_7'] != null ? pageContent['article_structure_7'] : '7. Acknowledgements'}</li>
            <li>${pageContent['article_structure_8'] != null ? pageContent['article_structure_8'] : '8. Conflict of Interest'}</li>
            <li>${pageContent['article_structure_9'] != null ? pageContent['article_structure_9'] : '9. References'}</li>
        </ol>

        <h3 style="font-size:20px; font-weight:700; margin-top:25px;">
            ${pageContent['title_page_title'] != null ? pageContent['title_page_title'] : '1. Title page'}
        </h3>

        <ol style="font-size:17px; padding-left:25px; line-height:1.7;">
            <li><strong>Title:</strong> ${pageContent['title_page_content_1'] != null ? pageContent['title_page_content_1'] : 'Concise and informative. Running title not more than 25 letters.'}</li>
            <li><strong>Author names and affiliations:</strong> ${pageContent['title_page_content_2'] != null ? pageContent['title_page_content_2'] : 'Number authors with superscript.'}</li>
        </ol>

        <h3 style="font-size:20px; font-weight:700; margin-top:25px;">
            ${pageContent['abstract_title'] != null ? pageContent['abstract_title'] : 'Abstract'}
        </h3>

        <p style="font-size:17px;">
            ${pageContent['abstract_content_1'] != null ? pageContent['abstract_content_1'] : 'Well structured abstract, not more than 200 words, covering background, aims and objectives, methods, statistical tests, results, and conclusion. No references.'}
        </p>

        <p style="font-size:17px;">
            <strong>Key words:</strong> ${pageContent['abstract_content_2'] != null ? pageContent['abstract_content_2'] : '3 to 6 key words.'}
        </p>

        <h3 style="font-size:20px; font-weight:700; margin-top:20px;">
            ${pageContent['introduction_title'] != null ? pageContent['introduction_title'] : '2. Introduction'}
        </h3>

        <p style="font-size:17px;">
            ${pageContent['introduction_content'] != null ? pageContent['introduction_content'] : 'Introduction should assume that the reader is knowledgeable. Include aims and objectives.'}
        </p>

        <h3 style="font-size:20px; font-weight:700; margin-top:20px;">
            ${pageContent['materials_methods_title'] != null ? pageContent['materials_methods_title'] : '3. Materials and Methods'}
        </h3>

        <p style="font-size:17px;">
            ${pageContent['materials_methods_content'] != null ? pageContent['materials_methods_content'] : 'Provide manufacturer name, trade name, and drug details. Follow ICMR & Govt. guidelines.'}
        </p>

        <h2 style="font-size:26px; font-weight:700; margin-top:35px;">
            ${pageContent['tables_figures_title'] != null ? pageContent['tables_figures_title'] : 'Tables And Figure'}
        </h2>

        <p style="font-size:17px;">
            ${pageContent['tables_figures_content'] != null ? pageContent['tables_figures_content'] : 'Only MS Word table format. Number tables consecutively. Avoid vertical rules. Figures in JPEG. Graphs generated in Excel.'}
        </p>

        <h2 style="font-size:26px; font-weight:700; margin-top:35px;">
            ${pageContent['peer_review_title'] != null ? pageContent['peer_review_title'] : 'Peer review policy :'}
        </h2>

        <p style="font-size:17px;">
            ${pageContent['peer_review_content_1'] != null ? pageContent['peer_review_content_1'] : 'Journal uses double-blind peer review. Reviewers and authors remain anonymous.'}
        </p>

        <p style="font-size:17px;">
            ${pageContent['peer_review_content_2'] != null ? pageContent['peer_review_content_2'] : 'Review process takes 03 weeks. Additional reviews may be requested.'}
        </p>

        <h2 style="font-size:26px; font-weight:700; margin-top:35px;">
            ${pageContent['plagiarism_title'] != null ? pageContent['plagiarism_title'] : 'Plagiarism Policy:'}
        </h2>

        <p style="font-size:17px;">
            ${pageContent['plagiarism_content'] != null ? pageContent['plagiarism_content'] : 'Journal respects intellectual property. Plagiarism is strictly prohibited. Author must respond within two weeks if plagiarism found. PDF removed if rejected. Author account may be disabled for 3/5/10 years or permanently.'}
        </p>

        <h2 style="font-size:26px; font-weight:700; margin-top:35px;">
            ${pageContent['publication_fee_title'] != null ? pageContent['publication_fee_title'] : 'Publication Fee:'}
        </h2>

        <p style="font-size:17px;">
            ${pageContent['publication_fee_content'] != null ? pageContent['publication_fee_content'] : 'Article Processing Fees payable after acceptance:  Technical charges: 2500 INR (Indian Author), 100 USD (Foreign Author)'}
        </p>

        <!-- Payment Section -->
        <div class="payment-section text-center" style="margin-top: 40px; padding: 30px; background: linear-gradient(135deg, #f8f9fa, #e9ecef); border-radius: 12px; border: 1px solid #dee2e6;">
            <h2 style="font-size:26px; font-weight:700; margin-bottom:25px; color: #0b5633;">
                <i class="fas fa-credit-card me-2"></i>Make Payment
            </h2>
            
            <!-- Razorpay Payment Button -->
            <form>
                <script src="https://checkout.razorpay.com/v1/payment-button.js" data-payment_button_id="pl_SDXtSx8cshgCvL" async> </script>
            </form>
            
            <div class="payment-info mt-3" style="font-size: 14px; color: #6c757d;">
                <i class="fas fa-shield-alt me-1"></i> Secure payment powered by Razorpay
            </div>
        </div>
            </div>
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
                    <li class="mb-2"><a 
							href="${pageContext.request.contextPath}/uploads/IJIMindexing.pdf"
							target="_blank" class="text-light text-decoration-none">Index</a>
						</li>
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Razorpay Checkout Script -->
    <!-- Razorpay Button Script handles everything -->
    
    <script>
        // Razorpay button handles everything - no custom JavaScript needed
    </script>

    <script>
        (function () {
            var btn = document.getElementById('downloadCopyrightBtnGuideline');
            if (!btn) {
                return;
            }
            btn.addEventListener('click', function (e) {
                e.preventDefault();
                var originalHtml = btn.innerHTML;
                btn.innerHTML = '<i class="fas fa-spinner fa-spin me-2"></i>Opening Preview...';
                btn.disabled = true;
                var previewUrl = '${pageContext.request.contextPath}/preview/Copyright-form';
						var newWindow = window.open(previewUrl, '_blank'); if (!newWindow)
						{ alert('Please allow popups to preview the copyright form.');
						btn.innerHTML = originalHtml; btn.disabled = false; return; }
						setTimeout(function () { btn.innerHTML = originalHtml;
						btn.disabled = false; }, 2000); }); })();
						</script>
</body>
</html>
