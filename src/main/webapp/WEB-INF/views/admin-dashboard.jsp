<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Dashboard - NATURE AYURVED</title>
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
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body {
	background-color: var(--cream);
	color: var(--text);
	line-height: 1.6;
	display: flex;
	min-height: 100vh;
	overflow-x: hidden;
	position: relative;
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

/* Main Content */
.main-content {
	flex: 1;
	margin-left: 250px;
	padding: 1.5rem;
	transition: all 0.3s ease;
	width: calc(100% - 250px);
	min-height: 100vh;
	overflow-x: hidden;
}

/* Top Bar */
.top-bar {
	display: flex;
	justify-content: space-between;
	align-items: center;
	background: var(--paper);
	padding: 1rem 1.5rem;
	border-radius: var(--radius);
	box-shadow: var(--shadow);
	margin-bottom: 1.5rem;
	border: 1px solid var(--light-gray);
	width: 100%;
	max-width: 100%;
	box-sizing: border-box;
}

.search-box {
	display: flex;
	align-items: center;
	background: var(--cream);
	border-radius: 30px;
	padding: 0.5rem 1rem;
	width: 300px;
	max-width: 100%;
	border: 1px solid var(--light-gray);
	box-sizing: border-box;
	flex-shrink: 0;
}

.search-box input {
	border: none;
	background: transparent;
	outline: none;
	width: 100%;
	padding: 0.3rem;
	color: var(--text);
}

.search-box input::placeholder {
	color: var(--gray);
}

.user-info {
	display: flex;
	align-items: center;
	gap: 1rem;
}

.user-details {
	text-align: right;
}

.user-details .user-name {
	font-weight: 600;
	color: var(--deep-green);
}

.user-details .user-role {
	font-size: 0.8rem;
	color: var(--rust);
}

.user-avatar {
	width: 40px;
	height: 40px;
	border-radius: 50%;
	background: var(--deep-green);
	color: var(--gold);
	display: flex;
	align-items: center;
	justify-content: center;
	font-weight: bold;
	border: 2px solid var(--gold);
}

/* Dashboard Header */
.dashboard-header {
	margin-bottom: 1.5rem;
}

.dashboard-header h1 {
	color: var(--deep-green);
	font-size: 1.8rem;
	margin-bottom: 0.5rem;
}

.dashboard-header p {
	color: var(--rust);
}

/* Stats Cards */
.stats-cards {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
	gap: 1.5rem;
	margin-bottom: 2rem;
	width: 100%;
	max-width: 100%;
}

.stat-card {
	background: var(--paper);
	padding: 1.5rem;
	border-radius: var(--radius);
	box-shadow: var(--shadow);
	display: flex;
	align-items: center;
	transition: transform 0.3s, box-shadow 0.3s;
	border: 1px solid var(--light-gray);
}

.stat-card:hover {
	transform: translateY(-5px);
	box-shadow: 0 15px 35px rgba(11, 74, 57, 0.1);
}

.stat-icon {
	width: 60px;
	height: 60px;
	border-radius: var(--radius);
	display: flex;
	align-items: center;
	justify-content: center;
	margin-right: 1rem;
	font-size: 1.5rem;
}

.stat-icon.total {
	background: rgba(11, 86, 51, 0.1);
	color: var(--deep-green);
}

.stat-icon.pending {
	background: rgba(201, 162, 90, 0.15);
	color: var(--gold);
}

.stat-icon.reviewed {
	background: rgba(43, 138, 95, 0.15);
	color: var(--leaf);
}

.stat-icon.published {
	background: rgba(122, 75, 58, 0.1);
	color: var(--rust);
}

.stat-content {
	flex: 1;
}

.stat-number {
	font-size: 2rem;
	font-weight: 700;
	margin-bottom: 0.2rem;
	color: var(--deep-green);
}

.stat-label {
	color: var(--rust);
	font-size: 0.9rem;
}

.stat-change {
	font-size: 0.8rem;
	margin-top: 0.3rem;
	font-weight: 600;
}

.stat-change.positive {
	color: var(--leaf);
}

.stat-change.negative {
	color: var(--rust);
}

/* Content Area */
.content-area {
	background: var(--paper);
	border-radius: var(--radius);
	box-shadow: var(--shadow);
	overflow: hidden;
	border: 1px solid var(--light-gray);
	width: 100%;
	max-width: 100%;
	box-sizing: border-box;
}

.content-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 1.5rem;
	border-bottom: 1px solid var(--light-gray);
	background: rgba(11, 86, 51, 0.03);
}

.content-header h3 {
	color: var(--deep-green);
	font-size: 1.3rem;
}

.content-actions {
	display: flex;
	gap: 0.8rem;
}

.btn {
	padding: 0.6rem 1.2rem;
	border: none;
	border-radius: var(--radius);
	font-size: 0.9rem;
	font-weight: 600;
	cursor: pointer;
	transition: all 0.3s;
	display: inline-flex;
	align-items: center;
	justify-content: center;
	gap: 0.5rem;
}

.btn-primary {
	background: var(--deep-green);
	color: var(--cream);
}

.btn-primary:hover {
	background: var(--primary-dark);
	transform: translateY(-2px);
}

.btn-outline {
	background: transparent;
	border: 1px solid var(--deep-green);
	color: var(--deep-green);
}

.btn-outline:hover {
	background: var(--deep-green);
	color: var(--cream);
	transform: translateY(-2px);
}

.btn-success {
	background: var(--leaf);
	color: var(--cream);
}

.btn-success:hover {
	background: #237a52;
	transform: translateY(-2px);
}

.btn-info {
	background: var(--rust);
	color: var(--cream);
}

.btn-info:hover {
	background: #6a4132;
	transform: translateY(-2px);
}

/* Table */
.table-container {
	overflow-x: auto;
	padding: 0 1.5rem 1.5rem;
	width: 100%;
	max-width: 100%;
	box-sizing: border-box;
	-webkit-overflow-scrolling: touch;
}

.table {
	width: 100%;
	border-collapse: collapse;
	min-width: 1000px;
	table-layout: auto;
}

.table th, .table td {
	padding: 12px 15px;
	text-align: left;
	border-bottom: 1px solid var(--light-gray);
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

.status {
	padding: 6px 12px;
	border-radius: 20px;
	font-size: 0.8rem;
	font-weight: bold;
	display: inline-block;
}

.status-submitted {
	background: rgba(201, 162, 90, 0.15);
	color: var(--gold);
}

.status-reviewed {
	background: rgba(43, 138, 95, 0.15);
	color: var(--leaf);
}

.status-published {
	background: rgba(122, 75, 58, 0.1);
	color: var(--rust);
}

.action-buttons {
	display: flex;
	gap: 0.5rem;
	flex-wrap: nowrap;
	align-items: center;
	justify-content: flex-start;
}

.btn-sm {
	padding: 6px 10px;
	font-size: 0.8rem;
	position: relative;
	flex-shrink: 0;
	min-width: 36px;
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

/* Tooltip Styles */
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

.no-submissions {
	text-align: center;
	color: var(--rust);
	padding: 3rem;
	font-style: italic;
}

.no-submissions i {
	color: var(--gold);
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

.modal-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 1.5rem;
	padding-bottom: 1rem;
	border-bottom: 1px solid var(--light-gray);
}

.modal-header h3 {
	color: var(--deep-green);
	font-size: 1.5rem;
}

.close-btn {
	background: none;
	border: none;
	font-size: 1.5rem;
	cursor: pointer;
	color: var(--rust);
	transition: color 0.3s;
}

.close-btn:hover {
	color: var(--deep-green);
}

.form-group {
	margin-bottom: 1.5rem;
}

.form-group label {
	display: block;
	margin-bottom: 0.5rem;
	font-weight: 500;
	color: var(--deep-green);
}

.form-control {
	width: 100%;
	padding: 10px;
	border: 2px solid var(--light-gray);
	border-radius: var(--radius);
	font-size: 1rem;
	transition: border-color 0.3s;
	background: var(--cream);
	color: var(--text);
}

.form-control:focus {
	outline: none;
	border-color: var(--leaf);
}

textarea.form-control {
	resize: vertical;
	min-height: 120px;
}

.form-actions {
	display: flex;
	justify-content: flex-end;
	gap: 1rem;
	margin-top: 1.5rem;
}

.btn-cancel {
	background: var(--light-gray);
	color: var(--text);
}

.btn-cancel:hover {
	background: #d4c9b9;
	transform: translateY(-1px);
}

/* Responsive Design - Professional & Mobile-First */
/* Extra Large Devices (Large Desktops, 1200px and up) */
@media (min-width: 1200px) {
	.main-content {
		padding: 1.5rem;
	}
	.stats-cards {
		grid-template-columns: repeat(4, 1fr);
		gap: 1.5rem;
	}
}

/* Large Devices (Desktops, 992px to 1199px) */
@media (max-width: 1199px) and (min-width: 993px) {
	.main-content {
		padding: 1.2rem;
	}
	.stats-cards {
		grid-template-columns: repeat(2, 1fr);
		gap: 1.2rem;
	}
	.search-box {
		width: 250px;
	}
	.stat-number {
		font-size: 1.8rem;
	}
}

/* Medium Devices (Tablets, 768px to 992px) */
@media (max-width: 992px) and (min-width: 769px) {
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
	.main-content {
		margin-left: 70px;
		padding: 1rem;
		width: calc(100% - 70px);
	}
	.stats-cards {
		grid-template-columns: repeat(2, 1fr);
		gap: 1rem;
	}
	.top-bar {
		padding: 0.8rem 1rem;
		flex-wrap: wrap;
	}
	.search-box {
		width: 200px;
		min-width: 180px;
	}
	.dashboard-header h1 {
		font-size: 1.5rem;
	}
	.stat-card {
		padding: 1.2rem;
	}
	.stat-icon {
		width: 55px;
		height: 55px;
		font-size: 1.4rem;
	}
	.stat-number {
		font-size: 1.7rem;
	}
}

/* Small Devices (Landscape Phones, 576px to 768px) */
@media (max-width: 768px) {
	body {
		overflow-x: hidden;
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
	
	/* Main Content */
	.main-content {
		margin-left: 0;
		padding: 0.8rem;
		width: 100%;
		overflow-x: hidden;
	}
	
	/* Top Bar */
	.top-bar {
		flex-direction: column;
		gap: 1rem;
		align-items: stretch;
		padding: 1rem;
		margin-bottom: 1rem;
	}
	
	.search-box {
		width: 100%;
		max-width: 100%;
	}
	
	.user-info {
		justify-content: space-between;
		width: 100%;
	}
	
	.user-details {
		text-align: left;
	}
	
	.user-avatar {
		width: 35px;
		height: 35px;
		font-size: 0.9rem;
	}
	
	/* Stats Cards */
	.stats-cards {
		grid-template-columns: 1fr;
		gap: 1rem;
		margin-bottom: 1.5rem;
	}
	
	.stat-card {
		padding: 1.2rem;
	}
	
	.stat-icon {
		width: 50px;
		height: 50px;
		font-size: 1.3rem;
		margin-right: 0.8rem;
	}
	
	.stat-number {
		font-size: 1.8rem;
	}
	
	.stat-label {
		font-size: 0.85rem;
	}
	
	.stat-change {
		font-size: 0.75rem;
	}
	
	/* Dashboard Header */
	.dashboard-header {
		margin-bottom: 1rem;
	}
	
	.dashboard-header h1 {
		font-size: 1.3rem;
		margin-bottom: 0.3rem;
	}
	
	.dashboard-header p {
		font-size: 0.9rem;
	}
	
	/* Content Area */
	.content-area {
		border-radius: 8px;
		overflow: hidden;
	}
	
	.content-header {
		flex-direction: column;
		align-items: flex-start;
		gap: 1rem;
		padding: 1rem;
	}
	
	.content-header h3 {
		font-size: 1.1rem;
	}
	
	.content-actions {
		width: 100%;
		justify-content: space-between;
		flex-wrap: wrap;
		gap: 0.5rem;
	}
	
	.btn {
		padding: 0.5rem 1rem;
		font-size: 0.85rem;
		flex: 1;
		min-width: 120px;
	}
	
	/* Table Responsive */
	.table-container {
		padding: 0 0.5rem 1rem;
		overflow-x: auto;
		-webkit-overflow-scrolling: touch;
	}
	
	.table {
		min-width: 800px;
		font-size: 0.85rem;
	}
	
	.table th, .table td {
		padding: 8px 10px;
	}
	
	/* Menu Toggle */
	.menu-toggle {
		display: block;
		top: 0.8rem;
		left: 0.8rem;
	}
}

/* Extra Small Devices (Portrait Phones, less than 576px) */
@media (max-width: 575px) {
	.main-content {
		padding: 0.5rem;
	}
	
	.top-bar {
		padding: 0.8rem;
	}
	
	.search-box {
		padding: 0.4rem 0.8rem;
	}
	
	.search-box input {
		font-size: 0.9rem;
	}
	
	.user-name {
		font-size: 0.9rem;
	}
	
	.user-role {
		font-size: 0.75rem;
	}
	
	.dashboard-header h1 {
		font-size: 1.2rem;
	}
	
	.dashboard-header p {
		font-size: 0.85rem;
	}
	
	.stat-card {
		padding: 1rem;
		flex-direction: column;
		text-align: center;
	}
	
	.stat-icon {
		margin-right: 0;
		margin-bottom: 0.5rem;
		width: 45px;
		height: 45px;
		font-size: 1.2rem;
	}
	
	.stat-content {
		width: 100%;
	}
	
	.stat-number {
		font-size: 1.5rem;
	}
	
	.stat-label {
		font-size: 0.8rem;
	}
	
	.stat-change {
		font-size: 0.7rem;
	}
	
	.content-header {
		padding: 0.8rem;
	}
	
	.content-header h3 {
		font-size: 1rem;
	}
	
	.btn {
		padding: 0.5rem 0.8rem;
		font-size: 0.8rem;
		min-width: 100px;
	}
	
	.btn-sm {
		padding: 5px 8px;
		font-size: 0.75rem;
		min-width: 32px;
	}
	
	/* Table on very small screens */
	.table-container {
		padding: 0 0.3rem 0.8rem;
	}
	
	.table {
		min-width: 700px;
		font-size: 0.8rem;
	}
	
	.table th, .table td {
		padding: 6px 8px;
	}
	
	.status {
		font-size: 0.7rem;
		padding: 4px 10px;
	}
	
	/* Menu Toggle */
	.menu-toggle {
		top: 0.5rem;
		left: 0.5rem;
		padding: 0.6rem 0.8rem;
		font-size: 1.1rem;
	}
	
	/* Sidebar adjustments for very small screens */
	.sidebar.active {
		width: 220px;
	}
	
	.sidebar-header {
		padding: 1rem 0.8rem;
	}
	
	.sidebar-header h2 {
		font-size: 1.3rem;
	}
	
	.sidebar-menu a {
		padding: 0.7rem 1.2rem;
		font-size: 0.9rem;
	}
	
	.sidebar-menu i {
		font-size: 1.1rem;
		margin-right: 0.7rem;
	}
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

/* Menu toggle visibility */
@media (max-width: 768px) {
	.menu-toggle {
		display: block;
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

/* Sidebar overlay visibility */
@media (max-width: 768px) {
	.sidebar-overlay {
		display: block;
	}
}

@media (min-width: 769px) {
	.sidebar-overlay {
		display: none !important;
	}
}

/* Prevent horizontal scroll */
html, body {
	max-width: 100%;
	overflow-x: hidden;
}

/* Additional Responsive Improvements */
@media (max-width: 992px) {
	.sidebar-menu {
		padding: 0.8rem 0;
	}
	
	.sidebar-menu li {
		margin-bottom: 0.3rem;
	}
	
	.sidebar-menu a {
		padding: 0.7rem 1rem;
		font-size: 0.9rem;
	}
}

/* Better touch targets for mobile */
@media (max-width: 768px) {
	.sidebar-menu a {
		min-height: 44px;
		display: flex;
		align-items: center;
	}
	
	.btn {
		min-height: 44px;
	}
	
	.menu-toggle {
		min-width: 44px;
		min-height: 44px;
	}
}

/* Improved spacing for tablets */
@media (min-width: 769px) and (max-width: 992px) {
	.main-content {
		padding: 1rem 0.8rem;
	}
	
	.top-bar {
		padding: 0.9rem 1rem;
	}
	
	.stats-cards {
		gap: 1rem;
	}
	
	.stat-card {
		padding: 1.2rem 1rem;
	}
}

/* Landscape phone optimization */
@media (max-width: 768px) and (orientation: landscape) {
	.sidebar.active {
		width: 200px;
	}
	
	.main-content {
		padding: 0.6rem;
	}
	
	.stats-cards {
		grid-template-columns: repeat(2, 1fr);
		gap: 0.8rem;
	}
	
	.stat-card {
		padding: 1rem;
		flex-direction: row;
		text-align: left;
	}
	
	.stat-icon {
		margin-right: 0.8rem;
		margin-bottom: 0;
	}
}

/* Smooth transitions */
* {
	transition: background-color 0.2s, color 0.2s, transform 0.2s;
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

	<!-- Sidebar -->
	<div class="sidebar" id="sidebar">
		<div class="sidebar-header">
			<h2>NATURE AYURVED</h2>
		</div>

		<nav class="sidebar-menu">
			<ul>
				<li><a href="${pageContext.request.contextPath}/admin/dashboard" class="active"> 
					<i class="fas fa-home"></i> 
					<span>Dashboard</span>
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

	<!-- Main Content -->
	<div class="main-content">
		<!-- Top Bar -->
		<div class="top-bar">
			<div class="search-box">
				<i class="fas fa-search" style="color: var(--rust);"></i> 
				<input type="text" placeholder="Search submissions...">
			</div>
			<div class="user-info">
				<div class="user-details">
					<div class="user-name">Administrator</div>
					<div class="user-role">Super Admin</div>
				</div>
				<div class="user-avatar">
					<i class="fas fa-user"></i>
				</div>
			</div>
		</div>

		<!-- Dashboard Header -->
		<div class="dashboard-header">
			<h1>Submission Management</h1>
			<p>Manage and review all manuscript submissions</p>
		</div>

		<!-- Stats Cards -->
		<div class="stats-cards">
			<div class="stat-card">
				<div class="stat-icon total">
					<i class="fas fa-file-alt"></i>
				</div>
				<div class="stat-content">
					<div class="stat-number">${totalSubmissions}</div>
					<div class="stat-label">Total Submissions</div>
					<div class="stat-change positive">
						<i class="fas fa-arrow-up"></i> 12% from last month
					</div>
				</div>
			</div>
			<div class="stat-card">
				<div class="stat-icon pending">
					<i class="fas fa-clock"></i>
				</div>
				<div class="stat-content">
					<div class="stat-number">${pendingSubmissions}</div>
					<div class="stat-label">Pending Review</div>
					<div class="stat-change negative">
						<i class="fas fa-arrow-up"></i> 5% from last week
					</div>
				</div>
			</div>
			<div class="stat-card">
				<div class="stat-icon reviewed">
					<i class="fas fa-check-circle"></i>
				</div>
				<div class="stat-content">
					<div class="stat-number">${reviewedSubmissions}</div>
					<div class="stat-label">Reviewed</div>
					<div class="stat-change positive">
						<i class="fas fa-arrow-up"></i> 8% from last week
					</div>
				</div>
			</div>
			<div class="stat-card">
				<div class="stat-icon published">
					<i class="fas fa-book"></i>
				</div>
				<div class="stat-content">
					<div class="stat-number">${publishedSubmissions}</div>
					<div class="stat-label">Published</div>
					<div class="stat-change positive">
						<i class="fas fa-arrow-up"></i> 3% from last week
					</div>
				</div>
			</div>
		</div>

		<!-- Submissions Table -->
		<!--<div class="content-area">
			<div class="content-header">
				<h3>All Submissions</h3>
				<div class="content-actions">
					<button class="btn btn-outline">
						<i class="fas fa-filter"></i> Filter
					</button>
					<button class="btn btn-primary">
						<i class="fas fa-download"></i> Export
					</button>
				</div>
			</div>

			<c:choose>
				<c:when test="${not empty submissions}">
					<div class="table-container">
						<table class="table">
							<thead>
								<tr>
									<th>ID</th>
									<th>Author Name</th>
									<th>Email</th>
									<th>Phone</th>
									<th>Title</th>
									<th>Filename</th>
									<th>Posted At</th>
									<th>Status</th>
									<th>Actions</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="s" items="${submissions}">
									<tr>
										<td>${s.id}</td>
										<td>${s.author.fullName}</td>
										<td>${s.author.email}</td>
										<td>${s.author.mobileNumber}</td>
										<td>${s.title}</td>
										<td>${s.fileName}</td>
										<td>${s.submittedAt}</td>
										<td>
											<span class="status status-${s.status}">
												${s.status} 
											</span>
										</td>
										<td>
											<div class="action-buttons">
												<!-- Download Original File with Tooltip 
												<div class="tooltip">
													<a href="${pageContext.request.contextPath}/admin/download/${s.id}"
														class="btn btn-sm btn-download"> 
														<i class="fas fa-download"></i>
													</a> 
													<span class="tooltiptext">Download File</span>
												</div>

												<!-- EMAIL Button with Tooltip -->
												<!--  <div class="tooltip">
													<button class="btn btn-sm btn-email"
														onclick="openComposeMail('${s.author.id}', '${s.author.email}')">
														<i class="fas fa-envelope"></i>
													</button>
													<span class="tooltiptext">Send Email</span>
												</div>

												<!-- Edit Button with Tooltip -->
												<!--  <div class="tooltip">
													<a href="${pageContext.request.contextPath}/admin/edit/${s.id}"
														class="btn btn-sm btn-edit"> 
														<i class="fas fa-edit"></i>
													</a> 
													<span class="tooltiptext">Edit Submission</span>
												</div>
											</div>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</c:when>
				<c:otherwise>
					<div class="no-submissions">
						<i class="fas fa-inbox" style="font-size: 3rem; margin-bottom: 1rem;"></i>
						<p>No submissions found.</p>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>-->

	<!-- Compose Mail Modal -->
	<!--  <div id="mailModal" class="modal">
		<div class="modal-content">
			<div class="modal-header">
				<h3>
					<i class="fas fa-envelope"></i> Compose Email
				</h3>
				<button class="close-btn" onclick="closeMailModal()">&times;</button>
			</div>
			<form action="${pageContext.request.contextPath}/admin/send-mail"
				method="post" enctype="multipart/form-data">

				<input type="hidden" id="mailSubmissionId" name="id">

				<div class="form-group">
					<label for="mailTo">To:</label> 
					<input type="email" id="mailTo" name="to" class="form-control" required>
				</div>

				<div class="form-group">
					<label for="mailSubject">Subject:</label> 
					<input type="text" id="mailSubject" name="subject" class="form-control" required>
				</div>

				<div class="form-group">
					<label for="mailMessage">Message:</label>
					<textarea id="mailMessage" name="message" class="form-control" required></textarea>
				</div>

				<div class="form-group">
					<label for="mailAttachments">Attachments:</label> 
					<input type="file" id="mailAttachments" name="attachments" multiple class="form-control">
				</div>

				<div class="form-actions">
					<button type="button" class="btn btn-cancel" onclick="closeMailModal()">Cancel</button>
					<button type="submit" class="btn btn-success">
						<i class="fas fa-paper-plane"></i> Send Email
					</button>
				</div>
			</form>
		</div>
	</div> -->

	<script>
    // Open Compose Mail Modal
    function openComposeMail(authorId, authorEmail) {
        document.getElementById('mailTo').value = authorEmail;
        document.getElementById('mailSubmissionId').value = authorId;
        document.getElementById('mailModal').style.display = 'flex';
    }

    // Close Compose Mail Modal
    function closeMailModal() {
        document.getElementById('mailModal').style.display = 'none';
    }

    // Close modal when clicking outside
    window.addEventListener('click', function(event) {
        const mailModal = document.getElementById('mailModal');
        if (event.target === mailModal) {
            closeMailModal();
        }
    });

    // Mobile menu toggle with overlay
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
    document.addEventListener('click', function(event) {
        const isClickInsideSidebar = sidebar.contains(event.target);
        const isClickOnToggle = menuToggle && menuToggle.contains(event.target);
        
        if (window.innerWidth <= 768 && sidebar.classList.contains('active')) {
            if (!isClickInsideSidebar && !isClickOnToggle) {
                toggleSidebar();
            }
        }
    });
    
    // Handle window resize
    window.addEventListener('resize', function() {
        if (window.innerWidth > 768) {
            sidebar.classList.remove('active');
            sidebarOverlay.classList.remove('active');
        }
    });
    </script>
</body>
</html>