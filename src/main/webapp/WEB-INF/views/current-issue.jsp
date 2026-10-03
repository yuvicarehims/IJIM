<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Current Issue - NATURE AYURVED</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"
	rel="stylesheet">

<style>
:root {
	--deep-green: #0b5633;
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
	padding: 0;
	z-index: 1020;
}

.topbar .navbar-nav {
	width: 100%;
	justify-content: space-between;
}

.topbar .nav-link {
	color: #fff !important;
	font-weight: 600;
	text-transform: uppercase;
	transition: var(--transition);
	font-size: 14px;
	padding: 15px 18px !important;
	position: relative;
}

.topbar .nav-link:hover, .topbar .nav-link.active {
	color: var(--gold) !important;
	background-color: rgba(255, 255, 255, 0.1);
}

.topbar .nav-link::after {
	content: '';
	position: absolute;
	bottom: 0;
	left: 50%;
	transform: translateX(-50%) scaleX(0);
	width: calc(100% - 40px);
	height: 3px;
	background-color: var(--gold);
	transition: transform 0.3s ease;
}

.topbar .nav-link:hover::after, .topbar .nav-link.active::after {
	transform: translateX(-50%) scaleX(1);
}

/* ===== Section Styling ===== */
.section-padding {
	padding: 80px 0;
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

/* ===== Current Issue Content ===== */
.current-issue-section {
	background-color: white;
}

.current-issue-section h2 {
	color: var(--rust);
}

.issue-header {
	background: linear-gradient(rgba(122, 75, 58, 0.9),
		rgba(122, 75, 58, 0.9)),
		url('https://img.freepik.com/premium-photo/blurred-vintage-paper-texture-background_10307-1536.jpg')
		no-repeat center center/cover;
	color: #fff;
	padding: 60px 0;
	text-align: center;
	border-radius: var(--radius);
	margin-bottom: 40px;
}

.issue-header h1 {
	color: #fff;
	font-family: 'Georgia', serif;
	font-weight: 700;
	font-size: 2.5rem;
	margin-bottom: 10px;
}

.issue-header .lead {
	color: var(--gold);
	font-size: 1.3rem;
	font-weight: 600;
}

.search-section {
	background: var(--paper);
	padding: 30px;
	border-radius: var(--radius);
	box-shadow: var(--shadow);
	margin-bottom: 40px;
}

.search-form {
	display: flex;
	gap: 15px;
	max-width: 800px;
	margin: 0 auto;
}

.search-input {
	flex: 1;
	padding: 15px 20px;
	border: 2px solid #e0e0e0;
	border-radius: 50px;
	font-size: 1rem;
	transition: var(--transition);
}

.search-input:focus {
	outline: none;
	border-color: var(--leaf);
	box-shadow: 0 0 0 3px rgba(43, 138, 95, 0.1);
}

.search-btn {
	background: var(--deep-green);
	color: white;
	padding: 15px 35px;
	border: none;
	border-radius: 50px;
	font-weight: 600;
	cursor: pointer;
	transition: var(--transition);
	white-space: nowrap;
}

.search-btn:hover {
	background: var(--leaf);
	transform: translateY(-2px);
	box-shadow: 0 5px 15px rgba(11, 86, 51, 0.3);
}

/* ===== Articles List ===== */
.articles-section {
	background: white;
	padding: 40px;
	border-radius: var(--radius);
	box-shadow: var(--shadow);
}

.section-title {
	color: var(--deep-green);
	font-family: 'Georgia', serif;
	font-weight: 700;
	font-size: 2rem;
	margin-bottom: 30px;
	padding-bottom: 15px;
	border-bottom: 3px solid var(--gold);
}

.article-list {
	display: flex;
	flex-direction: column;
	gap: 25px;
}

.article-item {
	background: var(--paper);
	padding: 30px;
	border: 2px solid #e8f5e8;
	border-radius: var(--radius);
	transition: var(--transition);
	border-left: 5px solid var(--gold);
}

.article-item:hover {
	border-color: var(--leaf);
	box-shadow: 0 8px 25px rgba(43, 138, 95, 0.15);
	transform: translateY(-3px);
}

.article-title {
	color: var(--deep-green);
	font-size: 1.4rem;
	font-weight: 600;
	margin-bottom: 10px;
	text-decoration: none;
	display: block;
	font-family: 'Georgia', serif;
	transition: var(--transition);
}

.article-title:hover {
	color: var(--rust);
}

.article-meta {
	color: var(--rust);
	font-size: 0.95rem;
	margin-bottom: 15px;
	display: flex;
	flex-wrap: wrap;
	gap: 15px;
	align-items: center;
}

.article-authors {
	font-weight: 600;
	color: var(--text);
}

.article-abstract {
	color: var(--text);
	line-height: 1.7;
	margin-bottom: 20px;
	font-size: 1rem;
}

.article-actions {
	display: flex;
	gap: 15px;
	align-items: center;
	flex-wrap: wrap;
}

.btn {
	padding: 10px 20px;
	border: none;
	border-radius: 6px;
	font-weight: 600;
	text-decoration: none;
	cursor: pointer;
	transition: var(--transition);
	display: inline-flex;
	align-items: center;
	gap: 8px;
	font-size: 0.95rem;
}

.btn-abstract {
	background: #3498db;
	color: white;
}

.btn-abstract:hover {
	background: #2980b9;
	transform: translateY(-2px);
	box-shadow: 0 5px 15px rgba(52, 152, 219, 0.3);
}

.btn-html {
	background: #2ecc71;
	color: white;
}

.btn-html:hover {
	background: #27ae60;
	transform: translateY(-2px);
	box-shadow: 0 5px 15px rgba(46, 204, 113, 0.3);
}

.btn-pdf {
	background: #e74c3c;
	color: white;
}

.btn-pdf:hover {
	background: #c0392b;
	transform: translateY(-2px);
	box-shadow: 0 5px 15px rgba(231, 76, 60, 0.3);
}

.doi-badge {
	background: #e3f2fd;
	color: #1565c0;
	padding: 6px 12px;
	border-radius: 20px;
	font-size: 0.85rem;
	font-family: monospace;
	font-weight: 500;
}

.no-articles {
	text-align: center;
	color: var(--rust);
	padding: 60px 20px;
	font-style: italic;
	background: var(--paper);
	border-radius: var(--radius);
}

.no-articles h3 {
	color: var(--deep-green);
	margin-bottom: 15px;
	font-family: 'Georgia', serif;
}

/* ===== Pagination ===== */
.pagination {
	display: flex;
	justify-content: center;
	gap: 8px;
	margin-top: 40px;
}

.pagination-btn {
	padding: 12px 20px;
	border: 2px solid var(--deep-green);
	background: white;
	color: var(--deep-green);
	text-decoration: none;
	border-radius: 6px;
	transition: var(--transition);
	font-weight: 600;
}

.pagination-btn:hover {
	background: var(--deep-green);
	color: white;
	transform: translateY(-2px);
}

.pagination-btn.active {
	background: var(--deep-green);
	color: white;
	border-color: var(--deep-green);
}

/* ===== PDF Modal Styles ===== */
.pdf-modal-overlay {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.7);
	z-index: 9999;
	overflow-y: auto;
	padding: 20px;
}

.pdf-modal-overlay.show {
	display: flex;
	align-items: center;
	justify-content: center;
}

.pdf-modal-content {
	background: white;
	border-radius: var(--radius);
	box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
	max-width: 900px;
	width: 100%;
	max-height: 90vh;
	overflow-y: auto;
	position: relative;
	animation: modalFadeIn 0.3s ease;
}

@
keyframes modalFadeIn {from { opacity:0;
	transform: scale(0.9);
}

to {
	opacity: 1;
	transform: scale(1);
}

}
.pdf-modal-header {
	background: linear-gradient(135deg, var(--deep-green), var(--leaf));
	color: white;
	padding: 25px 30px;
	border-radius: var(--radius) var(--radius) 0 0;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.pdf-modal-header h2 {
	margin: 0;
	font-family: 'Georgia', serif;
	font-size: 1.8rem;
	font-weight: 700;
}

.pdf-modal-close {
	background: rgba(255, 255, 255, 0.2);
	border: none;
	color: white;
	font-size: 1.5rem;
	width: 40px;
	height: 40px;
	border-radius: 50%;
	cursor: pointer;
	transition: var(--transition);
	display: flex;
	align-items: center;
	justify-content: center;
}

.pdf-modal-close:hover {
	background: rgba(255, 255, 255, 0.3);
	transform: rotate(90deg);
}

.pdf-modal-body {
	padding: 30px;
}

.pdf-modal-detail {
	margin-bottom: 20px;
	padding-bottom: 20px;
	border-bottom: 1px solid #e0e0e0;
}

.pdf-modal-detail:last-child {
	border-bottom: none;
}

.pdf-modal-detail-label {
	font-weight: 700;
	color: var(--deep-green);
	font-size: 0.95rem;
	text-transform: uppercase;
	letter-spacing: 0.5px;
	margin-bottom: 8px;
}

.pdf-modal-detail-value {
	color: var(--text);
	font-size: 1rem;
	line-height: 1.6;
}

.pdf-modal-abstract {
	background: var(--paper);
	padding: 20px;
	border-radius: 8px;
	border-left: 4px solid var(--gold);
}

.pdf-modal-footer {
	padding: 25px 30px;
	background: var(--paper);
	border-radius: 0 0 var(--radius) var(--radius);
	display: flex;
	justify-content: flex-end;
	gap: 15px;
	border-top: 2px solid #e0e0e0;
}

.pdf-modal-btn {
	padding: 12px 30px;
	border: none;
	border-radius: 6px;
	font-weight: 600;
	cursor: pointer;
	transition: var(--transition);
	display: inline-flex;
	align-items: center;
	gap: 8px;
	font-size: 1rem;
}

.pdf-modal-btn-print {
	background: var(--leaf);
	color: white;
}

.pdf-modal-btn-print:hover {
	background: #27ae60;
	transform: translateY(-2px);
	box-shadow: 0 5px 15px rgba(46, 204, 113, 0.3);
}

.pdf-modal-btn-download {
	background: #e74c3c;
	color: white;
}

.pdf-modal-btn-download:hover {
	background: #c0392b;
	transform: translateY(-2px);
	box-shadow: 0 5px 15px rgba(231, 76, 60, 0.3);
}

.pdf-modal-btn-cancel {
	background: #95a5a6;
	color: white;
}

.pdf-modal-btn-cancel:hover {
	background: #7f8c8d;
	transform: translateY(-2px);
	box-shadow: 0 5px 15px rgba(149, 165, 166, 0.3);
}

@media ( max-width : 768px) {
	.pdf-modal-content {
		max-width: 95%;
		margin: 10px;
	}
	.pdf-modal-header {
		padding: 20px;
	}
	.pdf-modal-header h2 {
		font-size: 1.4rem;
	}
	.pdf-modal-body {
		padding: 20px;
	}
	.pdf-modal-footer {
		flex-direction: column;
		padding: 20px;
	}
	.pdf-modal-btn {
		width: 100%;
		justify-content: center;
	}
}

/* ===== Footer ===== */
.footer {
	background-color: var(--deep-green);
	color: var(--cream);
	padding: 60px 0 20px;
	margin-top: 60px;
}

.footer a {
	color: #fff;
	text-decoration: none;
	transition: var(--transition);
}

.footer a:hover {
	color: var(--gold);
}

.footer h5 {
	color: var(--gold);
	margin-bottom: 20px;
	font-family: 'Georgia', serif;
	font-weight: 600;
	font-size: 1.3rem;
}

.footer-links {
	list-style: none;
	padding-left: 0;
}

.footer-links li {
	margin-bottom: 10px;
}

.footer-bottom {
	border-top: 1px solid rgba(255, 255, 255, 0.15);
	padding-top: 20px;
	margin-top: 40px;
	text-align: center;
	font-size: 14px;
}

.social-icons a {
	font-size: 1.5rem;
	margin-right: 15px;
}

/* ===== Responsive Adjustments ===== */
@media ( max-width : 992px) {
	.logo-text {
		font-size: 28px;
	}
	.topbar .navbar-nav {
		justify-content: flex-start;
	}
	.topbar .nav-link {
		padding: 10px 15px !important;
		font-size: 14px;
	}
	.topbar .nav-item {
		margin: 0 5px;
	}
	.topbar .nav-link::after {
		width: calc(100% - 30px);
	}
	.search-form {
		flex-direction: column;
	}
	.search-btn {
		width: 100%;
	}
}

@media ( max-width : 768px) {
	.brand-bar .d-flex:last-child {
		display: none !important;
	}
	.logo-text {
		font-size: 24px;
	}
	.logo-subtitle {
		display: none;
	}
	.section-padding {
		padding: 50px 0;
	}
	.articles-section {
		padding: 25px;
	}
	.article-item {
		padding: 20px;
	}
	.article-actions {
		flex-direction: column;
		align-items: flex-start;
	}
	.article-actions .btn {
		width: 100%;
		justify-content: center;
	}
	.topbar .navbar-collapse {
		background-color: var(--deep-green);
		border-top: 1px solid rgba(255, 255, 255, 0.1);
	}
	.topbar .nav-link {
		padding: 10px 20px !important;
	}
	.topbar .nav-link::after {
		display: none;
	}
	.topbar .d-flex {
		flex-direction: column;
		padding: 10px;
	}
	.topbar .d-flex .btn-sm {
		width: 100%;
		margin: 5px 0 !important;
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
	<%
	// JSP Logic - Session and Application Data
	String username = (String) session.getAttribute("username");
	Boolean isLoggedIn = (Boolean) session.getAttribute("isLoggedIn");
	String userRole = (String) session.getAttribute("userRole");

	// Application context data
	Integer totalArticles = (Integer) application.getAttribute("totalArticles");
	Integer currentIssue = (Integer) application.getAttribute("currentIssue");
	String submissionDeadline = (String) application.getAttribute("submissionDeadline");

	// Initialize default values if null
	if (totalArticles == null)
		totalArticles = 0;
	if (currentIssue == null)
		currentIssue = 1;
	if (submissionDeadline == null)
		submissionDeadline = "March 31, 2025";

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
						<img src="${pageContext.request.contextPath}/images/Logo_1-removebg-previewfooter.png"
							alt="AYUSCRIPT Logo" class="header-logo img-fluid">
					</h1>
				</div>

				<div class="header-issn px-3 px-md-4 px-lg-5">
					<span class="">ISSN: 3139-8871</span> <span
						class="">ISSN: 3139-8871</span>
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
		<div class="container-main">
			<a class="navbar-brand d-lg-none"
				href="${pageContext.request.contextPath}/">AYUSCRIPT</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navMain"
				aria-controls="navMain" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
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
					<li class="nav-item"><a class="nav-link active"
						href="${pageContext.request.contextPath}/current-issue">Current
							Issue</a></li>

					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/submit-article">Submit
							Article</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/author-guideline">Author
							Guideline</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/contact">Contact</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/policy" target="_blank">Policy</a></li>
				</ul>

				<div class="d-flex ms-lg-auto">
					<c:choose>
						<c:when test="${sessionScope.isLoggedIn}">
							<a class="btn btn-outline-light btn-sm me-2"
								href="${pageContext.request.contextPath}/dashboard"> <i
								class="fas fa-tachometer-alt"></i> Dashboard
							</a>
							<a class="btn btn-light btn-sm"
								href="${pageContext.request.contextPath}/logout"> <i
								class="fas fa-sign-out-alt"></i> Logout
							</a>
						</c:when>
						<c:otherwise>
							<a class="btn btn-outline-light btn-sm me-2"
								href="${pageContext.request.contextPath}/login"> <i
								class="fas fa-sign-in-alt"></i> Login
							</a>
							<a class="btn btn-light btn-sm"
								href="${pageContext.request.contextPath}/register"> <i
								class="fas fa-user-plus"></i> Register
							</a>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</nav>

	<!-- Current Issue Content -->
	<section class="current-issue-section section-padding">
		<div class="container-main">
			<!-- Issue Header -->
			<div class="issue-header">
				<h1>Current Issue</h1>
				<p class="lead">January - March 2025 | Volume
					${applicationScope.currentIssue}, Issue 1</p>
				<p>
					Total Articles Published: <strong>${applicationScope.totalArticles}</strong>
				</p>
			</div>

			<!-- Search Section -->
			<div class="search-section">
				<form class="search-form">
					<input type="text" class="search-input"
						placeholder="Search articles by title, author, or keywords...">
					<button type="submit" class="search-btn">
						<i class="fas fa-search me-2"></i> Search
					</button>
				</form>
			</div>

			<!-- Articles List -->
			<div class="articles-section">
				<h2 class="section-title">Published Articles</h2>

				<c:choose>
					<c:when test="${not empty publishedArticles}">
						<div class="article-list">
							<c:forEach var="article" items="${publishedArticles}">
								<div class="article-item">
									<div class="article-title">${article.title}</div>
									<div class="article-meta">
										<span class="article-authors"> <i
											class="fas fa-user me-1"></i> ${article.author.fullName}
										</span> <span> <i class="fas fa-calendar me-1"></i> Published:
											${article.updatedAt}
										</span>
									</div>
									<p class="article-abstract">
										<c:choose>
											<c:when
												test="${not empty article.content && article.content.length() > 200}">
                                                ${article.content.substring(0, 200)}...
                                            </c:when>
											<c:otherwise>
                                                ${article.content}
                                            </c:otherwise>
										</c:choose>
									</p>
									<div class="article-actions">
										<a
											href="${pageContext.request.contextPath}/published/abstract/${article.id}"
											class="btn btn-abstract" target="_blank"> <i
											class="fas fa-eye me-1"></i> Abstract
										</a> <a
											href="${pageContext.request.contextPath}/published/html/${article.id}"
											class="btn btn-html" target="_blank"> <i
											class="fas fa-file-alt me-1"></i> HTML Full Text
										</a>
										<button type="button" class="btn btn-pdf"
											data-article-id="${article.id}"
											data-article-title="${fn:escapeXml(article.title)}"
											data-article-author="${fn:escapeXml(article.author.fullName)}"
											data-article-date="${article.updatedAt}"
											data-article-content="${fn:escapeXml(article.content)}"
											onclick="showPdfModalFromButton(this)">
											<i class="fas fa-download me-1"></i> PDF
										</button>
									</div>
								</div>
							</c:forEach>
						</div>
					</c:when>
					<c:otherwise>
						<div class="no-articles">
							<h3>No articles published yet.</h3>
							<p>Check back later for published research articles.</p>
							<a href="${pageContext.request.contextPath}/submit-article"
								class="btn btn-pdf mt-3"> <i class="fas fa-upload me-1"></i>
								Submit Your Article
							</a>
						</div>
					</c:otherwise>
				</c:choose>

				<!-- Pagination -->
				<div class="pagination">
					<a href="#" class="pagination-btn active">1</a> <a href="#"
						class="pagination-btn">2</a> <a href="#" class="pagination-btn">3</a>
					<a href="#" class="pagination-btn">Next <i
						class="fas fa-chevron-right ms-1"></i></a>
				</div>
			</div>
		</div>
	</section>

	<!-- Footer -->
	<!-- ===== Footer ===== -->
	<footer class="footer"
		style="background:rgb(17, 23, 9); color: var(--cream); padding: 60px 0 25px;">
		<div class="container">

			<div class="row">

				<!-- LOGO AND ADDRESS (COMPLETELY LEFT ALIGNED) -->
				<div class="col-lg-4 mb-4" style="padding-left: 0;">
					<div class="footer-logo mb-3">
						<!-- Logo fully left -->
						<div style="margin-left: 0; padding-left: 0;">
							<img src="${pageContext.request.contextPath}/images/Logonew.jpg"
								alt="logo"
								style="height: 80px; margin-bottom: 15px; margin-left: 0;">
							<div
								style="font-size: 28px; font-family: Georgia, serif; color: var(--gold); font-weight: 700; margin-bottom: 10px; margin-left: 0;">
								AYUSCRIPT</div>
							<div
								style="font-size: 11px; font-weight: 600; color: #d4a96a; text-transform: uppercase; margin-bottom: 20px; margin-left: 0;">
								International Ayurvedic Research Journal</div>
						</div>
					</div>

					<!-- Address information also fully left -->
					<div style="margin-left: 0; padding-left: 0;">
						<p class="mb-2"
							style="font-size: 14px; line-height: 1.5; margin-left: 0;">
							Flat No: 004, Rauf Arcade, Near Mohan Palms,<br> Shingnan,
							Radlapur, Thane 421 303
						</p>
						<p class="mb-2" style="font-size: 14px; margin-left: 0;">Email:
							aysscriptjournal@gmail.com</p>
						<p class="mb-2" style="font-size: 14px; margin-left: 0;">Mobile:
							9324737097</p>
						<p class="mb-2 mt-3" style="font-size: 14px; margin-left: 0;">Editor-in-Chief
							Dr. Vishnu Bawane</p>
						<p class="mb-2" style="font-size: 14px; margin-left: 0;">Email:
							drvcbawane@gmail.com</p>
						<p class="mb-2" style="font-size: 14px; margin-left: 0;">Mobile:
							9324737097</p>
					</div>
				</div>

				<!-- Quick Links -->
				<div class="col-lg-2 mb-4">
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

	<!-- PDF Modal -->
	<div id="pdfModal" class="pdf-modal-overlay">
		<div class="pdf-modal-content">
			<div class="pdf-modal-header">
				<h2>
					<i class="fas fa-file-pdf me-2"></i>Article Details
				</h2>
				<button type="button" class="pdf-modal-close"
					onclick="closePdfModal()">
					<i class="fas fa-times"></i>
				</button>
			</div>
			<div class="pdf-modal-body">
				<div class="pdf-modal-detail">
					<div class="pdf-modal-detail-label">
						<i class="fas fa-heading me-2"></i>Title
					</div>
					<div class="pdf-modal-detail-value" id="modalTitle"></div>
				</div>
				<div class="pdf-modal-detail">
					<div class="pdf-modal-detail-label">
						<i class="fas fa-user me-2"></i>Author
					</div>
					<div class="pdf-modal-detail-value" id="modalAuthor"></div>
				</div>
				<div class="pdf-modal-detail">
					<div class="pdf-modal-detail-label">
						<i class="fas fa-calendar me-2"></i>Published Date
					</div>
					<div class="pdf-modal-detail-value" id="modalDate"></div>
				</div>
				<div class="pdf-modal-detail">
					<div class="pdf-modal-detail-label">
						<i class="fas fa-align-left me-2"></i>Content
					</div>
					<div class="pdf-modal-detail-value pdf-modal-abstract"
						id="modalContent"></div>
				</div>
			</div>
			<div class="pdf-modal-footer">
				<button type="button" class="pdf-modal-btn pdf-modal-btn-print"
					onclick="printArticle()">
					<i class="fas fa-print"></i> Print
				</button>
				<button type="button" class="pdf-modal-btn pdf-modal-btn-download"
					id="modalDownloadBtn">
					<i class="fas fa-download"></i> Download PDF
				</button>
				<button type="button" class="pdf-modal-btn pdf-modal-btn-cancel"
					onclick="closePdfModal()">
					<i class="fas fa-times"></i> Cancel
				</button>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script>
        // Set context path for JavaScript
        const contextPath = '${pageContext.request.contextPath}';
        let currentArticleId = null;

        function showPdfModalFromButton(button) {
            const articleId = button.getAttribute('data-article-id');
            const title = button.getAttribute('data-article-title') || 'N/A';
            const author = button.getAttribute('data-article-author') || 'N/A';
            const date = button.getAttribute('data-article-date') || 'N/A';
            const content = button.getAttribute('data-article-content') || 'No content available.';
            
            showPdfModal(articleId, title, author, date, content);
        }

        function showPdfModal(articleId, title, author, date, content) {
            currentArticleId = articleId;
            
            // Set modal content
            document.getElementById('modalTitle').textContent = title;
            document.getElementById('modalAuthor').textContent = author;
            document.getElementById('modalDate').textContent = date;
            
            // Handle content - limit display if too long
            const contentElement = document.getElementById('modalContent');
            if (content && content.length > 1000) {
                contentElement.textContent = content.substring(0, 1000) + '...';
            } else {
                contentElement.textContent = content;
            }
            
            // Set download button action
            const downloadBtn = document.getElementById('modalDownloadBtn');
            downloadBtn.onclick = function() {
                downloadPdf(articleId);
            };
            
            // Show modal
            const modal = document.getElementById('pdfModal');
            modal.classList.add('show');
            document.body.style.overflow = 'hidden';
        }

        function closePdfModal() {
            const modal = document.getElementById('pdfModal');
            modal.classList.remove('show');
            document.body.style.overflow = 'auto';
            currentArticleId = null;
        }

        function downloadPdf(articleId) {
            // Open PDF in new tab using viewer page (embeds PDF in iframe)
            const viewerUrl = contextPath + '/pdf-viewer/' + articleId;
            window.open(viewerUrl, '_blank');
            
            // Close modal after opening PDF
            setTimeout(function() {
                closePdfModal();
            }, 300);
        }

        function printArticle() {
            // Create a print-friendly version
            const printWindow = window.open('', '_blank');
            const title = document.getElementById('modalTitle').textContent;
            const author = document.getElementById('modalAuthor').textContent;
            const date = document.getElementById('modalDate').textContent;
            const content = document.getElementById('modalContent').textContent;
            
            printWindow.document.write(`
                <!DOCTYPE html>
                <html>
                <head>
                    <title>${title}</title>
                    <style>
                        body {
                            font-family: Arial, sans-serif;
                            max-width: 800px;
                            margin: 40px auto;
                            padding: 20px;
                            line-height: 1.6;
                        }
                        h1 {
                            color: #0b5633;
                            border-bottom: 3px solid #c9a25a;
                            padding-bottom: 10px;
                        }
                        .meta {
                            margin: 20px 0;
                            padding: 15px;
                            background: #f7efe6;
                            border-left: 4px solid #c9a25a;
                        }
                        .content {
                            margin-top: 30px;
                            text-align: justify;
                        }
                        @media print {
                            body { margin: 20px; }
                        }
                    </style>
                </head>
                <body>
                    <h1>${title}</h1>
                    <div class="meta">
                        <p><strong>Author:</strong> ${author}</p>
                        <p><strong>Published Date:</strong> ${date}</p>
                    </div>
                    <div class="content">
                        <h3>Content</h3>
                        <p>${content}</p>
                    </div>
                </body>
                </html>
            `);
            printWindow.document.close();
            printWindow.focus();
            setTimeout(function() {
                printWindow.print();
                printWindow.close();
            }, 250);
        }

        // Close modal when clicking outside
        document.getElementById('pdfModal').addEventListener('click', function(e) {
            if (e.target === this) {
                closePdfModal();
            }
        });

        // Close modal on Escape key
        document.addEventListener('keydown', function(e) {
            if (e.key === 'Escape') {
                closePdfModal();
            }
        });
    </script>
</body>
</html>