<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Payment Failed - AYUSCRIPT</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --deep-green: #0b5633;
            --leaf: #2b8a5f;
            --rust: #7a4b3a;
            --gold: #c9a25a;
            --cream: #fbf6ee;
            --paper: #f7efe6;
            --text: #2d2d2d;
        }
        
        body {
            font-family: 'Segoe UI', 'Helvetica Neue', Arial, sans-serif;
            background-color: var(--cream);
            color: var(--text);
            margin: 0;
            padding: 0;
            line-height: 1.6;
        }
        
        .failure-container {
            max-width: 800px;
            margin: 50px auto;
            padding: 30px;
            background: white;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(11, 86, 51, 0.1);
            border-top: 5px solid #dc3545;
        }
        
        .failure-icon {
            width: 100px;
            height: 100px;
            background: #f8d7da;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 25px;
            border: 5px solid #f5c6cb;
        }
        
        .failure-icon i {
            font-size: 50px;
            color: #dc3545;
        }
        
        .payment-details {
            background: var(--paper);
            padding: 25px;
            border-radius: 10px;
            margin: 25px 0;
            border-left: 4px solid #dc3545;
        }
        
        .detail-row {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            border-bottom: 1px solid #eee;
        }
        
        .detail-label {
            font-weight: 600;
            color: var(--deep-green);
        }
        
        .detail-value {
            font-weight: 500;
        }
        
        .btn-try-again {
            background: var(--deep-green);
            color: white;
            padding: 12px 30px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
            display: inline-block;
            margin-top: 20px;
            transition: all 0.3s ease;
        }
        
        .btn-try-again:hover {
            background: var(--leaf);
            color: white;
            transform: translateY(-2px);
        }
        
        .btn-home {
            background: var(--rust);
            color: white;
            padding: 12px 30px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
            display: inline-block;
            margin: 20px 10px 0;
            transition: all 0.3s ease;
        }
        
        .btn-home:hover {
            background: #8a5a4a;
            color: white;
            transform: translateY(-2px);
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="failure-container text-center">
            <div class="failure-icon">
                <i class="fas fa-times"></i>
            </div>
            
            <h1 style="color: #dc3545; margin-bottom: 20px; font-size: 2.5rem;">
                Payment Failed
            </h1>
            
            <p style="font-size: 1.2rem; color: #666; margin-bottom: 30px;">
                We're sorry, but your payment could not be processed at this time. Please try again.
            </p>
            
            <c:if test="${not empty payment}">
                <div class="payment-details">
                    <h3 style="color: var(--deep-green); margin-bottom: 20px; text-align: left;">
                        <i class="fas fa-exclamation-triangle me-2"></i>Payment Information
                    </h3>
                    
                    <div class="detail-row">
                        <span class="detail-label">Order ID:</span>
                        <span class="detail-value">${payment.razorpayOrderId}</span>
                    </div>
                    
                    <div class="detail-row">
                        <span class="detail-label">Amount:</span>
                        <span class="detail-value">
                            <c:choose>
                                <c:when test="${payment.paymentType == 'INR'}">
                                    ₹${payment.amount}
                                </c:when>
                                <c:otherwise>
                                    $${payment.amount}
                                </c:otherwise>
                            </c:choose>
                        </span>
                    </div>
                    
                    <div class="detail-row">
                        <span class="detail-label">Payment Status:</span>
                        <span class="detail-value" style="color: #dc3545; font-weight: 600;">
                            ${payment.status}
                        </span>
                    </div>
                    
                    <div class="detail-row">
                        <span class="detail-label">Date & Time:</span>
                        <span class="detail-value">${payment.createdAt}</span>
                    </div>
                    
                    <c:if test="${not empty payment.authorEmail}">
                        <div class="detail-row">
                            <span class="detail-label">Email:</span>
                            <span class="detail-value">${payment.authorEmail}</span>
                        </div>
                    </c:if>
                </div>
            </c:if>
            
            <div style="margin-top: 30px;">
                <p style="color: #666; margin-bottom: 25px;">
                    <i class="fas fa-info-circle me-2"></i>
                    Possible reasons for failure:
                </p>
                
                <ul style="text-align: left; max-width: 500px; margin: 0 auto 25px; color: #666;">
                    <li>Insufficient funds in your account</li>
                    <li>Incorrect card details</li>
                    <li>Network connectivity issues</li>
                    <li>Payment gateway timeout</li>
                </ul>
                
                <a href="${pageContext.request.contextPath}/author-guideline#payment-section" class="btn-try-again">
                    <i class="fas fa-redo me-2"></i>Try Again
                </a>
                
                <div style="margin-top: 15px;">
                    <a href="${pageContext.request.contextPath}/" class="btn-home">
                        <i class="fas fa-home me-2"></i>Back to Home
                    </a>
                    
                    <a href="${pageContext.request.contextPath}/contact" class="btn-home">
                        <i class="fas fa-envelope me-2"></i>Contact Support
                    </a>
                </div>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>