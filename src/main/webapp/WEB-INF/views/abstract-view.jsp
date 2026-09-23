<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Abstract: ${article.title}</title>

    <!-- Fonts & Icons -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&family=Cinzel:wght@600&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

    <!-- (Optional but helps footer layout if you use Bootstrap anywhere else) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        :root {
            --deep-green: rgb(30, 140, 193);;
            --leaf: #2b8a5f;
            --gold: #c9a25a;
            --cream: #fbf6ee;
            --paper: #f7efe6;
            --text: #2d2d2d;
            --radius: 14px;
            --shadow-soft: 0 10px 30px rgba(0,0,0,0.12);
            --max-width: 1200px;
        }

        * {
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: radial-gradient(circle at top, #ffffff 0%, #f7efe6 35%, #e8ddcf 100%);
            margin: 0;
            color: var(--text);
        }

        .container-main {
            max-width: var(--max-width);
            margin: 0 auto;
            padding: 0 20px;
        }

        /* MINI HEADER (TOP) */
        .mini-header {
            background:#fafafa;
            border-bottom:1px solid #e0e0e0;
            padding:8px 18px;
            display:flex;
            align-items:center;
            justify-content:space-between;
        }
        .mini-header-left {
            display:flex;
            align-items:center;
            gap:10px;
        }
        .mini-logo-text {
            font-family: 'Cinzel', serif;
            font-weight:700;
            font-size:20px;
            color:#6d3f1d;
            letter-spacing:1px;
        }
        .mini-header-right {
            font-size:12px;
            color:#555;
        }

        /* CONTENT WRAPPER */
        .page-wrapper {
            min-height: calc(100vh - 180px);
            display:flex;
            justify-content:center;
            align-items:flex-start;
            padding:35px 15px 40px;
        }

        .abstract-container {
            max-width:850px;
            width:100%;
            background:white;
            padding:26px 26px 24px;
            border-radius:var(--radius);
            box-shadow:var(--shadow-soft);
            border-top:4px solid var(--gold);
            position:relative;
        }

        .abstract-badge {
            position:absolute;
            top:-14px;
            left:20px;
            background:var(--deep-green);
            color:white;
            padding:4px 12px;
            border-radius:20px;
            font-size:11px;
            text-transform:uppercase;
            letter-spacing:0.08em;
            display:inline-flex;
            align-items:center;
            gap:6px;
        }

        .abstract-title {
            font-family:'Cinzel', serif;
            font-size:21px;
            margin:10px 0 5px;
            color:var(--deep-green);
        }

        .divider {
            height:1px;
            background:linear-gradient(to right, rgba(201,162,90,0.7), rgba(255,255,255,0));
            margin:8px 0 16px;
        }

        .abstract-heading {
            font-weight:600;
            font-size:14px;
            margin-bottom:6px;
            color:#444;
            text-transform:uppercase;
            letter-spacing:0.08em;
        }

        .abstract-content {
            line-height:1.7;
            font-size:15px;
            color:#333;
            text-align:justify;
        }

        .keywords {
            margin-top:18px;
            background:#faf7f0;
            padding:12px 14px;
            border-radius:10px;
            border-left:3px solid var(--gold);
            font-size:14px;
        }

        .keywords strong {
            text-transform:uppercase;
            letter-spacing:0.08em;
            font-size:12px;
            color:#555;
        }

        .actions-row {
            display:flex;
            justify-content:flex-end;
            margin-top:22px;
        }

        .back-btn {
            display:inline-flex;
            align-items:center;
            gap:6px;
            background:var(--deep-green);
            color:white;
            padding:9px 18px;
            text-decoration:none;
            border-radius:6px;
            font-size:13px;
            font-weight:500;
            border:none;
            cursor:pointer;
            box-shadow:0 4px 10px rgba(11,86,51,0.3);
        }
        .back-btn:hover {
            background:#093b26;
            color:#fff;
        }

        /* FOOTER (FULL AYUSCRIPT FOOTER) */
        .footer {
            background:var(--deep-green);
            color:var(--cream);
            padding:35px 0 10px;
            margin-top:10px;
        }

        .footer-links {
            list-style:none;
            padding-left:0;
            margin:0;
        }

        .footer-links li {
            margin-bottom:6px;
        }

        .footer-links a {
            color:white;
            text-decoration:none;
        }
        .footer-links a:hover {
            text-decoration:underline;
        }

        .footer-bottom {
            border-top:1px solid rgba(255,255,255,0.15);
            margin-top:25px;
            padding-top:12px;
            text-align:center;
            font-size:13px;
        }

        @media (max-width: 600px) {
            .page-wrapper {
                padding:20px 10px 30px;
            }
            .abstract-container {
                padding:20px 16px 18px;
            }
            .abstract-title {
                font-size:18px;
            }
            .mini-header {
                flex-direction:column;
                align-items:flex-start;
                gap:4px;
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
    padding: 25px 0 5px !important;  /* very compact */
}


        
    </style>
</head>
<body>

    <!-- TOP MINI HEADER -->
   <header style="background:#fafafa; padding:15px 0; border-bottom:1px solid #e0e0e0; width:100%;">

    <!-- FULL-WIDTH WRAPPER -->
    <div style="display:flex; align-items:center; justify-content:space-between; width:100%;">

        <!-- LEFT – LOGO -->
        <div style="padding-left:25px;">
            <img src="${pageContext.request.contextPath}/images/Logo_1-removebg-preview.png"
                 alt="AYUSCRIPT Logo"
                 style="height:90px; width:180px; object-fit:contain;">
        </div>

        <!-- CENTER – TITLE -->
        <div style="flex-grow:1; text-align:center; margin-left:-100px;">
            <h1 style="
                font-family: Georgia, serif;
                font-weight: 800;
                font-size: 48px;
                color: #6d3f1d;
                margin: 0;
                letter-spacing: 2px;">
                NATURE AYURVED
            </h1>
        </div>

        <!-- RIGHT – ISSN -->
        <div style="padding-right:35px;">
            <span style="
                font-size: 22px;
                font-weight: 700;
                color: #4a4a4a;">
                ISSN: 0000-0000
            </span>
        </div>

    </div>

</header>


    <!-- MAIN CONTENT -->
    <div class="page-wrapper">
        <div class="abstract-container">
            <div class="abstract-badge">
                <i class="fas fa-file-alt"></i> Abstract
            </div>

            <!-- Article Title (logic unchanged) -->
            <h1 class="abstract-title">${article.title}</h1>

            <div class="divider"></div>

            <div class="abstract-section">
                <div class="abstract-heading">Abstract</div>
                <div class="abstract-content">
                    <c:if test="${not empty article.abstractText}">
                        <p>${article.abstractText}</p>
                    </c:if>

                    <c:if test="${empty article.abstractText}">
                        <p>No abstract available for this article.</p>
                    </c:if>
                </div>
            </div>

            <c:if test="${not empty article.abstractKeywords}">
                <div class="keywords">
                    <strong>KEYWORDS:</strong>
                    &nbsp;${article.abstractKeywords}
                </div>
            </c:if>

            <div class="actions-row">
                <!-- SAME LOGIC: close window -->
                <a href="javascript:window.close()" class="back-btn">
                    <i class="fas fa-times"></i> Close Window
                </a>
            </div>
        </div>
    </div>

    <!-- FULL AYUSCRIPT FOOTER -->
   <!-- ===== Footer ===== -->

<footer class="footer" style="background:var(--deep-green); color:var(--cream); padding:60px 0 25px;">
    <div class="container">

        <div class="row align-items-start">

            <!-- LEFT COLUMN -->
            <div class="col-lg-4 mb-4">
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
             <!--    <p class="mb-2" style="font-size:14px; line-height:1.5;">
                    Flat No 604, Raut Arcade, Near Mohan Palms,<br>
                    Shirgaon, Badlapur, Thane 421 503
                </p>

                <p class="mb-2" style="font-size:14px;">Email: ayuscriptjournal@gmail.com</p>
                <p class="mb-2" style="font-size:14px;">Mobile: 9324737097</p>

                <p class="mb-2 mt-3" style="font-size:14px;">Editor-in-Chief: Dr. Vishnu Bawane</p>
                <p class="mb-2" style="font-size:14px;">Email: drvcbawane@gmail.com</p>
                <p class="mb-2" style="font-size:14px;">Mobile: 9324737097</p> -->

              <!--   <div class="social-icons mt-3">
                    <a href="#"><i class="fab fa-facebook-f me-3" style="color:white;"></i></a>
                    <a href="#"><i class="fab fa-twitter me-3" style="color:white;"></i></a>
                    <a href="#"><i class="fab fa-linkedin-in" style="color:white;"></i></a>
                </div> -->
            </div>

            <!-- Quick Links -->
            <div class="col-lg-2 mb-4">
                <h5 style="color:var(--gold); font-family:Georgia, serif; margin-bottom:20px;">Quick Links</h5>
                <ul class="footer-links">
                    <li><a href="${pageContext.request.contextPath}/about">About Us</a></li>
                    <li><a href="${pageContext.request.contextPath}/editorial-board">Editorial Board</a></li>
                    <li><a href="${pageContext.request.contextPath}/current-issue">Current Issue</a></li>
                </ul>
            </div>

            <!-- Author Zone -->
            <div class="col-lg-2 mb-4">
                <h5 style="color:var(--gold); font-family:Georgia, serif; margin-bottom:20px;">Author Zone</h5>
                <ul class="footer-links">
                    <li><a href="${pageContext.request.contextPath}/submit-article">Submit Article</a></li>
                    <li><a href="${pageContext.request.contextPath}/author-guideline">Author Guideline</a></li>
                    <li><a href="${pageContext.request.contextPath}/login">Login / Register</a></li>
                </ul>
            </div>

            <!-- Contact -->
            <div class="col-lg-4 mb-4">
                <h5 style="color:var(--gold); font-family:Georgia, serif; margin-bottom:20px;">Contact</h5>
                <ul class="footer-links">
                    <li><i class="fa fa-envelope me-2"></i> natureayurvedjournal@gmail.com</li>
                    <li><i class="fa fa-globe me-2"></i> natureayurved.com</li>
                    <li><i class="fa fa-barcode me-2"></i> ISSN: 0000-0000</li>
                </ul>
            </div>

        </div>

        <div class="footer-bottom mt-4 pt-3" style="border-top:1px solid rgba(255,255,255,0.15); text-align:center;">
            <p class="mb-0" style="font-size:14px;">
                Copyrights © 2026 NATURE AYURVED All Rights Reserved.
            </p>
        </div>

    </div>
</footer>   


    <!-- Optional Bootstrap JS (not required for logic) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
