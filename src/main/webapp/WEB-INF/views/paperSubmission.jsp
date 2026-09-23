<%@ page contentType="text/html;charset=UTF-8" language="java" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

			<!DOCTYPE html>
			<html lang="en">

			<head>
				<meta charset="UTF-8">
				<meta name="viewport" content="width=device-width, initial-scale=1.0">
				<title>Paper Review - NATURE AYURVEDT Admin</title>

				<!-- Bootstrap 5.3.3 CSS -->
				<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
				<!-- Font Awesome -->
				<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

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

					.container {
						max-width: 100%;
						margin: 0;
						padding: 1.5rem 20px;
						width: 100%;
						box-sizing: border-box;
						overflow: hidden;
						display: flex;
						flex-direction: column;
						flex: 1;
						min-height: 0;
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
						width: 100%;
						display: flex;
						flex-direction: column;
						flex: 1;
						min-height: 0;
						overflow: visible;
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

					/* Container overflow handling */
					.submissions-section {
						overflow: visible;
					}
					
					.container {
						overflow-x: visible;
						overflow-y: auto;
					}
					
					.content {
						overflow-x: visible;
						overflow-y: hidden;
					}

					/* Responsive table column widths - Professional distribution */
					/* Desktop: All columns visible */
					@media (min-width: 1400px) {
						.table th:nth-child(1), .table td:nth-child(1) { width: 5%; }
						.table th:nth-child(2), .table td:nth-child(2) { width: 12%; }
						.table th:nth-child(3), .table td:nth-child(3) { width: 13%; }
						.table th:nth-child(4), .table td:nth-child(4) { width: 9%; }
						.table th:nth-child(5), .table td:nth-child(5) { width: 25%; }
						.table th:nth-child(6), .table td:nth-child(6) { width: 10%; }
						.table th:nth-child(7), .table td:nth-child(7) { width: 10%; }
						.table th:nth-child(8), .table td:nth-child(8) { width: 8%; }
						.table th:nth-child(9), .table td:nth-child(9) { width: 8%; }
					}

					/* Large screens: Hide Phone */
					@media (min-width: 1200px) and (max-width: 1399.98px) {
						.table th:nth-child(1), .table td:nth-child(1) { width: 5%; }
						.table th:nth-child(2), .table td:nth-child(2) { width: 13%; }
						.table th:nth-child(3), .table td:nth-child(3) { width: 14%; }
						.table th:nth-child(5), .table td:nth-child(5) { width: 28%; }
						.table th:nth-child(6), .table td:nth-child(6) { width: 11%; }
						.table th:nth-child(7), .table td:nth-child(7) { width: 11%; }
						.table th:nth-child(8), .table td:nth-child(8) { width: 9%; }
						.table th:nth-child(9), .table td:nth-child(9) { width: 9%; }
					}

					/* Medium screens: Hide Email, Phone */
					@media (min-width: 992px) and (max-width: 1199.98px) {
						.table th:nth-child(1), .table td:nth-child(1) { width: 6%; }
						.table th:nth-child(2), .table td:nth-child(2) { width: 14%; }
						.table th:nth-child(5), .table td:nth-child(5) { width: 32%; }
						.table th:nth-child(6), .table td:nth-child(6) { width: 12%; }
						.table th:nth-child(7), .table td:nth-child(7) { width: 12%; }
						.table th:nth-child(8), .table td:nth-child(8) { width: 12%; }
						.table th:nth-child(9), .table td:nth-child(9) { width: 12%; }
					}

					/* Small screens: Hide Email, Phone, File */
					@media (min-width: 768px) and (max-width: 991.98px) {
						.table th:nth-child(1), .table td:nth-child(1) { width: 7%; }
						.table th:nth-child(2), .table td:nth-child(2) { width: 16%; }
						.table th:nth-child(5), .table td:nth-child(5) { width: 38%; }
						.table th:nth-child(7), .table td:nth-child(7) { width: 13%; }
						.table th:nth-child(8), .table td:nth-child(8) { width: 13%; }
						.table th:nth-child(9), .table td:nth-child(9) { width: 13%; }
					}

					/* Extra small: Only ID, Author, Title, Status, Actions */
					@media (min-width: 576px) and (max-width: 767.98px) {
						.table th:nth-child(1), .table td:nth-child(1) { width: 8%; }
						.table th:nth-child(2), .table td:nth-child(2) { width: 18%; }
						.table th:nth-child(5), .table td:nth-child(5) { width: 42%; }
						.table th:nth-child(8), .table td:nth-child(8) { width: 16%; }
						.table th:nth-child(9), .table td:nth-child(9) { width: 16%; }
					}

					/* Action Buttons */
					.action-buttons {
						display: flex;
						gap: 0.5rem;
						flex-wrap: wrap;
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
					}

					.btn-download {
						background: var(--leaf);
						color: var(--cream);
					}

					.btn-download:hover {
						background: #237a52;
						transform: translateY(-1px);
					}

					.btn-email {
						background: var(--rust);
						color: var(--cream);
					}

					.btn-email:hover {
						background: #6a4132;
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
						background: var(--deep-green);
						color: var(--cream);
					}

					.btn-review:hover {
						background: var(--primary-dark);
						transform: translateY(-1px);
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

					/* Responsive Design */
					@media (max-width: 1400px) {
						.container {
							padding: 0 15px;
						}

						.table {
							table-layout: fixed;
							width: 100%;
						}

						.table th,
						.table td {
							padding: 10px 12px;
							font-size: 0.9rem;
						}

						/* Adjust column widths for large screens */
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

						.table th:nth-child(4),
						.table td:nth-child(4) {
							width: 7%;
						}

						.table th:nth-child(5),
						.table td:nth-child(5) {
							width: 19%;
						}

						.table th:nth-child(6),
						.table td:nth-child(6) {
							width: 9%;
						}

						.table th:nth-child(7),
						.table td:nth-child(7) {
							width: 9%;
						}

						.table th:nth-child(8),
						.table td:nth-child(8) {
							width: 9%;
						}

						.table th:nth-child(9),
						.table td:nth-child(9) {
							width: 13%;
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

						/* Stats cards now use Bootstrap grid - no CSS grid needed */

						.table {
							table-layout: fixed;
							width: 100%;
						}

						.table th,
						.table td {
							padding: 8px 10px;
							font-size: 0.85rem;
						}

						/* Hide columns on medium screens */
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
							width: 5%;
						}

						.table th:nth-child(2),
						.table td:nth-child(2) {
							width: 11%;
						}

						.table th:nth-child(3),
						.table td:nth-child(3) {
							width: 13%;
						}

						.table th:nth-child(5),
						.table td:nth-child(5) {
							width: 22%;
						}

						.table th:nth-child(6),
						.table td:nth-child(6) {
							width: 11%;
						}

						.table th:nth-child(8),
						.table td:nth-child(8) {
							width: 11%;
						}

						.table th:nth-child(9),
						.table td:nth-child(9) {
							width: 17%;
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

						/* Stats cards now use Bootstrap grid - no CSS grid needed */

						.header-container {
							flex-direction: column;
							gap: 1rem;
							text-align: center;
							padding: 0 15px;
						}

						.container {
							padding: 1rem 15px;
						}

						.submissions-section {
							padding: 1rem;
						}
						
						.table-responsive {
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
						
						/* Ensure table fits mobile screens with horizontal scroll */
						.table {
							min-width: 900px;
							table-layout: auto;
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
						
						.table thead th {
							background: var(--deep-green) !important;
							color: var(--cream) !important;
						}

						/* Tablet responsive styles - already handled by media queries above */
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

					@media (max-width: 576px) {
						.container {
							padding: 0.75rem 10px;
						}

						.submissions-section {
							padding: 0.75rem;
						}

						.table {
							table-layout: fixed;
							width: 100%;
						}

						.table th:nth-child(2),
						.table td:nth-child(2),
						/* Author */
						.table th:nth-child(7),
						.table td:nth-child(7) {
							/* Posted */
							display: none;
						}

						/* Redistribute widths for mobile - only 4 columns visible */
						.table th:nth-child(1),
						.table td:nth-child(1) {
							width: 10%;
						}

						.table th:nth-child(5),
						.table td:nth-child(5) {
							width: 50%;
							font-size: 0.8rem;
							line-height: 1.4;
						}

						.table th:nth-child(8),
						.table td:nth-child(8) {
							width: 20%;
						}

						.table th:nth-child(9),
						.table td:nth-child(9) {
							width: 20%;
						}

						.table thead th {
							font-size: 0.75rem;
							padding: 10px 8px;
						}

						.table tbody td {
							padding: 12px 8px;
							font-size: 0.85rem;
						}

						.action-buttons {
							gap: 0.3rem;
							display: flex !important;
							flex-wrap: wrap;
							justify-content: center;
						}

						.btn {
							width: 32px;
							height: 32px;
							padding: 6px;
						}

						/* Filter controls responsive */
						#searchInput {
							width: 100% !important;
							max-width: 100% !important;
						}
					}

					/* Filter and Search Controls Styling */
					#searchInput:focus,
					#statusFilter:focus,
					#entriesPerPage:focus {
						outline: none;
						border-color: var(--deep-green) !important;
						box-shadow: 0 0 0 2px rgba(11, 86, 51, 0.1);
					}

					#searchInput::placeholder {
						color: var(--gray);
						opacity: 0.7;
					}

					/* Pagination button hover effects */
					#paginationControls button:not(:disabled):hover {
						background: var(--deep-green) !important;
						color: var(--cream) !important;
						transform: translateY(-1px);
						transition: all 0.3s;
					}

					#paginationControls button:disabled {
						cursor: not-allowed !important;
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
									<i class="fas fa-home"></i>
									<span>Dashboard</span>
								</a></li>

							<li><a href="${pageContext.request.contextPath}/admin/submissions">
									<i class="fas fa-file"></i> <span>Submissions</span>
								</a></li>

							<li><a href="${pageContext.request.contextPath}/admin/submissions1" class="active">
									<i class="fas fa-file-alt"></i> <span>Paper Review</span>
								</a></li>
<%-- 
							<li><a href="${pageContext.request.contextPath}/admin/conferences">
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

					<%-- 	<li><a href="${pageContext.request.contextPath}/admin/manage-content"> 
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
				<!-- ---------------- SIDEBAR END ---------------- -->

				<div class="content" id="mainContent">
					<!-- HEADER -->
					<header>
						<div class="header-container">
							<div class="logo">
								<h1>NATURE AYURVED - Submissions</h1>
								<div class="admin-badge">Administrator</div>
							</div>
							<div class="user-info">
								<span>Welcome, Admin</span>
							</div>
						</div>
					</header>

					<div class="container">
						<div class="dashboard-header">
							<h2>All Submissions</h2>
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

						<!-- Submissions Table -->
						<div class="submissions-section">
							<!-- Search and Filter Controls -->
							<div
								class="d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center gap-3 mb-3 p-3 bg-light rounded border">
								<div class="d-flex align-items-center gap-2 flex-wrap">
									<label for="entriesPerPage" class="mb-0 fw-semibold text-dark">Show:</label>
									<select id="entriesPerPage" class="form-select form-select-sm"
										style="width: auto; min-width: 80px;">
										<option value="5">5</option>
										<option value="10">10</option>
										<option value="25" selected>25</option>
										<option value="50">50</option>
										<option value="100">100</option>
										<option value="all">Show All</option>
									</select>
									<span id="entriesInfo" class="text-muted small">entries</span>
								</div>

								<div class="d-flex align-items-center gap-2 flex-wrap flex-grow-1 flex-md-grow-0">
									<!-- Status Filter -->
									<label for="statusFilter" class="mb-0 fw-semibold text-dark">Status:</label>
									<select id="statusFilter" class="form-select form-select-sm"
										style="width: auto; min-width: 150px;" onchange="handleFilter()">
										<option value="">All Status</option>
										<option value="UNDER_REVIEW">Review</option>
										<option value="UNDER_EDITING">Editing</option>
										<option value="UNDER_ACCEPTED">Accepted</option>
										<option value="UNDER_PUBLISHED">Published</option>
										<option value="UNDER_REJECTED">Rejected</option>
									</select>

									<!-- Search Box -->
									<div class="d-flex align-items-center gap-2 flex-grow-1" style="min-width: 200px;">
										<i class="fas fa-search text-success"></i>
										<input type="text" id="searchInput"
											placeholder="Search by ID, Author, Email, Title, Status..."
											class="form-control form-control-sm" style="max-width: 100%;"
											onkeyup="handleSearch()">
									</div>
								</div>
							</div>

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
															<%
																java.time.ZonedDateTime zdt = ((com.ayurvedic.main.entity.Submission)pageContext.getAttribute("s")).getSubmittedAt();
																if(zdt != null) {
																	java.time.format.DateTimeFormatter formatter = java.time.format.DateTimeFormatter.ofPattern("MMM dd, yyyy hh:mm a");
																	out.print(zdt.format(formatter));
																} else {
																	out.print("-");
																}
															%>
														</td>
														<td class="text-center" data-raw-status="${s.status}"><span
																class="badge bg-secondary text-capitalize">${fn:toLowerCase(fn:replace(s.status,
																'UNDER_', ''))}</span></td>

														<td>
															<div class="action-buttons">
																<!-- Paper Review Button with Tooltip - ADDED CONDITIONAL LOGIC -->
																<div class="custom-tooltip">
																	<c:choose>
																		<c:when test="${s.status == 'PUBLISHED'}">
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

																<!-- EDIT Button with Tooltip -->
																<div class="custom-tooltip">
																	<c:choose>
																		<c:when test="${s.status == 'PUBLISHED'}">
																			<button class="btn btn-edit"
																				style="background: var(--gray); cursor: not-allowed;"
																				onclick="showTempMessage('This article is already published and cannot be modified! Please change the status first if you need to edit.', 'error')"
																				disabled>
																				<i class="fas fa-edit"></i>
																			</button>
																			<span class="tooltiptext">Already
																				Published</span>
																		</c:when>
																		<c:otherwise>
																			<a href="${pageContext.request.contextPath}/admin/paper-review/edit?submissionId=${s.id}"
																				class="btn btn-edit">
																				<i class="fas fa-edit"></i>
																			</a>
																			<span class="tooltiptext">Edit Review</span>
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
												Showing <span id="showingFrom">0</span> to <span id="showingTo">0</span>
												of
												<span id="totalEntries">0</span> entries
											</div>
											<div class="d-flex gap-2 align-items-center flex-wrap">
												<button id="prevBtn" onclick="changePage(-1)"
													class="btn btn-sm btn-outline-secondary" disabled>
													<i class="fas fa-chevron-left"></i> Previous
												</button>
												<div id="pageNumbers" class="d-flex gap-1">
													<!-- Page numbers will be generated by JavaScript -->
												</div>
												<button id="nextBtn" onclick="changePage(1)"
													class="btn btn-sm btn-outline-secondary">
													Next <i class="fas fa-chevron-right"></i>
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

				<!-- MAIL MODAL -->
				<div id="mailModal" class="modal">
					<div class="modal-content">
						<h3 style="margin-bottom:1rem; color: var(--deep-green);">
							<i class="fas fa-envelope"></i> Compose Email
						</h3>

						<form action="${pageContext.request.contextPath}/admin/send-mail" method="post"
							enctype="multipart/form-data">

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
						document.getElementById('mailSubmissionId').value = id;
						document.getElementById('mailTo').value = email;
						document.getElementById('mailModal').style.display = 'flex';
					}

					function closeMailModal() {
						document.getElementById('mailModal').style.display = 'none';
					}

					// Close modal when clicking outside
					window.addEventListener('click', function (event) {
						const mailModal = document.getElementById('mailModal');
						if (event.target === mailModal) {
							closeMailModal();
						}
					});

					// ADDED FROM 1ST CODE: Show success/error messages from URL parameters
					const urlParams = new URLSearchParams(window.location.search);

					// Show error message if article already published
					if (urlParams.get('error') === 'Article+already+published') {
						showTempMessage('This article is already published and cannot be modified!', 'error');
					}

					// Show success message if published successfully  
					if (urlParams.get('message') === 'Published+Successfully') {
						showTempMessage('Published successfully!', 'success');
					}

					// ADDED FROM 1ST CODE: Temporary message function
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
						const statusFilter = document.getElementById('statusFilter').value;

						applyFilters(searchTerm, statusFilter);
					}

					// Handle filter
					function handleFilter() {
						const searchTerm = document.getElementById('searchInput').value.toLowerCase().trim();
						const statusFilter = document.getElementById('statusFilter').value;

						applyFilters(searchTerm, statusFilter);
					}

					// Apply all filters
					function applyFilters(searchTerm, statusFilter) {
						const tbody = document.getElementById('tableBody');

						if (!tbody) return;

						// Filter rows based on search term and status
						if (searchTerm === '' && statusFilter === '') {
							filteredRows = allRows;
						} else {
							filteredRows = allRows.filter(row => {
								const cells = row.querySelectorAll('td');
								let rowText = '';
								let statusText = '';

								cells.forEach((cell, index) => {
									// Get raw status from data attribute
									if (index === 7) {
										statusText = cell.getAttribute('data-raw-status') || cell.textContent.trim();
									}
									rowText += cell.textContent.toLowerCase() + ' ';
								});

								// Check search term match
								const matchesSearch = searchTerm === '' || rowText.includes(searchTerm);

								// Check status filter match
								let matchesStatus = true;
								if (statusFilter !== '') {
									// Exact match against the raw status value (e.g. UNDER_REVIEW)
									matchesStatus = statusText === statusFilter;
								}

								return matchesSearch && matchesStatus;
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
							const showingFrom = document.getElementById('showingFrom');
							const showingTo = document.getElementById('showingTo');
							const totalEntries = document.getElementById('totalEntries');
							
							if (showingFrom) showingFrom.textContent = filteredRows.length > 0 ? 1 : 0;
							if (showingTo) showingTo.textContent = filteredRows.length;
							if (totalEntries) totalEntries.textContent = filteredRows.length;
							
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
						const showingFrom = document.getElementById('showingFrom');
						const showingTo = document.getElementById('showingTo');
						const totalEntries = document.getElementById('totalEntries');

						if (showingFrom) showingFrom.textContent = filteredRows.length > 0 ? startIndex + 1 : 0;
						if (showingTo) showingTo.textContent = Math.min(endIndex, filteredRows.length);
						if (totalEntries) totalEntries.textContent = filteredRows.length;

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