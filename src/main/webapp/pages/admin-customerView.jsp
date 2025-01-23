<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer View - Shoe Mart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="../css/admin.css" rel="stylesheet">
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
                    <input type="search" class="form-control" placeholder="Search customers..." id="searchCustomerInput">
                </div>
            </div>
            <div class="col-md-4">
                <button class="btn btn-primary w-100 mt-3 mt-md-0" id="searchCustomerButton">
                    <i class="fas fa-search me-2"></i>Search
                </button>
            </div>
        </div>
    </div>

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
            <!-- Sample data -->
            <tr>
                <td>C001</td>
                <td>John Doe</td>
                <td>123 Main St, New York</td>
                <td>john.doe@example.com</td>
                <td>+1 123-456-7890</td>
                <td><img src="../images/customer1.jpg" alt="John Doe" style="width: 50px; height: 50px; border-radius: 50%;"></td>
            </tr>
            <tr>
                <td>C002</td>
                <td>Jane Smith</td>
                <td>456 Elm St, Los Angeles</td>
                <td>jane.smith@example.com</td>
                <td>+1 987-654-3210</td>
                <td><img src="../images/customer2.jpg" alt="Jane Smith" style="width: 50px; height: 50px; border-radius: 50%;"></td>
            </tr>
            <tr>
                <td>C003</td>
                <td>Alice Johnson</td>
                <td>789 Oak St, Chicago</td>
                <td>alice.johnson@example.com</td>
                <td>+1 555-123-4567</td>
                <td><img src="../images/customer3.jpg" alt="Alice Johnson" style="width: 50px; height: 50px; border-radius: 50%;"></td>
            </tr>
            </tbody>
        </table>
    </div>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Search functionality
    document.getElementById('searchCustomerButton').addEventListener('click', function() {
        const searchTerm = document.getElementById('searchCustomerInput').value.toLowerCase();
        const rows = document.getElementById('customerTableBody').getElementsByTagName('tr');

        for (let row of rows) {
            const text = row.textContent.toLowerCase();
            row.style.display = text.includes(searchTerm) ? '' : 'none';
        }
    });

    // Real-time search
    document.getElementById('searchCustomerInput').addEventListener('input', function() {
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