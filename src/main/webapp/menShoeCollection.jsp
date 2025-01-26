<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Men's Shoe Collection - Stepz With Shanz</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
            rel="stylesheet"
    />
    <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
            rel="stylesheet"
    />
    <style>
        body {
            background-color: #f8f9fa;
        }

        .men-shoes-title {
            font-weight: bold;
            font-size: 2.5rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 2rem;
            color: #333;
            text-align: center;
        }

        .product-card {
            border: none;
            background: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 15px;
            transition: transform 0.3s, box-shadow 0.3s;
            overflow: hidden;
        }

        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
        }

        .product-img {
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
            height: 250px;
            object-fit: cover;
        }

        .card-title {
            font-weight: bold;
            font-size: 1.25rem;
            color: #333;
            margin-bottom: 10px;
        }

        .price {
            font-weight: bold;
            color: #ff5722;
            font-size: 1.2rem;
            margin-bottom: 15px;
        }

        .btn-custom {
            background: linear-gradient(45deg, #8b31ff, #6b24c2);
            color: #fff;
            font-weight: bold;
            padding: 12px 25px;
            border-radius: 25px;
            width: 100%;
            text-transform: uppercase;
            transition: background 0.3s, transform 0.3s;
        }

        .btn-custom:hover {
            background: linear-gradient(90deg, #6b24c2, #8b31ff);
            transform: scale(1.05);
            color: white;
        }

        .filter-section {
            background: #fff;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }

        .filter-section h5 {
            font-weight: bold;
            color: #333;
            margin-bottom: 15px;
        }

        .filter-section .form-check-label {
            color: #555;
        }

        .filter-section .form-check-input:checked {
            background-color: #8b31ff;
            border-color: #8b31ff;
        }

        .filter-section .btn-apply {
            background: linear-gradient(45deg, #8b31ff, #6b24c2);
            color: #fff;
            font-weight: bold;
            padding: 10px 20px;
            border-radius: 25px;
            width: 100%;
            text-transform: uppercase;
            transition: background 0.3s, transform 0.3s;
        }

        .filter-section .btn-apply:hover {
            background: linear-gradient(90deg, #6b24c2, #8b31ff);
            transform: scale(1.05);
        }

        /* Header Styles */
        .header {
            background-color: #f8f9fa;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 20px 30px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .header .logo {
            font-size: 2rem;
            font-weight: bold;
            color: #ff5722;
        }

        .navbar {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .user-info {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .user-info .cart,
        .user-info .wishlist,
        .user-info .profile,
        .user-info .notification {
            position: relative;
        }

        .user-info .cart i,
        .user-info .wishlist i,
        .user-info .profile i,
        .user-info .notification i {
            font-size: 24px;
            color: #333;
        }

        .user-info .cart-count,
        .user-info .wishlist-count,
        .user-info .notification-count {
            position: absolute;
            top: -5px;
            right: -5px;
            font-size: 12px;
            color: #fff;
            background-color: #ff5722;
            padding: 5px 8px;
        }

        .user-info .language select {
            border-radius: 20px;
            padding: 10px 30px;
        }

        /* Footer Styles */
        footer {
            background: linear-gradient(45deg, #8b31ff, #6b24c2);
            color: #fff;
            padding: 40px 0;
        }

        footer h5 {
            font-weight: bold;
            margin-bottom: 20px;
        }

        footer .footer-link {
            color: #fff;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        footer .footer-link:hover {
            color: rgba(255, 255, 255, 0.8);
        }

        footer .social-icon {
            font-size: 1.5rem;
            margin-right: 1rem;
            color: #fff;
            transition: color 0.3s ease;
        }

        footer .social-icon:hover {
            color: #ff5722;
        }

        footer .newsletter-form {
            display: flex;
            gap: 10px;
        }

        footer .newsletter-form input {
            flex: 1;
            border-radius: 25px;
            padding: 10px 20px;
            border: none;
        }

        footer .newsletter-form button {
            border-radius: 25px;
            padding: 10px 20px;
            background: #ff5722;
            color: #fff;
            border: none;
            transition: background 0.3s ease;
        }

        footer .newsletter-form button:hover {
            background: #e64a19;
        }
    </style>
</head>
<body>

<!-- Header -->
<header class="header sticky-top">
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <button
                    class="navbar-toggler"
                    type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#navbarExample"
                    aria-controls="navbarExample"
                    aria-expanded="false"
                    aria-label="Toggle navigation"
            >
                <span class="navbar-toggler-icon"></span>
            </button>
            <a class="navbar-brand" href="#">
                <i class="fas fa-cubes fa-2x me-3"></i>
                <span class="h2 fw-bold mb-0">Stepz With Shanz</span>
            </a>
            <div class="collapse navbar-collapse" id="navbarExample">
                <ul class="navbar-nav me-auto mb-0">
                    <li class="nav-item">
                        <a class="nav-link active" href="homePage.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">New Arrivals</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a
                                class="nav-link dropdown-toggle"
                                href="#"
                                data-bs-toggle="dropdown"
                        >Collection</a
                        >
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="menShoeCollection.jsp">Men</a></li>
                            <li><a class="dropdown-item" href="#">Women</a></li>
                            <li><a class="dropdown-item" href="#">Child</a></li>
                            <li><a class="dropdown-item" href="#">Sport</a></li>
                            <li><a class="dropdown-item" href="#">Casual</a></li>
                        </ul>
                    </li>
                </ul>
                <div class="d-flex align-items-center flex-column flex-lg-row">
                    <form class="me-2 mb-2 mb-lg-0">
                        <input
                                type="text"
                                class="form-control form-control-sm"
                                placeholder="Search"
                        />
                    </form>
                    <a href="#" class="me-2"> <i class="fas fa-search"></i> </a>
                </div>
            </div>
        </div>
    </nav>

    <div class="user-info d-flex align-items-center justify-content-end">
        <!-- Cart Section -->
        <div class="cart me-3 position-relative">
            <a
                    href="#"
                    class="text-decoration-none"
                    data-bs-toggle="modal"
                    data-bs-target="#addToCartModal"
            >
                <i class="fas fa-shopping-cart cart-icon"></i>
            </a>
            <span
                    class="cart-count position-absolute top-0 start-100 translate-middle badge rounded-pill"
            >0</span
            >
        </div>

        <!-- Wishlist Section -->
        <div class="wishlist me-3 position-relative">
            <a href="/wishlist" class="text-decoration-none">
                <i class="fas fa-heart fa-lg"></i>
            </a>
            <span
                    class="wishlist-count position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger"
            >0</span
            >
        </div>

        <!-- Notification Section -->
        <div class="notification me-3 position-relative">
            <a href="/notifications" class="text-decoration-none">
                <i class="fas fa-bell fa-lg"></i>
            </a>
            <span
                    class="notification-count position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger"
            >0</span
            >
        </div>

        <!-- Language Selector -->
        <div class="language">
            <select
                    class="form-select form-select-sm"
                    aria-label="Language selector"
            >
                <option value="en">English</option>
                <option value="es">Spanish</option>
                <option value="fr">French</option>
                <option value="de">German</option>
            </select>
        </div>
        <!-- Profile Section -->
        <div class="profile me-3">
            <a
                    href="#"
                    class="text-decoration-none"
                    data-bs-toggle="modal"
                    data-bs-target="#userProfileModal"
            >
                <img
                        id="headerProfileImage"
                        src="assets/shoes-hero.jpg"
                        alt="Profile"
                        class="rounded-circle header-profile-image"
                        style="width: 40px; height: 40px; object-fit: cover"
                />
            </a>
        </div>
        <!-- Logout Section -->
        <div class="logout">
            <a href="index.jsp" class="text-decoration-none">
                <i class="fas fa-sign-out-alt fa-lg text-danger"></i>
            </a>
        </div>
    </div>
</header>

<!-- Main Content -->
<div class="container my-5">
    <h2 class="men-shoes-title">Men's Shoe Collection</h2>

    <!-- Filter Section -->
    <div class="row">
        <div class="col-md-3">
            <div class="filter-section">
                <h5>Filters</h5>
                <div class="mb-3">
                    <label class="form-label">Price Range</label>
                    <input type="range" class="form-range" min="0" max="200" step="10" id="priceRange">
                    <p class="text-muted">Price: $<span id="priceValue">0 - 200</span></p>
                </div>
                <div class="mb-3">
                    <label class="form-label">Brand</label>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="brandNike">
                        <label class="form-check-label" for="brandNike">Nike</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="brandAdidas">
                        <label class="form-check-label" for="brandAdidas">Adidas</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="brandPuma">
                        <label class="form-check-label" for="brandPuma">Puma</label>
                    </div>
                </div>
                <div class="mb-3">
                    <label class="form-label">Size</label>
                    <select class="form-select" id="sizeFilter">
                        <option value="">All Sizes</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                        <option value="11">11</option>
                        <option value="12">12</option>
                    </select>
                </div>
                <button class="btn btn-apply">Apply Filters</button>
            </div>
        </div>

        <!-- Product Grid -->
        <div class="col-md-9">
            <div class="row g-4">
                <!-- Product 1 -->
                <div class="col-md-4">
                    <div class="card product-card">
                        <img
                                src="https://images.unsplash.com/photo-1560769629-975ec94e6a86?w=800&auto=format&fit=crop&q=80"
                                class="card-img-top product-img"
                                alt="Stylish Sneakers"
                        />
                        <div class="card-body">
                            <h5 class="card-title">Stylish Sneakers</h5>
                            <p class="price">$79.99</p>
                            <a href="product-details.html" class="btn btn-custom">Buy Now</a>
                        </div>
                    </div>
                </div>

                <!-- Product 2 -->
                <div class="col-md-4">
                    <div class="card product-card">
                        <img
                                src="https://images.unsplash.com/photo-1539185441755-769473a23570?w=800&auto=format&fit=crop&q=80"
                                class="card-img-top product-img"
                                alt="Running Shoes"
                        />
                        <div class="card-body">
                            <h5 class="card-title">Running Shoes</h5>
                            <p class="price">$89.99</p>
                            <a href="product-details.html" class="btn btn-custom">Buy Now</a>
                        </div>
                    </div>
                </div>

                <!-- Product 3 -->
                <div class="col-md-4">
                    <div class="card product-card">
                        <img
                                src="https://images.unsplash.com/photo-1607522370275-f14206abe5d3?w=800&auto=format&fit=crop&q=80"
                                class="card-img-top product-img"
                                alt="Leather Shoes"
                        />
                        <div class="card-body">
                            <h5 class="card-title">Leather Shoes</h5>
                            <p class="price">$99.99</p>
                            <a href="product-details.html" class="btn btn-custom">Buy Now</a>
                        </div>
                    </div>
                </div>

                <!-- Product 4 -->
                <div class="col-md-4">
                    <div class="card product-card">
                        <img
                                src="https://images.unsplash.com/photo-1551107696-a4b0c5a0d9a2?w=800&auto=format&fit=crop&q=80"
                                class="card-img-top product-img"
                                alt="Casual Sneakers"
                        />
                        <div class="card-body">
                            <h5 class="card-title">Casual Sneakers</h5>
                            <p class="price">$69.99</p>
                            <a href="product-details.html" class="btn btn-custom">Buy Now</a>
                        </div>
                    </div>
                </div>

                <!-- Product 5 -->
                <div class="col-md-4">
                    <div class="card product-card">
                        <img
                                src="https://images.unsplash.com/photo-1549298916-f52d724204b4?w=800&auto=format&fit=crop&q=80"
                                class="card-img-top product-img"
                                alt="Sport Shoes"
                        />
                        <div class="card-body">
                            <h5 class="card-title">Sport Shoes</h5>
                            <p class="price">$89.99</p>
                            <a href="product-details.html" class="btn btn-custom">Buy Now</a>
                        </div>
                    </div>
                </div>

                <!-- Product 6 -->
                <div class="col-md-4">
                    <div class="card product-card">
                        <img
                                src="https://images.unsplash.com/photo-1491553895911-0055eca6402d?w=800&auto=format&fit=crop&q=80"
                                class="card-img-top product-img"
                                alt="Formal Shoes"
                        />
                        <div class="card-body">
                            <h5 class="card-title">Formal Shoes</h5>
                            <p class="price">$109.99</p>
                            <a href="product-details.html" class="btn btn-custom">Buy Now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%--Footer--%>
<footer class="bg-primary-gradient text-white py-5">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 mb-4 mb-lg-0">
                <h5 class="mb-3">About Us</h5>
                <p>We are passionate about delivering high-quality products and exceptional customer service. Our
                    mission is to provide innovative solutions that enhance your everyday life.</p>
            </div>
            <div class="col-lg-2 col-md-6 mb-4 mb-lg-0">
                <h5 class="mb-3">Quick Links</h5>
                <ul class="list-unstyled">
                    <li><a href="#" class="footer-link">Home</a></li>
                    <li><a href="#" class="footer-link">Products</a></li>
                    <li><a href="#" class="footer-link">About</a></li>
                    <li><a href="#" class="footer-link">Contact</a></li>
                </ul>
            </div>
            <div class="col-lg-2 col-md-6 mb-4 mb-lg-0">
                <h5 class="mb-3">Support</h5>
                <ul class="list-unstyled">
                    <li><a href="#" class="footer-link">FAQ</a></li>
                    <li><a href="#" class="footer-link">Shipping</a></li>
                    <li><a href="#" class="footer-link">Returns</a></li>
                    <li><a href="#" class="footer-link">Privacy Policy</a></li>
                </ul>
            </div>
            <div class="col-lg-4">
                <h5 class="mb-3">Stay Connected</h5>
                <p>Subscribe to our newsletter for updates and exclusive offers.</p>
                <form class="mb-3">
                    <div class="input-group">
                        <input type="email" class="form-control" placeholder="Enter your email"
                               aria-label="Enter your email" aria-describedby="button-addon2">
                        <button class="btn btn-primary" type="button" id="button-addon2">Subscribe</button>
                    </div>
                </form>
                <div class="social-icons">
                    <a href="#" class="social-icon"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" class="social-icon"><i class="fab fa-twitter"></i></a>
                    <a href="#" class="social-icon"><i class="fab fa-instagram"></i></a>
                    <a href="#" class="social-icon"><i class="fab fa-linkedin-in"></i></a>
                </div>
            </div>
        </div>
        <hr class="mt-4 mb-3">
        <div class="row">
            <div class="col-md-6 text-center text-md-start">
                <p class="mb-0">&copy; 2023 Your Company Name. All rights reserved.</p>
            </div>
            <div class="col-md-6 text-center text-md-end">
                <a href="#" class="footer-link me-3">Terms of Service</a>
                <a href="#" class="footer-link">Privacy Policy</a>
            </div>
        </div>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Price Range Filter
    const priceRange = document.getElementById("priceRange");
    const priceValue = document.getElementById("priceValue");

    priceRange.addEventListener("input", () => {
        const maxPrice = priceRange.value;
        priceValue.textContent = `0 - ${maxPrice}`;
    });

    // Apply Filters Button
    const applyFiltersButton = document.querySelector(".btn-apply");
    applyFiltersButton.addEventListener("click", () => {
        const selectedBrands = Array.from(
            document.querySelectorAll(".form-check-input:checked")
        ).map((input) => input.nextElementSibling.textContent);

        const selectedSize = document.getElementById("sizeFilter").value;

        alert(
            `Filters applied:\nPrice: ${priceValue.textContent}\nBrands: ${
            selectedBrands.length > 0 ? selectedBrands.join(", ") : "Any"
        }\nSize: ${selectedSize || "Any"}`
        );
    });

    // Cart Count Update
    const cartCountElement = document.querySelector(".cart-count");
    let cartCount = 0;

    document.querySelectorAll(".btn-custom").forEach((button) =>
        button.addEventListener("click", (event) => {
            event.preventDefault();
            cartCount += 1;
            cartCountElement.textContent = cartCount;
            alert("Item added to cart!");
        })
    );
</script>
</body>
</html>
