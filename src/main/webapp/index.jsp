<%--
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login/Register Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html, body {
            height: 100%;
            overflow: hidden;
        }

        body {
            background: linear-gradient(180deg, #000000 0%, #3c2f3a 50%, #000000 100%);
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .main-container {
            width: 100%;
            max-width: 1200px;
            margin: 0 20px;
        }

        .card {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 1rem;
            overflow: hidden;
            height: auto;
            max-height: 90vh;
        }

        .image-section {
            height: 100%;
            min-height: 500px;
            max-height: 90vh;
        }

        .image-section img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 1rem 0 0 1rem;
        }

        .form-container {
            perspective: 1000px;
            width: 100%;
            height: 100%;
            min-height: 500px;
        }

        .form-wrapper {
            position: relative;
            width: 100%;
            height: 100%;
            transition: transform 0.8s;
            transform-style: preserve-3d;
        }

        .form-wrapper.flipped {
            transform: rotateY(180deg);
        }

        .form-front,
        .form-back {
            position: absolute;
            width: 100%;
            height: 100%;
            -webkit-backface-visibility: hidden;
            backface-visibility: hidden;
            padding: 2rem;
        }

        .form-back {
            transform: rotateY(180deg);
            overflow-x: scroll;
        }

        .gradient-button {
            background: linear-gradient(45deg, #8B31FF, #6B24C2);
            border: none;
            color: white;
            transition: all 0.3s ease;
        }

        .gradient-button:hover {
            background: linear-gradient(45deg, #6B24C2, #8B31FF);
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(107, 36, 194, 0.3);
        }

        .form-control:focus {
            border-color: #8B31FF;
            box-shadow: 0 0 0 0.2rem rgba(139, 49, 255, 0.25);
        }

        .link-purple {
            color: #8B31FF;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .link-purple:hover {
            color: #6B24C2;
            text-decoration: underline;
        }

        .logo-section {
            color: #8B31FF;
        }

        .form-floating > label {
            color: #666;
        }

        @media (max-width: 768px) {
            .image-section {
                min-height: 200px;
            }

            .card {
                margin: 1rem;
                max-height: none;
            }

            .main-container {
                margin: 10px;
            }
        }

        .password-toggle {
            background: none;
            border: none;
            color: #6c757d;
            padding: 0.375rem 0.75rem;
            font-size: 1rem;
            transition: color 0.15s ease-in-out;
        }

        .password-toggle:hover {
            color: #8B31FF;
        }

        .form-floating > .password-toggle {
            padding-top: 1.625rem;
            padding-bottom: 0.625rem;
        }

        .image-section {
            position: relative;
            height: 100%;
            min-height: 500px;
            max-height: 90vh;
        }

        .image-section img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 1rem 0 0 1rem;
        }

        .image-overlay {
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.5);
            border-radius: 1rem 0 0 1rem;
            padding: 20px;
        }

        .on-text{
            margin-top: 20%;
        }

    </style>
</head>
<body>
<div class="main-container">
    <div class="card">
        <div class="row g-0">
            <!-- Image Section: 60% Width -->
            <div class="col-md-6 d-none d-md-block image-section position-relative">
                <img src="assets/login-image.jpeg" alt="login form">
                <div class="image-overlay position-absolute text-white d-flex flex-column justify-content-center align-items-center">
                    <h2 class="on-text fw-bold text-center px-3">Easy way to find the right shoes</h2>
                </div>
            </div>

            <!-- Form Section: 40% Width -->
            <div class="col-md-6">
                <div class="form-container">
                    <div class="form-wrapper" id="formWrapper">


                        <!-- Login Form -->
                        <div class="form-front">
                            <div class="logo-section d-flex align-items-center mb-4">
                                <i class="fas fa-cubes fa-2x me-3"></i>
                                <span class="h2 fw-bold mb-0">SHOE MART</span>
                            </div>
                            <h4 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Sign in to your account</h4>
                            <form>
                                <div class="form-floating mb-4">
                                    <input type="email" class="form-control" id="loginEmail" placeholder="name@example.com" required>
                                    <label for="loginEmail">Email address</label>
                                </div>
                                <div class="form-floating mb-4 position-relative">
                                    <input type="password" class="form-control" id="loginPassword" placeholder="Password" required>
                                    <label for="loginPassword">Password</label>
                                    <button type="button" class="btn position-absolute top-50 end-0 translate-middle-y password-toggle" onclick="togglePasswordVisibility('loginPassword', this)">
                                        <i class="fas fa-eye-slash"></i>
                                    </button>
                                </div>
                                <div class="mb-4">
                                    <a href="pages/homePage.jsp" class="gradient-button btn btn-lg w-100 text-white text-center">Login</a>
                                </div>

                                <div class="d-flex justify-content-between align-items-center mb-4">
                                    <a href="#!" class="link-purple">Forgot password?</a>
                                    <a href="#!" class="link-purple" onclick="flipCard(event)">Register here</a>
                                </div>
                                <div class="text-center">
                                    <small class="text-muted">
                                        By logging in, you agree to our
                                        <a href="#!" class="link-purple">Terms of Service</a> and
                                        <a href="#!" class="link-purple">Privacy Policy</a>
                                    </small>
                                </div>
                            </form>
                        </div>


                        <!-- Register Form -->
                        <div class="form-back">
                            <div class="logo-section d-flex align-items-center mb-4">
                                <i class="fas fa-cubes fa-2x me-3"></i>
                                <span class="h2 fw-bold mb-0">SHOE MART</span>
                            </div>
                            <h4 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Create your account</h4>
                            <form>
                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control" id="registerName" placeholder="Full Name" required>
                                    <label for="registerName">Full Name</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input type="email" class="form-control" id="registerEmail" placeholder="name@example.com" required>
                                    <label for="loginEmail">Email address</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control" id="address" placeholder="Address" required>
                                    <label for="address">Address</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control" id="telephone" placeholder="Telephone" required>
                                    <label for="telephone">Mobile No</label>
                                </div>
                                <div class="form-floating mb-3 position-relative">
                                    <input type="password" class="form-control" id="registerPassword" placeholder="Password" required>
                                    <label for="registerPassword">Password</label>
                                    <button type="button" class="btn position-absolute top-50 end-0 translate-middle-y password-toggle" onclick="togglePasswordVisibility('registerPassword', this)">
                                        <i class="fas fa-eye-slash"></i>
                                    </button>
                                </div>
                                <div class="form-floating mb-4 position-relative">
                                    <input type="password" class="form-control" id="confirmPassword" placeholder="Confirm Password" required>
                                    <label for="confirmPassword">Confirm Password</label>
                                    <button type="button" class="btn position-absolute top-50 end-0 translate-middle-y password-toggle" onclick="togglePasswordVisibility('confirmPassword', this)">
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
                                        <a href="#!" class="link-purple" onclick="flipCard(event)">Login here</a>
                                    </p>
                                </div>
                                <div class="text-center">
                                    <small class="text-muted">
                                        By registering, you agree to our
                                        <a href="#!" class="link-purple">Terms of Service</a> and
                                        <a href="#!" class="link-purple">Privacy Policy</a>
                                    </small>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
    function flipCard(event) {
        event.preventDefault();
        document.getElementById('formWrapper').classList.toggle('flipped');
    }

    function togglePasswordVisibility(inputId, button) {
        const passwordInput = document.getElementById(inputId);
        const icon = button.querySelector('i');

        if (passwordInput.type === 'password') {
            passwordInput.type = 'text';
            icon.classList.replace('fa-eye-slash','fa-eye');
        } else {
            passwordInput.type = 'password';
            icon.classList.replace('fa-eye' , 'fa-eye-slash' );
        }
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

--%>

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
                            <button type="button"
                                    class="btn position-absolute top-50 end-0 translate-middle-y password-toggle">
                                <i class="fas fa-eye-slash"></i>
                            </button>
                        </div>

                        <div class="mb-4">
                            <button type="submit" class="gradient-button btn btn-lg w-100 text-white">
                                Login
                            </button>
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
