<%@ page import="com.assignment5.model.Product" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product List</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        /* Custom styles for the page */
        body {
            padding: 20px;
            background-color: #f4f4f4; /* Changed background color */
            font-family: Arial, sans-serif; /* Changed font */
        }
        h2 {
            color: #333; /* Darkened heading color */
            text-align: center; /* Centered heading */
            margin-bottom: 20px; /* Increased space below heading */
        }
        .btn-container {
            text-align: center; /* Centered button */
            margin-bottom: 20px; /* Increased space below button */
        }
        .btn-container .btn-primary {
            background-color: #007bff; /* Changed button color */
            border-color: #007bff; /* Changed button border color */
            width: 150px; /* Increased button width */
        }
        .btn-container .btn-primary:hover {
            background-color: #0056b3; /* Darkened button color on hover */
            border-color: #0056b3; /* Darkened button border color on hover */
        }
        .table th, .table td {
            vertical-align: middle;
            text-align: center; /* Centered table content */
        }
        .table th {
            background-color: #007bff; /* Changed table header color */
            color: #fff; /* Changed table header text color */
        }
        .btn-primary, .btn-danger {
            width: 100px;
        }
        .btn-danger {
            background-color: #dc3545; /* Changed danger button color */
            border-color: #dc3545; /* Changed danger button border color */
        }
        .btn-danger:hover {
            background-color: #c82333; /* Darkened danger button color on hover */
            border-color: #bd2130; /* Darkened danger button border color on hover */
        }
    </style>
</head>
<body>
    <h2>Product List</h2>
    <div class="btn-container mt-2 mb-2">
    	<a href="AddProduct" class="btn btn-primary">Add New Product</a>
    </div>
    
    <table class="table table-bordered">
        <thead class="thead-dark">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Quantity</th>
                <th>Update</th>
                <th>Remove</th>
            </tr>
        </thead>
        <tbody>
            <% if (request.getAttribute("products") != null) {
                List<Product> products = (List<Product>) request.getAttribute("products");
                for (Product product : products) { %>
                    <tr>
                        <td><%= product.getId() %></td>
                        <td><%= product.getName() %></td>
                        <td><%= product.getQuantity() %></td>
                        <td>
                            <form action="addProduct" method="post">
                                <input type="hidden" name="productId" value="<%= product.getId() %>">
                                <a href="updateForm?productId=<%= product.getId() %>" class="btn btn-primary btn-sm">Update</a>
                            </form>
                        </td>
                        <td>
                            <form action="removeProduct" method="post">
                                <input type="hidden" name="productId" value="<%= product.getId() %>">
                                <button type="submit" class="btn btn-danger">Remove</button>
                            </form>
                        </td>
                    </tr>
                <% }
            } %>
        </tbody>
    </table>
    <!-- Include Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
