<%@ page import="com.assignment5.model.Product" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product List</title>
</head>
<body>
    <h2>Product List</h2>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Quantity</th>
            <th>Action</th>
        </tr>
        <% if (request.getAttribute("products") != null) {
            List<Product> products = (List<Product>) request.getAttribute("products");
            for (Product product : products) { %>
                <tr>
                    <td><%= product.getName() %></td>
                    <td><%= product.getQuantity() %></td>
                    <td>
                        <form action="addProduct" method="post">
                            <input type="hidden" name="productId" value="<%= product.getId() %>">
                            <input type="submit" value="Add">
                        </form>
                    </td>
                    <td>
                        <form action="removeProduct" method="post">
                            <input type="hidden" name="productId" value="<%= product.getId() %>">
                            <input type="submit" value="Remove">
                        </form>
                    </td>
                </tr>
            <% }
        } %>
    </table>
</body>
</html>
