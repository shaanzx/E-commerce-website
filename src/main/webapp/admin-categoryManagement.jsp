<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Category Management - Shoe Mart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="css/admin.css" rel="stylesheet">
</head>
<body>

<%@ include file="admin-sidebar.jsp" %>

<main class="container">
    <div class="accordion mb-4">
        <div class="accordion-item">
            <h2 class="accordion-header">
                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#categoryForm">
                    Add / Update Category
                </button>
            </h2>
            <div id="categoryForm" class="accordion-collapse collapse show">
                <div class="accordion-body">
                    <form id="categoryManagementForm" action="${pageContext.request.contextPath}/category-servlet" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="action" value="${category == null ? 'create' : 'update'}">
                        <input type="hidden" name="categoryCode" value="${category.categoryCode}">
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Category Code</label>
                                <input type="text" class="form-control" id="categoryCode" name="categoryCode" value="${category.categoryCode}" required>
                                <div class="error-label">Category code is required (Format: C00-000)</div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Category Name</label>
                                <input type="text" class="form-control" id="categoryName" name="categoryName" value="${category.categoryName}" required>
                                <div class="error-label">Category name is required (Min 3 characters)</div>
                            </div>
                            <div class="col-md-12 mb-3">
                                <label class="form-label">Description</label>
                                <textarea class="form-control" id="categoryDescription" name="categoryDescription" rows="3">${category.description}</textarea>
                            </div>
                            <div class="col-md-12 mb-3">
                                <label class="form-label">Category Image</label>
                                <input type="file" class="form-control" id="categoryImage" name="categoryImage" accept="image/*" required>
                                <div class="error-label">Image is required (Only JPG, PNG, or GIF)</div>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-md-3 mb-2">
                                <button type="submit" class="btn btn-primary w-100">
                                    <i class="fas fa-save me-2"></i>Save
                                </button>
                            </div>
                            <div class="col-md-3 mb-2">
                                <button type="button" class="btn btn-primary w-100" id="btnUpdateCategory">
                                    <i class="fas fa-edit me-2"></i>Update
                                </button>
                            </div>
                            <div class="col-md-3 mb-2">
                                <button type="button" class="btn btn-primary w-100" id="btnDeleteCategory">
                                    <i class="fas fa-trash me-2"></i>Delete
                                </button>
                            </div>
                            <div class="col-md-3 mb-2">
                                <button type="reset" class="btn btn-secondary w-100">
                                    <i class="fas fa-undo me-2"></i>Clear
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="search-container mb-4">
        <div class="row align-items-center">
            <div class="col-md-8">
                <div class="input-group">
          <span class="input-group-text">
            <i class="fas fa-search"></i>
          </span>
                    <input type="search" class="form-control" placeholder="Search categories..." id="searchCategoryInput">
                </div>
            </div>
            <div class="col-md-4">
                <button class="btn btn-primary w-100 mt-3 mt-md-0" id="searchCategoryButton">
                    <i class="fas fa-search me-2"></i>Search
                </button>
            </div>
        </div>
    </div>

    <div class="table-responsive">
        <table class="table table-hover">
            <thead>
            <tr>
                <th>Category Code</th>
                <th>Name</th>
                <th>Description</th>
                <th>Image</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody id="categoryTableBody">
            <c:forEach var="category" items="${categories}">
                <tr>
                    <td>${category.categoryCode}</td>
                    <td>${category.categoryName}</td>
                    <td>${category.description}</td>
                    <td><img src="${category.imageUrl}" alt="${category.categoryName}" style="width: 50px; height: 50px;"></td>
                    <td>
                        <a href="category-servlet?action=edit&categoryCode=${category.categoryCode}" class="btn btn-link text-primary">
                            <i class="fas fa-edit"></i>
                        </a>
                        <a href="category-servlet?action=delete&categoryCode=${category.categoryCode}" class="btn btn-link text-danger">
                            <i class="fas fa-trash"></i>
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Form validation
    document.getElementById('categoryManagementForm').addEventListener('submit', function(e) {
        e.preventDefault();
        if (validateCategoryForm()) {
            this.submit();
        }
    });

    function validateCategoryForm() {
        let isValid = true;

        // Category code validation (C00-000 format)
        const categoryCode = document.getElementById('categoryCode');
        if (!/^C\d{2}-\d{3}$/.test(categoryCode.value)) {
            showError(categoryCode);
            isValid = false;
        }

        // Category name validation (min 3 chars)
        const categoryName = document.getElementById('categoryName');
        if (categoryName.value.length < 3) {
            showError(categoryName);
            isValid = false;
        }

        // Image validation
        const categoryImage = document.getElementById('categoryImage');
        if (!categoryImage.files || categoryImage.files.length === 0) {
            showError(categoryImage);
            isValid = false;
        }

        return isValid;
    }

    function showError(input) {
        input.classList.add('is-invalid');
        const errorLabel = input.nextElementSibling;
        if (errorLabel && errorLabel.classList.contains('error-label')) {
            errorLabel.style.display = 'block';
        }
    }

    function clearError(input) {
        input.classList.remove('is-invalid');
        const errorLabel = input.nextElementSibling;
        if (errorLabel && errorLabel.classList.contains('error-label')) {
            errorLabel.style.display = 'none';
        }
    }

    // Clear errors on input
    document.querySelectorAll('input, select').forEach(input => {
        input.addEventListener('input', () => clearError(input));
    });

    // Search functionality
    document.getElementById('searchCategoryButton').addEventListener('click', function() {
        const searchTerm = document.getElementById('searchCategoryInput').value.toLowerCase();
        const rows = document.getElementById('categoryTableBody').getElementsByTagName('tr');

        for (let row of rows) {
            const text = row.textContent.toLowerCase();
            row.style.display = text.includes(searchTerm) ? '' : 'none';
        }
    });

    // Real-time search
    document.getElementById('searchCategoryInput').addEventListener('input', function() {
        const searchTerm = this.value.toLowerCase();
        const rows = document.getElementById('categoryTableBody').getElementsByTagName('tr');

        for (let row of rows) {
            const text = row.textContent.toLowerCase();
            row.style.display = text.includes(searchTerm) ? '' : 'none';
        }
    });
</script>
</body>
</html>