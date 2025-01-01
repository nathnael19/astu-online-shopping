<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Payment Success</title>
        <!--<link href="${pageContext.request.contextPath}/bootstrap/bootstrap.min.css">-->
        <link rel="stylesheet" href="../bootstrap/bootstrap.min.css"/>
        <style>
            @keyframes fadeIn {
                from {
                    opacity: 0;
                    transform: scale(0.95);
                }
                to {
                    opacity: 1;
                    transform: scale(1);
                }
            }
            .animate-fade-in {
                animation: fadeIn 0.5s ease-out;
            }
        </style>
    </head>
    <body>
        <%@include file="userNav.jsp"%>
        <section class=" card d-flex align-items-center justify-content-center vh-100">
            <div class="bg-white shadow rounded p-4 animate-fade-in text-center" style="max-width: 400px; width: 100%;">
                <div class="mb-4">
                    <svg class="bi bi-check-circle-fill text-success" xmlns="http://www.w3.org/2000/svg" width="64" height="64" fill="currentColor" viewBox="0 0 16 16">
                    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM6.97 10.03a.75.75 0 0 0 1.08.02l3.992-4.99a.75.75 0 1 0-1.14-.976L7.475 8.867 5.383 6.8a.75.75 0 1 0-1.136.976l2.723 2.735z"/>
                    </svg>
                </div>
                <h2 class="fw-bold text-dark mb-3">Payment Successful</h2>

                <p class="text-secondary mb-4">Thank you for your payment! Your transaction has been completed successfully.</p>
                <a href="homePage.jsp" class="btn btn-primary">Go to Home Page</a>

            </div>
        </section>
    </body>
</html>
