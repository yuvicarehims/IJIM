<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Previous Volumes And Issues - NATURE AYURVED Admin</title>

<!-- Bootstrap 5.3.3 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

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

body {
	background-color: var(--cream);
	color: var(--text);
	line-height: 1.6;
	display: flex;
	min-height: 100vh;
	overflow-x: hidden;
	max-width: 100vw;
}

/* ---------------- SIDEBAR ---------------- */
.sidebar {
	width: 250px;
	background: var(--deep-green);
	color: var(--cream);
	height: 100vh;
	position: fixed;
	left: 0;
	top: 0;
	transition: all 0.3s ease;
	z-index: 1000;
	box-shadow: 2px 0 10px rgba(0, 0, 0, 0.1);
	overflow-y: auto;
	overflow-x: hidden;
}

.sidebar-header {
	padding: 1.5rem 1rem;
	border-bottom: 1px solid rgba(251, 246, 238, 0.1);
	text-align: center;
	background: var(--primary-dark);
}

.sidebar-header h2 {
	font-size: 1.5rem;
	font-weight: 600;
	color: var(--gold);
}

.sidebar-menu {
	padding: 1rem 0;
	height: calc(100vh - 80px);
	overflow-y: auto;
}

.sidebar-menu ul {
	list-style: none;
}

.sidebar-menu li {
	margin-bottom: 0.5rem;
}

.sidebar-menu a {
	display: flex;
	align-items: center;
	padding: 0.8rem 1.5rem;
	color: rgba(251, 246, 238, 0.9);
	text-decoration: none;
	transition: all 0.3s;
}

.sidebar-menu a:hover, .sidebar-menu a.active {
	background: rgba(201, 162, 90, 0.15);
	color: var(--gold);
	border-left: 4px solid var(--gold);
}

.sidebar-menu i {
	margin-right: 0.8rem;
	font-size: 1.2rem;
	width: 20px;
	text-align: center;
}

/* Mobile menu toggle */
.menu-toggle {
	display: none;
	position: fixed;
	top: 1rem;
	left: 1rem;
	z-index: 3000;
	background: var(--deep-green);
	color: var(--gold);
	border: none;
	border-radius: 8px;
	padding: 0.7rem 0.9rem;
	font-size: 1.2rem;
	cursor: pointer;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
	transition: all 0.3s;
}

.menu-toggle:hover {
	background: var(--primary-dark);
	transform: scale(1.05);
}

/* Sidebar Overlay for Mobile */
.sidebar-overlay {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	z-index: 999;
	opacity: 0;
	transition: opacity 0.3s;
}

.sidebar-overlay.active {
	display: block;
	opacity: 1;
}

/* ---------------- CONTENT AREA ---------------- */
.content {
	margin-left: 250px;
	width: calc(100% - 250px);
	transition: all 0.3s ease;
	padding: 0;
	min-height: 100vh;
	overflow-x: hidden;
}

header {
	background: linear-gradient(135deg, var(--deep-green), var(--leaf));
	color: var(--cream);
	padding: 1rem 0;
	box-shadow: var(--shadow);
	width: 100%;
	position: sticky;
	top: 0;
	z-index: 100;
}

.header-container {
	max-width: 100%;
	margin: 0 auto;
	padding: 0 20px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.header-left {
	display: flex;
	align-items: center;
	gap: 15px;
}

.header-right {
	display: flex;
	align-items: center;
	gap: 15px;
}

.header-link {
	color: var(--cream);
	text-decoration: none;
	padding: 8px 15px;
	border-radius: 5px;
	transition: background 0.3s;
}

.header-link:hover {
	background: rgba(251, 246, 238, 0.2);
}

.header-btn {
	background: rgba(251, 246, 238, 0.2);
	color: var(--cream);
	padding: 8px 16px;
	text-decoration: none;
	border-radius: 5px;
	transition: background 0.3s;
	border: none;
	cursor: pointer;
}

.header-btn:hover {
	background: rgba(251, 246, 238, 0.3);
}

.container {
	max-width: 100%;
	margin: 2rem auto;
	padding: 0 20px;
	width: 100%;
}

.page-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 1.5rem;
}

.page-title {
	color: var(--deep-green);
	font-size: 2rem;
	margin: 0;
}

.breadcrumb {
	background: none;
	padding: 0;
	margin: 0;
	font-size: 0.9rem;
	color: var(--gray);
}

.breadcrumb a {
	color: var(--deep-green);
	text-decoration: none;
}

.breadcrumb a:hover {
	text-decoration: underline;
}

/* Table Controls */
.table-controls {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 1rem;
	flex-wrap: wrap;
	gap: 1rem;
}

.entries-control {
	display: flex;
	align-items: center;
	gap: 10px;
}

.entries-control label {
	margin: 0;
	color: var(--text);
	font-size: 0.9rem;
}

.entries-control select {
	padding: 6px 10px;
	border: 1px solid var(--light-gray);
	border-radius: 5px;
	background: var(--cream);
	color: var(--text);
}

.search-control {
	display: flex;
	align-items: center;
	gap: 10px;
}

.search-control label {
	margin: 0;
	color: var(--text);
	font-size: 0.9rem;
}

.search-control input {
	padding: 6px 10px;
	border: 1px solid var(--light-gray);
	border-radius: 5px;
	background: var(--cream);
	color: var(--text);
	width: 200px;
}

/* Table */
.table-section {
	background: var(--paper);
	padding: 2rem;
	border-radius: var(--radius);
	box-shadow: var(--shadow);
	border: 1px solid var(--light-gray);
	width: 100%;
	overflow: visible;
}

.table-responsive {
	width: 100%;
	overflow-x: auto;
}

.table {
	width: 100%;
	border-collapse: collapse;
	min-width: 800px;
	background: white;
}

.table th, .table td {
	padding: 12px 15px;
	border-bottom: 1px solid var(--light-gray);
	text-align: left;
	vertical-align: middle;
}

.table th {
	background: rgba(11, 86, 51, 0.05);
	color: var(--deep-green);
	font-weight: 600;
	position: sticky;
	top: 0;
	z-index: 10;
}

.table tbody tr:nth-child(even) {
	background: #f9f9f9;
}

.table tbody tr:hover {
	background: rgba(201, 162, 90, 0.05);
}

/* Action Buttons */
.action-buttons {
	display: flex;
	gap: 0.5rem;
	align-items: center;
	justify-content: center;
}

.btn-action {
	padding: 6px 10px;
	border-radius: 5px;
	font-size: 0.9rem;
	cursor: pointer;
	text-decoration: none;
	border: none;
	transition: all 0.3s;
	display: inline-flex;
	align-items: center;
	justify-content: center;
	width: 32px;
	height: 32px;
}

.btn-view {
	background: #007bff;
	color: white;
}

.btn-view:hover {
	background: #0056b3;
	transform: translateY(-1px);
}

.btn-delete {
	background: #dc3545;
	color: white;
}

.btn-delete:hover {
	background: #c82333;
	transform: translateY(-1px);
}

/* Pagination */
.pagination-info {
	margin-top: 1rem;
	color: var(--gray);
	font-size: 0.9rem;
}

.pagination {
	display: flex;
	justify-content: center;
	align-items: center;
	gap: 5px;
	margin-top: 1rem;
}

.pagination button {
	padding: 6px 12px;
	border: 1px solid var(--light-gray);
	border-radius: 5px;
	background: var(--cream);
	color: var(--text);
	cursor: pointer;
	transition: all 0.3s;
}

.pagination button:hover:not(:disabled) {
	background: var(--deep-green);
	color: var(--cream);
	border-color: var(--deep-green);
}

.pagination button:disabled {
	opacity: 0.5;
	cursor: not-allowed;
}

.pagination .page-number {
	padding: 6px 10px;
}

.pagination .page-number.active {
	background: var(--deep-green);
	color: var(--cream);
	border-color: var(--deep-green);
}

/* Responsive Design */
@media (max-width: 992px) {
	.sidebar {
		width: 70px;
		overflow: hidden;
		transform: translateX(0);
	}
	.sidebar-header h2, .sidebar-menu span {
		display: none;
	}
	.sidebar-menu a {
		justify-content: center;
		padding: 1rem 0.5rem;
	}
	.sidebar-menu i {
		margin-right: 0;
		font-size: 1.5rem;
	}
	.content {
		margin-left: 70px;
		width: calc(100% - 70px);
	}
}

@media (max-width: 768px) {
	body {
		overflow-x: hidden;
	}
	
	.sidebar {
		width: 0;
		transform: translateX(-100%);
		z-index: 2000;
	}
	
	.sidebar.active {
		width: 250px;
		transform: translateX(0);
	}
	
	.sidebar.active .sidebar-header h2, 
	.sidebar.active .sidebar-menu span {
		display: block;
	}
	
	.sidebar.active .sidebar-menu a {
		justify-content: flex-start;
		padding: 0.8rem 1.5rem;
	}
	
	.sidebar.active .sidebar-menu i {
		margin-right: 0.8rem;
		font-size: 1.2rem;
	}
	
	.content {
		margin-left: 0;
		width: 100%;
	}
	
	.menu-toggle {
		display: block;
	}
	
	.table-controls {
		flex-direction: column;
		align-items: stretch;
	}
	
	.search-control input {
		width: 100%;
	}
}

@media (min-width: 769px) {
	.menu-toggle {
		display: none;
	}
	.sidebar-overlay {
		display: none !important;
	}
}

/* Better scrollbar for sidebar */
.sidebar-menu {
	scrollbar-width: thin;
	scrollbar-color: rgba(201, 162, 90, 0.3) transparent;
}

.sidebar-menu::-webkit-scrollbar {
	width: 6px;
}

.sidebar-menu::-webkit-scrollbar-track {
	background: transparent;
}

.sidebar-menu::-webkit-scrollbar-thumb {
	background: rgba(201, 162, 90, 0.3);
	border-radius: 3px;
}

.sidebar-menu::-webkit-scrollbar-thumb:hover {
	background: rgba(201, 162, 90, 0.5);
}
</style>
</head>

<body>
	<!-- Sidebar Overlay for Mobile -->
	<div class="sidebar-overlay" id="sidebarOverlay"></div>

	<!-- Mobile Menu Toggle -->
	<button class="menu-toggle" id="menuToggle" aria-label="Toggle Menu">
		<i class="fas fa-bars"></i>
	</button>

	<!-- ---------------- SIDEBAR START ---------------- -->
	<div class="sidebar" id="sidebar">
		<div class="sidebar-header">
			<h2>NATURE AYURVED</h2>
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

		<%-- 		<li><a href="${pageContext.request.contextPath}/admin/conferences">
					<i class="fas fa-calendar"></i> <span>Conferences</span>
				</a></li> --%>

				<li><a href="${pageContext.request.contextPath}/editorial-board" target="_blank">
					<i class="fas fa-users"></i> <span>Editorial Board</span>
				</a></li>

				<li><a href="${pageContext.request.contextPath}/about" target="_blank">
					<i class="fas fa-info-circle"></i> <span>About & Contact Us</span>
				</a></li>

				<li><a href="${pageContext.request.contextPath}/admin/author-login-details">
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

				<li><a href="${pageContext.request.contextPath}/admin/previous-volumes-issues" class="active">
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
	<!-- ---------------- SIDEBAR END ---------------- -->

	<div class="content" id="mainContent">
		<!-- HEADER -->
		<header>
			<div class="header-container">
				<div class="header-left">
					<button class="sidebar-toggle" id="headerToggle" style="background: transparent; border: none; color: var(--cream); font-size: 1.2rem; cursor: pointer;">
						<i class="fas fa-bars"></i>
					</button>
				</div>
			</div>
		</header>

		<div class="container">
			<!-- Page Header -->
			<div class="page-header">
				<h1 class="page-title">Previous Volumes And Issues</h1>
				<nav aria-label="breadcrumb" class="breadcrumb">
					<a href="${pageContext.request.contextPath}/admin/dashboard">Home</a> / Previous Volumes And Issues
				</nav>
			</div>

			<!-- Table Section -->
			<div class="table-section">
				<!-- Table Controls -->
				<div class="table-controls">
					<div class="entries-control">
						<label>Show</label>
						<select id="entriesPerPage" onchange="changeEntriesPerPage()">
							<option value="10" selected>10</option>
							<option value="25">25</option>
							<option value="50">50</option>
							<option value="100">100</option>
						</select>
						<label>entries</label>
					</div>
					<div class="search-control">
						<label>Search:</label>
						<input type="text" id="searchInput" placeholder="Search..." onkeyup="filterTable()">
					</div>
				</div>

				<!-- Table -->
				<div class="table-responsive">
					<table class="table" id="dataTable">
						<thead>
							<tr>
								<th>Sr.No.</th>
								<th>Issue</th>
								<th>Volume</th>
								<th>Article ID</th>
								<th>Title</th>
								<th>Author</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody id="tableBody">
							<c:forEach var="s" items="${submissions}" varStatus="loop">
								<%
									com.ayurvedic.main.entity.Submission _s = (com.ayurvedic.main.entity.Submission) pageContext.getAttribute("s");
									String issue = _s != null && _s.getIssue() != null ? _s.getIssue() : "";
									String volume = _s != null && _s.getVolume() != null ? _s.getVolume() : "";
									String articleId = _s != null && _s.getArticleId() != null ? _s.getArticleId() : "";
									String title = _s != null && _s.getTitle() != null ? _s.getTitle() : "";
									
									// Get first author name
									String authorName = "";
									if (_s != null && _s.getAuthorNames() != null && !_s.getAuthorNames().isEmpty()) {
										String[] authors = _s.getAuthorNames().split("\\|\\|");
										if (authors.length > 0) {
											authorName = authors[0].trim();
										}
									}
									// Fallback to author.fullName if authorNames is empty
									if (authorName.isEmpty() && _s != null && _s.getAuthor() != null) {
										authorName = _s.getAuthor().getFullName() != null ? _s.getAuthor().getFullName() : "";
									}
									
									pageContext.setAttribute("issue", issue);
									pageContext.setAttribute("volume", volume);
									pageContext.setAttribute("articleId", articleId);
									pageContext.setAttribute("title", title);
									pageContext.setAttribute("authorName", authorName);
								%>
								<tr>
									<td>${loop.index + 1}</td>
									<td>${issue}</td>
									<td>${volume}</td>
									<td>${articleId}</td>
									<td>${title}</td>
									<td>${authorName}</td>
									<td>
										<div class="action-buttons">
											<a href="${pageContext.request.contextPath}/article/${s.id}" 
												class="btn-action btn-view" 
												title="View Article">
												<i class="fas fa-eye"></i>
											</a>
											<button type="button" 
												class="btn-action btn-delete" 
												onclick="confirmDelete(${s.id}, '${fn:escapeXml(title)}')"
												title="Delete Article">
												<i class="fas fa-trash"></i>
											</button>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<!-- Pagination Info -->
				<div class="pagination-info" id="paginationInfo">
					Showing 1 to <span id="showingTo">10</span> of <span id="totalEntries">${totalCount}</span> entries
				</div>

				<!-- Pagination -->
				<div class="pagination" id="pagination">
					<!-- Pagination buttons will be generated by JavaScript -->
				</div>
			</div>
		</div>
	</div>

	<script>
		let currentPage = 1;
		let entriesPerPage = 10;
		let allRows = [];
		let filteredRows = [];

		// Show temporary message function (for publish success/error messages)
		function showTempMessage(message, type) {
			const messageDiv = document.createElement('div');
			messageDiv.style.background = (type === 'success') ? 'var(--leaf)' : 'var(--rust)';
			messageDiv.style.position = 'fixed';
			messageDiv.style.top = '20px';
			messageDiv.style.right = '20px';
			messageDiv.style.padding = '15px 25px';
			messageDiv.style.color = 'var(--cream)';
			messageDiv.style.borderRadius = 'var(--radius)';
			messageDiv.style.zIndex = '10000';
			messageDiv.style.boxShadow = '0 4px 12px rgba(0, 0, 0, 0.15)';
			messageDiv.style.fontWeight = '600';
			messageDiv.style.fontSize = '16px';
			messageDiv.style.display = 'flex';
			messageDiv.style.alignItems = 'center';
			messageDiv.style.gap = '10px';
			
			// Add icon
			const icon = document.createElement('i');
			icon.className = type === 'success' ? 'fas fa-check-circle' : 'fas fa-exclamation-circle';
			messageDiv.appendChild(icon);
			
			// Add text
			const text = document.createElement('span');
			text.textContent = message;
			messageDiv.appendChild(text);
			
			document.body.appendChild(messageDiv);
			
			// Animate in
			messageDiv.style.opacity = '0';
			messageDiv.style.transform = 'translateX(100px)';
			setTimeout(() => {
				messageDiv.style.transition = 'all 0.3s ease';
				messageDiv.style.opacity = '1';
				messageDiv.style.transform = 'translateX(0)';
			}, 10);
			
			// Remove after 15 seconds with fade out (for publish messages)
			const timeoutDuration = (message.includes('Published') && message.includes('Successfully')) ? 15000 : 3000;
			setTimeout(() => {
				messageDiv.style.opacity = '0';
				messageDiv.style.transform = 'translateX(100px)';
				setTimeout(() => messageDiv.remove(), 300);
			}, timeoutDuration);
		}

		// Check for success/error message on page load
		function checkForMessages() {
			const urlParams = new URLSearchParams(window.location.search);
			const message = urlParams.get('message');
			
			// Check for Published Successfully message (handle both + and space)
			if (message && (message.includes('Published') && message.includes('Successfully'))) {
				showTempMessage('Published Successfully', 'success');
			}
			
			if (urlParams.get('error')) {
				showTempMessage('Failed to publish. Please try again.', 'error');
			}
		}

		// Initialize
		document.addEventListener('DOMContentLoaded', function() {
			checkForMessages();
			allRows = Array.from(document.querySelectorAll('#tableBody tr'));
			filteredRows = allRows;
			renderTable();
			
			// Sidebar toggle
		// Mobile menu toggle with overlay (matching admin-dashboard)
		const menuToggle = document.getElementById('menuToggle');
		const sidebar = document.getElementById('sidebar');
		const sidebarOverlay = document.getElementById('sidebarOverlay');
		
		function toggleSidebar() {
			sidebar.classList.toggle('active');
			sidebarOverlay.classList.toggle('active');
		}
		
		if (menuToggle) {
			menuToggle.addEventListener('click', toggleSidebar);
		}
		
		if (sidebarOverlay) {
			sidebarOverlay.addEventListener('click', toggleSidebar);
		}
		
		document.addEventListener('click', function(event) {
			const isClickInsideSidebar = sidebar.contains(event.target);
			const isClickOnToggle = menuToggle && menuToggle.contains(event.target);
			
			if (window.innerWidth <= 768 && sidebar.classList.contains('active')) {
				if (!isClickInsideSidebar && !isClickOnToggle) {
					toggleSidebar();
				}
			}
		});
		
		window.addEventListener('resize', function() {
			if (window.innerWidth > 768) {
				sidebar.classList.remove('active');
				sidebarOverlay.classList.remove('active');
			}
		});
	});

		function changeEntriesPerPage() {
			entriesPerPage = parseInt(document.getElementById('entriesPerPage').value);
			currentPage = 1;
			renderTable();
		}

		function filterTable() {
			const searchTerm = document.getElementById('searchInput').value.toLowerCase();
			filteredRows = allRows.filter(row => {
				const text = row.textContent.toLowerCase();
				return text.includes(searchTerm);
			});
			currentPage = 1;
			renderTable();
		}

		function renderTable() {
			// Hide all rows
			allRows.forEach(row => row.style.display = 'none');
			
			// Calculate pagination
			const start = (currentPage - 1) * entriesPerPage;
			const end = start + entriesPerPage;
			const rowsToShow = filteredRows.slice(start, end);
			
			// Show rows for current page
			rowsToShow.forEach(row => row.style.display = '');
			
			// Update pagination info
			const total = filteredRows.length;
			const showingTo = Math.min(end, total);
			document.getElementById('showingTo').textContent = showingTo;
			document.getElementById('totalEntries').textContent = total;
			
			// Generate pagination buttons
			generatePagination(total);
		}

		function generatePagination(total) {
			const totalPages = Math.ceil(total / entriesPerPage);
			const paginationDiv = document.getElementById('pagination');
			paginationDiv.innerHTML = '';
			
			// Previous button
			const prevBtn = document.createElement('button');
			prevBtn.textContent = 'Previous';
			prevBtn.disabled = currentPage === 1;
			prevBtn.onclick = () => {
				if (currentPage > 1) {
					currentPage--;
					renderTable();
				}
			};
			paginationDiv.appendChild(prevBtn);
			
			// Page numbers
			const maxPagesToShow = 5;
			let startPage = Math.max(1, currentPage - Math.floor(maxPagesToShow / 2));
			let endPage = Math.min(totalPages, startPage + maxPagesToShow - 1);
			
			if (endPage - startPage < maxPagesToShow - 1) {
				startPage = Math.max(1, endPage - maxPagesToShow + 1);
			}
			
			for (let i = startPage; i <= endPage; i++) {
				const pageBtn = document.createElement('button');
				pageBtn.textContent = i;
				pageBtn.className = 'page-number';
				if (i === currentPage) {
					pageBtn.classList.add('active');
				}
				pageBtn.onclick = () => {
					currentPage = i;
					renderTable();
				};
				paginationDiv.appendChild(pageBtn);
			}
			
			// Next button
			const nextBtn = document.createElement('button');
			nextBtn.textContent = 'Next';
			nextBtn.disabled = currentPage === totalPages;
			nextBtn.onclick = () => {
				if (currentPage < totalPages) {
					currentPage++;
					renderTable();
				}
			};
			paginationDiv.appendChild(nextBtn);
		}

		function confirmDelete(id, title) {
			if (confirm('Are you sure you want to delete the article "' + title + '"? This action cannot be undone.')) {
				deleteArticle(id);
			}
		}

		function deleteArticle(id) {
			const ctx = '${pageContext.request.contextPath}';
			fetch(ctx + '/admin/previous-volumes-issues/delete/' + id, {
				method: 'POST',
				headers: {
					'Content-Type': 'application/json'
				}
			})
			.then(response => response.json())
			.then(data => {
				if (data.success) {
					alert('Article deleted successfully!');
					location.reload();
				} else {
					alert('Error deleting article: ' + (data.message || 'Unknown error'));
				}
			})
			.catch(error => {
				console.error('Error:', error);
				alert('Error deleting article. Please try again.');
			});
		}

	</script>
</body>
</html>

