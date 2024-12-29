<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login Page</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="bootstrap/bootstrap.min.css"/>
        <script src="bootstrap/bootstrap.bundle.min.js"></script>
        <style>
            body {
                background: #f8f9fa;
                height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                font-family: Arial, sans-serif;
            }
            .login-container {
                background: #fff;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
                max-width: 400px;
                width: 100%;
            }
            .form-control:focus {
                border-color: #6a11cb;
                box-shadow: 0 0 5px rgba(106, 17, 203, 0.5);
            }

            .btn-primary:hover {
                background-color: #5a0fb9;

            }
            .error-message {
                color: red;
                font-size: 0.9em;
                margin-bottom: 15px;
                text-align: center;
            }

        </style>
        <link rel="icon" type="image/x-icon" href="assets/Free.png">

    </head>
    <body>
        <div class="login-container">
            <h3 class="text-center mb-4">Login</h3>
            
            <!-- Display Error Message -->
            <%
                String errorMessage = (String) request.getAttribute("errorMessage");
                if (errorMessage != null) {
            %>
                <div class="error-message">
                    <%= errorMessage %>
                </div>
            <% } %>
            
            <form action="LoginAction2" method="post">
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" name="email" class="form-control" id="email" placeholder="Enter your email" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" name="password" class="form-control" id="password" placeholder="Enter your password" required>
                </div>
                <div class="d-grid">
                    <button type="submit" class="btn btn-primary">Login</button>
                </div>
                <p class="text-center mt-3">
                    <a href="forgotPassword.jsp" class="text-decoration-none">Forgot Password?</a>
                </p>
                <div class="mt-3 text-center">
                    <p>Not a member? <a href="signup.jsp">Register here</a></p>
                </div>
            </form>

        </div>
    </body>
</html>
