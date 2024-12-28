<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../bootstrap/bootstrap.min.css"/>
        <script src="../bootstrap/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="#"><img class="mx-1 mb-1"src="../assets/house.svg" alt="home logo">SuQ (Admin)</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="adminHomePage.jsp"><img class="mx-1 mb-1"src="../assets/house.svg" alt="home logo">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="addProduct.jsp"><img class="mx-1 mb-1"src="../assets/patch-plus-fill.svg" alt="plus logo">Add Products</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="order.jsp"><img class="mx-1 mb-1"src="../assets/list-columns-reverse.svg" alt="orders logo">Orders</a>
                        </li>
                    </ul>
                    <ul class="navbar-nav">
                        <!-- Profile Dropdown -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="profileDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <img class="mx-1 mb-1"src="../assets/person-fill.svg" alt="profile picture">admin
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="profileDropdown">
                                <li><a class="dropdown-item" href="../logout.jsp">Logout</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <script src="../bootstrap/bootstrap.bundle.min.js"></script>
    </body>
</html>
