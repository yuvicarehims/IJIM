<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Author Dashboard - NATURE AYURVED</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

    <style>
        :root {
            --deep-green: rgb(30, 140, 193);;
            --leaf: #2b8a5f;
            --rust: #7a4b3a;
            --gold: #c9a25a;
            --cream: #fbf6ee;
            --paper: #f7efe6;
            --text: #2d2d2d;
            --light-green: #e8f5e8;
            --light-blue: #e3f2fd;
            --light-orange: #fff3e0;
            --light-purple: #f3e5f5;
            --shadow: 0 4px 12px rgba(11, 74, 57, 0.08);
            --shadow-hover: 0 8px 24px rgba(11, 74, 57, 0.12);
        }

        * {
            box-sizing: border-box;
        }

        html, body {
            overflow-x: hidden;
            max-width: 100%;
        }

        body {
            background-color: var(--cream);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: var(--text);
            line-height: 1.6;
            margin: 0;
            padding: 0;
        }

        /* Header Styles - Responsive */
        .brand-bar {
            background: linear-gradient(135deg, var(--deep-green), var(--leaf));
            color: white;
            padding: 12px 0;
            box-shadow: var(--shadow);
        }

        .container-main {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        .logo-text {
            font-size: 28px;
            font-weight: 700;
            color: white;
            font-family: Georgia, serif;
            letter-spacing: 0.5px;
        }

        .logo-subtitle {
            font-size: 12px;
            color: var(--gold);
            font-style: italic;
        }

        .user-info {
            color: white;
            font-size: 14px;
        }

        /* Header Responsive Adjustments */
        @media (max-width: 991px) {
            .brand-bar .d-flex {
                flex-wrap: wrap;
            }
            .brand-bar .d-flex > div {
                width: 100%;
                margin-bottom: 10px;
            }
            .brand-bar .d-flex > div:last-child {
                margin-bottom: 0;
            }
        }

        /* Navigation - Matching Homepage Style */
        .topbar {
            background-color: var(--deep-green);
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding-top: 6px !important;
            padding-bottom: 6px !important;
        }

        .topbar .navbar-nav {
            display: flex;
            align-items: center;
            gap: 10px !important;
            margin-right: auto !important;
            flex-wrap: nowrap;  /* Prevent wrapping to keep all nav on single line */
        }

        .navbar-nav .nav-link {
            color: #fff !important;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 14px;
            padding: 10px 12px !important;  /* Match homepage padding */
            border-radius: 4px;
            transition: all 0.3s;
            position: relative;
            white-space: nowrap;  /* Keep nav items on single line */
        }

        .navbar-nav .nav-link:hover,
        .navbar-nav .nav-link.active {
            color: var(--gold) !important;
            background-color: rgba(255, 255, 255, 0.1);
        }

        /* Underline hover effect like homepage */
        .navbar-nav .nav-link::after {
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

        .navbar-nav .nav-link.active::after,
        .navbar-nav .nav-link:hover::after {
            transform: translateX(-50%) scaleX(1);
        }

        /* Navbar Toggle Button */
        .navbar-toggler {
            border: 1px solid rgba(255,255,255,0.3) !important;
            color: white !important;
            padding: 6px 10px;
        }

        .navbar-toggler:focus {
            box-shadow: 0 0 0 0.2rem rgba(255,255,255,0.25);
        }

        .navbar-toggler-icon {
            background-image: none;
        }

        .navbar-toggler i {
            font-size: 1.2rem;
        }

        /* Dashboard Section */
        .dashboard-section {
            padding: 30px 0 50px;
        }

        .welcome-card {
            background: linear-gradient(135deg, var(--deep-green), var(--leaf));
            color: white;
            border-radius: 12px;
            padding: 30px;
            margin-bottom: 30px;
            box-shadow: var(--shadow);
        }

        .welcome-card h1 {
            font-size: 32px;
            margin-bottom: 10px;
            font-weight: 700;
        }

        .welcome-card p {
            font-size: 16px;
            opacity: 0.9;
            margin-bottom: 0;
        }

        /* Stats Grid */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 20px;
            margin-bottom: 40px;
        }

        .stat-card {
            background: white;
            border-radius: 10px;
            padding: 25px 20px;
            text-align: center;
            box-shadow: var(--shadow);
            transition: transform 0.3s, box-shadow 0.3s;
            border-top: 4px solid var(--leaf);
        }

        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: var(--shadow-hover);
        }

        .stat-card:nth-child(2) {
            border-top-color: var(--gold);
        }

        .stat-card:nth-child(3) {
            border-top-color: var(--rust);
        }

        .stat-card:nth-child(4) {
            border-top-color: var(--deep-green);
        }

        .stat-number {
            font-size: 36px;
            font-weight: 700;
            color: var(--deep-green);
            margin-bottom: 5px;
        }

        .stat-label {
            font-size: 14px;
            color: #666;
            font-weight: 500;
        }

        /* Upload Section */
        .upload-section {
            background: white;
            border-radius: 12px;
            padding: 30px;
            margin-bottom: 40px;
            box-shadow: var(--shadow);
        }

        .section-title {
            color: var(--deep-green);
            font-size: 22px;
            font-weight: 600;
            margin-bottom: 25px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 10px;
        }

        .section-title i {
            color: var(--gold);
        }

        .form-group {
            margin-bottom: 25px;
        }

        .form-label {
            font-weight: 600;
            color: var(--deep-green);
            margin-bottom: 8px;
            display: block;
        }

        .form-control {
            border: 1px solid #ddd;
            border-radius: 6px;
            padding: 12px 15px;
            font-size: 15px;
            transition: all 0.3s;
        }

        .form-control:focus {
            border-color: var(--leaf);
            box-shadow: 0 0 0 3px rgba(43, 138, 95, 0.1);
        }

        /* File Upload */
        .file-input-wrapper {
            position: relative;
        }

        .file-input-wrapper input[type="file"] {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            opacity: 0;
            cursor: pointer;
        }

        .file-input-custom {
            border: 2px dashed #ddd;
            border-radius: 6px;
            padding: 20px;
            text-align: center;
            transition: all 0.3s;
            background-color: #fafafa;
        }

        .file-input-wrapper:hover .file-input-custom {
            border-color: var(--leaf);
            background-color: #f5f9f7;
        }

        .file-input-text {
            font-size: 15px;
            color: #666;
            display: block;
            margin-bottom: 5px;
        }

        .file-input-icon {
            font-size: 24px;
            color: var(--leaf);
        }

        .file-info {
            font-size: 13px;
            color: #777;
            margin-top: 8px;
        }

        /* Buttons */
        .btn {
            border-radius: 6px;
            padding: 12px 24px;
            font-weight: 600;
            transition: all 0.3s;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }

        .btn-primary {
            background: linear-gradient(135deg, var(--deep-green), var(--leaf));
            border: none;
            color: white;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(11, 86, 51, 0.3);
        }

        .btn-outline-light {
            border-color: rgba(255, 255, 255, 0.7);
            color: rgba(255, 255, 255, 0.9);
        }

        .btn-outline-light:hover {
            background-color: rgba(255, 255, 255, 0.1);
            border-color: white;
            color: white;
        }

        /* Logout Button - White Professional Style */
        .btn-light,
        .btn-logout {
            background-color: white !important;
            color: var(--deep-green) !important;
            border: 1px solid rgba(255, 255, 255, 0.3) !important;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .btn-light:hover,
        .btn-logout:hover {
            background-color: rgba(255, 255, 255, 0.95) !important;
            color: var(--deep-green) !important;
            border-color: white !important;
            transform: translateY(-1px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
        }

        .btn-light:active,
        .btn-logout:active,
        .btn-light:focus,
        .btn-logout:focus {
            background-color: white !important;
            color: var(--deep-green) !important;
            border-color: white !important;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        /* Toggle Button */
        .toggle-btn {
            background: transparent;
            border: 1px solid var(--deep-green);
            color: var(--deep-green);
            border-radius: 20px;
            padding: 5px 15px;
            font-size: 14px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s;
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .toggle-btn:hover {
            background-color: var(--deep-green);
            color: white;
        }

        /* Submissions Section */
        .submissions-section {
            background: white;
            border-radius: 12px;
            padding: 30px;
            box-shadow: var(--shadow);
        }

        .table {
            width: 100%;
            border-collapse: collapse;
        }

        .table th {
            background-color: #f8f9fa;
            color: var(--deep-green);
            font-weight: 600;
            padding: 15px;
            border-bottom: 2px solid #e9ecef;
            text-align: left;
        }

        .table td {
            padding: 15px;
            border-bottom: 1px solid #e9ecef;
            vertical-align: top;
        }

        .table tbody tr {
            transition: background-color 0.2s;
        }

        .table tbody tr:hover {
            background-color: #f8f9fa;
        }

        /* Responsive Table */
        .table-responsive {
            overflow-x: auto;
            -webkit-overflow-scrolling: touch;
            width: 100%;
            display: block;
        }

        @media (max-width: 991px) {
            .table-responsive {
                overflow-x: auto;
                -webkit-overflow-scrolling: touch;
                max-width: 100%;
            }
            .table {
                min-width: 700px;
                font-size: 14px;
            }
            .table th,
            .table td {
                padding: 10px 8px !important;
            }
        }

        @media (max-width: 767px) {
            .table-responsive {
                overflow-x: auto;
                -webkit-overflow-scrolling: touch;
            }
            .table {
                min-width: 600px;
                font-size: 12px;
            }
            .table th,
            .table td {
                padding: 8px 6px !important;
                white-space: nowrap;
            }
            .table th {
                font-size: 11px;
            }
        }

        @media (max-width: 480px) {
            .table {
                min-width: 550px;
                font-size: 11px;
            }
            .table th,
            .table td {
                padding: 6px 4px !important;
            }
        }

        .status-badge {
            display: inline-block;
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
            text-transform: uppercase;
        }

        .status-submitted {
            background-color: var(--light-orange);
            color: #e65100;
        }

        .status-under_review {
            background-color: var(--light-blue);
            color: #1565c0;
        }
        
        .status-under_editing {
            background-color: #fff3e0;
            color: #e65100;
        }
        
        .status-under_accepted {
            background-color: var(--light-green);
            color: #2e7d32;
        }
        
        .status-under_published {
            background-color: #e8f5e8;
            color: #1b5e20;
        }
        
        .status-under_rejected {
            background-color: #ffebee;
            color: #c62828;
        }

        .status-approved {
            background-color: var(--light-green);
            color: #2e7d32;
        }

        .status-published {
            background-color: #e8f5e8;
            color: #1b5e20;
        }

        .status-rejected {
            background-color: #ffebee;
            color: #c62828;
        }

        .admin-notes {
            background-color: #fff8e1;
            border-left: 3px solid var(--gold);
            padding: 10px 15px;
            border-radius: 4px;
            margin-top: 10px;
            font-size: 14px;
        }

        .edit-info {
            font-size: 12px;
            color: #666;
            margin-top: 5px;
        }

        /* Author Form Styles */
        .author-row {
            margin-bottom: 10px;
        }

        .author-no {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 30px;
            height: 30px;
            background-color: var(--deep-green);
            color: white;
            border-radius: 50%;
            font-weight: 600;
            font-size: 14px;
        }

        .mini-btn {
            background-color: var(--leaf);
            color: white;
            border: none;
            border-radius: 50%;
            width: 30px;
            height: 30px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: all 0.3s;
            font-weight: 600;
        }

        .mini-btn:hover {
            background-color: var(--deep-green);
            transform: scale(1.1);
        }

        .form-row {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .form-row > div:first-child {
            flex-shrink: 0;
        }

        .form-row > div:nth-child(2),
        .form-row > div:nth-child(3) {
            flex: 1;
        }

        .form-row > div:last-child {
            flex-shrink: 0;
        }

        /* No Submissions */
        .no-submissions {
            text-align: center;
            padding: 50px 20px;
            color: #666;
        }

        .no-submissions i {
            font-size: 60px;
            color: #ddd;
            margin-bottom: 20px;
        }

        .no-submissions h4 {
            color: #777;
            margin-bottom: 10px;
        }

        /* Alerts */
        .alert {
            border-radius: 8px;
            border: none;
            padding: 15px 20px;
            margin-bottom: 25px;
            box-shadow: var(--shadow);
        }

        .alert-success {
            background-color: var(--light-green);
            color: #2e7d32;
        }

        .alert-danger {
            background-color: #ffebee;
            color: #c62828;
        }

        .alert-warning {
            background-color: #fff8e1;
            color: #e65100;
        }

        .alert-info {
            background-color: var(--light-blue);
            color: #1565c0;
        }

        /* Footer */
        .footer {
            background: linear-gradient(135deg, var(--deep-green), #084527);
            color: white;
            padding: 50px 0 20px;
        }

        .footer h5 {
            color: var(--gold);
            font-size: 18px;
            margin-bottom: 20px;
            font-weight: 600;
        }

        .footer-links {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .footer-links li {
            margin-bottom: 10px;
        }

        .footer-links a {
            color: rgba(255, 255, 255, 0.8);
            text-decoration: none;
            transition: color 0.3s;
        }

        .footer-links a:hover {
            color: var(--gold);
        }

        .social-icons {
            display: flex;
            gap: 15px;
        }

        .social-icons a {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 36px;
            height: 36px;
            background-color: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            color: white;
            transition: all 0.3s;
        }

        .social-icons a:hover {
            background-color: var(--gold);
            transform: translateY(-2px);
        }

        .footer-bottom {
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            padding-top: 20px;
            margin-top: 30px;
            text-align: center;
            color: rgba(255, 255, 255, 0.7);
            font-size: 14px;
        }

        .footer-bottom a {
            color: rgba(255, 255, 255, 0.8);
        }

        .footer-bottom a:hover {
            color: var(--gold);
        }

        /* Responsive Adjustments */
        /* Extra Large Devices (Large Desktops, 1200px and up) */
        @media (min-width: 1200px) {
            .container-main {
                max-width: 1140px;
            }
        }

        /* Large Devices (Desktops, 992px and up) */
        @media (max-width: 1199px) {
            .brand-bar {
                padding: 10px 0;
            }
            .logo-text {
                font-size: 24px;
            }
            .welcome-card h1 {
                font-size: 28px;
            }
        }

        /* Medium Devices (Tablets, 768px and up) */
        @media (max-width: 991px) {
            .brand-bar {
                padding: 8px 0;
            }
            .logo-text {
                font-size: 22px;
            }
            .logo-subtitle {
                font-size: 11px;
            }
            .user-info {
                font-size: 13px;
            }
            .stats-grid {
                grid-template-columns: repeat(2, 1fr);
                gap: 15px;
            }
            .welcome-card {
                padding: 25px;
            }
            .welcome-card h1 {
                font-size: 26px;
            }
            .welcome-card p {
                font-size: 15px;
            }
            .stat-number {
                font-size: 32px;
            }
            .stat-label {
                font-size: 13px;
            }
            .upload-section,
            .submissions-section {
                padding: 25px;
            }
            .section-title {
                font-size: 20px;
            }
            .topbar .navbar-nav {
                gap: 0 !important;
                padding: 10px 0;
            }
            .navbar-nav .nav-link {
                padding: 10px 15px !important;
                font-size: 13px;
            }
            .navbar-nav .nav-link::after {
                display: none;
            }
            .table {
                display: block;
                overflow-x: auto;
            }
            .brand-bar .d-none.d-md-block {
                display: none !important;
            }
            .section-title {
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
            }
        }

        /* Small Devices (Landscape Phones, 576px and up) */
        @media (max-width: 767px) {
            .brand-bar {
                padding: 6px 0;
            }
            .brand-bar .d-flex {
                flex-direction: column;
                align-items: flex-start !important;
                gap: 10px;
            }
            .logo-text {
                font-size: 20px;
            }
            .logo-subtitle {
                font-size: 10px;
            }
            .user-info {
                font-size: 12px;
            }
            .stats-grid {
                grid-template-columns: 1fr;
                gap: 12px;
            }
            .welcome-card {
                padding: 20px;
            }
            .welcome-card h1 {
                font-size: 22px;
            }
            .welcome-card p {
                font-size: 14px;
            }
            .stat-card {
                padding: 20px 15px;
            }
            .stat-number {
                font-size: 28px;
            }
            .stat-label {
                font-size: 12px;
            }
            .upload-section,
            .submissions-section {
                padding: 20px;
            }
            .section-title {
                font-size: 18px;
            }
            .form-label {
                font-size: 14px;
            }
            .form-control {
                padding: 10px 12px;
                font-size: 14px;
            }
            .form-row {
                flex-direction: column;
                gap: 8px;
            }
            .form-row > div {
                width: 100%;
            }
            .author-no {
                width: 25px;
                height: 25px;
                font-size: 12px;
            }
            .mini-btn {
                width: 25px;
                height: 25px;
                font-size: 12px;
            }
            .btn {
                padding: 10px 20px;
                font-size: 14px;
            }
            .table th,
            .table td {
                padding: 10px 8px;
                font-size: 13px;
            }
            .status-badge {
                font-size: 11px;
                padding: 4px 10px;
            }
            .container-main {
                padding: 0 15px;
            }
            .navbar-nav .nav-link {
                padding: 8px 12px !important;
                font-size: 12px;
            }
            .footer {
                padding: 40px 0 20px !important;
            }
            .footer h5 {
                font-size: 16px !important;
                margin-bottom: 15px !important;
            }
            .footer-links li {
                margin-bottom: 8px;
                font-size: 14px;
            }
        }

        /* Extra Small Devices (Portrait Phones, less than 576px) */
        @media (max-width: 575px) {
            .brand-bar {
                padding: 5px 0;
            }
            .logo-text {
                font-size: 18px;
            }
            .logo-subtitle {
                font-size: 9px;
            }
            .user-info {
                font-size: 11px;
            }
            .welcome-card {
                padding: 15px;
            }
            .welcome-card h1 {
                font-size: 20px;
            }
            .welcome-card p {
                font-size: 13px;
            }
            .stat-card {
                padding: 15px 12px;
            }
            .stat-number {
                font-size: 24px;
            }
            .stat-label {
                font-size: 11px;
            }
            .upload-section,
            .submissions-section {
                padding: 15px;
            }
            .section-title {
                font-size: 16px;
            }
            .form-label {
                font-size: 13px;
            }
            .form-control {
                padding: 8px 10px;
                font-size: 13px;
            }
            .form-row {
                flex-direction: column;
                gap: 6px;
            }
            .form-row > div {
                width: 100%;
            }
            .author-no {
                width: 22px;
                height: 22px;
                font-size: 11px;
            }
            .mini-btn {
                width: 22px;
                height: 22px;
                font-size: 11px;
            }
            .btn {
                padding: 8px 18px;
                font-size: 13px;
            }
            .table th,
            .table td {
                padding: 8px 6px;
                font-size: 12px;
            }
            .status-badge {
                font-size: 10px;
                padding: 3px 8px;
            }
            .container-main {
                padding: 0 12px;
            }
            .navbar-nav .nav-link {
                padding: 6px 10px !important;
                font-size: 11px;
            }
            .footer {
                padding: 30px 0 15px !important;
            }
            .footer h5 {
                font-size: 14px !important;
                margin-bottom: 12px !important;
            }
            .footer-links li {
                margin-bottom: 6px;
                font-size: 12px;
            }
        }
    </style>
</head>

<body>
    <%
        // JSP Logic - Session and Application Data
        String username = (String) session.getAttribute("username");
        Boolean isLoggedIn = (Boolean) session.getAttribute("isLoggedIn");
        String userRole = (String) session.getAttribute("userRole");

        // Message handling
        String message = (String) request.getAttribute("message");
        String messageType = (String) request.getAttribute("messageType");
    %>

    <header class="brand-bar">
        <div class="container-main d-flex align-items-center justify-content-between">
            <div class="d-flex align-items-center">
                <img src="${pageContext.request.contextPath}/images/Logo_1-removebg-preview.png" alt="logo" style="height:60px;" class="me-3">
                <div class="d-flex flex-column align-items-start">
                    <div class="logo-text">NATURE AYURVED</div>
                    <span class="logo-subtitle">International Journal of Ayurved Science & Research</span>
                </div>
            </div>
            <div class="d-flex align-items-center">
                <div class="fw-bold text-end me-4 d-none d-md-block" style="color: var(--gold);">
                    <i class="fas fa-barcode"></i> <strong class="fs-6">ISSN:</strong> 0000-0000
                </div>
                <c:if test="${not empty sessionScope.username}">
                    <div class="user-info">
                        <i class="fas fa-user-circle me-1"></i> Welcome, <strong>${sessionScope.username}</strong> (${sessionScope.userRole})
                    </div>
                </c:if>
            </div>
        </div>
    </header>

    <!-- Error/Success Messages Display - Visible in Browser -->
    <div class="container-main" style="margin-top: 20px; position: relative; z-index: 1000;">
        <c:if test="${not empty message}">
            <div class="alert alert-${messageType} fade show" role="alert" style="margin-bottom: 20px; display: block !important; visibility: visible !important;">
                <c:choose>
                    <c:when test="${messageType == 'danger' or messageType == 'error'}">
                        <i class="fas fa-exclamation-triangle me-2"></i>
                    </c:when>
                    <c:when test="${messageType == 'success'}">
                        <i class="fas fa-check-circle me-2"></i>
                    </c:when>
                    <c:otherwise>
                        <i class="fas fa-info-circle me-2"></i>
                    </c:otherwise>
                </c:choose>
                <strong>${message}</strong>
            </div>
        </c:if>
    </div>

    <nav class="navbar navbar-expand-lg navbar-dark topbar sticky-top">
        <div class="container-fluid px-3 px-md-4 px-lg-5">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navMain" 
                    aria-controls="navMain" aria-expanded="false" aria-label="Toggle navigation">
                <i class="fas fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navMain">
                <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link " href="${pageContext.request.contextPath}/">Home</a></li>
                    <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/about">About Us</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/editorial-board">Editorial Board</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/current-issue">Current Issue</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/archives">Archives</a></li>
                   
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/login">Submit Article</a></li>
                    <li class="nav-item"><a class="nav-link " href="${pageContext.request.contextPath}/author-guideline">Author Guideline</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/contact">Contact</a></li>
                    
                </ul>

                <div class="d-flex ms-lg-auto">
                    <c:choose>
                        <c:when test="${sessionScope.isLoggedIn}">
                            <a class="btn btn-outline-light btn-sm me-2" href="${pageContext.request.contextPath}/dashboard">
                                <i class="fas fa-tachometer-alt"></i> Dashboard
                            </a>
                            <a class="btn btn-light btn-sm btn-logout" href="${pageContext.request.contextPath}/logout" style="background-color: white !important; color: var(--deep-green) !important; border: 1px solid rgba(255, 255, 255, 0.3) !important;">
                                <i class="fas fa-sign-out-alt"></i> Logout
                            </a>
                        </c:when>
                        <c:otherwise>
                           <!--   <a class="btn btn-outline-light btn-sm me-2" href="${pageContext.request.contextPath}/login">
                                <i class="fas fa-sign-in-alt"></i> Login
                            </a>
                            <a class="btn btn-light btn-sm" href="${pageContext.request.contextPath}/register">
                                <i class="fas fa-user-plus"></i> Register
                            </a> -->
                            <a class="btn btn-light btn-sm btn-logout" href="${pageContext.request.contextPath}/logout" style="background-color: white !important; color: var(--deep-green) !important; border: 1px solid rgba(255, 255, 255, 0.3) !important;">
                                <i class="fas fa-sign-out-alt"></i> Logout
                            </a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </nav>

    <!-- Dashboard Section -->
    <section class="dashboard-section">
        <div class="container-main">
            <!-- Welcome Card -->
            <div class="welcome-card">
                <h1>Author Dashboard</h1>
                <p>Welcome back, <strong>${user.fullName}</strong>! Manage your research submissions and track their progress.</p>
            </div>

            <!-- Statistics Grid -->
            <div class="stats-grid">
                <div class="stat-card">
                    <div class="stat-number">${submissions != null ? submissions.size() : 0}</div>
                    <div class="stat-label">Total Submissions</div>
                </div>

                <!-- Published -->
                <div class="stat-card">
                    <div class="stat-number">
                        <c:set var="publishedCount" value="0" />
                        <c:if test="${not empty submissions}}">
                            <c:forEach var="submission" items="${submissions}">
                                <%-- Safely get enum name into statusName string for comparisons --%>
                                <%
                                    com.ayurvedic.main.entity.Submission _s = (com.ayurvedic.main.entity.Submission) pageContext.getAttribute("submission");
                                    String statusName = (_s != null && _s.getStatus() != null) ? _s.getStatus().name() : "";
                                    pageContext.setAttribute("statusName", statusName);
                                %>
                                <c:if test="${statusName == 'UNDER_PUBLISHED'}">
                                    <c:set var="publishedCount" value="${publishedCount + 1}" />
                                </c:if>
                            </c:forEach>
                        </c:if>
                        ${publishedCount}
                    </div>
                    <div class="stat-label">Published Articles</div>
                </div>

                <!-- Under Review -->
                <div class="stat-card">
                    <div class="stat-number">
                        <c:set var="underReviewCount" value="0" />
                        <c:if test="${not empty submissions}">
                            <c:forEach var="submission" items="${submissions}">
                                <%
                                    com.ayurvedic.main.entity.Submission _s2 = (com.ayurvedic.main.entity.Submission) pageContext.getAttribute("submission");
                                    String statusName2 = (_s2 != null && _s2.getStatus() != null) ? _s2.getStatus().name() : "";
                                    pageContext.setAttribute("statusName", statusName2);
                                %>
                                <c:if test="${statusName == 'UNDER_REVIEW' or statusName == 'UNDER_EDITING'}">
                                    <c:set var="underReviewCount" value="${underReviewCount + 1}" />
                                </c:if>
                            </c:forEach>
                        </c:if>
                        ${underReviewCount}
                    </div>
                    <div class="stat-label">Under Review</div>
                </div>

                <!-- Approved -->
                <div class="stat-card">
                    <div class="stat-number">
                        <c:set var="approvedCount" value="0" />
                        <c:if test="${not empty submissions}">
                            <c:forEach var="submission" items="${submissions}">
                                <%
                                    com.ayurvedic.main.entity.Submission _s3 = (com.ayurvedic.main.entity.Submission) pageContext.getAttribute("submission");
                                    String statusName3 = (_s3 != null && _s3.getStatus() != null) ? _s3.getStatus().name() : "";
                                    pageContext.setAttribute("statusName", statusName3);
                                %>
                                <c:if test="${statusName == 'UNDER_ACCEPTED'}">
                                    <c:set var="approvedCount" value="${approvedCount + 1}" />
                                </c:if>
                            </c:forEach>
                        </c:if>
                        ${approvedCount}
                    </div>
                    <div class="stat-label">Approved</div>
                </div>
            </div>

           <!-- Upload Section -->
<div class="upload-section">
    <div class="section-title">
        <div class="d-flex align-items-center">
            <i class="fas fa-upload"></i>
            <span>Submit New Article</span>
        </div>
        <button type="button" class="toggle-btn" id="toggleUploadSection">
            <i class="fas fa-chevron-down"></i> Show
        </button>
    </div>

    <div id="uploadFormContainer" style="display: none;">
        <noscript>
            <style>
                #uploadFormContainer { display: block !important; }
            </style>
        </noscript>
        <form id="submitArticleForm" action="${pageContext.request.contextPath}/author/submit" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">

            <!-- Title -->
            <div class="form-group">
                <label for="title" class="form-label">Article Title *</label>
                <input type="text" id="title" name="title" class="form-control"
                       placeholder="Enter your article title" required>
            </div>

            <!-- Document Upload -->
            <div class="form-group">
                <label for="document" class="form-label">Upload Document *</label>
                <div class="file-input-wrapper">
                    <input type="file" id="document" name="document"
                           accept=".doc,.docx,.pdf,.txt" required>
                    <div class="file-input-custom">
                        <span class="file-input-text">Choose document file...</span>
                        <i class="fas fa-file-upload file-input-icon"></i>
                    </div>
                </div>
                <div class="file-info">
                    <i class="fas fa-info-circle me-1"></i>
                    Supported formats: DOC, DOCX, PDF, TXT (Maximum file size: 10MB)
                </div>
            </div>

            <!-- AUTHORS SECTION (INSIDE FORM) -->
<div class="form-group" style="margin-top:1rem;">
    <label>Authors (Optional)</label>

    <div id="authorsContainer">
        <div class="author-row" data-index="0">
            <div class="form-row" style="display:flex; gap:10px; margin-bottom:8px;">

                <div>
                    <div class="author-no">1</div>
                </div>

                <div>
                    <input type="text" name="authorNames"
                           class="form-control"
                           placeholder="Author's Name">
                </div>

                <div>
                    <input type="text" name="authorDetails"
                           class="form-control"
                           placeholder="Author's Details">
                </div>

                <div>
                    <button type="button" class="mini-btn" onclick="addAuthorRow()">+</button>
                </div>

            </div>
        </div>
    </div>
</div>


            <!-- Submit Button -->
            <button type="submit" class="btn btn-primary">
                <i class="fas fa-paper-plane me-2"></i>SUBMIT ARTICLE
            </button>

        </form>
    </div>
</div>

            <!-- Submissions List -->
            <div class="submissions-section">
                <div class="section-title">
                    <div class="d-flex align-items-center">
                        <i class="fas fa-list-alt"></i>
                        <span>My Submitted Articles</span>
                    </div>
                    <button type="button" class="toggle-btn" id="toggleSubmissionsSection">
                        <i class="fas fa-chevron-down"></i> Show
                    </button>
                </div>
                <div id="submissionsContainer" style="display: none;">
                    <c:choose>
                        <c:when test="${not empty submissions}">
                            <div class="table-responsive" style="overflow-x: auto; width: 100%; -webkit-overflow-scrolling: touch; display: block;">
                       <table class="table" style="width: 100%; margin-bottom: 0;">
    <thead>
        <tr>
            <th>Title</th>
            <th>File Name</th>
            <th>Submitted Date</th>
            <th>Authors</th>
            <th>Author Details</th>
            <th>Status</th>
        </tr>
    </thead>

    <tbody>
        <c:forEach var="submission" items="${submissions}">
        <%
            com.ayurvedic.main.entity.Submission _sRow =
                (com.ayurvedic.main.entity.Submission) pageContext.getAttribute("submission");

            String statusNameRow =
                (_sRow != null && _sRow.getStatus() != null)
                    ? _sRow.getStatus().name()
                    : "";

            pageContext.setAttribute("statusName", statusNameRow);
        %>

        <tr>
            <!-- Title -->
            <td><strong>${submission.title}</strong></td>

            <!-- File Name -->
            <td>${submission.fileName}</td>

            <!-- Submitted Date -->
            <td>
               <fmt:formatDate 
    value="${submission.submittedAtDate}" 
    pattern="dd MMM yyyy, hh:mm a" 
    timeZone="Asia/Kolkata" />
            </td>

            <!-- Authors -->
            <td>
                <%
                    String authors = (_sRow != null) ? _sRow.getAuthorNames() : null;
                    if (authors != null && !authors.trim().isEmpty()) {
                        for (String a : authors.split("\\|\\|")) {
                %>
                            <div><i class="fas fa-user"></i> <%= a %></div>
                <%
                        }
                    } else {
                %>
                        <span style="color:gray;">No authors</span>
                <%
                    }
                %>
            </td>

            <!-- Author Details -->
            <td>
                <%
                    String details = (_sRow != null) ? _sRow.getAuthorDetails() : null;
                    if (details != null && !details.trim().isEmpty()) {
                        for (String d : details.split("\\|\\|")) {
                %>
                            <div><i class="fas fa-info-circle"></i> <%= d %></div>
                <%
                        }
                    } else {
                %>
                        <span style="color:gray;">No details</span>
                <%
                    }
                %>
            </td>

            <!-- Status -->
            <td>
                <span class="status-badge status-${statusName.toLowerCase()}">
                    <c:choose>
                        <c:when test="${statusName == 'UNDER_REVIEW'}">Under Review</c:when>
                        <c:when test="${statusName == 'UNDER_EDITING'}">Under Editing</c:when>
                        <c:when test="${statusName == 'UNDER_ACCEPTED'}">Under Accepted</c:when>
                        <c:when test="${statusName == 'UNDER_PUBLISHED'}">Under Published</c:when>
                        <c:when test="${statusName == 'UNDER_REJECTED'}">Under Rejected</c:when>
                        <c:otherwise>Under Review</c:otherwise>
                    </c:choose>
                </span>
            </td>

            <!-- Notes -->
            <td>
                <c:if test="${not empty submission.adminNotes}">
                    <strong><i class="fas fa-comment"></i></strong> ${submission.adminNotes}
                </c:if>

                <c:if test="${not empty submission.editedAt}">
                    <div>
                        <i class="fas fa-edit"></i> Edited by ${submission.editedBy} on ${submission.editedAt}
                    </div>
                </c:if>
            </td>
        </tr>

        </c:forEach>
    </tbody>
</table>

                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="no-submissions">
                                <i class="fas fa-file-alt"></i>
                                <h4>No Submissions Yet</h4>
                                <p>Submit your first research article using the form above to get started.</p>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <div class="container-main">
            <div class="row">
                <div class="col-lg-4 mb-4 mb-lg-0">
                    <div class="footer-logo mb-3">
								<img src="${pageContext.request.contextPath}/images/Logo_1-removebg-preview.png" alt="logo"
									class="img-fluid mb-3" style="height:80px; max-width:180px;">
								<div
									style="font-size:28px; font-family:Georgia, serif; color:var(--gold); font-weight:700; margin-bottom:10px;">
									Nature Ayurved
								</div>
								<div
									style="font-size:11px; font-weight:600; color:#d4a96a; text-transform:uppercase; margin-bottom:20px;">
									International Journal of Ayurved Science & Research
								</div>
							</div>
                  
                    <div class="social-icons mt-3">
                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>

                <div class="col-6 col-lg-2">
                    <h5>Quick Links</h5>
                    <ul class="footer-links">
                        <li><a href="${pageContext.request.contextPath}/about">About Us</a></li>
                        <li><a href="${pageContext.request.contextPath}/editorial-board">Editorial Board</a></li>
                        <li><a href="${pageContext.request.contextPath}/current-issues">Current Issue</a></li>
                        <li><a href="${pageContext.request.contextPath}/archives">Archives</a></li>
                    </ul>
                </div>

               <div class="col-lg-2 mb-4">
                    <h5>Author Zone</h5>
                    <ul class="footer-links">
                        <li><a href="${pageContext.request.contextPath}/submit-article">Submit Article</a></li>
                        <li><a href="${pageContext.request.contextPath}/author-guideline">Author Guideline</a></li>
                        <li><a href="${pageContext.request.contextPath}/login">Login / Register</a></li>
                      
                    </ul>
                </div>

               <div class="col-lg-4 mb-4">
                    <h5>Contact</h5>
                    <ul class="footer-links">
                        <li><i class="fas fa-envelope me-2"></i> <a href="mailto:editor@ayuscript.com">natureayurvedjournal@gmail.com</a></li>
                        <li><i class="fas fa-globe me-2"></i> <a href="http://www.ayuscript.com/">natureayurved.com</a></li>
                        <li><i class="fas fa-barcode me-2"></i> ISSN: 0000-0000</li>
                    </ul>
                </div>
            </div>

            <div class="footer-bottom">
                &copy; 2025 NATURE AYURVED | All Rights Reserved. | <a href="#">Privacy Policy</a>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        // File input display
        const docInput = document.getElementById('document');
        if (docInput) {
            docInput.addEventListener('change', function(e) {
                const fileName = e.target.files[0]?.name || 'Choose document file...';
                const el = document.querySelector('.file-input-text');
                if (el) el.textContent = fileName;
            });
        }

        // Auto-dismiss alerts after 5 seconds
        document.addEventListener('DOMContentLoaded', function() {
            const alerts = document.querySelectorAll('.alert');
            alerts.forEach(function(alert) {
                setTimeout(function() {
                    const bsAlert = new bootstrap.Alert(alert);
                    bsAlert.close();
                }, 5000);
            });
            
            // Initialize toggle functionality
            initializeToggleButtons();
        });

        // Toggle functionality for sections
        function initializeToggleButtons() {
            // Upload section toggle
            const toggleUploadBtn = document.getElementById('toggleUploadSection');
            const uploadFormContainer = document.getElementById('uploadFormContainer');
            
            // Submissions section toggle
            const toggleSubmissionsBtn = document.getElementById('toggleSubmissionsSection');
            const submissionsContainer = document.getElementById('submissionsContainer');
            
            // Check sessionStorage for saved toggle states
            const uploadSectionState = sessionStorage.getItem('uploadSectionState');
            const submissionsSectionState = sessionStorage.getItem('submissionsSectionState');
            
            // Auto-expand form if there's an error or success message
            const hasMessage = document.querySelector('.alert') !== null;
            
            // Initialize upload section state
            if (uploadSectionState === 'expanded' || hasMessage) {
                uploadFormContainer.style.display = 'block';
                toggleUploadBtn.innerHTML = '<i class="fas fa-chevron-up"></i> Hide';
                if (hasMessage) {
                    sessionStorage.setItem('uploadSectionState', 'expanded');
                }
            }
            
            // Initialize submissions section state
            if (submissionsSectionState === 'expanded') {
                submissionsContainer.style.display = 'block';
                toggleSubmissionsBtn.innerHTML = '<i class="fas fa-chevron-up"></i> Hide';
            }
            
            // Upload section toggle event
            toggleUploadBtn.addEventListener('click', function() {
                if (uploadFormContainer.style.display === 'none') {
                    uploadFormContainer.style.display = 'block';
                    toggleUploadBtn.innerHTML = '<i class="fas fa-chevron-up"></i> Hide';
                    sessionStorage.setItem('uploadSectionState', 'expanded');
                } else {
                    uploadFormContainer.style.display = 'none';
                    toggleUploadBtn.innerHTML = '<i class="fas fa-chevron-down"></i> Show';
                    sessionStorage.setItem('uploadSectionState', 'collapsed');
                }
            });
            
            // Submissions section toggle event
            toggleSubmissionsBtn.addEventListener('click', function() {
                if (submissionsContainer.style.display === 'none') {
                    submissionsContainer.style.display = 'block';
                    toggleSubmissionsBtn.innerHTML = '<i class="fas fa-chevron-up"></i> Hide';
                    sessionStorage.setItem('submissionsSectionState', 'expanded');
                } else {
                    submissionsContainer.style.display = 'none';
                    toggleSubmissionsBtn.innerHTML = '<i class="fas fa-chevron-down"></i> Show';
                    sessionStorage.setItem('submissionsSectionState', 'collapsed');
                }
            });
        }
        
        // Form validation
        function validateForm() {
            console.log('Form validation started');
            const title = document.getElementById('title');
            const documentInput = document.getElementById('document');
            
            if (!title || !title.value || title.value.trim() === '') {
                console.error('Title validation failed');
                alert('Please enter an article title');
                if (title) title.focus();
                return false;
            }
            
            if (!documentInput || !documentInput.files || documentInput.files.length === 0) {
                console.error('Document validation failed');
                alert('Please select a document to upload');
                if (documentInput) documentInput.focus();
                return false;
            }
            
            const file = documentInput.files[0];
            console.log('File selected:', file.name, 'Size:', file.size);
            
            const maxSize = 10 * 1024 * 1024; // 10MB
            if (file.size > maxSize) {
                console.error('File size validation failed:', file.size);
                alert('File size must be less than 10MB');
                return false;
            }
            
            const allowedExtensions = ['doc', 'docx', 'pdf', 'txt'];
            const fileName = file.name.toLowerCase();
            const fileExtension = fileName.substring(fileName.lastIndexOf('.') + 1);
            
            if (!allowedExtensions.includes(fileExtension)) {
                console.error('File extension validation failed:', fileExtension);
                alert('Only DOC, DOCX, PDF, and TXT files are allowed');
                return false;
            }
            
            // Show loading indicator
            const submitBtn = document.querySelector('#submitArticleForm button[type="submit"]');
            if (submitBtn) {
                submitBtn.disabled = true;
                submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin me-2"></i>Submitting...';
            }
            
            console.log('Form validation passed, submitting...');
            return true;
        }
        
        // Add form submission event listener for debugging
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.getElementById('submitArticleForm');
            if (form) {
                form.addEventListener('submit', function(e) {
                    console.log('Form submit event triggered');
                    console.log('Form action:', form.action);
                    console.log('Form method:', form.method);
                    console.log('Form enctype:', form.enctype);
                });
            }
        });
        
        //upload section Authors 
        let authorIndex = 1;

        function addAuthorRow() {
            let container = document.getElementById("authorsContainer");

            let row = document.createElement("div");
            row.classList.add("author-row");
            row.setAttribute("data-index", authorIndex);

            row.innerHTML = `
              <div class="form-row" style="display:flex; gap:10px; margin-bottom:8px;">
                  <div><div class="author-no">${authorIndex + 1}</div></div>

                  <div>
                      <input type="text" name="authorNames"
                             class="form-control"
                             placeholder="Author's Name">
                  </div>

                  <div>
                      <input type="text" name="authorDetails"
                             class="form-control"
                             placeholder="Author's Details">
                  </div>

                  <div>
                      <button type="button" class="mini-btn" onclick="removeAuthorRow(this)">-</button>
                  </div>
              </div>
            `;

            container.appendChild(row);
            authorIndex++;
        }

        function removeAuthorRow(btn) {
            btn.closest(".author-row").remove();
        }
        
        // Check for flash messages in URL parameters (fallback)
        window.addEventListener('DOMContentLoaded', function() {
            const urlParams = new URLSearchParams(window.location.search);
            const message = urlParams.get('message');
            const messageType = urlParams.get('messageType');
            
            if (message) {
                const alertDiv = document.createElement('div');
                alertDiv.className = 'alert alert-' + (messageType || 'info') + ' fade show';
                alertDiv.setAttribute('role', 'alert');
                alertDiv.innerHTML = '<i class="fas fa-info-circle me-2"></i> ' + decodeURIComponent(message);
                
                const container = document.querySelector('.container-main');
                if (container) {
                    container.insertBefore(alertDiv, container.firstChild);
                }
            }
        });
    </script>
</body>
</html>
