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
/*        .btn-primary {
            background-color: #6a11cb;
            border: none;
        }*/
        .btn-primary:hover {
            background-color: #5a0fb9;
        }
    </style>
</head>

<body>
    <div class="login-container">
        <h3 class="text-center mb-4">Forgot Password</h3>
        <form action="ForgotPassword" method="post">
            <div class="mb-3">
                <label for="userName" class="form-label">User Name</label>
                <input type="text" name="userName" class="form-control" id="userName" placeholder="Enter your username" maxlength="10" minlength="5" required>
            </div>
            
            <div class="mb-3">
                        <label for="securityQuestion" class="form-label">Security Questions</label>
                        <select class="form-select" id="securityQuestion" name="securityQuestion" required>
                            <option selected disabled>Select a Question</option>
                            <option  value="What was your primary school name?">What was your primary school name?</option>
                            <option  value="Where does your parent's met?">Where does your parent's met?</option>
                            <option value="What was the name of your first pet?">What was the name of your first pet?</option>
                            <option  value="Who was your favorite teacher?">Who was your favorite teacher?</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label for="answer" class="form-label">Security Question Answer</label>
                        <input type="text" class="form-control" name="securityAnswer" id="answer" rows="3" placeholder="Enter your Answer" required>
                    </div>
            
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" name="password" class="form-control" id="password" placeholder="Enter your password" required>
            </div>
            <div class="mb-3">
                <label for="confirmPassword" class="form-label">Confirm Password</label>
                <input type="password" name="confirmPassword" class="form-control" id="confirmPassword" placeholder="Enter your password" required>
            </div>
            <div class="d-grid">
                <button type="submit" class="btn btn-primary">Reset</button>
            </div>
            <p class="text-center mt-3">
                <a href="index.jsp" class="text-decoration-none">login</a>
            </p>
        </form>
        
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
