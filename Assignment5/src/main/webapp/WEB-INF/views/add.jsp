<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Product</title>
    <!-- Bootstrap CSS link -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+Knujsl5+zJ3eQoH3VlARvRfBtTEv2h2tF5fVTvC2KxOrZt" crossorigin="anonymous">
    <style>
        /* Custom CSS */
        body {
            height: 100vh;
            display: flex;
            align-items: flex-start; /* Align items to the top */
            justify-content: flex-start; /* Align items to the top */
            background-color: #f8f9fa;
            padding: 20px; /* Added padding for better appearance */
        }
        .card {
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
        }
        .card-header {
            background-color: #007bff;
            color: #fff;
            font-weight: bold;
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
            padding: 15px;
            text-align: center; /* Centered text */
        }
        .card-body {
            padding: 20px;
        }
        .form-label {
            font-weight: bold;
        }
        .btn-primary {
            width: 100%;
            background-color: #007bff; /* Changed button color */
            border-color: #007bff; /* Changed button border color */
        }
        .btn-primary:hover {
            background-color: #0056b3; /* Darkened button color on hover */
            border-color: #0056b3; /* Darkened button border color on hover */
        }
    </style>
</head>
<body>
    <div class="card">
        <div class="card-header">
            <h3>Add New Product</h3>
        </div>
        <div class="card-body">
            <form action="AddProduct" method="post">
                <div class="mb-3">
                    <label for="productId" class="form-label">Product ID</label>
                    <input type="text" id="productId" name="productId" class="form-control">
                </div>
                <div class="mb-3">
                    <label for="productName" class="form-label">Product Name</label>
                    <input type="text" id="productName" name="productName" class="form-control">
                </div>
                <div class="mb-3">
                    <label for="quantity" class="form-label">Quantity</label>
                    <input type="number" id="quantity" name="quantity" class="form-control">
                </div>
                <button type="submit" class="btn btn-primary">Add Product</button>
            </form>
        </div>
    </div>
    <!-- Bootstrap JS bundle (optional) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-Ur5Yr5kiEhCIhVA9ECE5wGpOVIlPwqIyL/Adk8c+E+nSu3HpCy3pjI1JswbFjciI" crossorigin="anonymous"></script>
</body>
</html>
