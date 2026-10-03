<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>IJIM | Home</title>
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

@media ( max-width : 991.98px) {
	.navbar-custom .navbar-collapse {
		background: rgba(33, 79, 55, 0.98);
		margin-top: 10px;
		padding: 15px;
		border-radius: 8px;
	}
	.navbar-custom .nav-link {
		padding: 12px 15px !important;
		border-bottom: 1px solid rgba(255, 255, 255, 0.1);
	}
	.navbar-custom .nav-link:last-child {
		border-bottom: none;
	}
	.navbar-custom .nav-link::after {
		display: none;
	}
}

.navbar-custom .nav-link:hover, .navbar-custom .nav-link.active {
	color: var(--gold) !important;
	background-color: rgba(255, 255, 255, 0.1);
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

.navbar-custom .nav-link.active::after, .navbar-custom .nav-link:hover::after
	{
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
	box-shadow: 0px 2px 8px rgba(0, 0, 0, 0.18);
}

.navbar-custom .btn-light:hover {
	box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.25);
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
	background: rgba(0, 0, 0, 0.3);
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
	background: rgba(255, 255, 255, 0.1);
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
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
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
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
}

/* FOOTER */
footer {
	background: var(--deep-green) !important;
}

.justified-text {
	text-align: justify;
	line-height: 1.6; /* improves readability */
}
/* RESPONSIVE BREAKPOINTS */
/* Extra Large Devices (Large Desktops, 1200px and up) */
@media ( min-width : 1200px) {
	.hero-text-overlay {
		max-width: 650px;
	}
}

/* Large Devices (Desktops, 992px and up) */
@media ( max-width : 1199.98px) {
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
@media ( max-width : 991.98px) {
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
@media ( max-width : 767.98px) {
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
@media ( max-width : 575.98px) {
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
	footer .col-lg-4, footer .col-lg-2, footer .col-lg-3 {
		margin-bottom: 30px;
	}
}

/* Very Small Devices (less than 400px) */
@media ( max-width : 399.98px) {
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
	background-color: rgba(255, 255, 255, 0.5);
	border: 2px solid rgba(255, 255, 255, 0.8);
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

@
keyframes scroll-left { 0% {
	transform: translateX(0);
}

100




















%
{
transform




















:




















translateX


















(




















-100


















%
)


















;
}
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

/* ================= CURRENT ISSUE ================= */
.current-issue-section {
	width: 100%;
	min-height: 520px;
	padding: 45px 30px;
	box-sizing: border-box;
	/* Screenshot jaisa dark background */
	background: linear-gradient(rgba(0, 20, 30, 0.90),
		rgba(20, 35, 15, 0.90)),
		url("https://images.unsplash.com/photo-1530026405186-ed1f139313f8?auto=format&fit=crop&w=1600&q=80");
	background-size: cover;
	background-position: center;
}

/* Main container */
.current-issue-container {
	max-width: 1170px;
	margin: 0 auto;
	display: flex;
	gap: 30px;
	box-sizing: border-box;
}

.current-issue-articles {
    flex: 1;
    height: 500px;
    overflow-y: auto;
    overflow-x: hidden;
}
/* ================= JOURNAL COVER ================= */
.journal-cover {
	width: 370px;
	flex-shrink: 0;
}

.journal-cover img {
	width: 100%;
	height: auto;
	display: block;
	object-fit: cover;
}

/* ================= ARTICLES ================= */
.current-issue-articles {
	flex: 1;
	color: white;
	max-height: 500px;
    overflow-y: auto;
    /* Scrollbar */
    scrollbar-width: thin;
    scrollbar-color: #ccc transparent;
}

/* Heading */
.current-issue-heading {
	text-align: center;
	font-family: Georgia, "Times New Roman", serif;
	font-size: 32px;
	font-weight: normal;
	margin: -15px 0 35px;
	color: white;
}

/* Article */
.issue-article {
	padding: 0 0 18px;
	margin-bottom: 12px;
	border-bottom: 2px solid rgba(255, 255, 255, 0.75);
}

/* Year / Volume / Issue */
.issue-meta {
	font-size: 16px;
	line-height: 1.8;
	margin-bottom: 15px;
	color: #ffffff;
}

.issue-meta span {
	margin: 0 5px;
}

/* Labels */
.article-title-label, .article-author-label {
	font-size: 17px;
	font-weight: 600;
	margin-bottom: 2px;
	color: #ffffff;
}

/* Article title */
.article-title {
	font-size: 16px;
	line-height: 1.9;
	margin-bottom: 4px;
	color: #ffffff;
}

/* Author */
.article-author {
	font-size: 16px;
	line-height: 1.8;
	margin-bottom: 5px;
	color: #ffffff;
}

/* Links */
.article-links {
	font-size: 16px;
	margin-top: 8px;
}

.article-links a {
	color: #ffffff;
	text-decoration: none;
	margin-right: 5px;
}

.article-links a:hover {
	color: #8dc63f;
}

/* More Article */
.more-article {
	text-align: right;
	margin-top: 8px;
}

.more-article a {
	color: #1686d9;
	font-size: 16px;
	text-decoration: none;
}

.more-article a:hover {
	text-decoration: underline;
}

/* ================= RESPONSIVE ================= */
@media ( max-width : 768px) {
	.current-issue-container {
		flex-direction: column;
	}
	.journal-cover {
		width: 100%;
		max-width: 370px;
		margin: 0 auto;
	}
	.current-issue-heading {
		margin-top: 20px;
	}
}

/* ================= INSTRUCTIONS SECTION ================= */
.instructions-section {
	width: 100%;
	padding: 40px 30px;
	box-sizing: border-box;
	background: #ffffff;
}

/* Main Container */
.instructions-container {
	max-width: 1170px;
	margin: 0 auto;
	box-sizing: border-box;
}

/* Heading */
.instructions-heading {
	font-family: Georgia, "Times New Roman", serif;
	font-size: 30px;
	font-weight: normal;
	color: #333333;
	margin: 0 0 25px;
	text-align: left;
}

/* Text */
.instructions-text {
	font-size: 16px;
	line-height: 1.8;
	color: #333333;
	margin: 0 0 15px;
}

/* Link */
.instructions-link {
	margin-top: 15px;
}

.instructions-link a {
	color: #1686d9;
	font-size: 16px;
	text-decoration: none;
}

.instructions-link a:hover {
	color: #8dc63f;
	text-decoration: underline;
}

/* ================= RESPONSIVE ================= */
@media ( max-width : 768px) {
	.instructions-section {
		padding: 30px 20px;
	}
	.instructions-heading {
		font-size: 26px;
	}
	.instructions-text {
		font-size: 15px;
		line-height: 1.7;
	}
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
					<img src="${pageContext.request.contextPath}/images/IJIMlogo.png"
						alt="AYUSCRIPT Logo" class="header-logo img-fluid">
				</div>

				<div class="header-title">
					<h1 class="heading-responsive">
						<!-- <a href="https://www.ijim.co.in/home" target="_blank">
							International Journal of Indian Medicine <span
							style="font-size: 25px; text-shadow: 0px 0px rgba(128, 128, 128, 0.589); color: black; !important"
							class="impact-factor">IIFS Impact Factor: 4.125</span>
						</a> -->

						<div>
							International Journal of Indian Medicine <span
								class="impact-factor"> IIFS Impact Factor: 4.125 </span>
						</div>
					</h1>
				</div>

				<div class="header-issn px-3 px-md-4 px-lg-5">
					<span class="d-none d-md-inline">ISSN: 2582-7634</span> <span
						class="d-md-none">ISSN: 2582-7634 </span>
				</div>
			</div>
		</div>
	</header>


	<nav
		class="navbar navbar-expand-lg navbar-dark sticky-top navbar-custom">

		<div class="container-fluid px-3 px-md-4 px-lg-5">

			<a class="navbar-brand d-lg-none"
				href="${pageContext.request.contextPath}/"> <strong>NATURE
					AYURVED</strong>
			</a>

			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navMain"
				aria-controls="navMain" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navMain">

				<ul class="navbar-nav mx-auto mb-2 mb-lg-0 text-center">
					<li class="nav-item"><a
						class="nav-link ${page=='home'?'active':''}"
						href="${pageContext.request.contextPath}/">HOME</a></li>

					<li class="nav-item"><a
						class="nav-link ${page=='about'?'active':''}"
						href="${pageContext.request.contextPath}/about">ABOUT US</a></li>

					<li class="nav-item"><a
						class="nav-link ${page=='editorial'?'active':''}"
						href="${pageContext.request.contextPath}/editorial-board">EDITORIAL
							BOARD</a></li>

					<li class="nav-item"><a
						class="nav-link ${page=='current'?'active':''}"
						href="${pageContext.request.contextPath}/current-issue">CURRENT
							ISSUE</a></li>

					<li class="nav-item"><a
						class="nav-link ${page=='archives'?'active':''}"
						href="${pageContext.request.contextPath}/archives">ARCHIVES</a></li>

					<li class="nav-item"><a
						class="nav-link ${page=='submit'?'active':''}"
						href="${pageContext.request.contextPath}/login">SUBMIT ARTICLE</a>
					</li>

					<li class="nav-item"><a
						class="nav-link ${page=='guideline'?'active':''}"
						href="${pageContext.request.contextPath}/author-guideline">AUTHOR
							GUIDELINE</a></li>

					<li class="nav-item"><a
						class="nav-link ${page=='contact'?'active':''}"
						href="${pageContext.request.contextPath}/contact">CONTACT</a></li>

					<%-- <li class="nav-item"><a
						class="nav-link ${page=='policy'?'active':''}"
						href="${pageContext.request.contextPath}/policy">POLICY</a></li>
					<li class="nav-item"><a class="nav-link"
						href="https://www.vidyavishva.com/" target="_blank">VIDYAVISHVA</a>
					</li> --%>
				</ul>

			</div>
		</div>
	</nav>

	${pageContent}

	<!-- ================= CURRENT ISSUE SECTION ================= -->

	<section class="current-issue-section">

		<div class="current-issue-container">

			<!-- Left : Journal Cover -->
			<div class="journal-cover">
				<img
					src="${pageContext.request.contextPath}/images/coverpageijim.jpg"
					alt="International Journal of Indian Medicine">
			</div>


			<!-- Right : Articles -->
			<div class="current-issue-articles">

				<h2 class="current-issue-heading">Current Issue</h2>


				<!-- ================= ARTICLE 1 ================= -->

				<c:forEach var="article" items="${publishedArticles}">

					<div class="issue-article">

						<div class="issue-meta">
							Year : ${article.publicationDate.year} <span>|</span> Volume :
							${article.volume} <span>|</span> Issue : ${article.issue} <span>|</span>
							Pages : ${article.numberOfPages}
						</div>

						<div class="article-title-label">Title</div>

						<div class="article-title">${article.title}</div>

						<div class="article-author-label">Author</div>

						<div class="article-author">${article.authorNames}</div>

						<div class="article-links">
						
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

				<!-- More Article -->
				<div class="more-article">
					<a href="#"> For More Article Click Here </a>
				</div>

			</div>

		</div>

	</section>




	<!-- ================= INSTRUCTIONS & AUTHOR GUIDELINES ================= -->

	<section class="instructions-section">

		<div class="instructions-container">

			<h2 class="instructions-heading" style="text-align: center;">
				Instructions or Author Guidelines</h2>

			<p class="instructions-text">As part of the submission process,
				authors are required to check off their submission’s compliance with
				all of the following items, and submissions may be returned to
				authors that do not adhere to these guidelines.The submission has
				not been previously published, nor is it before another journal for
				consideration.</p>


			<div class="instructions-link">
				<a href="https://www.ijim.co.in/guideline" target="_blank"> [For
					More Instruction Click Here] </a>
			</div>

		</div>

	</section>




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
								arcaexperts@gmail.com </a></li>
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

</body>
</html>