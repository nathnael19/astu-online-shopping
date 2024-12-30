<%@page import="aos.dao.DatabaseProvider"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Profile - Online Shopping</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="../bootstrap/bootstrap.min.css"/>
        <script src="${pageContext.request.contextPath}/bootstrap/bootstrap.bundle.min.js"></script>
        <style>
            .profile-container {
                max-width: 800px;
                margin: 50px auto;
                padding: 30px;
                background-color: #f8f9fa;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .profile-header {
                text-align: center;
                margin-bottom: 30px;
                position: relative;
            }

            .profile-header img {
                border-radius: 50%;
                width: 120px;
                height: 120px;
                object-fit: cover;
            }

            .profile-header .btn-add-image {
                position: absolute;
                bottom: 0;
                right: 0;
                background-color: #007bff;
                color: white;
                border-radius: 50%;
                border: none;
                padding: 10px;
                font-size: 18px;
                cursor: pointer;
                display: none; /* Initially hidden */
            }

            .profile-info {
                margin-top: 20px;
            }

            .profile-info dt {
                font-weight: bold;
            }

            .profile-info dd {
                margin-left: 0;
            }

            .file-input {
                display: none;
            }
            .error-message {
                color: greenyellow;
                font-size: 0.9em;
                margin-bottom: 15px;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <%
            String username21 = (String) session.getAttribute("userName");
            if (username21 == null) {
                // User not logged in, redirect to login page
                response.sendRedirect("../index.jsp");
                return;
            }
        %>
        <%
            int userId = (Integer) session.getAttribute("userId");

            String query = "select * from users where userId='" + userId + "';";
            try {
                Connection connection = DatabaseProvider.getConn();
                Statement stmt = connection.createStatement();

                ResultSet rs = stmt.executeQuery(query);
                while (rs.next()) {

        %>
        <%@include file="userNav.jsp" %>
        <div class="profile-container">
            <div class="error-message">
                <%                    String errorMessage = (String) request.getAttribute("errorMessage");
                    if (errorMessage != null) {
                %>
                <div class="error-message">
                    <%= errorMessage%>
                </div>
                <% }%>
            </div>
                <div class="profile-header">
                    <img id="pp" src="${pageContext.request.contextPath}/productImages/<%=rs.getString(15)%>" alt="profile picture">
                    <h2 class="mt-3" id="profileName"><%=rs.getString(2)%></h2>
                    <p class="text-muted" id="profileJoinDate">Joined: <%=rs.getDate(14)%></p>
                </div>

                <!-- Profile Information -->
                <div class="profile-info" id="profileViewMode">               
                    <dl class="row">
                        <dt class="col-sm-3">Full Name:</dt>
                        <dd class="col-sm-9" id="fullName"><%=rs.getString(3)%></dd>

                        <dt class="col-sm-3">Email:</dt>
                        <dd class="col-sm-9" id="email"><%=rs.getString(4)%></dd>

                        <dt class="col-sm-3">Gender</dt>
                        <dd class="col-sm-9" id="gender"><%=rs.getString(5)%></dd>

                        <dt class="col-sm-3">Address</dt>
                        <dd class="col-sm-9" id="address"><%=rs.getString(7)%></dd>

                        <dt class="col-sm-3">City</dt>
                        <dd class="col-sm-9" id="city"><%=rs.getString(8)%></dd>

                        <dt class="col-sm-3">Region</dt>
                        <dd class="col-sm-9" id="region"><%=rs.getString(9)%></dd>

                        <dt class="col-sm-3">Date of Birth</dt>
                        <dd class="col-sm-9" id="dob"><%=rs.getString(12)%></dd>

                        <dt class="col-sm-3">Phone Number</dt>
                        <dd class="col-sm-9" id="phoneNumber"><%=rs.getInt(6)%></dd>
                    </dl>
                </div>

                <!-- Profile Edit Mode -->
                <div class="profile-info" id="profileEditMode" style="display: none;">
                    <form  action="../UpdateProfile" method="post" enctype="multipart/form-data">

                        <button class="btn btn-primary"><input type="file" accept="image/*" name="picturePicture"></button>
                        <div class="mb-3">
                            <label for="editFullName" class="form-label">Full Name</label>
                            <input type="text" name="name" class="form-control" id="editFullName" value="<%=rs.getString(3)%>" required>
                        </div>
                        <div class="mb-3">
                            <label for="editEmail" class="form-label">Email</label>
                            <input type="email" name="email" class="form-control" id="editEmail" value="<%=rs.getString(4)%>" required>
                        </div>
                        <div class="mb-3">
                            <label for="editPhone" class="form-label">Phone</label>
                            <input type="tel" name="phoneNumber" class="form-control" id="editPhone" value="<%=rs.getString(6)%>" maxlength="10" minlength="10" required>
                        </div>
                        <div class="mb-3">
                            <label for="editAddress" class="form-label">Address</label>
                            <input type="text" name="address" class="form-control" id="editAddress" value="<%=rs.getString(7)%>" required>
                        </div>
                        <div class="mb-3">
                            <label for="editCity" class="form-label">City</label>
                            <input type="text"  name="city" class="form-control" id="editCity" value="<%=rs.getString(8)%>" required>
                        </div>
                        <div class="mb-3">
                            <label for="editRegion" class="form-label">Region</label>
                            <input type="text"  name="region" class="form-control" id="editRegion" value="<%=rs.getString(9)%>" required>
                        </div>

                        <button type="submit" class="btn btn-primary">Save Changes</button>
                        <button type="button" class="btn btn-secondary ms-2" onclick="toggleEditMode()">Cancel</button>
                    </form>
                    <%    }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>

                </div>

                <!-- Button to Edit Profile -->
                <div class="text-center" id="editProfileButtonContainer">
                    <button class="btn btn-primary" onclick="toggleEditMode()">Edit Profile</button>
                </div>
            </div>

            <!-- Bootstrap JS -->
            <script src="../bootstrap/bootstrap.bundle.min.js"></script>

            <!-- JavaScript to handle edit and image upload functionality -->
            <script>
                        // Function to toggle between view and edit modes
                        function toggleEditMode() {
                            const profileViewMode = document.getElementById('profileViewMode');
                            const profilePicture = document.getElementById('pp');
                            const profileEditMode = document.getElementById('profileEditMode');
                            const editProfileButtonContainer = document.getElementById('editProfileButtonContainer');

                            // If we are in view mode, switch to edit mode
                            if (profileViewMode.style.display === "none") {
                                profileViewMode.style.display = "block";
                                profilePicture.style.display = "block";
                                profileEditMode.style.display = "none";
                            } else {
                                // Otherwise, switch to edit mode
                                profileViewMode.style.display = "none";
                                profileEditMode.style.display = "block";
                                profilePicture.style.display = "none";
                                editProfileButtonContainer.style.display = "none";
                            }
                        }

                        // Handle form submission to save edited profile
                        document.getElementById('editProfileForm').addEventListener('submit', function (e) {
                            e.preventDefault();

                            // Get the edited values
                            const fullName = document.getElementById('editFullName').value;
                            const email = document.getElementById('editEmail').value;
                            const phone = document.getElementById('editPhone').value;
                            const address = document.getElementById('editAddress').value;
                            const city = document.getElementById('editCity').value;
                            const region = document.getElementById('editRegion').value;

                            // Update the profile view with the new data
                            document.getElementById('fullName').textContent = fullName;
                            document.getElementById('email').textContent = email;
                            document.getElementById('phone').textContent = phone;
                            document.getElementById('address').textContent = address;
                            document.getElementById('city').textContent = city;
                            document.getElementById('region').textContent = region;

                            // Switch back to view mode
                            toggleEditMode();
                        });
            </script>
            <script src="${pageContext.request.contextPath}/bootstrap/bootstrap.bundle.min.js"></script>
    </body>
</html>
