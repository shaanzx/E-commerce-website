<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Product Management</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
  <link href="css/admin.css" rel="stylesheet">
</head>
<style>
  h2,label{
    color: white;
  }
</style>
<body>
<%@ include file="admin-sidebar.jsp" %>
<div class="container mt-5">
  <h2>Product Management</h2>

  <div id="message" class="alert" style="display: none;"></div>

  <form id="productForm" enctype="multipart/form-data">
    <input type="hidden" name="action" id="formAction" value="save">
    <input type="hidden" name="itemCode" id="itemCode">

    <div class="row">
      <div class="col-md-6">
        <label>Item Code</label>
        <input type="text" class="form-control" id="itemCodeDisplay" readonly>
      </div>
      <div class="col-md-6">
        <label>Product Name</label>
        <input type="text" class="form-control" name="itemName" required>
      </div>
    </div>

    <div class="row mt-3">
      <div class="col-md-4">
        <label>Unit Price</label>
        <input type="number" class="form-control" name="unitPrice" step="0.01" required>
      </div>
      <div class="col-md-4">
        <label>Quantity</label>
        <input type="number" class="form-control" name="qtyOnHand" required>
      </div>
      <div class="col-md-4">
        <label>Category</label>
        <select class="form-control" name="category" id="category" required>
          <option value="">Select Category</option>
          <!-- Categories will be loaded dynamically via AJAX -->
        </select>
      </div>
    </div>

    <div class="row mt-3">
      <div class="col-md-12">
        <label>Product Image</label>
        <input type="file" class="form-control" name="itemImage" accept="image/*">
      </div>
    </div>

    <div class="mt-3">
      <button type="button" class="btn btn-primary me-2" id="btnSave">Save</button>
      <button type="button" class="btn btn-secondary" onclick="resetForm()">Clear</button>
    </div>
  </form>

  <table class="table mt-4">
    <thead>
    <tr>
      <th>Item Code</th>
      <th>Name</th>
      <th>Price</th>
      <th>Quantity</th>
      <th>Category</th>
      <th>Image</th>
      <th>Actions</th>
    </tr>
    </thead>
    <tbody id="productTableBody">
    <c:forEach var="product" items="${products}">
      <tr>
        <td>${product.id}</td>
        <td>${product.name}</td>
        <td>$${product.unitPrice}</td>
        <td>${product.quantity}</td>
        <td>${product.category}</td>
        <td><img src="${product.image}" style="width:50px;height:50px;"></td>
        <td>
          <button onclick="editProduct('${product.id}', '${product.name}', ${product.unitPrice}, ${product.quantity}, '${product.category}')" class="btn btn-sm btn-warning">Edit</button>
          <button onclick="deleteProduct('${product.id}')" class="btn btn-sm btn-danger">Delete</button>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
  $(document).ready(function() {
    fetchNextProductId();
    loadCategories(); // Load categories into the combo box
    loadProducts(); // Load products into the table

    $('#btnSave').click(function() {
      saveOrUpdateProduct();
    });
  });

  function fetchNextProductId() {
    $.ajax({
      url: 'product',
      type: 'GET',
      data: { action: 'generateId' },
      success: function(id) {
        $('#itemCode').val(id);
        $('#itemCodeDisplay').val(id);
      },
      error: function(xhr) {
        console.error("Error fetching next product ID:", xhr.responseText);
      }
    });
  }

  function loadCategories() {
    $.ajax({
      url: 'product',
      type: 'GET',
      data: { action: 'loadCategories' },
      success: function(data) {
        $('#category').html(data); // Populate the combo box with categories
      },
      error: function(xhr) {
        console.error("Error loading categories:", xhr.responseText);
      }
    });
  }

  function loadProducts() {
    $.ajax({
      url: 'product',
      type: 'GET',
      success: function(data) {
        $('#productTableBody').html(data);
      },
      error: function(xhr) {
        console.error("Error loading products:", xhr.responseText);
      }
    });
  }

  function saveOrUpdateProduct() {
    const formData = new FormData($('#productForm')[0]);

    $.ajax({
      url: 'product',
      type: 'POST',
      data: formData,
      processData: false,
      contentType: false,
      success: function(response) {
        $('#message').text(response).removeClass('alert-danger').addClass('alert-success').show();
        loadProducts();
        resetForm();
      },
      error: function(xhr) {
        $('#message').text(xhr.responseText).removeClass('alert-success').addClass('alert-danger').show();
      }
    });
  }

  function editProduct(id, name, price, quantity, category) {
    $('#itemCode').val(id);
    $('#itemCodeDisplay').val(id);
    $('input[name="itemName"]').val(name);
    $('input[name="unitPrice"]').val(price);
    $('input[name="qtyOnHand"]').val(quantity);
    $('#category').val(category);
    $('#formAction').val('update');
  }

  function deleteProduct(id) {
    if (confirm('Are you sure you want to delete this product?')) {
      $.ajax({
        url: 'product',
        type: 'POST',
        data: { action: 'delete', itemCode: id },
        success: function(response) {
          $('#message').text(response).removeClass('alert-danger').addClass('alert-success').show();
          loadProducts();
        },
        error: function(xhr) {
          $('#message').text(xhr.responseText).removeClass('alert-success').addClass('alert-danger').show();
        }
      });
    }
  }

  function resetForm() {
    $('#productForm')[0].reset();
    $('#formAction').val('save');
    fetchNextProductId();
  }
</script>
</body>
</html>