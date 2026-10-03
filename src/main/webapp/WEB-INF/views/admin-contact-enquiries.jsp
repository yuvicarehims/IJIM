<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Contact Enquiries - IJIM Admin</title>

<!-- Bootstrap 5.3.3 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
:root {
	--deep-green: rgb(30, 140, 193);;
	--leaf: #2b8a5f;
	--rust: #7a4b3a;
	--gold: #c9a25a;
	--cream: #fbf6ee;
	--paper: #f7efe6;
	--text: #2d2d2d;
	--radius: 12px;
	--shadow: 0 10px 30px rgba(11, 74, 57, 0.06);
	--gray: #6b6b6b;
	--light-gray: #e8e0d5;
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
}

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
	background: #083c23;
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

.sidebar-header {
	padding: 1.5rem 1rem;
	border-bottom: 1px solid rgba(251,246,238,0.1);
	text-align: center;
	background: #083c23;
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
	color: rgba(251,246,238,0.9);
	text-decoration: none;
	transition: all 0.3s;
}

.sidebar-menu a:hover,
.sidebar-menu a.active {
	background: rgba(201,162,90,0.15);
	color: var(--gold);
	border-left: 4px solid var(--gold);
}

.sidebar-menu i {
	margin-right: 0.8rem;
	font-size: 1.2rem;
	width: 20px;
	text-align: center;
}

.content {
	flex: 1;
	margin-left: 250px;
	padding: 1.5rem;
	transition: all 0.3s ease;
	width: calc(100% - 250px);
	min-height: 100vh;
	overflow-x: hidden;
	background: var(--cream);
}

.header-container {
	display: flex;
	justify-content: space-between;
	align-items: center;
	background: var(--paper);
	padding: 1rem 1.5rem;
	border-radius: var(--radius);
	box-shadow: var(--shadow);
	margin-bottom: 1.5rem;
	border: 1px solid var(--light-gray);
}

.logo h1 {
	font-size: 1.5rem;
	color: var(--deep-green);
	margin: 0;
}

.admin-badge {
	background: var(--gold);
	color: var(--text);
	padding: 0.3rem 0.8rem;
	border-radius: 5px;
	font-size: 0.8rem;
	font-weight: 600;
	margin-top: 0.5rem;
	display: inline-block;
}

.stats-cards {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
	gap: 1rem;
	margin-bottom: 1.5rem;
}

.stat-card {
	background: var(--paper);
	padding: 1.5rem;
	border-radius: var(--radius);
	box-shadow: var(--shadow);
	border: 1px solid var(--light-gray);
	text-align: center;
}

.stat-number {
	font-size: 2rem;
	font-weight: bold;
	color: var(--deep-green);
	margin-bottom: 0.5rem;
}

.stat-label {
	color: var(--gray);
	font-size: 0.9rem;
}

.table-container {
	background: var(--paper);
	padding: 1.5rem;
	border-radius: var(--radius);
	box-shadow: var(--shadow);
	border: 1px solid var(--light-gray);
}

.table {
	width: 100%;
	border-collapse: collapse;
	background: var(--cream);
}

.table th {
	background: var(--deep-green);
	color: var(--cream);
	padding: 12px;
	text-align: left;
	font-weight: 600;
	border-bottom: 2px solid var(--primary-dark);
}

.table td {
	padding: 12px;
	border-bottom: 1px solid var(--light-gray);
}

.table tr:hover {
	background: rgba(11, 86, 51, 0.05);
}

.badge-unread {
	background: var(--rust);
	color: white;
	padding: 4px 8px;
	border-radius: 4px;
	font-size: 0.8rem;
	font-weight: 600;
}

.badge-read {
	background: var(--leaf);
	color: white;
	padding: 4px 8px;
	border-radius: 4px;
	font-size: 0.8rem;
	font-weight: 600;
}

.btn-mark-read {
	background: var(--leaf);
	color: white;
	border: none;
	padding: 6px 12px;
	border-radius: 5px;
	cursor: pointer;
	font-size: 0.85rem;
	transition: all 0.3s;
}

.btn-mark-read:hover {
	background: #237a52;
	transform: translateY(-1px);
}

.message-cell {
	max-width: 300px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.message-full {
	white-space: normal;
	word-wrap: break-word;
}

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
		padding: 1rem;
	}
	
	.menu-toggle {
		display: block;
	}
	
	.table {
		font-size: 0.85rem;
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
				<%-- <li><a href="${pageContext.request.contextPath}/admin/conferences">
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
				
				<li><a href="${pageContext.request.contextPath}/admin/previous-volumes-issues">
					<i class="fas fa-book"></i> <span>Previous Volumes And Issues</span>
				</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/contact-enquiries" class="active">
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

	<div class="content">
		<header>
			<div class="header-container">
				<div class="logo">
					<h1>Contact Enquiries</h1>
					<div class="admin-badge">Administrator</div>
				</div>
			</div>
		</header>

		<div class="stats-cards">
			<div class="stat-card">
				<div class="stat-number">${totalEnquiries}</div>
				<div class="stat-label">Total Enquiries</div>
			</div>
			<div class="stat-card">
				<div class="stat-number">${unreadCount}</div>
				<div class="stat-label">Unread Enquiries</div>
			</div>
		</div>

		<div class="table-container">
			<c:choose>
				<c:when test="${not empty enquiries}">
					<table class="table">
						<thead>
							<tr>
								<th>ID</th>
								<th>Name</th>
								<th>Email</th>
								<th>Phone</th>
								<th>Subject</th>
								<th>Message</th>
								<th>Date</th>
								<th>Status</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="enquiry" items="${enquiries}">
								<tr>
									<td>${enquiry.id}</td>
									<td>${enquiry.name}</td>
									<td>${enquiry.email}</td>
									<td>${enquiry.phone != null ? enquiry.phone : 'N/A'}</td>
									<td>${enquiry.subject != null ? enquiry.subject : 'No Subject'}</td>
									<td class="message-cell" title="${enquiry.message}">
										${fn:length(enquiry.message) > 50 ? fn:substring(enquiry.message, 0, 50) : enquiry.message}${fn:length(enquiry.message) > 50 ? '...' : ''}
									</td>
									<td>
										<fmt:formatDate value="${enquiry.createdAtDate}" 
											pattern="dd MMM yyyy, hh:mm a" 
											timeZone="Asia/Kolkata" />
									</td>
									<td>
										<c:choose>
											<c:when test="${enquiry.isRead}">
												<span class="badge-read">Read</span>
											</c:when>
											<c:otherwise>
												<span class="badge-unread">Unread</span>
											</c:otherwise>
										</c:choose>
									</td>
									<td>
										<c:if test="${!enquiry.isRead}">
											<button class="btn-mark-read" onclick="markAsRead(${enquiry.id})">
												Mark as Read
											</button>
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:when>
				<c:otherwise>
					<div style="text-align: center; padding: 2rem; color: var(--gray);">
						<i class="fas fa-inbox" style="font-size: 3rem; margin-bottom: 1rem; opacity: 0.5;"></i>
						<p>No contact enquiries found.</p>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

	<script>
		function markAsRead(enquiryId) {
			if (confirm('Mark this enquiry as read?')) {
				fetch('${pageContext.request.contextPath}/admin/contact-enquiries/mark-read/' + enquiryId, {
					method: 'POST',
					headers: {
						'Content-Type': 'application/json'
					}
				})
				.then(response => response.json())
				.then(data => {
					if (data.success) {
						location.reload();
					} else {
						alert('Error: ' + data.message);
					}
				})
				.catch(error => {
					console.error('Error:', error);
					alert('An error occurred while marking the enquiry as read.');
				});
			}
		}
	</script>
	
	<script>
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
	</script>
</body>
</html>

