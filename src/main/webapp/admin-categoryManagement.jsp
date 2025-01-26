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
                    <form id="categoryManagementForm">
                        <input type="hidden" name="action" id="action" value="create">
                        <input type="hidden" name="categoryCode" id="categoryCode" value="">
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Category Name</label>
                                <input type="text" class="form-control" id="categoryName" name="categoryName" required>
                                <div class="error-label" style="display:none;">Category name is required (Min 3 characters)</div>
                            </div>
                            <div class="col-md-12 mb-3">
                                <label class="form-label">Description</label>
                                <textarea class="form-control" id="categoryDescription" name="categoryDescription" rows="3"></textarea>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-md-3 mb-2">
                                <button type="button" class="btn btn-primary w-100" id="btnSaveCategory">
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
                <th>Actions</th>
            </tr>
            </thead>
            <tbody id="categoryTableBody">
            <c:forEach var="category" items="${categories}">
                <tr>
                    <td>${category.id}</td>
                    <td>${category.name}</td>
                    <td>${category.description}</td>
                    <td>
                        <button class="btn btn-link text-primary" onclick="editCategory('${category.id}')">
                            <i class="fas fa-edit"></i>
                        </button>
                        <button class="btn btn-link text-danger" onclick="deleteCategory('${category.id}')">
                            <i class="fas fa-trash"></i>
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function() {
        loadCategories();

        $('#btnSaveCategory').click(function() {
            saveCategory();
        });

        $('#btnUpdateCategory').click(function() {
            updateCategory();
        });

        $('#btnDeleteCategory').click(function() {
            deleteCategory($('#categoryCode').val());
        });

        $('#searchCategoryButton').click(function() {
            searchCategory();
        });

        $('#searchCategoryInput').on('input', function() {
            searchCategory();
        });
    });

    function loadCategories() {
        $.ajax({
            url: 'category-servlet',
            type: 'GET',
            data: { action: 'load' },
            success: function(data) {
                $('#categoryTableBody').html(data);
            }
        });
    }

    function saveCategory() {
        const categoryData = {
            action: $('#action').val(),
            categoryCode: $('#categoryCode').val(),
            categoryName: $('#categoryName').val(),
            categoryDescription: $('#categoryDescription').val()
        };

        $.ajax({
            url: 'category-servlet',
            type: 'POST',
            data: categoryData,
            success: function(response) {
                alert(response);
                loadCategories();
                clearForm();
            }
        });
    }

    function updateCategory() {
        const categoryData = {
            action: 'update',
            categoryCode: $('#categoryCode').val(),
            categoryName: $('#categoryName').val(),
            categoryDescription: $('#categoryDescription').val()
        };

        $.ajax({
            url: 'category-servlet',
            type: 'POST',
            data: categoryData,
            success: function(response) {
                alert(response);
                loadCategories();
                clearForm();
            }
        });
    }

    function deleteCategory(categoryCode) {
        if (confirm('Are you sure you want to delete this category?')) {
            $.ajax({
                url: 'category-servlet',
                type: 'GET',
                data: { action: 'delete', categoryCode: categoryCode },
                success: function(response) {
                    alert(response);
                    loadCategories();
                }
            });
        }
    }

    function editCategory(categoryCode) {
        $.ajax({
            url: 'category-servlet',
            type: 'GET',
            data: { action: 'edit', categoryCode: categoryCode },
            success: function(category) {
                $('#action').val('update');
                $('#categoryCode').val(category.id);
                $('#categoryName').val(category.name);
                $('#categoryDescription').val(category.description);
            }
        });
    }

    function searchCategory() {
        const searchTerm = $('#searchCategoryInput').val().toLowerCase();
        const rows = $('#categoryTableBody tr');

        rows.each(function() {
            const text = $(this).text().toLowerCase();
            $(this).toggle(text.includes(searchTerm));
        });
    }

    function clearForm() {
        $('#categoryManagementForm')[0].reset();
        $('#action').val('create');
        $('#categoryCode').val('');
    }
</script>
</body>
</html>