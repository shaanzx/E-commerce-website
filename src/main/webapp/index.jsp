<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Shoe Mart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>
<body>
<div class="main-container">
    <div class="card">
        <div class="row g-0">
            <!-- Image Section -->
            <div class="col-md-6 d-none d-md-block image-section position-relative">
                <img src="assets/login-image.jpeg" alt="login form">
                <div class="image-overlay position-absolute text-white d-flex flex-column justify-content-center align-items-center">
                    <h2 class="on-text fw-bold text-center px-3">Easy way to find the right shoes</h2>
                </div>
            </div>

            <!-- Form Section -->
            <div class="col-md-6">
                <div class="p-4">
                    <!-- Logo Section -->
                    <div class="logo-section d-flex align-items-center mb-4">
                        <i class="fas fa-cubes fa-2x me-3"></i>
                        <span class="h2 fw-bold mb-0">SHOE MART</span>
                    </div>

                    <h4 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Sign in to your account</h4>

                    <!-- Error message display -->
                    <% if (request.getAttribute("error") != null) { %>
                    <div class="alert alert-danger" role="alert">
                        <%= request.getAttribute("error") %>
                    </div>
                    <% } %>

                    <!-- Login Form -->
                    <form id="loginForm" action="${pageContext.request.contextPath}/loginCustomerAdminServlet" method="post">
                    <div class="form-floating mb-4">
                            <input type="email" class="form-control" id="loginEmail" name="email" placeholder="name@example.com" required>
                            <label for="loginEmail">Email address</label>
                        </div>

                        <div class="form-floating mb-4 position-relative">
                            <input type="password" class="form-control" id="loginPassword" name="password" placeholder="Password" required>
                            <label for="loginPassword">Password</label>
                            <button type="button" class="btn position-absolute top-50 end-0 translate-middle-y password-toggle" onclick="togglePasswordVisibility('loginPassword', this)">
                                <i class="fas fa-eye-slash"></i>
                            </button>
                        </div>

                        <div class="mb-4">
                            <button type="submit" class="gradient-button btn btn-lg w-100 text-white">Login</button>
                        </div>

                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <a href="forgot-password.jsp" class="link-purple">Forgot password?</a>
                            <a href="register.jsp" class="link-purple">Register here</a>
                        </div>

                        <div class="text-center">
                            <small class="text-muted">
                                By logging in, you agree to our
                                <a href="#" class="link-purple">Terms of Service</a> and
                                <a href="#" class="link-purple">Privacy Policy</a>
                            </small>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Function to toggle password visibility
    function togglePasswordVisibility(inputId, button) {
        const passwordInput = document.getElementById(inputId);
        const icon = button.querySelector('i');

        if (passwordInput.type === 'password') {
            passwordInput.type = 'text';
            icon.classList.replace('fa-eye-slash', 'fa-eye');
        } else {
            passwordInput.type = 'password';
            icon.classList.replace('fa-eye', 'fa-eye-slash');
        }
    }

    // Validate the login form before submission (if needed)
    function validateForm(formId) {
        var form = document.getElementById(formId);
        // Add validation logic as per your requirements
        return true; // Return true to proceed with form submission
    }

    document.querySelectorAll('.password-toggle').forEach(button => {
        const inputId = button.previousElementSibling.id;
        button.addEventListener('click', function () {
            togglePasswordVisibility(inputId, this);
        });
    });
</script>
</body>
</html>
