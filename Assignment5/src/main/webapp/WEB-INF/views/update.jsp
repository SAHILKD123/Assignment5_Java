<%@ page import="com.assignment5.model.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Product</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        /* Custom styles for the page */
        body {
            padding: 20px;
            background-color: #f8f9fa;
        }
        h2 {
            color: #007bff;
        }
        .container {
            max-width: 500px;
            margin: 0 auto;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-control {
            width: 100%;
        }
        .btn-primary {
            width: 100%;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Update Product</h2>
        <form action="updateProduct" method="post">
            <input type="hidden" name="id" value="${product.id}">
            <div class="form-group">
                <label for="productName">Product Name:</label>
                <input type="text" class="form-control" id="productName" name="productName" value="${product.name}">
            </div>
            <div class="form-group">
                <label for="quantity">Quantity:</label>
                <input type="number" class="form-control" id="quantity" name="quantity" value="${product.quantity}">
            </div>
            <button type="submit" class="btn  btn-primary">Update Product</button>
        </form>
    </div>
</body>
</html>
