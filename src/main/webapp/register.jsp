<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Stepz With Shanz</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>
<style>
    .form-cart {
        overflow-y: scroll; /* Enables vertical scrolling */
        height: 100vh; /* Ensures the form container takes the full viewport height */
    }
</style>
<body>
<div class="main-container">
    <div class="card">
        <div class="row g-0">
            <div class="col-md-6 d-none d-md-block image-section position-relative">
                <img src="assets/login-image.jpeg" alt="registration form">
                <div class="image-overlay position-absolute text-white d-flex flex-column justify-content-center align-items-center">
                    <h2 class="on-text fw-bold text-center px-3">Join us to find your perfect pair</h2>
                </div>
            </div>

            <div class="col-md-6 ">
                <div class="form-cart p-4">
                    <div class="logo-section d-flex align-items-center mb-4">
                        <i class="fas fa-cubes fa-2x me-3"></i>
                        <span class="h2 fw-bold mb-0">Stepz With Shanz</span>
                    </div>

                    <h4 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Create your account</h4>

                    <!-- Success message display -->
                    <% if (request.getAttribute("message") != null) { %>
                    <div class="alert alert-success" role="alert">
                        <%= request.getAttribute("message") %>
                    </div>
                    <% } %>

                    <!-- Error message display -->
                    <% if (request.getAttribute("error") != null) { %>
                    <div class="alert alert-danger" role="alert">
                        <%= request.getAttribute("error") %>
                    </div>
                    <% } %>

                    <form id="registerForm" action="${pageContext.request.contextPath}/save-customer" method="post" onsubmit="return validateForm('registerForm')">
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="registerName" name="fullName"
                                   placeholder="Full Name" required>
                            <label for="registerName">Full Name</label>
                        </div>

                        <div class="form-floating mb-3">
                            <input type="email" class="form-control" id="registerEmail" name="email"
                                   placeholder="name@example.com" required>
                            <label for="registerEmail">Email address</label>
                        </div>

                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="address" name="address"
                                   placeholder="Address" required>
                            <label for="address">Address</label>
                        </div>

                        <div class="form-floating mb-3">
                            <input type="tel" class="form-control" id="telephone" name="telephone"
                                   placeholder="Mobile No" required>
                            <label for="telephone">Mobile No</label>
                        </div>

                        <div class="form-floating mb-3 position-relative">
                            <input type="password" class="form-control" id="registerPassword" name="password"
                                   placeholder="Password" required>
                            <label for="registerPassword">Password</label>
                            <button type="button" class="btn position-absolute top-50 end-0 translate-middle-y password-toggle">
                                <i class="fas fa-eye-slash"></i>
                            </button>
                        </div>

                        <div class="form-floating mb-4 position-relative">
                            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword"
                                   placeholder="Confirm Password" required>
                            <label for="confirmPassword">Confirm Password</label>
                            <button type="button" class="btn position-absolute top-50 end-0 translate-middle-y password-toggle">
                                <i class="fas fa-eye-slash"></i>
                            </button>
                        </div>

                        <div class="mb-4">
                            <button type="submit" class="gradient-button btn btn-lg w-100">
                                Register
                            </button>
                        </div>

                        <div class="text-center mb-4">
                            <p class="mb-0">Already have an account?
                                <a href="login.jsp" class="link-purple">Login here</a>
                            </p>
                        </div>

                        <div class="text-center">
                            <small class="text-muted">
                                By registering, you agree to our
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
