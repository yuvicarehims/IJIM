<%@ page contentType="text/html;charset=UTF-8" language="java" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
			<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


				<!DOCTYPE html>
				<html lang="en">

				<head>
					<meta charset="UTF-8">
					<meta name="viewport" content="width=device-width, initial-scale=1.0">
					<title>Submissions - NATURE AYURVED Admin</title>

				<!-- Bootstrap 5.3.3 CSS -->
				<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
					rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
				<!-- Font Awesome -->
				<link rel="stylesheet"
					href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

					<style>
						:root {
							--deep-green: rgb(30, 140, 193);;
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

						/* Keep content inside screen */
						.content,
						.container,
						.submissions-section {
							max-width: 100%;
							box-sizing: border-box;
						}

					/* ==================== PROFESSIONAL TABLE DESIGN ==================== */
					
					/* Table Container - Professional Scrollable Design */
					.table-responsive {
						width: 100%;
						display: block;
						overflow-x: auto;
						overflow-y: auto;
						-webkit-overflow-scrolling: touch;
						border-radius: 12px;
						box-shadow: 0 4px 20px rgba(11, 86, 51, 0.08);
						background: #ffffff;
						border: 1px solid rgba(11, 86, 51, 0.12);
						position: relative;
						max-height: calc(100vh - 380px);
						min-height: 450px;
					}
					
					/* Custom Scrollbar - Professional Styling */
					.table-responsive::-webkit-scrollbar {
						width: 14px;
						height: 14px;
					}
					
					.table-responsive::-webkit-scrollbar-track {
						background: #f5f5f5;
						border-radius: 10px;
						border: 1px solid rgba(11, 86, 51, 0.05);
					}
					
					.table-responsive::-webkit-scrollbar-thumb {
						background: linear-gradient(180deg, var(--leaf) 0%, var(--deep-green) 100%);
						border-radius: 10px;
						border: 2px solid #f5f5f5;
						transition: background 0.3s ease;
					}
					
					.table-responsive::-webkit-scrollbar-thumb:hover {
						background: linear-gradient(180deg, var(--deep-green) 0%, #083c23 100%);
					}
					
					.table-responsive::-webkit-scrollbar-corner {
						background: #f5f5f5;
					}
					
					/* Firefox Scrollbar */
					.table-responsive {
						scrollbar-width: thin;
						scrollbar-color: var(--leaf) #f5f5f5;
					}
					
					/* Table Base Styling */
					.table {
						width: 100%;
						margin: 0;
						border-collapse: separate;
						border-spacing: 0;
						background: #ffffff;
						min-width: 1200px; /* Ensure horizontal scroll on smaller screens */
					}
					
					/* Professional Table Header - Sticky */
					.table thead {
						position: sticky;
						top: 0;
						z-index: 100;
						background: linear-gradient(135deg, #0b5633 0%, #1a7a4d 50%, #2b8a5f 100%);
					}
					
					.table thead th {
						background: linear-gradient(135deg, #0b5633 0%, #1a7a4d 50%, #2b8a5f 100%);
						color: #ffffff;
						font-weight: 700;
						font-size: 0.8rem;
						text-transform: uppercase;
						letter-spacing: 0.8px;
						padding: 16px 14px;
						border: none;
						border-right: 1px solid rgba(255, 255, 255, 0.1);
						white-space: nowrap;
						text-align: left;
						position: relative;
						box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
					}
					
					.table thead th:last-child {
						border-right: none;
					}
					
					/* Table Body - Professional Styling */
					.table tbody {
						background: #ffffff;
					}
					
					.table tbody tr {
						transition: all 0.25s cubic-bezier(0.4, 0, 0.2, 1);
						border-bottom: 1px solid #e8e8e8;
					}
					
					.table tbody tr:last-child {
						border-bottom: none;
					}
					
					.table tbody tr:hover {
						background: linear-gradient(90deg, #f8fdfa 0%, #f0f9f5 100%);
						box-shadow: 0 2px 8px rgba(11, 86, 51, 0.08);
						transform: translateY(-1px);
					}
					
					.table tbody td {
						padding: 16px 14px;
						font-size: 0.9rem;
						line-height: 1.6;
						vertical-align: middle;
						color: #2d2d2d;
						border-right: 1px solid #f0f0f0;
						word-wrap: break-word;
						overflow-wrap: break-word;
						hyphens: auto;
					}
					
					.table tbody td:last-child {
						border-right: none;
					}
					
					/* Column Widths - Professional Distribution */
					.table th:nth-child(1),
					.table td:nth-child(1) {
						width: 5%;
						min-width: 60px;
						text-align: center;
					}
					
					.table th:nth-child(2),
					.table td:nth-child(2) {
						width: 10%;
						min-width: 120px;
					}
					
					.table th:nth-child(3),
					.table td:nth-child(3) {
						width: 12%;
						min-width: 150px;
					}
					
					.table th:nth-child(4),
					.table td:nth-child(4) {
						width: 10%;
						min-width: 120px;
					}
					
					.table th:nth-child(5),
					.table td:nth-child(5) {
						width: 22%;
						min-width: 250px;
						font-weight: 500;
						color: #1a1a1a;
					}
					
					.table th:nth-child(6),
					.table td:nth-child(6) {
						width: 10%;
						min-width: 120px;
					}
					
					.table th:nth-child(7),
					.table td:nth-child(7) {
						width: 10%;
						min-width: 140px;
					}
					
					.table th:nth-child(8),
					.table td:nth-child(8) {
						width: 10%;
						min-width: 120px;
						text-align: center;
					}
					
					.table th:nth-child(9),
					.table td:nth-child(9) {
						width: 12%;
						min-width: 150px;
						text-align: center;
					}
					
					.table th:nth-child(10),
					.table td:nth-child(10) {
						width: 12%;
						min-width: 150px;
						text-align: center;
					}
					
					.table th:nth-child(11),
					.table td:nth-child(11) {
						width: 12%;
						min-width: 160px;
						text-align: center;
					}

					/* Title column - more flexible with better styling */
					.table th:nth-child(5),
					.table td:nth-child(5) {
						word-break: break-word;
						overflow-wrap: break-word;
						hyphens: auto;
						font-weight: 500;
						color: #2d2d2d;
					}

					/* ID column styling */
					.table td:nth-child(1) {
						font-weight: 600;
						color: var(--deep-green);
						font-size: 0.85rem;
					}

					/* Status dropdown professional styling */
					.status-dropdown {
						border: 1px solid #dee2e6;
						border-radius: 6px;
						transition: all 0.2s ease;
						font-size: 0.85rem;
					}

					.status-dropdown:hover {
						border-color: var(--deep-green);
						box-shadow: 0 0 0 3px rgba(11, 86, 51, 0.1);
					}

					.status-dropdown:focus {
						border-color: var(--deep-green);
						box-shadow: 0 0 0 3px rgba(11, 86, 51, 0.15);
						outline: none;
					}

						/* Safety */
						.content {
							box-sizing: border-box;
							display: flex;
							flex-direction: column;
							height: 100vh;
							overflow: hidden;
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
							margin: 0;
						}

						.sidebar-menu {
							padding: 1rem 0;
							height: calc(100vh - 80px);
							overflow-y: auto;
						}

						.sidebar-menu ul {
							list-style: none;
							padding: 0;
							margin: 0;
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

						.sidebar-menu a:hover,
						.sidebar-menu a.active {
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

						.menu-toggle:active {
							transform: scale(0.95);
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
							flex: 1;
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
							margin-bottom: 0;
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

						.logout-btn {
							background: rgba(251, 246, 238, 0.2);
							color: var(--cream);
							padding: 8px 16px;
							text-decoration: none;
							border-radius: 5px;
							transition: background 0.3s;
						}

						.logout-btn:hover {
							background: rgba(251, 246, 238, 0.3);
						}

					/* Bootstrap container-fluid override for admin layout */
					.container-fluid {
						max-width: 100%;
						margin: 0;
						padding: 1.5rem 20px;
						width: 100%;
						box-sizing: border-box;
						overflow-y: auto;
						overflow-x: hidden;
						flex: 1;
						-webkit-overflow-scrolling: touch;
						min-height: 0;
					}
					
					/* Ensure submissions section has proper right margin for finishing */
					.container-fluid .submissions-section {
						margin-right: 1rem;
						width: calc(100% - 1rem);
						max-width: calc(100% - 1rem);
					}

						.dashboard-header {
							margin-bottom: 1rem;
							flex-shrink: 0;
						}

						.dashboard-header h2 {
							color: var(--deep-green);
							font-size: 2rem;
							margin-bottom: 0.5rem;
						}

						@media (max-width: 768px) {
							.dashboard-header h2 {
								font-size: 1.5rem;
							}
						}

						/* Dashboard Cards - Now using Bootstrap Grid */
						/* Stats cards will use Bootstrap's responsive grid system */

						.stat-card {
							background: var(--paper);
							padding: 1rem 1.25rem;
							border-radius: var(--radius);
							box-shadow: var(--shadow);
							text-align: center;
							border: 1px solid var(--light-gray);
						}

						.stat-number {
							font-size: 2rem;
							font-weight: bold;
							color: var(--deep-green);
							line-height: 1.2;
						}

						.stat-label {
							color: var(--rust);
						}

					/* Submissions table */
					.submissions-section {
						background: #ffffff;
						padding: 1.5rem;
						border-radius: 12px;
						box-shadow: 0 4px 20px rgba(11, 86, 51, 0.08);
						border: 1px solid rgba(11, 86, 51, 0.12);
						width: calc(100% - 2rem);
						max-width: calc(100% - 2rem);
						overflow: visible;
						box-sizing: border-box;
						display: flex;
						flex-direction: column;
						min-height: 0;
						margin: 0 1rem 1rem 1rem;
					}

					/* Remove duplicate table-responsive - already defined above */

					/* Center align specific columns */
					.table th:nth-child(8),
					.table td:nth-child(8),
					.table th:nth-child(9),
					.table td:nth-child(9),
					.table th:nth-child(10),
					.table td:nth-child(10),
					.table th:nth-child(11),
					.table td:nth-child(11) {
						text-align: center;
					}

						/* Authors List Item - Centered Alignment */
						.author-list-wrapper {
							display: flex;
							flex-direction: column;
							align-items: center;
							justify-content: center;
							gap: 8px;
						}

						.author-list-item {
							display: flex;
							align-items: center;
							justify-content: center;
							gap: 6px;
							text-align: center;
							font-size: 0.9rem;
							line-height: 1.4;
						}

						.author-list-item i {
							flex-shrink: 0;
						}

					.table th:nth-child(10),
					.table td:nth-child(10) {
						/* Author Details (New) */
						width: 12%;
						word-wrap: break-word;
						white-space: normal;
						text-align: center;
						vertical-align: middle;
					}

						/* Author Details Item - Centered Alignment */
						.author-details-wrapper {
							display: flex;
							flex-direction: column;
							align-items: center;
							justify-content: center;
							gap: 10px;
						}

						.author-detail-item {
							display: flex;
							align-items: flex-start;
							justify-content: center;
							gap: 6px;
							text-align: center;
							font-size: 0.85rem;
							line-height: 1.5;
							max-width: 100%;
						}

						.author-detail-item i {
							flex-shrink: 0;
							margin-top: 2px;
						}

						.author-detail-item span {
							text-align: center;
							word-break: break-word;
						}

					.table th:nth-child(11),
					.table td:nth-child(11) {
						/* Actions (New) */
						width: 12%;
						min-width: 140px;
						white-space: normal;
						display: table-cell !important;
						visibility: visible !important;
						padding: 12px 8px !important;
						overflow: visible !important;
						padding: 12px 15px !important;
						text-align: center;
						vertical-align: middle;
					}

						/* Force Actions column to be visible */
						table#submissionsTable th:nth-child(11),
						table#submissionsTable td:nth-child(11) {
							display: table-cell !important;
							visibility: visible !important;
							opacity: 1 !important;
							min-width: 180px !important;
						}


					/* Action Buttons */
					.action-buttons {
						display: flex;
						gap: 0.5rem;
						flex-wrap: wrap;
						align-items: center;
						justify-content: center;
					}

					.custom-tooltip {
						position: relative;
						display: inline-block;
					}

					.custom-tooltip .tooltiptext {
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

					.custom-tooltip .tooltiptext::after {
						content: "";
						position: absolute;
						top: 100%;
						left: 50%;
						margin-left: -5px;
						border-width: 5px;
						border-style: solid;
						border-color: var(--deep-green) transparent transparent transparent;
					}

					.custom-tooltip:hover .tooltiptext {
						visibility: visible;
						opacity: 1;
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
					}

						.btn-download {
							background: var(--leaf) !important;
							color: var(--cream) !important;
							display: inline-flex !important;
							visibility: visible !important;
							opacity: 1 !important;
						}

						.btn-download:hover {
							background: #237a52 !important;
							transform: translateY(-1px);
						}

						.btn-email {
							background: var(--rust) !important;
							color: var(--cream) !important;
							display: inline-flex !important;
							visibility: visible !important;
							opacity: 1 !important;
						}

						.btn-email:hover {
							background: #6a4132 !important;
							transform: translateY(-1px);
						}

						.btn-edit {
							background: var(--gold);
							color: var(--text);
						}

						.btn-edit:hover {
							background: #b8934f;
							transform: translateY(-1px);
						}

						.btn-review {
							background: var(--deep-green) !important;
							color: var(--cream) !important;
							display: inline-flex !important;
							visibility: visible !important;
							opacity: 1 !important;
						}

						.btn-review:hover {
							background: var(--primary-dark) !important;
							transform: translateY(-1px);
						}

						/* Ensure Font Awesome icons are visible */
						.btn i,
						.btn i.fas,
						.btn i.fa {
							font-size: 1rem !important;
							display: inline-block !important;
							visibility: visible !important;
							opacity: 1 !important;
							color: inherit !important;
						}

						.btn-save {
							background: var(--leaf);
							color: var(--cream);
							padding: 10px 20px;
							border-radius: 5px;
							width: auto;
							height: auto;
						}

						.btn-cancel {
							background: var(--gray);
							color: var(--cream);
							padding: 10px 20px;
							border-radius: 5px;
							width: auto;
							height: auto;
						}

						/* Tooltip Styles */
						.tooltip {
							position: relative;
							display: inline-block !important;
							visibility: visible !important;
							opacity: 1 !important;
						}

						/* Override for action buttons tooltips */
						.action-buttons>.tooltip {
							display: flex !important;
							flex-shrink: 0 !important;
							margin: 0 !important;
							padding: 0 !important;
							width: auto !important;
							height: auto !important;
							align-items: center !important;
							justify-content: center !important;
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

						/* Modal */
						.modal {
							display: none;
							position: fixed;
							top: 0;
							left: 0;
							width: 100%;
							height: 100%;
							background: rgba(43, 43, 43, 0.8);
							z-index: 2000;
							align-items: center;
							justify-content: center;
						}

						.modal-content {
							background: var(--paper);
							padding: 2rem;
							border-radius: var(--radius);
							width: 90%;
							max-width: 600px;
							box-shadow: 0 20px 40px rgba(11, 74, 57, 0.2);
							border: 1px solid var(--light-gray);
						}

						.form-control {
							border: 1px solid var(--light-gray);
							background: var(--cream);
							color: var(--text);
							padding: 10px;
							border-radius: var(--radius);
							width: 100%;
							margin-bottom: 1rem;
						}

						.form-control:focus {
							border-color: var(--leaf);
							outline: none;
						}

						.no-submissions {
							text-align: center;
							color: var(--rust);
							padding: 2rem;
							font-style: italic;
						}

						/* Toggle Button */
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

						/* Responsive Design */
						@media (max-width: 1400px) {
							.container-fluid {
								padding: 1rem 15px;
							}

							.table th,
							.table td {
								padding: 10px 12px;
								font-size: 0.9rem;
							}
						}

						@media (max-width: 1200px) {
							.content {
								margin-left: 70px;
								width: calc(100% - 70px);
								max-width: calc(100vw - 70px);
							}

							.sidebar {
								width: 70px;
							}

							.sidebar-header h2,
							.sidebar-menu span {
								display: none;
							}

							.sidebar-menu ul li a {
								padding: 15px;
								justify-content: center;
							}

							.sidebar-menu i {
								margin-right: 0;
							}

							/* Adjust column widths for medium screens */
							.table th:nth-child(1),
							.table td:nth-child(1) {
								width: 3%;
							}

							.table th:nth-child(2),
							.table td:nth-child(2) {
								width: 7%;
							}

							.table th:nth-child(3),
							.table td:nth-child(3) {
								width: 9%;
							}

							.table th:nth-child(4),
							.table td:nth-child(4) {
								width: 6%;
							}

							.table th:nth-child(5),
							.table td:nth-child(5) {
								width: 14%;
							}

							.table th:nth-child(6),
							.table td:nth-child(6) {
								width: 7%;
							}

							.table th:nth-child(7),
							.table td:nth-child(7) {
								width: 7%;
							}

							.table th:nth-child(8),
							.table td:nth-child(8) {
								width: 8%;
							}

							.table th:nth-child(9),
							.table td:nth-child(9) {
								width: 12%;
							}

							.table th:nth-child(10),
							.table td:nth-child(10) {
								width: 15%;
							}

							.table th:nth-child(11),
							.table td:nth-child(11) {
								width: 14%;
							}

							/* Adjust visibility for new columns on smaller screens if necessary */
							.table th:nth-child(8),
							.table td:nth-child(8),
							/* Status */
							.table th:nth-child(9),
							.table td:nth-child(9),
							/* Authors List */
							.table th:nth-child(10),
							.table td:nth-child(10) {
								/* Author Details */
								font-size: 0.8rem;
								/* Make content smaller to fit */
							}

							.author-list-item,
							.author-detail-item {
								font-size: 0.75rem;
								gap: 4px;
							}

							.status-dropdown {
								font-size: 0.8rem !important;
								padding: 5px 8px !important;
								width: 100%;
								max-width: 100%;
							}

							.table th,
							.table td {
								padding: 8px 10px;
								font-size: 0.85rem;
							}
						}

						@media (max-width: 992px) {
							.stats-cards {
								grid-template-columns: repeat(2, 1fr);
							}

							.table {
								table-layout: fixed;
								width: 100%;
							}

							.table th:nth-child(4),
							.table td:nth-child(4),
							/* Phone */
							.table th:nth-child(7),
							.table td:nth-child(7) {
								/* Posted */
								display: none;
							}

							/* Redistribute widths after hiding columns */
							.table th:nth-child(1),
							.table td:nth-child(1) {
								width: 4%;
							}

							.table th:nth-child(2),
							.table td:nth-child(2) {
								width: 9%;
							}

							.table th:nth-child(3),
							.table td:nth-child(3) {
								width: 11%;
							}

							.table th:nth-child(5),
							.table td:nth-child(5) {
								width: 16%;
							}

							.table th:nth-child(6),
							.table td:nth-child(6) {
								width: 8%;
							}

							.table th:nth-child(8),
							.table td:nth-child(8) {
								width: 9%;
							}

							.table th:nth-child(9),
							.table td:nth-child(9) {
								width: 13%;
							}

							.table th:nth-child(10),
							.table td:nth-child(10) {
								width: 16%;
							}

							.table th:nth-child(11),
							.table td:nth-child(11) {
								width: 14%;
							}
						}

						@media (max-width: 992px) {
							.sidebar {
								width: 70px;
								overflow: hidden;
								transform: translateX(0);
							}

							.sidebar-header h2,
							.sidebar-menu span {
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
								max-width: calc(100vw - 70px);
								padding: 0;
							}
						}

						@media (max-width: 768px) {

							html,
							body {
								overflow: hidden;
								height: 100%;
							}

							/* Mobile Sidebar - Overlay Style */
							.sidebar {
								width: 0;
								transform: translateX(-100%);
								box-shadow: 2px 0 10px rgba(0, 0, 0, 0.1);
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
								max-width: 100vw;
							}

							.menu-toggle {
								display: block;
							}

							.stats-cards {
								grid-template-columns: 1fr;
								gap: 1rem;
							}

							.header-container {
								flex-direction: column;
								gap: 1rem;
								text-align: center;
								padding: 0 15px;
							}

						.container-fluid {
							padding: 1rem 15px;
						}

							.submissions-section {
								padding: 1rem;
								width: calc(100% - 1rem);
								max-width: calc(100% - 1rem);
								margin: 0 0.5rem 1rem 0.5rem;
							}

							.table-responsive {
								overflow-x: auto;
								overflow-y: auto;
								-webkit-overflow-scrolling: touch;
								width: 100%;
								max-height: calc(100vh - 280px);
								min-height: 300px;
								border: 1px solid rgba(11, 86, 51, 0.12);
								border-radius: 12px;
								background: #ffffff;
							}
							
							/* Custom scrollbar for mobile */
							.table-responsive::-webkit-scrollbar {
								width: 10px;
								height: 10px;
							}
							
							.table-responsive::-webkit-scrollbar-thumb {
								background: linear-gradient(180deg, var(--leaf) 0%, var(--deep-green) 100%);
								border-radius: 5px;
							}

							.table {
								table-layout: auto;
								width: 100%;
								margin-bottom: 0;
								min-width: 900px;
							}
							
							/* Sticky header for mobile */
							.table thead {
								position: sticky;
								top: 0;
								z-index: 100;
							}
							
							.table thead th {
								background: linear-gradient(135deg, #0b5633 0%, #1a7a4d 50%, #2b8a5f 100%) !important;
								color: #ffffff !important;
								font-size: 0.75rem;
								padding: 12px 10px;
							}

							.table th,
							.table td {
								padding: 8px;
								font-size: 0.8rem;
							}

							/* Hide some columns on mobile for better fit */
							.table th:nth-child(3),
							.table td:nth-child(3),
							/* Email */
							.table th:nth-child(4),
							.table td:nth-child(4),
							/* Phone */
							.table th:nth-child(6),
							.table td:nth-child(6) {
								/* File */
								display: none;
							}

							/* Redistribute widths for tablet - Author, Title, Posted, Status, Actions visible */
							.table th:nth-child(1),
							.table td:nth-child(1) {
								width: 6%;
							}

							.table th:nth-child(2),
							.table td:nth-child(2) {
								width: 12%;
							}

							.table th:nth-child(5),
							.table td:nth-child(5) {
								width: 35%;
								font-size: 0.85rem;
								line-height: 1.4;
							}

							.table th:nth-child(7),
							.table td:nth-child(7) {
								width: 12%;
							}

							.table th:nth-child(8),
							.table td:nth-child(8) {
								width: 15%;
							}

							/* Ensure Actions column has proper width on tablet */
							.table th:nth-child(11),
							.table td:nth-child(11) {
								width: 20%;
								min-width: 130px !important;
								padding: 10px 6px !important;
							}

							.action-buttons {
								gap: 0.4rem !important;
							}

							/* Pagination responsive */
							#paginationControls {
								padding: 0.75rem !important;
								gap: 0.75rem !important;
							}

							#paginationInfo {
								font-size: 0.8rem !important;
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

						/* Mobile: Only ID, Title, Status, Actions visible */
						@media (max-width: 575.98px) {
							.container-fluid {
								padding: 0.75rem 10px;
							}

							.submissions-section {
								padding: 0.75rem;
							}

							.table {
								table-layout: fixed;
								width: 100%;
							}

							.table thead th {
								font-size: 0.75rem;
								padding: 10px 8px;
							}

							.table tbody td {
								padding: 12px 8px;
								font-size: 0.85rem;
							}

							/* Redistribute widths for mobile - only 4 columns visible */
							.table th:nth-child(1),
							.table td:nth-child(1) {
								width: 10%;
							}

							.table th:nth-child(5),
							.table td:nth-child(5) {
								width: 45%;
								font-size: 0.8rem;
								line-height: 1.4;
							}

							.table th:nth-child(8),
							.table td:nth-child(8) {
								width: 22%;
							}

							.table th:nth-child(11),
							.table td:nth-child(11) {
								width: 23%;
							}

							.status-dropdown {
								font-size: 0.75rem;
								padding: 4px 8px;
							}
						}

						/* Small tablets: Add Author column */
						@media (min-width: 576px) and (max-width: 767.98px) {
							.table {
								table-layout: fixed;
								width: 100%;
							}

							.table th:nth-child(1),
							.table td:nth-child(1) {
								width: 6%;
							}

							.table th:nth-child(2),
							.table td:nth-child(2) {
								width: 12%;
							}

							.table th:nth-child(5),
							.table td:nth-child(5) {
								width: 38%;
								font-size: 0.9rem;
							}

							.table th:nth-child(8),
							.table td:nth-child(8) {
								width: 18%;
							}

							.table th:nth-child(11),
							.table td:nth-child(11) {
								width: 24%;
							}
						}

						/* Medium tablets: Add Posted column */
						@media (min-width: 768px) and (max-width: 991.98px) {
							.table {
								table-layout: fixed;
								width: 100%;
							}

							.table th:nth-child(1),
							.table td:nth-child(1) {
								width: 5%;
							}

							.table th:nth-child(2),
							.table td:nth-child(2) {
								width: 10%;
							}

							.table th:nth-child(5),
							.table td:nth-child(5) {
								width: 32%;
								font-size: 0.9rem;
							}

							.table th:nth-child(7),
							.table td:nth-child(7) {
								width: 12%;
							}

							.table th:nth-child(8),
							.table td:nth-child(8) {
								width: 15%;
							}

							.table th:nth-child(11),
							.table td:nth-child(11) {
								width: 23%;
							}
						}

							.table th,
							.table td {
								padding: 6px;
								font-size: 0.75rem;
							}

							.action-buttons {
								gap: 0.5rem !important;
								display: flex !important;
								visibility: visible !important;
								flex-wrap: nowrap !important;
								justify-content: center;
								padding: 0;
								margin: 0;
								width: 100%;
							}

							.action-buttons .tooltip {
								flex-shrink: 0 !important;
								margin: 0 !important;
								padding: 0 !important;
							}

							.btn {
								width: 32px !important;
								height: 32px !important;
								min-width: 32px !important;
								min-height: 32px !important;
								max-width: 32px !important;
								max-height: 32px !important;
								padding: 0 !important;
								display: flex !important;
								visibility: visible !important;
								opacity: 1 !important;
								flex-shrink: 0 !important;
								margin: 0 !important;
								box-sizing: border-box !important;
							}

							/* Ensure Actions column is visible on mobile */
							.table th:nth-child(11),
							.table td:nth-child(11) {
								display: table-cell !important;
								visibility: visible !important;
								min-width: 140px !important;
								padding: 10px 8px !important;
							}

							.author-list-item,
							.author-detail-item {
								font-size: 0.7rem;
							}

							.status-dropdown {
								font-size: 0.7rem !important;
								padding: 4px 6px !important;
							}

							/* Pagination responsive for small screens */
							#paginationControls {
								padding: 0.5rem !important;
								gap: 0.5rem !important;
							}

							#paginationInfo {
								font-size: 0.75rem !important;
							}
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

					<!-- Sidebar -->
					<div class="sidebar" id="sidebar">
						<div class="sidebar-header">
							<h2>NATURE AYURVED</h2>
						</div>

						<nav class="sidebar-menu">
							<ul>
								<li><a href="${pageContext.request.contextPath}/admin/dashboard">
										<i class="fas fa-home"></i> <span>Dashboard</span>
									</a></li>

								<li><a href="${pageContext.request.contextPath}/admin/submissions" class="active">
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
							</a></li> --%>

							<%-- <li><a href="${pageContext.request.contextPath}/submitArticle" target="_blank">
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
									<h1>NATURE AYURVED - Submissions</h1>
									<div class="admin-badge">Administrator</div>
								</div>
								<div class="user-info">
									<span>Welcome, Admin</span>
									<!--  	<a href="${pageContext.request.contextPath}/logout" class="logout-btn">Logout</a> -->
								</div>
							</div>
						</header>

					<div class="container-fluid">
						<div class="dashboard-header mb-3">
							<h2 class="mb-0">All Submissions</h2>
						</div>

						<!-- Bootstrap Grid System for Stats Cards -->
						<div class="row g-2 g-md-3 mb-3">
							<div class="col-6 col-sm-4 col-md-3 col-lg-2">
								<div class="stat-card h-100">
									<div class="stat-number">${totalSubmissions}</div>
									<div class="stat-label">Total Submissions</div>
								</div>
							</div>

							<div class="col-6 col-sm-4 col-md-3 col-lg-2">
								<div class="stat-card h-100">
									<div class="stat-number">${reviewSubmissions}</div>
									<div class="stat-label">Review</div>
								</div>
							</div>

							<div class="col-6 col-sm-4 col-md-3 col-lg-2">
								<div class="stat-card h-100">
									<div class="stat-number">${editingSubmissions}</div>
									<div class="stat-label">Editing</div>
								</div>
							</div>

							<div class="col-6 col-sm-4 col-md-3 col-lg-2">
								<div class="stat-card h-100">
									<div class="stat-number">${acceptedSubmissions}</div>
									<div class="stat-label">Accepted</div>
								</div>
							</div>

							<div class="col-6 col-sm-4 col-md-3 col-lg-2">
								<div class="stat-card h-100">
									<div class="stat-number">${publishedSubmissions}</div>
									<div class="stat-label">Published</div>
								</div>
							</div>

							<div class="col-6 col-sm-4 col-md-3 col-lg-2">
								<div class="stat-card h-100">
									<div class="stat-number">${rejectedSubmissions}</div>
									<div class="stat-label">Rejected</div>
								</div>
							</div>
						</div>

							<div class="submissions-section">
								<!-- Search and Entries Per Page Controls - Bootstrap Grid -->
								<div class="row g-2 g-md-3 mb-2 align-items-center">
									<div class="col-12 col-md-auto">
										<div class="d-flex align-items-center gap-2 flex-wrap">
											<label for="entriesPerPage" class="mb-0 fw-semibold text-dark small">Show:</label>
											<select id="entriesPerPage" class="form-select form-select-sm" style="width: auto; min-width: 70px;">
												<option value="5">5</option>
												<option value="10">10</option>
												<option value="25" selected>25</option>
												<option value="50">50</option>
												<option value="100">100</option>
												<option value="all">Show All</option>
											</select>
											<span id="entriesInfo" class="text-muted small">entries</span>
										</div>
									</div>
									<div class="col-12 col-md-auto ms-md-auto">
										<div class="d-flex align-items-center gap-2">
											<i class="fas fa-search text-success"></i>
											<input type="text" id="searchInput"
												placeholder="Search by ID, Author, Email, Title, Status..."
												class="form-control form-control-sm"
												style="min-width: 200px; max-width: 100%;"
												onkeyup="handleSearch()">
										</div>
									</div>
								</div>

								<!-- Bootstrap Table Responsive with Professional Scrollbar -->
								<div class="table-responsive" style="box-shadow: 0 2px 8px rgba(11, 86, 51, 0.08);">
									<c:choose>
									<c:when test="${not empty submissions}">
										<table class="table table-hover align-middle" id="submissionsTable">
											<thead>
												<tr>
													<th scope="col" class="text-nowrap">ID</th>
													<th scope="col" class="d-none d-sm-table-cell">Author</th>
													<th scope="col" class="d-none d-md-table-cell">Email</th>
													<th scope="col" class="d-none d-lg-table-cell">Phone</th>
													<th scope="col">Title</th>
													<th scope="col" class="d-none d-xl-table-cell">File</th>
													<th scope="col" class="d-none d-md-table-cell">Posted</th>
													<th scope="col" class="text-nowrap text-center">Status</th>
													<th scope="col" class="d-none d-lg-table-cell">Authors</th>
													<th scope="col" class="d-none d-xl-table-cell">Details</th>
													<th scope="col" class="text-nowrap text-center">Actions</th>
												</tr>
											</thead>

												<tbody id="tableBody">
													<c:forEach var="s" items="${submissions}">
														<tr>
															<td class="fw-bold text-nowrap">${s.id}</td>
															<td class="d-none d-sm-table-cell"><strong>${s.author.fullName}</strong></td>
															<td class="d-none d-md-table-cell small text-muted">${s.author.email}</td>
															<td class="d-none d-lg-table-cell small text-muted">${s.author.mobileNumber}</td>
															<td class="text-break fw-medium">${s.title}</td>
															<td class="d-none d-xl-table-cell small text-truncate text-muted" style="max-width: 150px;" title="${s.fileName}">${s.fileName}</td>
															<td class="d-none d-md-table-cell small text-muted">
																<fmt:formatDate value="${s.submittedAtDate}"
																	pattern="dd MMM yyyy, hh:mm a"
																	timeZone="Asia/Kolkata" />
															</td>
															<td>
															<%
com.ayurvedic.main.entity.Submission _sStatus =
	(com.ayurvedic.main.entity.Submission) pageContext.getAttribute("s");

String currentStatus =
	(_sStatus != null && _sStatus.getStatus() != null)
		? _sStatus.getStatus().name()
		: "UNDER_REVIEW";

/* Map old statuses to new ones for display */
if ("SUBMITTED".equals(currentStatus) || "REVIEWED".equals(currentStatus)) {
	currentStatus = "UNDER_REVIEW";
} else if ("APPROVED".equals(currentStatus)) {
	currentStatus = "UNDER_ACCEPTED";
} else if ("PUBLISHED".equals(currentStatus)) {
	currentStatus = "UNDER_PUBLISHED";
} else if ("REJECTED".equals(currentStatus)) {
	currentStatus = "UNDER_REJECTED";
}

pageContext.setAttribute("currentStatus", currentStatus);
%>

																	<select class="form-select form-select-sm status-dropdown"
																		id="status-dropdown-${s.id}"
																		data-submission-id="${s.id}"
																		data-original-value="${currentStatus}"
																		onchange="updateStatus(${s.id}, this.value, this)"
																		style="max-width: 120px; margin: 0 auto;">
																		<option value="UNDER_REVIEW" <c:if
																			test="${currentStatus eq 'UNDER_REVIEW'}">
																			selected</c:if>>Review</option>
																		<option value="UNDER_EDITING" <c:if
																			test="${currentStatus eq 'UNDER_EDITING'}">
																			selected</c:if>>Editing</option>
																		<option value="UNDER_ACCEPTED" <c:if
																			test="${currentStatus eq 'UNDER_ACCEPTED'}">
																			selected</c:if>>Accepted</option>
																		<option value="UNDER_PUBLISHED" <c:if
																			test="${currentStatus eq 'UNDER_PUBLISHED'}">
																			selected</c:if>>Published</option>
																		<option value="UNDER_REJECTED" <c:if
																			test="${currentStatus eq 'UNDER_REJECTED'}">
																			selected</c:if>>Rejected</option>
																	</select>
															</td>

															<td class="d-none d-lg-table-cell">
																<c:choose>
																	<c:when test="${not empty s.authorNames}">
																		<div class="author-list-wrapper">
																			<c:forEach var="a"
																				items="${fn:split(s.authorNames, '||')}">
																				<div class="author-list-item">
																					<i class="fas fa-user"></i>
																					<span>${a}</span>
																				</div>
																			</c:forEach>
																		</div>
																	</c:when>
																	<c:otherwise>
																		<span
																			style="color:gray; text-align: center; display: block;">No
																			authors</span>
																	</c:otherwise>
																</c:choose>
															</td>

															<td class="d-none d-xl-table-cell">
																<c:choose>
																	<c:when test="${not empty s.authorDetails}">
																		<div class="author-details-wrapper">
																			<c:forEach var="d"
																				items="${fn:split(s.authorDetails, '||')}">
																				<div class="author-detail-item">
																					<i class="fas fa-info-circle"></i>
																					<span>${d}</span>
																				</div>
																			</c:forEach>
																		</div>
																	</c:when>
																	<c:otherwise>
																		<span
																			style="color:gray; text-align: center; display: block;">No
																			details</span>
																	</c:otherwise>
																</c:choose>
															</td>

															<td class="text-center">
																<div class="action-buttons">
																	<div class="custom-tooltip">
																		<a href="${pageContext.request.contextPath}/admin/download/${s.id}"
																			class="btn btn-download">
																			<i class="fas fa-download"></i>
																		</a>
																		<span class="tooltiptext">Download File</span>
																	</div>

																	<div class="custom-tooltip">
																		<button class="btn btn-email"
																			onclick="openComposeMail('${s.id}', '${s.author.email}')">
																			<i class="fas fa-envelope"></i>
																		</button>
																		<span class="tooltiptext">Send Email</span>
																	</div>

																	<div class="custom-tooltip">
																		<% // Get actual status from submission object
																			com.ayurvedic.main.entity.Submission
																			_sAction=(com.ayurvedic.main.entity.Submission)
																			pageContext.getAttribute("s"); String
																			actualStatus=(_sAction !=null &&
																			_sAction.getStatus() !=null) ?
																			_sAction.getStatus().name() : "" ;
																			pageContext.setAttribute("actualStatus",
																			actualStatus); %>
																			<c:choose>
																				<c:when
																					test="${actualStatus == 'PUBLISHED'}">
																					<button class="btn btn-review"
																						style="background: var(--gray); cursor: not-allowed;"
																						onclick="showTempMessage('This article is already published and cannot be modified! Please change the status first if you need to edit.', 'error')"
																						disabled>
																						<i class="fas fa-file-alt"></i>
																					</button>
																					<span class="tooltiptext">Already
																						Published</span>
																				</c:when>
																				<c:otherwise>
																					<a href="${pageContext.request.contextPath}/admin/paper-review?submissionId=${s.id}"
																						class="btn btn-review">
																						<i class="fas fa-file-alt"></i>
																					</a>
																					<span class="tooltiptext">Paper
																						Review</span>
																				</c:otherwise>
																			</c:choose>
																	</div>
																</div>
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>

											<!-- Pagination Controls -->
											<div id="paginationControls"
												class="d-flex flex-column flex-md-row justify-content-between align-items-center gap-3 mt-3 p-3 bg-light rounded border">
												<div id="paginationInfo" class="text-muted small mb-0">
													Showing <span id="showingFrom" class="fw-semibold">0</span> to <span
														id="showingTo" class="fw-semibold">0</span> of <span
														id="totalEntries" class="fw-semibold">0</span> entries
												</div>
												<div class="d-flex gap-2 align-items-center flex-wrap">
													<button id="prevBtn" onclick="changePage(-1)"
														class="btn btn-sm btn-outline-secondary" disabled>
														<i class="fas fa-chevron-left"></i> <span
															class="d-none d-sm-inline">Previous</span>
													</button>
													<div id="pageNumbers" class="d-flex gap-1">
														<!-- Page numbers will be generated by JavaScript -->
													</div>
													<button id="nextBtn" onclick="changePage(1)"
														class="btn btn-sm btn-outline-secondary">
														<span class="d-none d-sm-inline">Next </span><i
															class="fas fa-chevron-right"></i>
													</button>
												</div>
											</div>
										</c:when>

										<c:otherwise>
											<div class="no-submissions">No submissions found.</div>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
					</div>

					<div id="mailModal" class="modal">
						<div class="modal-content">
							<h3 style="margin-bottom:1rem; color: var(--deep-green);">
								<i class="fas fa-envelope"></i> Compose Email
							</h3>

							<form id="mailForm" action="${pageContext.request.contextPath}/admin/send-mail"
								method="post" enctype="multipart/form-data" onsubmit="return validateMailForm()">

								<input type="hidden" id="mailSubmissionId" name="id">

								<div style="margin-bottom: 1rem;">
									<label
										style="color: var(--deep-green); display: block; margin-bottom: 0.5rem;">To:</label>
									<input type="email" id="mailTo" name="to" class="form-control" required>
								</div>

								<div style="margin-bottom: 1rem;">
									<label
										style="color: var(--deep-green); display: block; margin-bottom: 0.5rem;">Subject:</label>
									<input type="text" id="mailSubject" name="subject" class="form-control" required>
								</div>

								<div style="margin-bottom: 1rem;">
									<label
										style="color: var(--deep-green); display: block; margin-bottom: 0.5rem;">Message:</label>
									<textarea id="mailMessage" name="message" rows="6" class="form-control"
										required></textarea>
								</div>

								<div style="margin-bottom: 1rem;">
									<label
										style="color: var(--deep-green); display: block; margin-bottom: 0.5rem;">Attachments:</label>
									<input type="file" name="attachments" multiple class="form-control">
								</div>

								<div style="display: flex; gap: 1rem; justify-content: flex-end;">
									<button type="button" class="btn-cancel" onclick="closeMailModal()">Cancel</button>
									<button type="submit" class="btn-save">Send Email</button>
								</div>
							</form>
						</div>
					</div>

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

						// Close sidebar when clicking overlay
						if (sidebarOverlay) {
							sidebarOverlay.addEventListener('click', toggleSidebar);
						}

						// Close sidebar when clicking outside on mobile
						document.addEventListener('click', function (event) {
							const isClickInsideSidebar = sidebar.contains(event.target);
							const isClickOnToggle = menuToggle && menuToggle.contains(event.target);

							if (window.innerWidth <= 768 && sidebar.classList.contains('active')) {
								if (!isClickInsideSidebar && !isClickOnToggle) {
									toggleSidebar();
								}
							}
						});

						// Handle window resize
						window.addEventListener('resize', function () {
							if (window.innerWidth > 768) {
								sidebar.classList.remove('active');
								sidebarOverlay.classList.remove('active');
							}
						});

						function openComposeMail(id, email) {
							console.log('📧 Opening mail modal for submission ID:', id, 'Email:', email);

							try {
								const submissionIdField = document.getElementById('mailSubmissionId');
								const emailField = document.getElementById('mailTo');
								const modal = document.getElementById('mailModal');

								if (!submissionIdField) {
									console.error('❌ mailSubmissionId field not found');
									alert('Error: Mail form not found. Please refresh the page.');
									return;
								}

								if (!emailField) {
									console.error('❌ mailTo field not found');
									alert('Error: Email field not found. Please refresh the page.');
									return;
								}

								if (!modal) {
									console.error('❌ mailModal not found');
									alert('Error: Mail modal not found. Please refresh the page.');
									return;
								}

								// Set values
								submissionIdField.value = id;
								emailField.value = email || '';

								// Clear other fields
								const subjectField = document.getElementById('mailSubject');
								const messageField = document.getElementById('mailMessage');
								if (subjectField) subjectField.value = '';
								if (messageField) messageField.value = '';

								// Show modal
								modal.style.display = 'flex';
								console.log('✅ Mail modal opened successfully');

							} catch (error) {
								console.error('❌ Error opening mail modal:', error);
								alert('Error opening mail form: ' + error.message);
							}
						}

						function closeMailModal() {
							const modal = document.getElementById('mailModal');
							if (modal) {
								modal.style.display = 'none';
								console.log('📧 Mail modal closed');
							}
						}

						// Validate mail form before submission
						function validateMailForm() {
							console.log('📧 Validating mail form...');

							const submissionId = document.getElementById('mailSubmissionId').value;
							const to = document.getElementById('mailTo').value;
							const subject = document.getElementById('mailSubject').value;
							const message = document.getElementById('mailMessage').value;

							if (!submissionId || submissionId.trim() === '') {
								alert('Error: Submission ID is missing. Please refresh the page and try again.');
								console.error('❌ Submission ID is empty');
								return false;
							}

							if (!to || to.trim() === '') {
								alert('Please enter a recipient email address.');
								document.getElementById('mailTo').focus();
								return false;
							}

							// Basic email validation
							const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
							if (!emailRegex.test(to)) {
								alert('Please enter a valid email address.');
								document.getElementById('mailTo').focus();
								return false;
							}

							if (!subject || subject.trim() === '') {
								alert('Please enter an email subject.');
								document.getElementById('mailSubject').focus();
								return false;
							}

							if (!message || message.trim() === '') {
								alert('Please enter an email message.');
								document.getElementById('mailMessage').focus();
								return false;
							}

							// Show loading indicator
							const submitBtn = document.querySelector('#mailForm button[type="submit"]');
							if (submitBtn) {
								submitBtn.disabled = true;
								submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Sending...';
							}

							console.log('✅ Mail form validation passed');
							console.log('📤 Submitting email to:', to);
							return true;
						}

						// Close modal when clicking outside
						window.addEventListener('click', function (event) {
							const mailModal = document.getElementById('mailModal');
							if (event.target === mailModal) {
								closeMailModal();
							}
						});

						// Show success/error messages from URL parameters
						const urlParams = new URLSearchParams(window.location.search);

						// Show error message if article already published
						if (urlParams.get('error') === 'Article+already+published') {
							showTempMessage('This article is already published and cannot be modified!', 'error');
						}

						// Show success message if published successfully  
						if (urlParams.get('message') === 'Published+Successfully') {
							showTempMessage('Published successfully!', 'success');
						}

						// Show email success/error messages
						const emailMessage = urlParams.get('message');
						const emailError = urlParams.get('error');

						if (emailMessage && emailMessage.includes('Email+sent')) {
							showTempMessage('Email sent successfully!', 'success');
						}

						if (emailError && emailError.includes('Failed+to+send+email')) {
							const errorMsg = decodeURIComponent(emailError).replace(/\+/g, ' ');
							showTempMessage(errorMsg, 'error');
						}

						function showTempMessage(message, type) {
							const messageDiv = document.createElement('div');

							// Set background color based on type
							if (type === 'success') {
								messageDiv.style.background = 'var(--leaf)'; // Green for success
							} else {
								messageDiv.style.background = 'var(--rust)'; // Red for error
							}

							// Style the message
							messageDiv.style.position = 'fixed';
							messageDiv.style.top = '20px';
							messageDiv.style.right = '20px';
							messageDiv.style.padding = '15px 20px';
							messageDiv.style.color = 'var(--cream)';
							messageDiv.style.borderRadius = 'var(--radius)';
							messageDiv.style.zIndex = '10000';
							messageDiv.style.boxShadow = 'var(--shadow)';
							messageDiv.style.fontWeight = 'bold';
							messageDiv.style.fontSize = '14px';
							messageDiv.textContent = message;

							// Add to page
							document.body.appendChild(messageDiv);

							// Remove after 3 seconds
							setTimeout(() => {
								messageDiv.remove();
							}, 3000);
						}

						// ✅ NEW: Update submission status via AJAX
						function updateStatus(submissionId, newStatus, dropdownElement) {
							console.log('🔄 Updating status for submission:', submissionId, 'to:', newStatus);

							// Use the passed dropdown element if provided, otherwise try to find it
							let dropdown = dropdownElement;

							if (!dropdown) {
								// Try finding by ID first (most reliable)
								dropdown = document.getElementById(`status-dropdown-${submissionId}`);
							}

							if (!dropdown) {
								// Try finding by data attribute
								dropdown = document.querySelector(`select[data-submission-id="${submissionId}"]`);
							}

							// If not found, try finding by class and then checking data attribute
							if (!dropdown) {
								const allDropdowns = document.querySelectorAll('.status-dropdown');
								console.log('🔍 Found', allDropdowns.length, 'status dropdowns');
								for (let dd of allDropdowns) {
									if (dd.getAttribute('data-submission-id') == submissionId) {
										dropdown = dd;
										console.log('✅ Found dropdown using alternative method');
										break;
									}
								}
							}

							if (!dropdown) {
								console.error('❌ Dropdown not found for submission:', submissionId);
								console.error('🔍 Available dropdowns:', document.querySelectorAll('.status-dropdown').length);
								showTempMessage('Error: Could not find status dropdown. Please refresh the page.', 'error');
								return;
							}

							console.log('✅ Dropdown found:', dropdown);

							// Show loading indicator
							const originalValue = dropdown.getAttribute('data-original-value') || dropdown.value;
							dropdown.disabled = true;
							dropdown.style.opacity = '0.6';

							// Create form data
							const formData = new FormData();
							formData.append('submissionId', submissionId);
							formData.append('status', newStatus);

							console.log('📤 Sending AJAX request...');

							// Send AJAX request
							const url = '${pageContext.request.contextPath}/admin/update-status';
							console.log('📤 Request URL:', url);
							console.log('📤 FormData:', {
								submissionId: submissionId,
								status: newStatus
							});

							fetch(url, {
								method: 'POST',
								body: formData,
								headers: {
									'X-Requested-With': 'XMLHttpRequest'
								},
								credentials: 'same-origin'
							})
								.then(response => {
									console.log('📥 Response status:', response.status);
									if (!response.ok) {
										// Try to get error message from response
										return response.json().then(errorData => {
											console.error('❌ Server error response:', errorData);
											throw new Error(errorData.message || errorData.errorDetails || 'Network response was not ok: ' + response.status);
										}).catch(() => {
											throw new Error('Network response was not ok: ' + response.status);
										});
									}
									return response.json();
								})
								.then(data => {
									console.log('✅ Response data:', data);
									dropdown.disabled = false;
									dropdown.style.opacity = '1';

									if (data.success) {
										showTempMessage(data.message || 'Status updated successfully!', 'success');
										dropdown.setAttribute('data-original-value', newStatus);
										// Update the selected option visually
										dropdown.value = newStatus;

										// Reload the page after 1 second to show updated status
										setTimeout(() => {
											window.location.reload();
										}, 1000);
									} else {
										console.error('❌ Update failed:', data.message);
										showTempMessage(data.message || 'Failed to update status', 'error');
										// Revert to original value
										dropdown.value = originalValue;
									}
								})
								.catch(error => {
									console.error('❌ Error:', error);
									dropdown.disabled = false;
									dropdown.style.opacity = '1';
									showTempMessage('Error updating status. Please try again. Error: ' + error.message, 'error');
									// Revert to original value
									dropdown.value = originalValue;
								});
						}
					</script>

					<!-- Pagination and Search Script -->
					<script>
						let currentPage = 1;
						let entriesPerPage = 25;
						let filteredRows = [];
						let allRows = [];

						// Initialize on page load
						document.addEventListener('DOMContentLoaded', function () {
							// Get all table rows (excluding header)
							const tbody = document.getElementById('tableBody');
							if (tbody) {
								allRows = Array.from(tbody.querySelectorAll('tr'));
								
							// Sort rows by ID in descending order (..., 3, 2, 1)
							allRows.sort(function(a, b) {
								const idA = parseInt(a.querySelector('td:first-child')?.textContent?.trim() || '0');
								const idB = parseInt(b.querySelector('td:first-child')?.textContent?.trim() || '0');
								return idB - idA; // Descending order
							});
								
								// Clear tbody and re-append sorted rows to maintain correct order
								tbody.innerHTML = '';
								allRows.forEach(row => tbody.appendChild(row));
								
								filteredRows = allRows;
								
								// Get initial entries per page value from dropdown
								const entriesSelect = document.getElementById('entriesPerPage');
								if (entriesSelect) {
									const initialValue = entriesSelect.value;
									if (initialValue === 'all') {
										entriesPerPage = 'all';
									} else {
										entriesPerPage = parseInt(initialValue) || 25;
									}
									renderTable();
									
									// Add event listener for entries per page change
									entriesSelect.addEventListener('change', function () {
										const newValue = this.value;
										if (newValue === 'all') {
											entriesPerPage = 'all';
											currentPage = 1; // Reset to first page when changing entries per page
											renderTable();
										} else {
											const parsedValue = parseInt(newValue);
											if (!isNaN(parsedValue) && parsedValue > 0) {
												entriesPerPage = parsedValue;
												currentPage = 1; // Reset to first page when changing entries per page
												renderTable();
											}
										}
									});
								}
							}
						});

						// Handle search
						function handleSearch() {
							const searchTerm = document.getElementById('searchInput').value.toLowerCase().trim();
							const tbody = document.getElementById('tableBody');

							if (!tbody) return;

							// Filter rows based on search term
							if (searchTerm === '') {
								filteredRows = allRows;
							} else {
								filteredRows = allRows.filter(row => {
									const cells = row.querySelectorAll('td');
									let rowText = '';
									cells.forEach(cell => {
										rowText += cell.textContent.toLowerCase() + ' ';
									});
									return rowText.includes(searchTerm);
								});
							}

							currentPage = 1;
							renderTable();
						}

						// Render table with pagination
						function renderTable() {
							const tbody = document.getElementById('tableBody');
							if (!tbody) return;

							// Handle "Show All" option
							if (entriesPerPage === 'all') {
								// Show all filtered rows
								allRows.forEach(row => row.style.display = 'none');
								filteredRows.forEach(row => row.style.display = '');
								
								// Update pagination info
								const showingFromEl = document.getElementById('showingFrom');
								const showingToEl = document.getElementById('showingTo');
								const totalEntriesEl = document.getElementById('totalEntries');
								
								if (showingFromEl) showingFromEl.textContent = filteredRows.length > 0 ? 1 : 0;
								if (showingToEl) showingToEl.textContent = filteredRows.length;
								if (totalEntriesEl) totalEntriesEl.textContent = filteredRows.length;
								
								// Hide pagination controls when showing all
								updatePaginationControls(1, true);
								return;
							}

							// Ensure entriesPerPage is valid
							if (!entriesPerPage || entriesPerPage < 1) {
								entriesPerPage = 25;
							}

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
							const showingFromEl = document.getElementById('showingFrom');
							const showingToEl = document.getElementById('showingTo');
							const totalEntriesEl = document.getElementById('totalEntries');
							
							if (showingFromEl) showingFromEl.textContent = filteredRows.length > 0 ? startIndex + 1 : 0;
							if (showingToEl) showingToEl.textContent = Math.min(endIndex, filteredRows.length);
							if (totalEntriesEl) totalEntriesEl.textContent = filteredRows.length;

							// Update pagination controls
							updatePaginationControls(totalPages, false);
						}

						// Update pagination controls
						function updatePaginationControls(totalPages, hidePagination) {
							const prevBtn = document.getElementById('prevBtn');
							const nextBtn = document.getElementById('nextBtn');
							const pageNumbers = document.getElementById('pageNumbers');
							
							// Hide pagination controls when showing all entries
							if (hidePagination) {
								if (prevBtn) prevBtn.style.display = 'none';
								if (nextBtn) nextBtn.style.display = 'none';
								if (pageNumbers) pageNumbers.innerHTML = '';
								return;
							}
							
							// Show pagination controls
							if (prevBtn) prevBtn.style.display = '';
							if (nextBtn) nextBtn.style.display = '';

							// Enable/disable previous button
							if (prevBtn) {
								prevBtn.disabled = currentPage === 1;
								if (currentPage === 1) {
									prevBtn.classList.add('disabled');
								} else {
									prevBtn.classList.remove('disabled');
								}
							}

							// Enable/disable next button
							if (nextBtn) {
								nextBtn.disabled = currentPage === totalPages || totalPages === 0;
								if (currentPage === totalPages || totalPages === 0) {
									nextBtn.classList.add('disabled');
								} else {
									nextBtn.classList.remove('disabled');
								}
							}

							// Generate page numbers
							if (pageNumbers) {
								pageNumbers.innerHTML = '';
								if (totalPages === 0) return;
							} else {
								return;
							}

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
									ellipsis.style.padding = '0 5px';
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
							btn.style.minWidth = '38px';
							btn.style.fontSize = '0.875rem';
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

					<!-- Bootstrap 5.3.3 JS Bundle -->
					<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
				</body>

				</html>