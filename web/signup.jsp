<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Signup Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="bootstrap/bootstrap.min.css"/>
        <script src="bootstrap/bootstrap.bundle.min.js"></script>
        <style>
            body {
                background-color: #f8f9fa;
            }
            .signup-form {
                max-width: 600px;
                margin: 50px auto;
                padding: 30px;
                background-color: #fff;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            .form-control:focus {
                box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
            }
            .btn-primary {
                width: 100%;
            }
        </style>
    </head>
    <body>

        <div class="container">

            <div class="signup-form">
                <h2 class="text-center mb-4">Create Your Account</h2>
                <form action="SignupAction" method="post">
                    
                    <div class="mb-3">
                        <label for="userName" class="form-label">User Name</label>
                        <input type="text" name="userName" class="form-control" id="userName" placeholder="Enter a username" maxlength="10" minlength="5" required>
                    </div>
                    
                    <div class="mb-3">
                        <label for="fullname" class="form-label">Full Name</label>
                        <input type="text" name="name" class="form-control" id="fullname" placeholder="Enter your full name" required>
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" name="email" class="form-control" id="email" placeholder="Enter your email" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Gender</label>
                        <div name="gender" required>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="gender" id="male" value="Male">
                                <label class="form-check-label" for="male">Male</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="gender" id="female" value="Female">
                                <label class="form-check-label" for="female">Female</label>
                            </div>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="editDob" class="form-label">Date of Birth</label>
                        <input type="date" name="dob" class="form-control" id="editDob" placeholder="1990-03-10" required>
                    </div>
                    
                    <div class="mb-3">
                        <label for="phone" class="form-label">Phone Number</label>
                        <input type="tel" name="phoneNumber" class="form-control" id="phone" placeholder="Enter your phone number" minlength="10" maxlength="10" required>
                    </div>
                    
                    <div class="mb-3">
                        <label for="address" class="form-label">Address</label>
                        <input type="text" class="form-control" name="address" id="address" rows="3" placeholder="Enter your address" required>
                    </div>
                    
                    <div class="mb-3">
                        <label for="city" class="form-label">City</label>
                        <input type="text" name="city" class="form-control" id="city" placeholder="Enter your city" required>
                    </div>
                    
                    <div class="mb-3">
                        <label for="region" class="form-label">Region</label>
                        <input type="text" name="region" class="form-control" id="region" placeholder="Enter your region" required>
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
                        <input type="password" name="password" class="form-control" id="password" placeholder="Create a password" minlength="8" maxlength="32" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Sign Up</button>
                    <div class="mt-3 text-center">
                        <p>Already have an account? <a href="index.jsp">Login here</a></p>
                    </div>
                </form>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
