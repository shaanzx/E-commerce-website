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
    h2, label{
      color: white;
    }
  </style>
<body>
<%@ include file="admin-sidebar.jsp" %>
<div class="container mt-5">
  <h2>Product Management</h2>

  <c:if test="${param.success eq 'save'}">
    <div class="alert alert-success">Product saved successfully!</div>
  </c:if>
  <c:if test="${param.success eq 'update'}">
    <div class="alert alert-success">Product updated successfully!</div>
  </c:if>
  <c:if test="${param.success eq 'delete'}">
    <div class="alert alert-success">Product deleted successfully!</div>
  </c:if>

  <form id="productForm" action="/E_commerce_war_exploded/product" method="post" enctype="multipart/form-data">
    <input type="hidden" name="action" id="formAction" value="save">

    <div class="row">
      <div class="col-md-6">
        <label>Item Code</label>
        <input type="text" class="form-control" id="itemCode" name="itemCode" readonly>
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
        <select class="form-control" name="category" required>
          <option value="Running">1</option>
          <option value="Casual">2</option>
          <option value="Sports">3</option>
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
      <button type="submit" class="btn btn-primary me-2">Save</button>
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
    <tbody>
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
<script>
  document.addEventListener('DOMContentLoaded', function() {
    fetchNextProductId();
  });

  function fetchNextProductId() {
    fetch('product?action=generateId')
            .then(response => response.text())
            .then(id => {
              document.getElementById('itemCode').value = id;
            });
  }

  function editProduct(id, name, price, quantity, category) {
    document.querySelector('input[name="itemCode"]').value = id;
    document.querySelector('input[name="itemName"]').value = name;
    document.querySelector('input[name="unitPrice"]').value = price;
    document.querySelector('input[name="qtyOnHand"]').value = quantity;
    document.querySelector('select[name="category"]').value = category;

    document.getElementById('formAction').value = 'update';
  }

  function deleteProduct(id) {
    if (confirm('Are you sure you want to delete this product?')) {
      const form = document.getElementById('productForm');
      document.getElementById('formAction').value = 'delete';
      document.querySelector('input[name="itemCode"]').value = id;
      form.submit();
    }
  }

  function resetForm() {
    document.getElementById('productForm').reset();
    document.getElementById('formAction').value = 'save';
    fetchNextProductId();
  }
</script>
</body>
</html>