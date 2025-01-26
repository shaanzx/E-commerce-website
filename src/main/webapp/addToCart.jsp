<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart - Stepz With Shanz</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #2c3e50;
            --secondary-color: #34495e;
            --accent-color: #3498db;
            --success-color: #2ecc71;
            --warning-color: #f1c40f;
            --danger-color: #e74c3c;
            --light-bg: #f8f9fa;
            --card-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            --hover-transition: all 0.3s ease;
        }

        body {
            background-color: var(--light-bg);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
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

        .cart-container {
            background: white;
            border-radius: 15px;
            box-shadow: var(--card-shadow);
            padding: 25px;
            margin: 30px 0;
        }

        .cart-item {
            padding: 20px;
            transition: var(--hover-transition);
            border-radius: 10px;
            background: white;
        }

        .cart-item:hover {
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
        }

        .cart-item-image {
            width: 100%;
            max-width: 300px;
            height: auto;
            border-radius: 10px;
            margin-bottom: 20px;
        }

        .quantity-control {
            display: flex;
            align-items: center;
            gap: 10px;
            margin: 20px 0;
        }

        .quantity-btn {
            background: var(--light-bg);
            border: none;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: var(--hover-transition);
            font-size: 1.2rem;
        }

        .quantity-btn:hover {
            background: linear-gradient(45deg, #8b31ff, #6b24c2);
            color: white;
        }

        .quantity-input {
            width: 60px;
            text-align: center;
            border: 1px solid #eee;
            border-radius: 5px;
            padding: 8px;
            font-size: 1.1rem;
        }

        .cart-summary {
            background: white;
            border-radius: 15px;
            box-shadow: var(--card-shadow);
            padding: 25px;
            position: sticky;
            top: 100px;
        }

        .summary-item {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
            font-size: 1.1rem;
        }

        .checkout-btn {
            background: linear-gradient(45deg, #8b31ff, #6b24c2);
            color: white;
            border: none;
            width: 100%;
            padding: 15px;
            border-radius: 10px;
            font-weight: bold;
            transition: var(--hover-transition);
            font-size: 1.2rem;
        }

        .checkout-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(107, 36, 194, 0.3);
            background: linear-gradient(45deg, #6b24c2, #8b31ff);
        }

        .size-badge {
            background: var(--light-bg);
            padding: 8px 20px;
            border-radius: 20px;
            font-size: 1rem;
            color: var(--primary-color);
            margin-right: 10px;
        }

        .color-circle {
            width: 25px;
            height: 25px;
            border-radius: 50%;
            display: inline-block;
            border: 2px solid white;
            box-shadow: 0 0 0 1px #ccc;
            vertical-align: middle;
        }

        .product-title {
            font-size: 1.8rem;
            margin-bottom: 15px;
            color: var(--primary-color);
        }

        .product-price {
            font-size: 1.6rem;
            font-weight: bold;
            color: #8b31ff;
            margin-bottom: 20px;
        }

        .product-description {
            color: #666;
            margin-bottom: 20px;
            line-height: 1.6;
        }

        .continue-shopping {
            display: inline-flex;
            align-items: center;
            color: #8b31ff;
            text-decoration: none;
            font-weight: 500;
            transition: var(--hover-transition);
        }

        .continue-shopping:hover {
            color: #6b24c2;
        }

        .continue-shopping i {
            margin-right: 8px;
        }

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
<!-- Header from your code -->
<header class="header sticky-top">
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarExample">
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
                        <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">Collection</a>
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

<!-- Cart Content -->
<div class="container my-5">
    <a href="index.html" class="continue-shopping mb-4 d-inline-block">
        <i class="fas fa-arrow-left"></i>
        Continue Shopping
    </a>

    <div class="row g-4">
        <!-- Cart Item Details -->
        <div class="col-lg-8">
            <div class="cart-item">
                <div class="row">
                    <div class="col-md-5">
                        <img src="https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800&auto=format&fit=crop&q=80"
                             alt="Nike Air Max 270"
                             class="cart-item-image">
                    </div>
                    <div class="col-md-7">
                        <h2 class="product-title">Nike Air Max 270</h2>
                        <div class="product-price">$299.99</div>
                        <p class="product-description">
                            Experience unrivaled comfort and style with the Nike Air Max 270.
                            Featuring innovative Air cushioning and a breathable mesh upper,
                            these shoes deliver both performance and fashion-forward design.
                        </p>
                        <div class="mb-3">
                            <span class="size-badge">Size: 42</span>
                            <span class="color-circle" style="background-color: #000000;" title="Black"></span>
                        </div>
                        <div class="quantity-control">
                            <button class="quantity-btn" id="decreaseQuantity">-</button>
                            <input type="number" class="quantity-input" value="1" min="1" id="quantity">
                            <button class="quantity-btn" id="increaseQuantity">+</button>
                        </div>
                        <div class="text-muted">SKU: NK-AM270-42-BLK</div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Order Summary -->
        <div class="col-lg-4">
            <div class="cart-summary">
                <h4 class="mb-4">Order Summary</h4>
                <div class="summary-item">
                    <span>Subtotal</span>
                    <span id="subtotal">$299.99</span>
                </div>
                <div class="summary-item">
                    <span>Shipping</span>
                    <span>$10.00</span>
                </div>
                <div class="summary-item">
                    <span>Tax</span>
                    <span id="tax">$30.00</span>
                </div>
                <hr>
                <div class="summary-item">
                    <span class="fw-bold">Total</span>
                    <span class="fw-bold" id="total">$339.99</span>
                </div>
                <button class="checkout-btn mt-4">
                    Proceed to Checkout
                </button>
                <div class="mt-4">
                    <div class="d-flex align-items-center mb-2">
                        <i class="fas fa-truck me-2"></i>
                        <small>Free shipping on orders over $100</small>
                    </div>
                    <div class="d-flex align-items-center mb-2">
                        <i class="fas fa-undo me-2"></i>
                        <small>30 days free returns</small>
                    </div>
                    <div class="d-flex align-items-center">
                        <i class="fas fa-lock me-2"></i>
                        <small>Secure checkout</small>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Footer from your code -->
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
                        <input type="email" class="form-control" placeholder="Enter your email">
                        <button class="btn btn-primary" type="button">Subscribe</button>
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
    document.addEventListener('DOMContentLoaded', function () {
        const quantityInput = document.getElementById('quantity');
        const subtotalElement = document.getElementById('subtotal');
        const taxElement = document.getElementById('tax');
        const totalElement = document.getElementById('total');
        const basePrice = 299.99;

        function updateTotals() {
            const quantity = parseInt(quantityInput.value);
            const subtotal = basePrice * quantity;
            const shipping = 10.00;
            const tax = subtotal * 0.1;
            const total = subtotal + shipping + tax;

            subtotalElement.textContent = `$${subtotal.toFixed(2)}`;
            taxElement.textContent = `$${tax.toFixed(2)}`;
            totalElement.textContent = `$${total.toFixed(2)}`;
        }

        document.getElementById('decreaseQuantity').addEventListener('click', function () {
            if (quantityInput.value > 1) {
                quantityInput.value = parseInt(quantityInput.value) - 1;
                updateTotals();
            }
        });

        document.getElementById('increaseQuantity').addEventListener('click', function () {
            quantityInput.value = parseInt(quantityInput.value) + 1;
            updateTotals();
        });

        quantityInput.addEventListener('change', updateTotals);

        document.querySelector('.checkout-btn').addEventListener('click', function () {
            alert('Proceeding to checkout...');
        });
    });
</script>
</body>
</html>
