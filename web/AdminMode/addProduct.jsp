<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add Product - Online Shopping</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="../bootstrap/bootstrap.min.css"/>
        <style>
            .form-container {
                max-width: 600px;
                margin: 50px auto;
                padding: 30px;
                background-color: #f8f9fa;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
        </style>
    </head>
    <body>
        <%@include file="adminNav.jsp"%>
        <!-- Add Product Form -->
        <div class="form-container">
            <h2 class="text-center mb-4">Add New Product</h2>
            <form action="../AddProduct" method="post" enctype="multipart/form-data">
                <div>
                    <input type="file" accept="image/*" name="fileUrl" required>
                </div>
                <!-- Product Name -->
                <div class="mb-3">
                    <label for="productName" class="form-label">Product Name</label>
                    <input type="text" name="name" class="form-control" id="productName" placeholder="Enter product name" >
                </div>

                <!-- Category -->
                <div class="mb-3">
                    <label for="productCategory" class="form-label">Category</label>
                    <select class="form-select" id="productCategory" name="productCategory" required>
                        <option selected disabled>Select category</option>
                        <option value="Electronics">Electronics</option>
                        <option value="Footwear">Footwear</option>
                        <option value="Fashion">Fashion</option>
                        <option value="Gaming">Gaming</option>
                        <option value="Home Appliances">Home Appliances</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="description" class="form-label">Description</label>
                    <textarea class="form-control" id="description" name="description" rows="4" placeholder="Tell us something about the product..." required></textarea>
                </div>

                <!-- Price -->
                <div class="mb-3">
                    <label for="productPrice" class="form-label">Price ($)</label>
                    <input type="number" name="price" class="form-control" id="productPrice" placeholder="Enter product price" required>
                </div>

                <!-- Submit Button -->
                <div class="d-grid gap-2">
                    <button type="submit" class="btn btn-primary">Add Product</button>
                </div>
            </form>
        </div>

        <!-- Bootstrap JS -->
        <script src="../bootstrap/bootstrap.bundle.min.js"></script>
    </body>
</html>

