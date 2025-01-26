
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Shoe Details - Stepz With Shanz</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
            rel="stylesheet"
    />
    <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
            rel="stylesheet"
    />
    <style>
        :root {
            --primary: #8b31ff;
            --primary-dark: #6b24c2;
        }

        body {
            background-color: #f8f9fa;
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
        }

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

        .product-gallery {
            position: sticky;
            top: 100px;
        }

        .thumbnail-container {
            display: flex;
            gap: 10px;
            margin-top: 20px;
        }

        .thumbnail {
            width: 80px;
            height: 80px;
            border-radius: 10px;
            cursor: pointer;
            border: 2px solid transparent;
            transition: all 0.3s;
        }

        .thumbnail:hover,
        .thumbnail.active {
            border-color: var(--primary);
        }

        .main-image {
            width: 100%;
            height: auto;
            border-radius: 15px;
            margin-bottom: 20px;
        }

        .product-info {
            padding: 30px;
            background: white;
            border-radius: 15px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .product-title {
            font-size: 2.5rem;
            font-weight: bold;
            margin-bottom: 15px;
            color: #2c3e50;
        }

        .product-price {
            font-size: 2rem;
            color: var(--primary);
            font-weight: bold;
            margin-bottom: 20px;
        }

        .size-selector {
            margin: 20px 0;
        }

        .size-btn {
            padding: 10px 20px;
            margin: 5px;
            border: 2px solid #ddd;
            border-radius: 8px;
            background: none;
            cursor: pointer;
            transition: all 0.3s;
        }

        .size-btn:hover,
        .size-btn.active {
            background: var(--primary);
            color: white;
            border-color: var(--primary);
        }

        .color-selector {
            margin: 20px 0;
        }

        .color-circle {
            width: 35px;
            height: 35px;
            border-radius: 50%;
            margin: 5px;
            cursor: pointer;
            border: 2px solid white;
            box-shadow: 0 0 0 2px #ddd;
            display: inline-block;
            transition: all 0.3s;
        }

        .color-circle.active {
            box-shadow: 0 0 0 2px var(--primary);
        }

        .quantity-control {
            display: flex;
            align-items: center;
            gap: 15px;
            margin: 20px 0;
        }

        .quantity-btn {
            background: #f8f9fa;
            border: none;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: all 0.3s;
            font-size: 1.2rem;
        }

        .quantity-btn:hover {
            background: var(--primary);
            color: white;
        }

        .quantity-input {
            width: 60px;
            text-align: center;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 8px;
            font-size: 1.1rem;
        }

        .add-to-cart-btn {
            background: linear-gradient(45deg, var(--primary), var(--primary-dark));
            color: white;
            border: none;
            padding: 15px 30px;
            border-radius: 10px;
            font-size: 1.2rem;
            margin-top: 20px;
            width: 100%;
            transition: all 0.3s;
        }

        .add-to-cart-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(139, 49, 255, 0.3);
        }

        .product-features {
            margin-top: 30px;
        }

        .feature-item {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
            color: #666;
        }

        .feature-item i {
            color: var(--primary);
            margin-right: 10px;
        }

        .product-description {
            line-height: 1.8;
            color: #666;
        }

        /* Reusing your existing header and footer styles */
        .bg-primary-gradient {
            background: linear-gradient(45deg, var(--primary), var(--primary-dark));
        }

        /* Footer */
        :root {
            --primary: #8b31ff;
            --primary-dark: #6b24c2;
        }
        .bg-primary-gradient {
            background: linear-gradient(45deg, var(--primary), var(--primary-dark));
        }
        .btn-primary {
            background-color: var(--primary);
            border-color: var(--primary);
        }
        .btn-primary:hover {
            background-color: var(--primary-dark);
            border-color: var(--primary-dark);
        }
        .text-primary {
            color: var(--primary) !important;
        }
        .footer-link {
            color: #ffffff;
            text-decoration: none;
            transition: color 0.3s ease;
        }
        .footer-link:hover {
            color: rgba(255, 255, 255, 0.8);
        }
        .social-icon {
            font-size: 1.5rem;
            margin-right: 1rem;
            color: #ffffff;
            transition: color 0.3s ease;
        }
        .social-icon:hover {
            color: var(--primary);
        }
    </style>
</head>
<body>
<!-- Header (Same as your cart page) -->
<header class="header sticky-top">
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <button
                    class="navbar-toggler"
                    type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#navbarExample"
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
                        <a class="nav-link active" href="#">Home</a>
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
                            <li><a class="dropdown-item" href="#">Men</a></li>
                            <li><a class="dropdown-item" href="#">Women</a></li>
                            <li><a class="dropdown-item" href="#">Child</a></li>
                            <li><a class="dropdown-item" href="#">Sport</a></li>
                            <li><a class="dropdown-item" href="#">Casual</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>

<!-- Main Content -->
<div class="container my-5">
    <div class="row g-4">
        <!-- Product Gallery -->
        <div class="col-lg-6">
            <div class="product-gallery">
                <img
                        src="https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800&auto=format&fit=crop&q=80"
                        class="card-img-top"
                        alt="Red Nike Sneakers"
                />
                <div class="thumbnail-container">
                    <img
                            src="https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800&auto=format&fit=crop&q=80"
                            alt="Thumbnail 1"
                            class="thumbnail active"
                    />
                    <img
                            src="https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800&auto=format&fit=crop&q=80"
                            alt="Thumbnail 2"
                            class="thumbnail"
                    />
                    <img
                            src="https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800&auto=format&fit=crop&q=80"
                            alt="Thumbnail 3"
                            class="thumbnail"
                    />
                    <img
                            src="https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800&auto=format&fit=crop&q=80"
                            alt="Thumbnail 4"
                            class="thumbnail"
                    />
                </div>
            </div>
        </div>

        <!-- Product Details -->
        <div class="col-lg-6">
            <div class="product-info">
                <h1 class="product-title">Nike Air Max 270</h1>
                <div class="product-price">$299.99</div>
                <p class="product-description">
                    Experience unrivaled comfort and style with the Nike Air Max 270.
                    Featuring innovative Air cushioning and a breathable mesh upper,
                    these shoes deliver both performance and fashion-forward design.
                </p>

                <div class="size-selector">
                    <h5>Select Size</h5>
                    <div class="size-options">
                        <button class="size-btn">38</button>
                        <button class="size-btn">39</button>
                        <button class="size-btn active">40</button>
                        <button class="size-btn">41</button>
                        <button class="size-btn">42</button>
                        <button class="size-btn">43</button>
                    </div>
                </div>

                <div class="color-selector">
                    <h5>Select Color</h5>
                    <div class="color-options">
                <span
                        class="color-circle active"
                        style="background-color: #000000"
                ></span>
                        <span
                                class="color-circle"
                                style="background-color: #ff0000"
                        ></span>
                        <span
                                class="color-circle"
                                style="background-color: #0000ff"
                        ></span>
                        <span
                                class="color-circle"
                                style="background-color: #ffffff"
                        ></span>
                    </div>
                </div>

                <div class="quantity-control">
                    <button class="quantity-btn" id="decreaseQuantity">-</button>
                    <input
                            type="number"
                            class="quantity-input"
                            value="1"
                            min="1"
                            id="quantity"
                    />
                    <button class="quantity-btn" id="increaseQuantity">+</button>
                </div>

                <button class="add-to-cart-btn">
                    <i class="fas fa-shopping-cart me-2"></i>
                    <a class="text-decoration-none text-white" href="addToCart.jsp">Add to Cart</a>
                </button>

                <div class="product-features">
                    <div class="feature-item">
                        <i class="fas fa-check-circle"></i>
                        <span>Free shipping on orders over $100</span>
                    </div>
                    <div class="feature-item">
                        <i class="fas fa-undo"></i>
                        <span>30 days free returns</span>
                    </div>
                    <div class="feature-item">
                        <i class="fas fa-shield-alt"></i>
                        <span>2 years warranty</span>
                    </div>
                    <div class="feature-item">
                        <i class="fas fa-truck"></i>
                        <span>Fast delivery</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Footer (Same as your cart page) -->
<footer class="bg-primary-gradient text-white py-5">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 mb-4 mb-lg-0">
                <h5 class="mb-3">About Us</h5>
                <p>
                    We are passionate about delivering high-quality products and
                    exceptional customer service. Our mission is to provide innovative
                    solutions that enhance your everyday life.
                </p>
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
                        <input
                                type="email"
                                class="form-control"
                                placeholder="Enter your email"
                        />
                        <button class="btn btn-primary" type="button">Subscribe</button>
                    </div>
                </form>
                <div class="social-icons">
                    <a href="#" class="social-icon"
                    ><i class="fab fa-facebook-f"></i
                    ></a>
                    <a href="#" class="social-icon"><i class="fab fa-twitter"></i></a>
                    <a href="#" class="social-icon"
                    ><i class="fab fa-instagram"></i
                    ></a>
                    <a href="#" class="social-icon"
                    ><i class="fab fa-linkedin-in"></i
                    ></a>
                </div>
            </div>
        </div>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Quantity Control
        const quantityInput = document.getElementById('quantity');

        document.getElementById('decreaseQuantity').addEventListener('click', function() {
            if (quantityInput.value > 1) {
                quantityInput.value = parseInt(quantityInput.value) - 1;
            }
        });

        document.getElementById('increaseQuantity').addEventListener('click', function() {
            quantityInput.value = parseInt(quantityInput.value) + 1;
        });

        // Size Selection
        const sizeBtns = document.querySelectorAll('.size-btn');
        sizeBtns.forEach(btn => {
            btn.addEventListener('click',
                btn.addEventListener('click', function() {
                    sizeBtns.forEach(b => b.classList.remove('active'));
                    btn.classList.add('active');
                }));
        });

        // Color Selection
        const colorCircles = document.querySelectorAll('.color-circle');
        colorCircles.forEach(circle => {
            circle.addEventListener('click', function() {
                colorCircles.forEach(c => c.classList.remove('active'));
                circle.classList.add('active');
            });
        });

        // Thumbnail Image Selection
        const thumbnails = document.querySelectorAll('.thumbnail');
        const mainImage = document.querySelector('.main-image');
        thumbnails.forEach(thumbnail => {
            thumbnail.addEventListener('click', function() {
                thumbnails.forEach(t => t.classList.remove('active'));
                thumbnail.classList.add('active');
                mainImage.src = thumbnail.src;
            });
        });
    });
</script>
</body>
</html>

