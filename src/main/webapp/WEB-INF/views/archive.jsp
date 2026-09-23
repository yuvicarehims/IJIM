<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Archives | NATURE AYURVED</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap + Font Awesome -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"
	rel="stylesheet" />

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
}

* {
	box-sizing: border-box;
}

html, body {
	overflow-x: hidden;
	max-width: 100%;
}

body {
	font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
	margin: 0;
	background: white;
	color: var(--text);
}

.container-main {
	max-width: var(--max-width);
	margin: auto;
	padding: 0 15px;
}

/* ⭐ HEADER FROM HOME PAGE ⭐ */
header {
	background: #fafafa;
	padding: 15px 0;
	border-bottom: 1px solid #e0e0e0;
	width: 100%;
}

/* ⭐ NAVBAR FROM HOME PAGE ⭐ */
.navbar-custom {
	background: #214f37;
	padding-top: 6px !important;
	padding-bottom: 6px !important;
	font-size: 18px;
}

.navbar-custom .nav-link {
	color: white !important;
	font-weight: 600;
	text-transform: uppercase;
	padding: 10px 12px !important;
	position: relative;
}

.navbar-custom .nav-link:hover, .navbar-custom .nav-link.active {
	color: var(--gold) !important;
	background-color: rgba(255, 255, 255, 0.1);
}

.navbar-custom .btn-outline-light {
	font-size: 14px;
	padding: 7px 18px;
	border-radius: 8px;
}

/* ⭐ NAVBAR CUSTOM STYLES (To match your screenshot exactly) ⭐ */
.navbar-custom {
	background: rgb(30, 140, 193);
	/* Match the original padding of 15px top/bottom, overridden by link padding */
	padding-top: 6px !important;
	padding-bottom: 6px !important;
	font-size: 18px;
}

.navbar-custom .navbar-nav {
	/* Control spacing between links */
	gap: 10px;
	flex-wrap: nowrap;
	/* Prevent wrapping to keep all nav on single line */
}

.navbar-custom .nav-link {
	color: #fff !important;
	font-weight: 600;
	text-transform: uppercase;
	font-size: 14px; /* Exact size from your reference */
	padding: 10px 12px !important; /* Exact padding from your reference */
	position: relative;
	transition: all 0.3s ease;
	white-space: nowrap; /* Keep nav items on single line */
}

.navbar-custom .nav-link:hover, .navbar-custom .nav-link.active {
	color: var(--gold) !important;
	background-color: rgba(255, 255, 255, 0.1); /* Hover background */
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

.navbar-custom .nav-link.active::after, .navbar-custom .nav-link:hover::after
	{
	transform: translateX(-50%) scaleX(1);
}

/* Login/Register Buttons Styling to Match Reference */
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
/* ⭐ END NAVBAR CUSTOM STYLES ⭐ */

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

/* ⭐ ARCHIVES PAGE STYLING ⭐ */
.archives-wrapper {
	max-width: 100%;
	margin: 40px auto 80px;
	padding: 0;
}

.archives-title {
	text-align: center;
	font-size: 36px;
	margin-bottom: 40px;
	font-family: Georgia, serif;
	font-weight: 700;
	color: var(--rust);
}

.year-row {
	border: 1px solid #dcdcdc;
	margin-bottom: 25px;
	background: #ffffff;
}

.year-header {
	padding: 22px 30px;
	display: flex;
	align-items: center;
	justify-content: space-between;
	cursor: pointer;
}

.year-header-left {
	font-size: 26px;
	font-weight: 700;
	color: #7a4b1d;
}

.year-header-right {
	display: flex;
	align-items: center;
	gap: 16px;
	color: #999;
}

.year-divider {
	width: 1px;
	height: 26px;
	background: #ddd;
}

.year-content {
	display: none;
	padding: 20px 40px 30px;
	font-size: 16px;
}

.volume-label {
	font-weight: 700;
	margin-bottom: 12px;
}

.issue-list {
	display: flex;
	flex-wrap: wrap;
	gap: 35px;
}

.issue-link {
	display: inline-flex;
	gap: 8px;
	cursor: pointer;
	font-size: 18px;
}

.issue-link:hover {
	color: var(--deep-green);
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
.issue-card {
	display: flex;
	flex-wrap: wrap;
	gap: 15px;
}

/* .issue-item {
    width: auto !important;
    flex: 0 0 auto !important;
    cursor: pointer;
} */
.journal-volume {
	padding: 12px 20px;
}

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

.issue-list {
	display: flex;
	flex-direction: column;
	gap: 15px;
}

/* .issue-card {
	border: 1px solid #ddd;
	border-left: 5px solid #8b5a2b;
	background: #fff;
	padding: 18px 22px;
	cursor: pointer;
	transition: 0.3s;
} */
.issue-card:hover {
	background: #fafafa;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
}

.journal-name {
	font-size: 20px;
	font-weight: 700;
	color: #8b5a2b;
	margin-bottom: 8px;
}

.journal-date {
	font-size: 15px;
	color: #666;
	margin-bottom: 8px;
}

/* .journal-volume {
	font-size: 16px;
	font-weight: 600;
	color: #222;
} */

/* ===== Responsive Adjustments ===== */
/* Extra Large Devices (Large Desktops, 1200px and up) */
@media ( min-width : 1200px) {
	.container-main {
		max-width: 1140px;
	}
	.archives-wrapper {
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
	.archives-wrapper {
		padding: 0 20px;
		margin: 30px auto 60px;
	}
	.archives-title {
		font-size: 32px;
		margin-bottom: 30px;
	}
	.year-header {
		padding: 18px 25px;
	}
	.year-header-left {
		font-size: 22px;
	}
	.year-content {
		padding: 15px 30px 25px;
	}
	.issue-list {
		gap: 25px;
	}
	.issue-link {
		font-size: 16px;
	}
	.navbar-custom .nav-link {
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
	.archives-wrapper {
		padding: 0 15px;
		margin: 25px auto 50px;
	}
	.archives-title {
		font-size: 28px;
		margin-bottom: 25px;
	}
	.year-row {
		margin-bottom: 20px;
	}
	.year-header {
		padding: 15px 20px;
		flex-wrap: wrap;
	}
	.year-header-left {
		font-size: 20px;
	}
	.year-header-right {
		gap: 12px;
	}
	.year-content {
		padding: 15px 20px 20px;
		font-size: 14px;
	}
	.volume-label {
		font-size: 16px;
		margin-bottom: 10px;
	}
	.issue-list {
		flex-direction: column;
		gap: 15px;
	}
	.issue-link {
		font-size: 15px;
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
	.archives-wrapper {
		padding: 0 10px;
		margin: 20px auto 40px;
	}
	.archives-title {
		font-size: 24px;
		margin-bottom: 20px;
	}
	.year-row {
		margin-bottom: 15px;
	}
	.year-header {
		padding: 12px 15px;
	}
	.year-header-left {
		font-size: 18px;
	}
	.year-header-right {
		gap: 10px;
	}
	.year-divider {
		height: 20px;
	}
	.year-content {
		padding: 12px 15px 15px;
		font-size: 13px;
	}
	.volume-label {
		font-size: 14px;
		margin-bottom: 8px;
	}
	.issue-list {
		gap: 12px;
	}
	.issue-link {
		font-size: 14px;
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
	font-size: 31px;
	color: #6d3f1d;
	margin: 0;
	letter-spacing: 2px;
	word-break: break-word;
}

.issue-item {
	padding: 15px 0;
	border-bottom: 1px solid #ececec;
	cursor: pointer;
}

.issue-item:last-child {
	border-bottom: none;
}

.journal-volume {
	cursor: pointer;
	padding: 5px 8px;
	border-radius: 5px;
	transition: 0.3s ease;
}

.journal-volume:hover {
	background-color: #f3f4f6;
	color: #065f46;
}

.journal-name {
	font-size: 28px;
	font-weight: 600;
	color: #065f46;
}

.journal-date {
	font-size: 20px;
	font-weight: 500;
	font-weight: 700;
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
	<!-- ⭐ NAVBAR ⭐ -->
	<nav
		class="navbar navbar-expand-lg navbar-dark sticky-top navbar-custom">
		<div class="container-fluid px-3 px-md-4 px-lg-5">
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navMain"
				aria-controls="navMain" aria-expanded="false"
				aria-label="Toggle navigation">
				<i class="fas fa-bars"></i>
			</button>

			<div class="collapse navbar-collapse" id="navMain">
				<ul class="navbar-nav mx-auto">
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/">HOME</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/about">ABOUT US</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/editorial-board">EDITORIAL
							BOARD</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/current-issue">CURRENT
							ISSUE</a></li>
					<li class="nav-item"><a class="nav-link active"
						href="${pageContext.request.contextPath}/archives">ARCHIVES</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/login">SUBMIT ARTICLE</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/author-guideline">AUTHOR
							GUIDELINE</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/contact">CONTACT</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/policy">Policy</a></li>
					<li class="nav-item"><a class="nav-link"
						href="https://www.vidyavishva.com/" target="_blank">VIDYAVISHVA</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- ⭐ ARCHIVES CONTENT ⭐ -->
	<div class="container">

		<div class="archives-wrapper">

			<h1 class="archives-title">Archives</h1>

			<h4 class="archives-title" style="font-size: 30px;">nature
				Ayurved-International Journal of Ayurved Science and Research</h4>


			<c:choose>

				<c:when test="${empty archiveData}">

					<p style="text-align: center; color: #777;">No published
						articles found.</p>

				</c:when>


				<c:otherwise>

					<!-- YEAR LOOP -->
					<c:forEach var="yearEntry" items="${archiveData}">

						<c:set var="year" value="${yearEntry.key}" />
						<c:set var="volumeMap" value="${yearEntry.value}" />


						<div class="year-row">


							<!-- YEAR HEADER -->
							<div class="year-header" onclick="toggleYear(this)">

								<div class="year-header-left">${year}</div>

								<div class="year-header-right">

									<div class="year-divider"></div>

									<i class="fas fa-chevron-right year-chevron"></i>

								</div>

							</div>


							<!-- YEAR CONTENT -->
							<div class="year-content">


								<!-- VOLUME LOOP -->
								<c:forEach var="volumeEntry" items="${volumeMap}">

									<c:set var="volume" value="${volumeEntry.key}" />
									<c:set var="issueMap" value="${volumeEntry.value}" />


									<!-- VOLUME HEADING -->
									<div class="volume-label">

										Volume -

										<c:choose>

											<c:when test="${fn:startsWith(volume, 'Volume ')}">

                                            ${fn:replace(volume, 'Volume ', '')}

                                        </c:when>

											<c:otherwise>

                                            ${volume}

                                        </c:otherwise>

										</c:choose>

									</div>


									<!-- ISSUES -->
									<div class="issue-list">

										<div class="issue-card">


											<!-- ISSUE LOOP -->
											<c:forEach var="issueEntry" items="${issueMap}">

												<c:set var="issue" value="${issueEntry.key}" />


												<!-- SINGLE ISSUE -->
												<div class="issue-item"
													onclick="goToIssue('${year}','${volume}','${issue}')">

													<div class="journal-volume">

														<i class="fas fa-folder"></i> Issue -

														<c:choose>

															<c:when test="${fn:startsWith(issue, 'Issue ')}">

                                                            ${fn:replace(issue, 'Issue ', '')}

                                                        </c:when>

															<c:otherwise>

                                                            ${issue}

                                                        </c:otherwise>

														</c:choose>

													</div>

												</div>


											</c:forEach>

										</div>

									</div>


								</c:forEach>

							</div>

						</div>


					</c:forEach>

				</c:otherwise>

			</c:choose>

		</div>

	</div>


	<!-- ⭐ FOOTER ⭐ -->
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
						<li><i class="fas fa-barcode me-2"></i> ISSN: 0000-0000</li>
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
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

	<script>
		function toggleYear(headerEl) {
			const row = headerEl.closest('.year-row');
			const content = row.querySelector('.year-content');
			const chevron = row.querySelector('.year-chevron');

			if (content.style.display === 'block') {
				content.style.display = 'none';
				chevron.classList
						.replace('fa-chevron-down', 'fa-chevron-right');
			} else {
				content.style.display = 'block';
				chevron.classList
						.replace('fa-chevron-right', 'fa-chevron-down');
			}
		}

		function goToIssue(year, volume, issue) {
			const base = '${pageContext.request.contextPath}';
			console.log('Base path:', base); // Debug log

			const url = base + '/archives/issue?year=' + year + '&volume='
					+ encodeURIComponent(volume) + '&issue='
					+ encodeURIComponent(issue);
			console.log('Navigating to:', url);

			window.location.href = url;
		}
	</script>

</body>
</html>
