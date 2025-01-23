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
            <div class="col-md-6 d-none d-md-block image-section position-relative">
                <img src="assets/login-image.jpeg" alt="login form">
                <div class="image-overlay position-absolute text-white d-flex flex-column justify-content-center align-items-center">
                    <h2 class="on-text fw-bold text-center px-3">Easy way to find the right shoes</h2>
                </div>
            </div>

            <div class="col-md-6">
                <div class="p-4">
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

                    <form id="loginForm" action="login" method="post" onsubmit="return validateForm('loginForm')">
                        <div class="form-floating mb-4">
                            <input type="email" class="form-control" id="loginEmail" name="email"
                                   placeholder="name@example.com" required>
                            <label for="loginEmail">Email address</label>
                        </div>

                        <div class="form-floating mb-4 position-relative">
                            <input type="password" class="form-control" id="loginPassword" name="password"
                                   placeholder="Password" required>
                            <label for="loginPassword">Password</label>
                            <button type="button" class="btn position-absolute top-50 end-0 translate-middle-y password-toggle">
                                <i class="fas fa-eye-slash"></i>
                            </button>
                        </div>

                        <div class="mb-4">
                            <a href="pages/homePage.jsp" class="gradient-button btn btn-lg w-100 text-white text-decoration-none">
                                Login
                            </a>
                        </div>

                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <a href="forgot-password.jsp" class="link-purple">Forgot password?</a>
                            <a href="pages/register.jsp" class="link-purple">Register here</a>
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
<script src="js/scripts.js"></script>
</body>
</html>