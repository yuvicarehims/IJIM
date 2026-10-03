<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>Author Login - IJIM</title>
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
	min-height: 100vh;
	display: flex;
	flex-direction: column;
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

/* Download Copyright Form Button */
.btn-download-copyright {
	display: inline-block;
	background: linear-gradient(135deg, #6B5CE7, #4a3caa);
	color: white;
	padding: 12px 25px;
	border-radius: 30px;
	text-decoration: none;
	font-weight: 600;
	font-size: 16px;
	text-transform: uppercase;
	letter-spacing: 1px;
	box-shadow: 0 4px 15px rgba(107, 92, 231, 0.3);
	transition: all 0.3s ease;
	border: 2px solid transparent;
}

.btn-download-copyright:hover {
	background: linear-gradient(135deg, #4a3caa, #6B5CE7);
	color: white;
	text-decoration: none;
	transform: translateY(-2px);
	box-shadow: 0 6px 20px rgba(107, 92, 231, 0.4);
	border-color: rgba(255, 255, 255, 0.3);
}

.btn-download-copyright:active {
	transform: translateY(0);
}

/* Breadcrumb and Download Section Styles */
.breadcrumb-download-section {
	background-color: white;
	padding: 15px 0;
	border-bottom: 1px solid #e0e0e0;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
}

.breadcrumb-download-wrapper {
	display: flex;
	justify-content: flex-end;
	align-items: center;
}

/* Download Link Styles - Right Aligned */
.download-section-full {
	width: auto;
	text-align: right;
}

.download-copyright-link {
	display: inline-flex;
	align-items: center;
	gap: 8px;
	color: #6B5CE7;
	text-decoration: none;
	font-family: 'Segoe UI', 'Helvetica Neue', Arial, sans-serif;
	font-weight: 600;
	font-size: 14px;
	padding: 8px 15px;
	border-radius: 4px;
	transition: all 0.2s ease;
}

.download-copyright-link:hover {
	color: #4a3caa;
	text-decoration: underline;
	background-color: rgba(107, 92, 231, 0.05);
}

.download-icon {
	font-size: 16px;
}

/* ===== Login Section ===== */
.login-section {
	flex: 1;
	display: flex;
	align-items: center;
	justify-content: center;
	padding: 60px 0;
	background: linear-gradient(135deg, rgba(11, 86, 51, 0.03) 0%,
		rgba(201, 162, 90, 0.03) 100%);
}

.login-container {
	width: 100%;
	max-width: 420px;
	margin: 0 auto;
}

.login-card {
	background: white;
	padding: 35px 30px;
	border-radius: var(--radius);
	box-shadow: var(--shadow);
	border-top: 5px solid var(--gold);
	transition: var(--transition);
}

.login-card:hover {
	box-shadow: 0 15px 40px rgba(11, 86, 51, 0.15);
	transform: translateY(-5px);
}

.login-header {
	text-align: center;
	margin-bottom: 35px;
}

.login-icon {
	width: 70px;
	height: 70px;
	background: linear-gradient(135deg, var(--deep-green), var(--leaf));
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	margin: 0 auto 18px;
	color: white;
	font-size: 1.8rem;
	box-shadow: 0 8px 20px rgba(11, 86, 51, 0.3);
}

.login-title {
	color: var(--deep-green);
	font-family: 'Georgia', serif;
	font-weight: 700;
	font-size: 1.9rem;
	margin-bottom: 8px;
}

.login-subtitle {
	color: var(--rust);
	font-size: 1rem;
	font-weight: 500;
}

.form-group {
	margin-bottom: 20px;
	text-align: left;
}

.form-label {
	display: block;
	margin-bottom: 7px;
	color: var(--deep-green);
	font-weight: 600;
	font-size: 0.95rem;
}

.form-control {
	width: 100%;
	padding: 12px 16px;
	border: 2px solid #e8f5e9;
	border-radius: var(--radius);
	font-size: 0.95rem;
	transition: var(--transition);
	background: var(--cream);
}

.form-control:focus {
	outline: none;
	border-color: var(--leaf);
	box-shadow: 0 0 0 3px rgba(43, 138, 95, 0.1);
	background: white;
}

.form-control::placeholder {
	color: #a0a0a0;
}

.btn-group {
	display: flex;
	gap: 12px;
	margin-top: 25px;
}

.btn {
	flex: 1;
	padding: 12px 20px;
	border: none;
	border-radius: var(--radius);
	font-size: 0.95rem;
	font-weight: 600;
	cursor: pointer;
	transition: var(--transition);
	text-decoration: none;
	text-align: center;
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 6px;
}

.btn-login {
	background: var(--deep-green);
	color: white;
}

.btn-login:hover {
	background: var(--leaf);
	transform: translateY(-2px);
	box-shadow: 0 5px 15px rgba(11, 86, 51, 0.3);
}

.btn-cancel {
	background: transparent;
	color: var(--deep-green);
	border: 2px solid var(--deep-green);
}

.btn-cancel:hover {
	background: var(--deep-green);
	color: white;
	transform: translateY(-2px);
	box-shadow: 0 5px 15px rgba(11, 86, 51, 0.3);
}

.login-links {
	margin-top: 25px;
	display: flex;
	flex-direction: column;
	gap: 10px;
	text-align: center;
}

.login-link {
	color: var(--deep-green);
	text-decoration: none;
	font-weight: 500;
	transition: var(--transition);
	padding: 8px 0;
}

.login-link:hover {
	color: var(--rust);
	text-decoration: underline;
}

.divider {
	display: flex;
	align-items: center;
	margin: 25px 0;
	color: var(--rust);
	font-weight: 500;
}

.divider::before, .divider::after {
	content: '';
	flex: 1;
	border-bottom: 1px solid #e0e0e0;
}

.divider::before {
	margin-right: 15px;
}

.divider::after {
	margin-left: 15px;
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

/* ===== Responsive Adjustments ===== */
/* Extra Large Devices (Large Desktops, 1200px and up) */
@media ( min-width : 1200px) {
	.login-container {
		max-width: 420px;
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
	.login-container {
		max-width: 400px;
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
	.login-section {
		padding: 40px 0;
	}
	.login-container {
		max-width: 380px;
	}
	.login-card {
		padding: 30px 25px;
	}
	.login-icon {
		width: 60px;
		height: 60px;
		font-size: 1.5rem;
		margin-bottom: 15px;
	}
	.login-title {
		font-size: 1.7rem;
	}
	.login-subtitle {
		font-size: 0.95rem;
	}
	.topbar .nav-link {
		padding: 10px 15px !important;
		font-size: 13px;
	}

	/* Tablet responsive for download section */
	.breadcrumb-download-wrapper {
		justify-content: flex-end;
	}
	.download-copyright-link {
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
	.login-section {
		padding: 30px 0;
	}
	.login-container {
		max-width: 100%;
		padding: 0 15px;
	}
	.login-card {
		padding: 25px 20px;
		margin: 0;
	}
	.login-header {
		margin-bottom: 25px;
	}
	.login-icon {
		width: 55px;
		height: 55px;
		font-size: 1.3rem;
		margin-bottom: 12px;
	}
	.login-title {
		font-size: 1.5rem;
		margin-bottom: 6px;
	}
	.login-subtitle {
		font-size: 0.9rem;
	}
	.form-group {
		margin-bottom: 18px;
	}
	.form-label {
		font-size: 0.9rem;
		margin-bottom: 6px;
	}
	.form-control {
		padding: 11px 14px;
		font-size: 0.9rem;
	}
	.btn-group {
		flex-direction: column;
		gap: 10px;
		margin-top: 20px;
	}
	.btn {
		padding: 11px 18px;
		font-size: 0.9rem;
	}
	.login-links {
		margin-top: 20px;
		gap: 8px;
	}
	.login-link {
		font-size: 0.9rem;
	}
	.divider {
		margin: 20px 0;
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
	.login-section {
		padding: 25px 0;
	}
	.login-container {
		padding: 0 10px;
	}
	.login-card {
		padding: 20px 15px;
	}
	.login-header {
		margin-bottom: 20px;
	}
	.login-icon {
		width: 50px;
		height: 50px;
		font-size: 1.2rem;
		margin-bottom: 10px;
	}
	.login-title {
		font-size: 1.3rem;
		margin-bottom: 5px;
	}
	.login-subtitle {
		font-size: 0.85rem;
	}
	.form-group {
		margin-bottom: 15px;
	}
	.form-label {
		font-size: 0.85rem;
		margin-bottom: 5px;
	}
	.form-control {
		padding: 10px 12px;
		font-size: 0.85rem;
	}
	.btn-group {
		margin-top: 18px;
		gap: 8px;
	}
	.btn {
		padding: 10px 16px;
		font-size: 0.85rem;
	}
	.login-links {
		margin-top: 18px;
		gap: 6px;
	}
	.login-link {
		font-size: 0.85rem;
	}
	.divider {
		margin: 18px 0;
		font-size: 0.85rem;
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

	/* Mobile responsive for download section */
	.breadcrumb-download-wrapper {
		justify-content: flex-end;
	}
	.download-section-full {
		text-align: right;
	}
	.download-copyright-link {
		font-size: 12px;
		padding: 6px 12px;
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
.impact-factor {
	display: block;
	font-size: 20px;
	margin-top: 5px;
}
.heading-responsive {
	text-align: center;
	font-size: 22px;
	margin: 0;
}
</style>
</head>

<body>
	<%
	// JSP Logic - Session and Application Data String username=(String) session.getAttribute("username");
	Boolean isLoggedIn = (Boolean) session.getAttribute("isLoggedIn");
	String userRole = (String) session.getAttribute("userRole"); // Message handling String message=(String)
	request.getAttribute("message");
	String messageType = (String) request.getAttribute("messageType");
	%>

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
					<span class="d-none d-md-inline">ISSN: 3139-8871</span> <span
						class="d-md-none">ISSN: 3139-8871</span>
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

	<!-- 🌿 Navbar -->
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
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/editorial-board">Editorial
							Board</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/current-issue">Current
							Issue</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/archives">Archives</a></li>
					<li class="nav-item"><a class="nav-link active"
						href="${pageContext.request.contextPath}/login">Submit Article</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/author-guideline">Author
							Guideline</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/contact">Contact</a></li>
				<%-- 	<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/policy">Policy</a></li>
					<li class="nav-item"><a class="nav-link"
						href="https://www.vidyavishva.com/" target="_blank">VIDYAVISHVA</a></li> --%>
				</ul>
			</div>
		</div>
	</nav>


	<!-- Download Copyright Form Section -->
	<div class="breadcrumb-download-section">
		<div class="container-main">
			<div class="breadcrumb-download-wrapper">
				<!-- Download Copyright Form Link (Full Width) -->
				<div class="download-section-full">
					<a href="#" class="download-copyright-link"
						id="downloadCopyrightBtn"> <i
						class="fas fa-arrow-circle-right download-icon"></i> DOWNLOAD
						COPYRIGHT FORM
					</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Login Section -->
	<section class="login-section">
		<div class="login-container">
			<div class="login-card">
				<div class="login-header">
					<div class="login-icon">
						<i class="fas fa-lock"></i>
					</div>
					<h1 class="login-title">Login</h1>
					<p class="login-subtitle">Enter your credentials to access your
						account</p>
				</div>

				<!-- Error/Success Messages -->
				<c:if test="${not empty error}">
					<div class="alert alert-error fade show" role="alert">
						<i class="fas fa-exclamation-circle me-2"></i> ${error}
					</div>
				</c:if>
				<c:if test="${not empty success}">
					<div class="alert alert-success fade show" role="alert">
						<i class="fas fa-check-circle me-2"></i> ${success}
					</div>
				</c:if>

				<!-- Login Form -->
				<form action="${pageContext.request.contextPath}/login"
					method="post" id="loginForm">
					<div class="form-group">
						<label for="username" class="form-label"> <i
							class="fas fa-envelope me-2"></i>Email Address
						</label> <input type="email" id="username" name="username"
							class="form-control" placeholder="Enter your email address"
							required>
					</div>

					<div class="form-group" style="position: relative;">
						<label for="password" class="form-label"> <i
							class="fas fa-key me-2"></i>Password
						</label> <input type="password" id="password" name="password"
							class="form-control" placeholder="Enter your password" required>
						<span onclick="togglePassword()"
							style="position: absolute; right: 10px; top: 70%; transform: translateY(-50%); cursor: pointer;">
							<i class="fa-solid fa-eye"></i>
						</span>
					</div>

					<div class="btn-group">
						<button type="submit" class="btn btn-login" id="loginBtn">
							<i class="fas fa-sign-in-alt me-2"></i>LOGIN
						</button>
						<button type="button" class="btn btn-cancel"
							id="forgotPasswordBtn">
							<i class="fas fa-question-circle me-2"></i>FORGOT PASSWORD?
						</button>
					</div>
				</form>

				<!-- Hidden form for forgot password -->
				<form action="${pageContext.request.contextPath}/forgot-password"
					method="post" id="forgotPasswordForm" style="display: none;">
					<input type="hidden" id="forgotEmail" name="email">
				</form>

				<div class="divider">OR</div>

				<div class="login-links">
					<a href="${pageContext.request.contextPath}/register"
						class="login-link"> <i class="fas fa-user-plus me-2"></i>Create
						New Author Account
					</a>
					<!-- Removed the old forgot password link since we now have the button -->
				</div>
			</div>
		</div>
	</section>

	<div class="payment-section text-center"
		style="margin-top: 40px; padding: 30px; background: linear-gradient(135deg, #f8f9fa, #e9ecef); border-radius: 12px; border: 1px solid #dee2e6;">
		<h2
			style="font-size: 26px; font-weight: 700; margin-bottom: 25px; color: #0b5633;">
			<i class="fas fa-credit-card me-2"></i>Make Payment
		</h2>

		
		<form>
			<!-- <script src="https://checkout.razorpay.com/v1/payment-button.js" data-payment_button_id="pl_SDXtSx8cshgCvL" async> </script> -->
			<form><script src="https://checkout.razorpay.com/v1/payment-button.js" data-payment_button_id="pl_JLeVbxuCWdMsS2" async> </script> </form>
		</form>

		<div class="payment-info mt-3"
			style="font-size: 14px; color: #6c757d;">
			<i class="fas fa-shield-alt me-1"></i> Secure payment powered by
			Razorpay
		</div>
	</div>


	<!-- ===== Footer ===== -->

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

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

	<script>
                    // Download Copyright Form functionality
                    document.getElementById('downloadCopyrightBtn').addEventListener('click', function (e) {
                        e.preventDefault();

                        // Show loading state
                        const btn = this;
                        const originalText = btn.innerHTML;
                        btn.innerHTML = '<i class="fas fa-spinner fa-spin me-2"></i>Opening Preview...';
                        btn.disabled = true;

                        // Use the preview endpoint to open PDF in new tab
                        const previewUrl = '${pageContext.request.contextPath}/preview/Copyright-form';

                        // Open PDF in new tab for preview
                        const newWindow = window.open(previewUrl, '_blank');

                        // If popup blocked, show error
                        if (!newWindow) {
                            alert('Please allow popups to preview the copyright form.');
                            btn.innerHTML = originalText;
                            btn.disabled = false;
                            return;
                        }

                        // Reset button after a short delay
                        setTimeout(function () {
                            btn.innerHTML = originalText;
                            btn.disabled = false;
                        }, 2000);

                        // Reset button after delay
                        setTimeout(() => {
                            btn.innerHTML = originalText;
                            btn.disabled = false;
                        }, 2000);

                        // Alternative method using fetch with better error handling
                        /*
                        fetch(downloadUrl)
                            .then(response => {
                                if (!response.ok) {
                                    if (response.status === 404) {
                                        throw new Error('Copyright form file not found on server. Please contact administrator.');
                                    } else {
                                        throw new Error('Unable to download file. Server responded with status: ' + response.status);
                                    }
                                }
                                return response.blob();
                            })
                            .then(blob => {
                                const url = window.URL.createObjectURL(blob);
                                const a = document.createElement('a');
                                a.href = url;
                                a.download = 'Copyright form.pdf';
                                document.body.appendChild(a);
                                a.click();
                                window.URL.revokeObjectURL(url);
                                document.body.removeChild(a);
                                
                                // Reset button
                                btn.innerHTML = originalText;
                                btn.disabled = false;
                            })
                            .catch(error => {
                                console.error('Download failed:', error);
                                alert('Error: ' + error.message);
                                
                                // Reset button
                                btn.innerHTML = originalText;
                                btn.disabled = false;
                            });
                        */
                    });

                    // Forgot password functionality
                    document.getElementById('forgotPasswordBtn').addEventListener('click', function () {
                        const email = document.getElementById('username').value.trim();

                        if (!email) {
                            alert('Please enter your email address first.');
                            document.getElementById('username').focus();
                            return;
                        }

                        // Basic email validation
                        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                        if (!emailRegex.test(email)) {
                            alert('Please enter a valid email address.');
                            document.getElementById('username').focus();
                            return;
                        }

                        // Set the email in hidden form and submit
                        document.getElementById('forgotEmail').value = email;
                        document.getElementById('forgotPasswordForm').submit();
                    });

                    // Auto-hide alerts after 4 seconds
                    document.addEventListener('DOMContentLoaded', function () {
                        setTimeout(function () {
                            const alerts = document.querySelectorAll('.alert');
                            alerts.forEach(function (alert) {
                                const bsAlert = new bootstrap.Alert(alert);
                                bsAlert.close();
                            });
                        }, 4000);
                    });

                    // Enter key support for forgot password
                    document.getElementById('username').addEventListener('keypress', function (e) {
                        if (e.key === 'Enter') {
                            e.preventDefault();
                            document.getElementById('loginBtn').click();
                        }
                    });
					
					
					function togglePassword() {
					    const passwordField = document.getElementById("password");

					    if (passwordField.type === "password") {
					        passwordField.type = "text";   // show password
					    } else {
					        passwordField.type = "password"; // hide password
					    }
					}
                </script>


</body>

</html>