<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>Current Issue • NATURE AYURVED</title>

<!-- Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&family=Cinzel:wght@600&display=swap"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"
	rel="stylesheet">

<!-- Bootstrap (from reference design) -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
:root {
	--deep-green: rgb(30, 140, 193);
	--leaf: #2b8a5f;
	--gold: #c9a25a;
	--cream: #fbf6ee;
	--paper: #f7efe6;
	--text: #2d2d2d;
	--radius: 12px;
	--shadow: 0 10px 30px rgba(11, 74, 57, 0.06);
	--max-width: 1200px;
}

* {
	box-sizing: border-box;
}

html, body {
	overflow-x: hidden;
	max-width: 100%;
}

body {
	margin: 0;
	font-family: 'Poppins', sans-serif;
	background: var(--paper);
	color: var(--text);
	-webkit-font-smoothing: antialiased;
}

.container-main {
	max-width: var(--max-width);
	margin: 0 auto;
	padding: 0 20px;
}

/* PAGE HEADER (Current Issue) */
header {
	background: linear-gradient(180deg, rgba(11, 74, 57, 0.8),
		rgba(11, 74, 57, 0.4)),
		url('${pageContext.request.contextPath}/images/contact.png') center/cover
		no-repeat;
	color: white;
	padding: 60px 20px 65px;
	text-align: center;
	position: relative;
	border-bottom: 4px solid rgba(201, 162, 90, 0.25);
	box-shadow: 0 6px 18px rgba(0, 0, 0, 0.25);
}

header::after {
	content: "";
	position: absolute;
	bottom: 0;
	left: 50%;
	transform: translateX(-50%);
	width: 90px;
	height: 3px;
	background: var(--gold);
	border-radius: 2px;
}

header h1 {
	font-family: 'Cinzel', serif;
	font-size: 30px;
	margin: 0;
	color: var(--gold);
	text-shadow: 0 3px 14px rgba(0, 0, 0, 0.6);
	letter-spacing: 0.5px;
}

header p {
	margin-top: 10px;
	font-size: 15px;
	color: rgba(255, 255, 255, 0.92);
	text-shadow: 0 1px 6px rgba(0, 0, 0, 0.3);
}

section {
	padding: 50px 0;
}

/* Current Issue Styles */
.current-issue-section {
	padding: 40px 0;
}

.issue-header {
	text-align: center;
	margin-bottom: 40px;
}

.issue-header h1 {
	color: var(--deep-green);
	margin-bottom: 10px;
}

.issue-header .lead {
	color: var(--leaf);
	font-size: 1.2rem;
	font-weight: 500;
}

.search-section {
	margin-bottom: 30px;
}

.search-form {
	display: flex;
	max-width: 600px;
	margin: 0 auto;
}

.search-input {
	flex: 1;
	padding: 12px 16px;
	border: 2px solid #e0e0e0;
	border-radius: 8px 0 0 8px;
	font-size: 1rem;
}

.search-btn {
	background: var(--deep-green);
	color: white;
	border: none;
	padding: 12px 24px;
	border-radius: 0 8px 8px 0;
	cursor: pointer;
	font-weight: 500;
}

.articles-section {
	margin-top: 40px;
}

.section-title {
	color: var(--deep-green);
	border-bottom: 2px solid var(--gold);
	padding-bottom: 10px;
	margin-bottom: 30px;
}

.article-list {
	display: flex;
	flex-direction: column;
	gap: 25px;
}

.article-item {
	background: white;
	border-radius: 12px;
	padding: 25px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
	border-left: 4px solid var(--gold);
	transition: transform 0.3s, box-shadow 0.3s;
}

.article-item:hover {
	transform: translateY(-2px);
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.12);
}

.article-title {
	font-size: 1.3rem;
	font-weight: 600;
	color: var(--deep-green);
	margin-bottom: 12px;
	line-height: 1.4;
}

.article-meta {
	display: flex;
	gap: 20px;
	margin-bottom: 15px;
	flex-wrap: wrap;
	font-size: 0.9rem;
	color: #666;
}

.article-authors {
	font-weight: 500;
	color: var(--leaf);
}

.article-type-badge {
	background: var(--deep-green);
	color: white;
	padding: 4px 12px;
	border-radius: 20px;
	font-size: 0.8rem;
	font-weight: 500;
}

.article-abstract {
	color: #555;
	line-height: 1.6;
	margin-bottom: 20px;
}

.article-actions {
	display: flex;
	gap: 12px;
	flex-wrap: wrap;
}

.btn-abstract, .btn-pdf, .btn-view {
	padding: 8px 16px;
	border-radius: 6px;
	text-decoration: none;
	font-weight: 500;
	font-size: 0.9rem;
	transition: all 0.3s;
	border: none;
	cursor: pointer;
}

.btn-abstract {
	background: var(--leaf);
	color: white;
	padding: 8px 16px;
	border-radius: 6px;
	text-decoration: none;
	font-weight: 500;
	font-size: 0.9rem;
	transition: all 0.3s;
	border: none;
	cursor: pointer;
	display: inline-block;
}

.btn-abstract:hover {
	background: var(--deep-green);
	color: white;
}

.btn-view {
	background: #6c757d;
	color: white;
}

.btn-view:hover {
	background: #5a6268;
	color: white;
}

.btn-pdf {
	background: var(--gold);
	color: white;
}

.btn-pdf:hover {
	background: #b8934a;
	color: white;
}

.no-articles {
	text-align: center;
	padding: 60px 20px;
	color: #666;
}

footer span {
	color: var(--gold);
	font-weight: 600;
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
	header {
		padding: 50px 20px 60px;
	}
	header h1 {
		font-size: 28px;
	}
	header p {
		font-size: 14px;
	}
	.issue-header h1 {
		font-size: 28px;
	}
	.issue-header .lead {
		font-size: 1.1rem;
	}
	.search-form {
		max-width: 100%;
	}
	.article-title {
		font-size: 1.2rem;
	}
	.article-meta {
		font-size: 0.85rem;
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
	header {
		padding: 45px 15px 55px;
	}
	header h1 {
		font-size: 24px;
	}
	header p {
		font-size: 13px;
	}
	section {
		padding: 30px 0;
	}
	.current-issue-section {
		padding: 30px 0;
	}
	.issue-header {
		margin-bottom: 30px;
	}
	.issue-header h1 {
		font-size: 24px;
	}
	.issue-header .lead {
		font-size: 1rem;
	}
	.search-section {
		margin-bottom: 25px;
	}
	.search-form {
		flex-direction: column;
		gap: 10px;
	}
	.search-input {
		border-radius: 8px;
		width: 100%;
	}
	.search-btn {
		border-radius: 8px;
		width: 100%;
	}
	.article-item {
		padding: 20px;
	}
	.article-title {
		font-size: 1.1rem;
	}
	.article-meta {
		flex-direction: column;
		gap: 8px;
		font-size: 0.8rem;
	}
	.article-abstract {
		font-size: 0.9rem;
	}
	.article-actions {
		flex-direction: column;
		gap: 10px;
	}
	.btn-abstract, .btn-view, .btn-pdf {
		width: 100%;
		text-align: center;
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
	header {
		padding: 40px 15px 50px;
	}
	header h1 {
		font-size: 20px;
	}
	header p {
		font-size: 12px;
	}
	section {
		padding: 25px 0;
	}
	.current-issue-section {
		padding: 25px 0;
	}
	.issue-header {
		margin-bottom: 25px;
	}
	.issue-header h1 {
		font-size: 20px;
	}
	.issue-header .lead {
		font-size: 0.9rem;
	}
	.article-item {
		padding: 15px;
	}
	.article-title {
		font-size: 1rem;
		margin-bottom: 10px;
	}
	.article-meta {
		font-size: 0.75rem;
	}
	.article-abstract {
		font-size: 0.85rem;
		margin-bottom: 15px;
	}
	.btn-abstract, .btn-view, .btn-pdf {
		font-size: 0.85rem;
		padding: 6px 12px;
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
	text-shadow: none !important;
	filter: none !important;
	opacity: 1 !important;
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

.header-logo img {
	height: 90px;
	width: 180px;
	object-fit: contain;
	max-width: 100%;
}

.heading-responsive {
    text-align: center;
    font-size: clamp(1.5rem, 4vw, 2.5rem);
    margin: 0;
}

.impact-factor {
	display: block;
	font-size: 20px;
	margin-top: 5px;
}
.header-title h1 {
    text-shadow: none !important;
}
</style>
</head>

<body>

	<!-- ========== TOP LOGO HEADER (AYUSCRIPT THEME) ========== -->
	<!-- 🌿 Brand Bar -->
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

	<!-- ========== NAVBAR (AYUSCRIPT THEME + YOUR LOGIN LOGIC) ========== -->
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
					<li class="nav-item"><a class="nav-link active"
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
	<!-- PAGE HEADER (Current Issue) -->
	<header>
		<h1>Current Issue</h1>
		<p>Latest Published Research Articles in Ayurveda</p>
	</header>

	<!-- Current Issue Content -->
	<section class="current-issue-section">
		<div class="container-main">
			<!-- Issue Header -->
			<div class="issue-header">
				<h1>Current Issue</h1>
				<p class="lead">${quarterInfo.displayYear}|Volume
					${quarterInfo.displayVolume}, Issue ${quarterInfo.displayIssue}</p>
				<p>
					Total Articles Published: <strong>${not empty publishedArticles ? publishedArticles.size() :
                    0}</strong>
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
											class="fas fa-user me-1"></i> <c:choose>
												<c:when test="${not empty article.authorNames}">
                                  ${fn:split(article.authorNames, '||')[0]}
                                  <c:if
														test="${fn:length(fn:split(article.authorNames, '||')) > 1}">
                                    et al.
                                  </c:if>
												</c:when>
												<c:otherwise>
                                  No Author
                                </c:otherwise>
											</c:choose>
										</span> <span> <i class="fas fa-calendar me-1"></i> <c:choose>
												<c:when test="${not empty article.publicationDate}">
                                  ${article.publicationDate.month} ${article.publicationDate.dayOfMonth},
                                  ${article.publicationDate.year}
                                </c:when>
												<c:otherwise>
													<c:if test="${not empty article.updatedAt}">
                                    ${article.updatedAt.month} ${article.updatedAt.dayOfMonth},
                                    ${article.updatedAt.year}
                                  </c:if>
												</c:otherwise>
											</c:choose>
										</span> <span class="article-type-badge">${article.articleType}</span>
									</div>
									<p class="article-abstract">
										<c:if test="${not empty article.abstractText}">
											<c:set var="abstractText" value="${article.abstractText}" />
											<c:choose>
												<c:when test="${fn:length(abstractText) > 200}">
                                  ${fn:substring(abstractText, 0, 200)}...
                                </c:when>
												<c:otherwise>
                                  ${abstractText}
                                </c:otherwise>
											</c:choose>
										</c:if>
										<c:if test="${empty article.abstractText}">
                              No abstract available.
                            </c:if>
									</p>
									<div class="article-actions">
										<!-- 1. View Abstract Button - Opens only abstract -->
										<a
											href="${pageContext.request.contextPath}/article/${article.id}/abstract"
											class="btn-abstract" target="_blank"> <i
											class="fas fa-eye me-1"></i> View Abstract
										</a>

										<!-- 2. View Full HTML Button - Opens complete article with all fields -->
										<a
											href="${pageContext.request.contextPath}/article/${article.id}"
											class="btn-view" target="_blank"> <i
											class="fas fa-file-alt me-1"></i> View Full Article
										</a>

										<!-- 3. Download PDF Button -->
										<c:if test="${not empty article.referencePdfPath}">
											<a
												href="${pageContext.request.contextPath}/preview/${article.id}"
												target="_blank" class="btn btn-primary"> <i
												class="fas fa-eye"></i> Preview PDF
											</a>
										</c:if>




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
								class="btn-view"
								style="display: inline-block; margin-top: 15px;"> <i
								class="fas fa-upload me-1"></i> Submit Your Article
							</a>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</section>

	<!-- ===== Footer ===== -->

	<!-- ===== Footer ===== -->
	<footer class="bg-dark text-light pt-5 pb-3"
		style="background: var(--deep-green) !important;">
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
				Copyright © 2026 NATURE AYURVED | All Rights Reserved | <a href="#"
					class="text-light text-decoration-none">Privacy Policy</a>
			</div>

		</div>
	</footer>




	<!-- Bootstrap JS (for navbar toggler) -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

	<script>
            // Simple search functionality
            document.querySelector('.search-form').addEventListener('submit', function (e) {
              e.preventDefault();
              const searchTerm = document.querySelector('.search-input').value.toLowerCase();
              const articles = document.querySelectorAll('.article-item');

              articles.forEach(article => {
                const title = article.querySelector('.article-title').textContent.toLowerCase();
                const authors = article.querySelector('.article-authors').textContent.toLowerCase();
                const abstractText = article.querySelector('.article-abstract').textContent.toLowerCase();

                if (title.includes(searchTerm) || authors.includes(searchTerm) || abstractText.includes(searchTerm)) {
                  article.style.display = 'block';
                } else {
                  article.style.display = 'none';
                }
              });
            });
          </script>

</body>

</html>