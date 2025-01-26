<%@ page import="lk.ijse.ecommerce.tm.CustomerTM" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer View - Shoe Mart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="css/admin.css" rel="stylesheet">
</head>
<body>
<%@ include file="admin-sidebar.jsp" %>

<main class="container">
    <div class="search-container mb-4">
        <div class="row align-items-center">
            <div class="col-md-8">
                <div class="input-group">
                    <span class="input-group-text">
                        <i class="fas fa-search"></i>
                    </span>
                    <input type="search" class="form-control" placeholder="Search customers..."
                           id="searchCustomerInput">
                </div>
            </div>
            <div class="col-md-4">
                <button class="btn btn-primary w-100 mt-3 mt-md-0" id="searchCustomerButton">
                    <i class="fas fa-search me-2"></i>Search
                </button>
            </div>
        </div>
    </div>

    <%
        List<CustomerTM> customerList = (List<CustomerTM>) request.getAttribute("customerList");
        System.out.println("Customer List in JSP: " + (customerList != null ? customerList.size() : "null"));

        if (customerList != null && !customerList.isEmpty()) {
    %>
    <div class="table-responsive">
        <table class="table table-hover">
            <thead>
            <tr>
                <th>Customer ID</th>
                <th>Name</th>
                <th>Address</th>
                <th>Email</th>
                <th>Mobile No</th>
                <th>Image</th>
            </tr>
            </thead>
            <tbody id="customerTableBody">
            <% for (CustomerTM customer : customerList) { %>
            <tr>
                <td><%= customer.getId() %></td>
                <td><%= customer.getName() %></td>
                <td><%= customer.getAddress() %></td>
                <td><%= customer.getEmail() %></td>
                <td><%= customer.getContact() %></td>
                <td>
                    <% if (customer.getImage() != null) { %>
                    <img src="data:image/jpeg;base64,<%= customer.getImage() %>" alt="Customer Image" width="50" height="50">
                    <% } else { %>
                    No Image
                    <% } %>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
    <% } else { %>
    <div class="alert alert-warning" role="alert">
        No customers found.
    </div>
    <% } %>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Search functionality
    document.getElementById('searchCustomerButton').addEventListener('click', function () {
        const searchTerm = document.getElementById('searchCustomerInput').value.toLowerCase();
        const rows = document.getElementById('customerTableBody').getElementsByTagName('tr');

        for (let row of rows) {
            const text = row.textContent.toLowerCase();
            row.style.display = text.includes(searchTerm) ? '' : 'none';
        }
    });

    // Real-time search
    document.getElementById('searchCustomerInput').addEventListener('input', function () {
        const searchTerm = this.value.toLowerCase();
        const rows = document.getElementById('customerTableBody').getElementsByTagName('tr');

        for (let row of rows) {
            const text = row.textContent.toLowerCase();
            row.style.display = text.includes(searchTerm) ? '' : 'none';
        }
    });
</script>
</body>
</html>