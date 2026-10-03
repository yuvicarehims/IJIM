<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Author Login Details - IJIM Admin</title>

<!-- Bootstrap 5.3.3 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

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
	--primary: var(--deep-green);
	--primary-dark: #083c23;
	--primary-light: var(--leaf);
	--secondary: var(--rust);
	--success: var(--leaf);
	--warning: var(--gold);
	--info: #4a7c59;
	--light: var(--paper);
	--dark: var(--text);
	--gray: #6b6b6b;
	--light-gray: #e8e0d5;
	--white: var(--cream);
}

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Arial', sans-serif;
}

html {
	height: 100%;
	overflow: hidden;
}

body {
	background-color: var(--cream);
	color: var(--text);
	line-height: 1.6;
	display: flex;
	height: 100vh;
	overflow: hidden;
	max-width: 100vw;
	margin: 0;
	padding: 0;
}

/* Sidebar */
.sidebar {
	width: 250px;
	background: var(--deep-green);
	color: var(--cream);
	height: 100vh;
	position: fixed;
	left: 0;
	top: 0;
	overflow-y: auto;
	overflow-x: hidden;
	transition: all 0.3s ease;
	z-index: 1000;
	box-shadow: 2px 0 10px rgba(0, 0, 0, 0.1);
}

.sidebar.collapsed {
	width: 70px;
}

.sidebar-header {
	padding: 20px;
	text-align: center;
	background: var(--primary-dark);
	border-bottom: 1px solid rgba(251, 246, 238, 0.1);
	transition: all 0.3s ease;
}

.sidebar.collapsed .sidebar-header {
	padding: 15px;
}

.sidebar-header h2 {
	margin: 0;
	color: var(--gold);
	font-size: 1.5rem;
	transition: all 0.3s ease;
}

.sidebar.collapsed .sidebar-header h2 {
	display: none;
}

.sidebar-menu ul {
	list-style: none;
	margin-top: 10px;
}

.sidebar-menu ul li {
	border-bottom: 1px solid rgba(251, 246, 238, 0.1);
}

.sidebar-menu ul li a {
	display: flex;
	align-items: center;
	gap: 12px;
	color: rgba(251, 246, 238, 0.9);
	padding: 12px 20px;
	text-decoration: none;
	transition: all 0.3s ease;
	white-space: nowrap;
}

.sidebar.collapsed .sidebar-menu ul li a {
	padding: 15px;
	justify-content: center;
}

.sidebar-menu ul li a:hover, .sidebar-menu ul li a.active {
	background: rgba(201, 162, 90, 0.15);
	color: var(--gold);
	border-left: 4px solid var(--gold);
}

.sidebar-menu span {
	transition: all 0.3s ease;
}

.sidebar.collapsed .sidebar-menu span {
	display: none;
}

.sidebar-menu i {
	font-size: 1.2rem;
	min-width: 20px;
	text-align: center;
}

/* Content Area */
.content {
	margin-left: 250px;
	width: calc(100% - 250px);
	transition: all 0.3s ease;
	padding: 0;
	height: 100vh;
	overflow: hidden;
	max-width: calc(100vw - 250px);
	box-sizing: border-box;
	display: flex;
	flex-direction: column;
}

.content.expanded {
	margin-left: 70px;
	width: calc(100% - 70px);
	max-width: calc(100vw - 70px);
}

header {
	background: linear-gradient(135deg, var(--deep-green), var(--leaf));
	color: var(--cream);
	padding: 1rem 0;
	box-shadow: var(--shadow);
	width: 100%;
	box-sizing: border-box;
	overflow-x: hidden;
	position: relative;
	z-index: 100;
	flex-shrink: 0;
}

.header-container {
	max-width: 100%;
	margin: 0 auto;
	padding: 0 20px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	width: 100%;
	box-sizing: border-box;
	overflow-x: hidden;
}

.logo h1 {
	font-size: 1.7rem;
	font-weight: bold;
}

.admin-badge {
	background: rgba(251, 246, 238, 0.2);
	padding: 5px 10px;
	border-radius: 15px;
	font-size: 0.9rem;
}

.container {
	max-width: 100%;
	margin: 0;
	padding: 1.5rem 20px;
	width: 100%;
	box-sizing: border-box;
	overflow-y: auto;
	overflow-x: hidden;
	flex: 1;
	-webkit-overflow-scrolling: touch;
}

.dashboard-header {
	margin-bottom: 1.5rem;
}

.dashboard-header h2 {
	color: var(--deep-green);
	font-size: 2rem;
	margin-bottom: 0.5rem;
}

/* Stats Cards */
.stats-cards {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
	gap: 1.5rem;
	margin-bottom: 2rem;
}

@media (max-width: 576px) {
	.stats-cards {
		grid-template-columns: 1fr;
		gap: 1rem;
	}
}

.stat-card {
	background: var(--paper);
	padding: 1.5rem;
	border-radius: var(--radius);
	box-shadow: var(--shadow);
	text-align: center;
	border: 1px solid var(--light-gray);
}

.stat-number {
	font-size: 2.5rem;
	font-weight: bold;
	color: var(--deep-green);
}

.stat-label {
	color: var(--rust);
}

/* Authors Section */
.authors-section {
	background: var(--paper);
	padding: 2rem;
	border-radius: var(--radius);
	box-shadow: var(--shadow);
	border: 1px solid var(--light-gray);
	width: 100%;
	max-width: 100%;
	overflow: hidden;
	box-sizing: border-box;
}

.table-responsive {
	width: 100%;
	overflow-x: auto;
	overflow-y: visible;
	-webkit-overflow-scrolling: touch;
	position: relative;
}

.table {
	width: 100%;
	border-collapse: collapse;
	table-layout: auto;
	margin-bottom: 0;
}

.table th, .table td {
	padding: 12px 15px;
	border-bottom: 1px solid var(--light-gray);
	text-align: left;
	word-wrap: break-word;
	vertical-align: middle;
}

.table th {
	background: rgba(11, 86, 51, 0.05);
	color: var(--deep-green);
	font-weight: 600;
	position: sticky;
	top: 0;
}

.table tr:hover {
	background: rgba(201, 162, 90, 0.05);
}

/* Action Buttons */
.action-buttons {
	display: flex;
	gap: 0.5rem;
	flex-wrap: nowrap;
	align-items: center;
	justify-content: center;
}

.btn {
	padding: 8px;
	border-radius: var(--radius);
	font-size: 0.9rem;
	cursor: pointer;
	text-decoration: none;
	border: none;
	transition: all 0.3s;
	display: inline-flex;
	align-items: center;
	justify-content: center;
	width: 36px;
	height: 36px;
	min-width: 36px;
	min-height: 36px;
}

.btn-email {
	background: var(--rust);
	color: var(--cream);
}

.btn-email:hover {
	background: #6a4132;
	transform: translateY(-1px);
}

.btn-view {
	background: var(--leaf);
	color: var(--cream);
}

.btn-view:hover {
	background: #237a52;
	transform: translateY(-1px);
}

/* Tooltip */
.tooltip {
	position: relative;
	display: inline-block;
}

.tooltip .tooltiptext {
	visibility: hidden;
	width: auto;
	background-color: var(--deep-green);
	color: var(--cream);
	text-align: center;
	border-radius: 4px;
	padding: 5px 10px;
	position: absolute;
	z-index: 1;
	bottom: 125%;
	left: 50%;
	transform: translateX(-50%);
	opacity: 0;
	transition: opacity 0.3s;
	font-size: 0.75rem;
	white-space: nowrap;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
}

.tooltip .tooltiptext::after {
	content: "";
	position: absolute;
	top: 100%;
	left: 50%;
	margin-left: -5px;
	border-width: 5px;
	border-style: solid;
	border-color: var(--deep-green) transparent transparent transparent;
}

.tooltip:hover .tooltiptext {
	visibility: visible;
	opacity: 1;
}

.no-authors {
	text-align: center;
	color: var(--rust);
	padding: 3rem;
	font-style: italic;
}

/* Sidebar Toggle */
.sidebar-toggle {
	position: fixed;
	top: 20px;
	left: 20px;
	z-index: 3000;
	background: var(--deep-green);
	color: var(--gold);
	border: none;
	border-radius: 5px;
	padding: 10px;
	font-size: 1.2rem;
	cursor: pointer;
	transition: all 0.3s ease;
	display: none;
}

.sidebar-toggle:hover {
	background: var(--primary-dark);
	transform: scale(1.1);
}

/* Responsive Design */
@media (max-width: 1200px) {
	.content {
		margin-left: 70px;
		width: calc(100% - 70px);
		max-width: calc(100vw - 70px);
	}
	
	.sidebar {
		width: 70px;
	}
	
	.sidebar-header h2, .sidebar-menu span {
		display: none;
	}
	
	.sidebar-menu ul li a {
		padding: 15px;
		justify-content: center;
	}
	
	.sidebar-menu i {
		margin-right: 0;
	}
	
	.table th, .table td {
		padding: 8px 10px;
		font-size: 0.85rem;
	}
}

@media (max-width: 768px) {
	html, body {
		overflow: hidden;
		height: 100%;
	}
	
	.sidebar-toggle {
		display: block;
	}
	
	.sidebar {
		width: 0;
		transform: translateX(-100%);
	}
	
	.sidebar.active {
		width: 260px;
		transform: translateX(0);
	}
	
	.sidebar.active .sidebar-header h2,
	.sidebar.active .sidebar-menu span {
		display: block;
	}
	
	.sidebar.active .sidebar-menu ul li a {
		justify-content: flex-start;
		padding: 12px 20px;
	}
	
	.sidebar.active .sidebar-menu i {
		margin-right: 12px;
	}
	
	.content {
		margin-left: 0;
		width: 100%;
		max-width: 100vw;
	}
	
	.container {
		padding: 1rem 15px;
	}
	
	.authors-section {
		padding: 1rem;
	}
	
	.table-responsive {
		overflow-x: auto;
		-webkit-overflow-scrolling: touch;
		width: 100%;
	}
	
	.table {
		min-width: 800px;
	}
	
	.table th, .table td {
		padding: 8px;
		font-size: 0.8rem;
	}
	
	/* Hide some columns on mobile for better fit */
	.table th:nth-child(5), .table td:nth-child(5), /* Institute Name */
	.table th:nth-child(6), .table td:nth-child(6) { /* Address */
		display: none;
	}
}

@media (max-width: 576px) {
	.container {
		padding: 0.75rem 10px;
	}
	
	.authors-section {
		padding: 0.75rem;
	}
	
	.table {
		min-width: 700px;
	}
	
	.table th, .table td {
		padding: 6px;
		font-size: 0.75rem;
	}
	
	/* Hide more columns on small screens */
	.table th:nth-child(4), .table td:nth-child(4), /* Mobile Number */
	.table th:nth-child(7), .table td:nth-child(7) { /* Registration Date */
		display: none;
	}
	
	.action-buttons {
		gap: 0.3rem;
		flex-wrap: wrap;
		justify-content: center;
	}
	
	.btn {
		width: 32px;
		height: 32px;
		padding: 6px;
	}
}
</style>
</head>

<body>
	<button class="sidebar-toggle" id="sidebarToggle">
		<i class="fas fa-bars"></i>
	</button>

	<div class="sidebar" id="sidebar">
		<div class="sidebar-header">
			<h2>IJIM</h2>
		</div>

		<nav class="sidebar-menu">
			<ul>
				<li><a href="${pageContext.request.contextPath}/admin/dashboard">
					<i class="fas fa-home"></i> <span>Dashboard</span>
				</a></li>
				
				<li><a href="${pageContext.request.contextPath}/admin/submissions">
					<i class="fas fa-file"></i> <span>Submissions</span>
				</a></li>

				<li><a href="${pageContext.request.contextPath}/admin/submissions1"> 
					<i class="fas fa-file-alt"></i> <span>Paper Review</span> 
				</a></li>

			<%-- 	<li><a href="${pageContext.request.contextPath}/admin/conferences">
					<i class="fas fa-calendar"></i> <span>Conferences</span>
				</a></li> --%>

				<li><a href="${pageContext.request.contextPath}/editorial-board" target="_blank">
					<i class="fas fa-users"></i> <span>Editorial Board</span>
				</a></li>

				<li><a href="${pageContext.request.contextPath}/about" target="_blank">
					<i class="fas fa-info-circle"></i> <span>About & Contact Us</span>
				</a></li>

				<li><a href="${pageContext.request.contextPath}/admin/author-login-details" class="active">
				<i class="fas fa-user-lock"></i> <span>Author Login Details</span>
			</a></li>

			<%-- <li><a href="${pageContext.request.contextPath}/admin/manage-content"> 
				<i class="fas fa-edit"></i> <span>Page Content</span>
			</a></li>

			<li><a href="${pageContext.request.contextPath}/submitArticle" target="_blank">
					<i class="fas fa-upload"></i> <span>Submit Article</span>
				</a></li> --%>
				<li><a href="${pageContext.request.contextPath}/admin/manage-template"> 
					<i class="fas fa-edit"></i> <span>PAGE EDIT</span>
				</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/gallery"> 
					<i class="fas fa-edit"></i> <span>Gallery</span>
				</a></li>

				<li><a href="${pageContext.request.contextPath}/admin/previous-volumes-issues">
					<i class="fas fa-book"></i> <span>Previous Volumes And Issues</span>
				</a></li>

				<li><a href="${pageContext.request.contextPath}/admin/contact-enquiries">
					<i class="fas fa-envelope-open"></i> <span>Contact Enquires</span>
				</a></li>

				<li><a href="${pageContext.request.contextPath}/" target="_blank">
					<i class="fas fa-globe"></i> <span>Visit Website</span>
				</a></li>

				<li><a href="${pageContext.request.contextPath}/logout">
					<i class="fas fa-sign-out-alt"></i> <span>Logout</span>
				</a></li>
			</ul>
		</nav>
	</div>

	<div class="content" id="mainContent">
		<header>
			<div class="header-container">
				<div class="logo">
					<h1>IJIM - Author Login Details</h1>
					<div class="admin-badge">Administrator</div>
				</div>
				<div class="user-info">
					<span>Welcome, Admin</span>
				</div>
			</div>
		</header>

		<div class="container">
			<div class="dashboard-header">
				<h2>All Registered Authors</h2>
			</div>

			<!-- Stats Card -->
			<div class="stats-cards">
				<div class="stat-card">
					<div class="stat-number">${totalAuthors}</div>
					<div class="stat-label">Total Authors</div>
				</div>
			</div>

			<!-- Authors Table -->
			<div class="authors-section">
				<!-- Search and Entries Per Page Controls -->
				<div class="d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center gap-3 mb-3 p-3 bg-light rounded border">
					<div class="d-flex align-items-center gap-2 flex-wrap">
						<label for="entriesPerPage" class="mb-0 fw-semibold text-dark">Show:</label>
						<select id="entriesPerPage" class="form-select form-select-sm" style="width: auto; min-width: 80px;">
							<option value="10">10</option>
							<option value="25" selected>25</option>
							<option value="50">50</option>
							<option value="100">100</option>
						</select>
						<span id="entriesInfo" class="text-muted small">entries</span>
					</div>
					<div class="d-flex align-items-center gap-2 flex-wrap flex-grow-1 flex-md-grow-0">
						<form method="GET" action="${pageContext.request.contextPath}/admin/author-login-details" class="d-flex align-items-center gap-2 flex-wrap flex-grow-1" style="min-width: 200px;">
							<i class="fas fa-search text-success"></i>
							<input type="text" name="search" id="searchInput" 
							       placeholder="Search by Name, Email, Institute..." 
							       value="${searchTerm}"
							       class="form-control form-control-sm"
							       style="max-width: 100%;">
							<button type="submit" class="btn btn-sm btn-success">
								<i class="fas fa-search"></i> Search
							</button>
							<c:if test="${not empty searchTerm}">
								<a href="${pageContext.request.contextPath}/admin/author-login-details" 
								   class="btn btn-sm btn-danger text-decoration-none">
									<i class="fas fa-times"></i> Clear
								</a>
							</c:if>
						</form>
					</div>
				</div>
				
				<div class="table-responsive">
					<c:choose>
						<c:when test="${not empty authors}">
							<table class="table" id="authorsTable">
								<thead>
									<tr>
										<th>ID</th>
										<th>Full Name</th>
										<th>Email (Username)</th>
										<th>Mobile Number</th>
										<th>Institute Name</th>
										<th>Address</th>
										<th>Registration Date</th>
										<th>Total Submissions</th>
										<th>Actions</th>
									</tr>
								</thead>

								<tbody id="tableBody">
									<c:forEach var="author" items="${authors}">
										<tr>
											<td>${author.id}</td>
											<td>${author.fullName}</td>
											<td>${author.email}</td>
											<td>${author.mobileNumber != null ? author.mobileNumber : 'N/A'}</td>
											<td>${author.instituteName != null ? author.instituteName : 'N/A'}</td>
											<td>${author.address != null ? author.address : 'N/A'}</td>
											<td>
												<%
													com.ayurvedic.main.entity.User _author = 
														(com.ayurvedic.main.entity.User) pageContext.getAttribute("author");
													if (_author != null && _author.getCreatedAt() != null) {
														java.time.format.DateTimeFormatter formatter = 
															java.time.format.DateTimeFormatter.ofPattern("dd MMM yyyy");
														out.print(_author.getCreatedAt().format(formatter));
													} else {
														out.print("N/A");
													}
												%>
											</td>
											<td>
												<c:set var="submissionCount" value="${submissionCounts[author.id]}" />
												<c:choose>
													<c:when test="${submissionCount != null}">
														${submissionCount}
													</c:when>
													<c:otherwise>0</c:otherwise>
												</c:choose>
											</td>
											<td>
												<div class="action-buttons">
													<div class="tooltip">
														<a href="mailto:${author.email}" class="btn btn-email">
															<i class="fas fa-envelope"></i>
														</a>
														<span class="tooltiptext">Send Email</span>
													</div>
													<div class="tooltip">
														<a href="${pageContext.request.contextPath}/admin/submissions?authorId=${author.id}" class="btn btn-view">
															<i class="fas fa-eye"></i>
														</a>
														<span class="tooltiptext">View Submissions</span>
													</div>
												</div>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							
							<!-- Pagination Controls -->
							<div id="paginationControls" class="d-flex flex-column flex-md-row justify-content-between align-items-center gap-3 mt-3 p-3 bg-light rounded border">
								<div id="paginationInfo" class="text-muted small mb-0">
									Showing <span id="showingFrom">0</span> to <span id="showingTo">0</span> of <span id="totalEntries">0</span> entries
								</div>
								<div class="d-flex gap-2 align-items-center flex-wrap">
									<button id="prevBtn" onclick="changePage(-1)" class="btn btn-sm btn-outline-secondary" disabled>
										<i class="fas fa-chevron-left"></i> Previous
									</button>
									<div id="pageNumbers" class="d-flex gap-1">
										<!-- Page numbers will be generated by JavaScript -->
									</div>
									<button id="nextBtn" onclick="changePage(1)" class="btn btn-sm btn-outline-secondary">
										Next <i class="fas fa-chevron-right"></i>
									</button>
								</div>
							</div>
						</c:when>

						<c:otherwise>
							<div class="no-authors">
								<i class="fas fa-users" style="font-size: 3rem; margin-bottom: 1rem; color: var(--gold);"></i>
								<p>No authors found.</p>
								<c:if test="${not empty searchTerm}">
									<p style="margin-top: 1rem;">
										<a href="${pageContext.request.contextPath}/admin/author-login-details" style="color: var(--deep-green); text-decoration: underline;">
											View all authors
										</a>
									</p>
								</c:if>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap JS -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

	<script>
		// Sidebar toggle
		document.getElementById('sidebarToggle').addEventListener('click', function() {
			const sidebar = document.getElementById('sidebar');
			sidebar.classList.toggle('active');
		});

		// Pagination and Search Script
		let currentPage = 1;
		let entriesPerPage = 25;
		let filteredRows = [];
		let allRows = [];
		
		// Initialize on page load
		document.addEventListener('DOMContentLoaded', function() {
			const tbody = document.getElementById('tableBody');
			if (tbody) {
				allRows = Array.from(tbody.querySelectorAll('tr'));
				filteredRows = allRows;
				entriesPerPage = parseInt(document.getElementById('entriesPerPage').value);
				renderTable();
			}
			
			// Add event listener for entries per page change
			const entriesSelect = document.getElementById('entriesPerPage');
			if (entriesSelect) {
				entriesSelect.addEventListener('change', function() {
					entriesPerPage = parseInt(this.value);
					currentPage = 1;
					renderTable();
				});
			}
		});
		
		// Render table with pagination
		function renderTable() {
			const tbody = document.getElementById('tableBody');
			if (!tbody) return;
			
			// Hide all rows
			allRows.forEach(row => row.style.display = 'none');
			
			// Calculate pagination
			const totalPages = Math.ceil(filteredRows.length / entriesPerPage);
			const startIndex = (currentPage - 1) * entriesPerPage;
			const endIndex = startIndex + entriesPerPage;
			const pageRows = filteredRows.slice(startIndex, endIndex);
			
			// Show rows for current page
			pageRows.forEach(row => row.style.display = '');
			
			// Update pagination info
			const showingFrom = document.getElementById('showingFrom');
			const showingTo = document.getElementById('showingTo');
			const totalEntries = document.getElementById('totalEntries');
			
			if (showingFrom) showingFrom.textContent = filteredRows.length > 0 ? startIndex + 1 : 0;
			if (showingTo) showingTo.textContent = Math.min(endIndex, filteredRows.length);
			if (totalEntries) totalEntries.textContent = filteredRows.length;
			
			// Update pagination controls
			updatePaginationControls(totalPages);
		}
		
		// Update pagination controls
		function updatePaginationControls(totalPages) {
			const prevBtn = document.getElementById('prevBtn');
			const nextBtn = document.getElementById('nextBtn');
			const pageNumbers = document.getElementById('pageNumbers');
			
			if (!prevBtn || !nextBtn || !pageNumbers) return;
			
			// Enable/disable previous button
			prevBtn.disabled = currentPage === 1;
			if (currentPage === 1) {
				prevBtn.classList.add('disabled');
			} else {
				prevBtn.classList.remove('disabled');
			}
			
			// Enable/disable next button
			nextBtn.disabled = currentPage === totalPages || totalPages === 0;
			if (currentPage === totalPages || totalPages === 0) {
				nextBtn.classList.add('disabled');
			} else {
				nextBtn.classList.remove('disabled');
			}
			
			// Generate page numbers
			pageNumbers.innerHTML = '';
			if (totalPages === 0) return;
			
			const maxVisiblePages = 5;
			let startPage = Math.max(1, currentPage - Math.floor(maxVisiblePages / 2));
			let endPage = Math.min(totalPages, startPage + maxVisiblePages - 1);
			
			if (endPage - startPage < maxVisiblePages - 1) {
				startPage = Math.max(1, endPage - maxVisiblePages + 1);
			}
			
			// First page
			if (startPage > 1) {
				const btn = createPageButton(1);
				pageNumbers.appendChild(btn);
				if (startPage > 2) {
					const ellipsis = document.createElement('span');
					ellipsis.textContent = '...';
					ellipsis.className = 'px-2 d-flex align-items-center';
					pageNumbers.appendChild(ellipsis);
				}
			}
			
			// Page numbers
			for (let i = startPage; i <= endPage; i++) {
				const btn = createPageButton(i);
				pageNumbers.appendChild(btn);
			}
			
			// Last page
			if (endPage < totalPages) {
				if (endPage < totalPages - 1) {
					const ellipsis = document.createElement('span');
					ellipsis.textContent = '...';
					ellipsis.className = 'px-2 d-flex align-items-center';
					pageNumbers.appendChild(ellipsis);
				}
				const btn = createPageButton(totalPages);
				pageNumbers.appendChild(btn);
			}
		}
		
		// Create page button
		function createPageButton(pageNum) {
			const btn = document.createElement('button');
			btn.textContent = pageNum;
			btn.className = 'btn btn-sm ' + (pageNum === currentPage ? 'btn-success' : 'btn-outline-secondary');
			btn.onclick = () => goToPage(pageNum);
			return btn;
		}
		
		// Change page
		function changePage(direction) {
			const totalPages = Math.ceil(filteredRows.length / entriesPerPage);
			const newPage = currentPage + direction;
			
			if (newPage >= 1 && newPage <= totalPages) {
				currentPage = newPage;
				renderTable();
				// Scroll to top of table container
				const tableContainer = document.querySelector('.table-responsive');
				if (tableContainer) {
					tableContainer.scrollIntoView({ behavior: 'smooth', block: 'start' });
				}
			}
		}
		
		// Go to specific page
		function goToPage(page) {
			const totalPages = Math.ceil(filteredRows.length / entriesPerPage);
			if (page >= 1 && page <= totalPages) {
				currentPage = page;
				renderTable();
				// Scroll to top of table container
				const tableContainer = document.querySelector('.table-responsive');
				if (tableContainer) {
					tableContainer.scrollIntoView({ behavior: 'smooth', block: 'start' });
				}
			}
		}
	</script>
</body>
</html>

