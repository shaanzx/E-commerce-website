<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Item Management - Shoe Mart</title>
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
        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#itemForm">
          Add / Update Item
        </button>
      </h2>
      <div id="itemForm" class="accordion-collapse collapse show">
        <div class="accordion-body">
          <form id="itemManagementForm" enctype="multipart/form-data">
            <div class="row">
              <div class="col-md-6 mb-3">
                <label class="form-label">Item Code</label>
                <input type="text" class="form-control" id="itemCode" required>
                <div class="error-label">Item code is required (Format: S00-000)</div>
              </div>
              <div class="col-md-6 mb-3">
                <label class="form-label">Item Name</label>
                <input type="text" class="form-control" id="itemName" required>
                <div class="error-label">Item name is required (Min 3 characters)</div>
              </div>
              <div class="col-md-4 mb-3">
                <label class="form-label">Unit Price</label>
                <div class="input-group">
                  <span class="input-group-text">$</span>
                  <input type="number" class="form-control" id="unitPrice" step="0.01" required>
                </div>
                <div class="error-label">Unit price is required (Format: 00.00)</div>
              </div>
              <div class="col-md-4 mb-3">
                <label class="form-label">Qty On Hand</label>
                <input type="number" class="form-control" id="qtyOnHand" min="0" required>
                <div class="error-label">Quantity is required (Min: 0)</div>
              </div>
              <div class="col-md-4 mb-3">
                <label class="form-label">Category</label>
                <select class="form-control" id="category" required>
                  <option value="">Select Category</option>
                  <option value="running">Running</option>
                  <option value="casual">Casual</option>
                  <option value="sports">Sports</option>
                  <option value="formal">Formal</option>
                  <option value="sneakers">Sneakers</option>
                  <option value="boots">Boots</option>
                </select>
                <div class="error-label">Category is required</div>
              </div>
              <div class="col-md-12 mb-3">
                <label class="form-label">Description</label>
                <textarea class="form-control" id="description" rows="3"></textarea>
              </div>
              <div class="col-md-12 mb-3">
                <label class="form-label">Item Image</label>
                <input type="file" class="form-control" id="itemImage" accept="image/*" required>
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
                <button type="button" class="btn btn-primary w-100" id="btnUpdate">
                  <i class="fas fa-edit me-2"></i>Update
                </button>
              </div>
              <div class="col-md-3 mb-2">
                <button type="button" class="btn btn-primary w-100" id="btnDelete">
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
          <input type="search" class="form-control" placeholder="Search items..." id="searchInput">
        </div>
      </div>
      <div class="col-md-4">
        <button class="btn btn-primary w-100 mt-3 mt-md-0" id="searchButton">
          <i class="fas fa-search me-2"></i>Search
        </button>
      </div>
    </div>
  </div>

  <div class="table-responsive">
    <table class="table table-hover">
      <thead>
      <tr>
        <th>Item Code</th>
        <th>Name</th>
        <th>Category</th>
        <th>Unit Price</th>
        <th>Qty On Hand</th>
        <th>Image</th>
        <th>Actions</th>
      </tr>
      </thead>
      <tbody id="itemTableBody">
      <!-- Sample data -->
      <tr>
        <td>S00-001</td>
        <td>Nike Air Max</td>
        <td>Running</td>
        <td>$129.99</td>
        <td>50</td>
        <td><img src="../images/nike-air-max.jpg" alt="Nike Air Max" style="width: 50px; height: 50px;"></td>
        <td>
          <button class="btn btn-link text-primary" onclick="editItem('S00-001')">
            <i class="fas fa-edit"></i>
          </button>
          <button class="btn-delete" onclick="deleteItem('S00-001')">
            <i class="fas fa-trash"></i>
          </button>
        </td>
      </tr>
      <tr>
        <td>S00-002</td>
        <td>Adidas Ultraboost</td>
        <td>Running</td>
        <td>$179.99</td>
        <td>35</td>
        <td><img src="../images/adidas-ultraboost.jpg" alt="Adidas Ultraboost" style="width: 50px; height: 50px;"></td>
        <td>
          <button class="btn btn-link text-primary" onclick="editItem('S00-002')">
            <i class="fas fa-edit"></i>
          </button>
          <button class="btn-delete" onclick="deleteItem('S00-002')">
            <i class="fas fa-trash"></i>
          </button>
        </td>
      </tr>
      </tbody>
    </table>
  </div>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
  // Form validation
  document.getElementById('itemManagementForm').addEventListener('submit', function(e) {
    e.preventDefault();
    if (validateForm()) {
      saveItem();
    }
  });

  function validateForm() {
    let isValid = true;

    // Item code validation (S00-000 format)
    const itemCode = document.getElementById('itemCode');
    if (!/^S\d{2}-\d{3}$/.test(itemCode.value)) {
      showError(itemCode);
      isValid = false;
    }

    // Item name validation (min 3 chars)
    const itemName = document.getElementById('itemName');
    if (itemName.value.length < 3) {
      showError(itemName);
      isValid = false;
    }

    // Unit price validation
    const unitPrice = document.getElementById('unitPrice');
    if (unitPrice.value <= 0) {
      showError(unitPrice);
      isValid = false;
    }

    // Quantity validation
    const qtyOnHand = document.getElementById('qtyOnHand');
    if (qtyOnHand.value < 0) {
      showError(qtyOnHand);
      isValid = false;
    }

    // Category validation
    const category = document.getElementById('category');
    if (!category.value) {
      showError(category);
      isValid = false;
    }

    // Image validation
    const itemImage = document.getElementById('itemImage');
    if (!itemImage.files || itemImage.files.length === 0) {
      showError(itemImage);
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

  function saveItem() {
    const formData = new FormData();
    formData.append('itemCode', document.getElementById('itemCode').value);
    formData.append('itemName', document.getElementById('itemName').value);
    formData.append('unitPrice', document.getElementById('unitPrice').value);
    formData.append('qtyOnHand', document.getElementById('qtyOnHand').value);
    formData.append('category', document.getElementById('category').value);
    formData.append('description', document.getElementById('description').value);
    formData.append('itemImage', document.getElementById('itemImage').files[0]);

    // Here you would typically make an AJAX call to save the data
    console.log('Saving item:', formData);
    alert('Item saved successfully!');
    document.getElementById('itemManagementForm').reset();
  }

  function editItem(itemCode) {
    // Here you would typically fetch the item data and populate the form
    console.log('Editing item:', itemCode);
    document.getElementById('itemCode').value = itemCode;
    // Scroll to form
    document.getElementById('itemForm').scrollIntoView({ behavior: 'smooth' });
  }

  function deleteItem(itemCode) {
    if (confirm('Are you sure you want to delete this item?')) {
      // Here you would typically make an AJAX call to delete the item
      console.log('Deleting item:', itemCode);
      alert(`Item ${itemCode} deleted successfully!`);
    }
  }

  // Search functionality
  document.getElementById('searchButton').addEventListener('click', function() {
    const searchTerm = document.getElementById('searchInput').value.toLowerCase();
    const rows = document.getElementById('itemTableBody').getElementsByTagName('tr');

    for (let row of rows) {
      const text = row.textContent.toLowerCase();
      row.style.display = text.includes(searchTerm) ? '' : 'none';
    }
  });

  // Real-time search
  document.getElementById('searchInput').addEventListener('input', function() {
    const searchTerm = this.value.toLowerCase();
    const rows = document.getElementById('itemTableBody').getElementsByTagName('tr');

    for (let row of rows) {
      const text = row.textContent.toLowerCase();
      row.style.display = text.includes(searchTerm) ? '' : 'none';
    }
  });
</script>
</body>
</html>