<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Modern Product Home Page</title>
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

        i {
            color: black;
        }

        .gradient-text {
            background: linear-gradient(45deg, #8b31ff, #6b24c2);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
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

        /* User Profile */
        .profile-image-container {
            position: relative;
            display: inline-block;
        }

        .profile-image {
            width: 100px;
            height: 100px;
            object-fit: cover;
            background: #f8f9fa;
            border-radius: 50%;
        }

        .header-profile-image {
            width: 40px;
            height: 40px;
            object-fit: cover;
            border: 2px solid #8b31ff;
            border-radius: 50%;
        }

        .edit-image-button {
            position: absolute;
            bottom: 0;
            right: 0;
            background: linear-gradient(45deg, #8b31ff, #6b24c2);
            color: white;
            width: 10px;
            height: 10px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .edit-image-button:hover {
            transform: scale(1.1);
        }

        .edit-button,
        .password-toggle {
            color: #6b24c2;
            border-color: #6b24c2;
        }

        .edit-button:hover,
        .password-toggle:hover {
            background: linear-gradient(45deg, #8b31ff, #6b24c2);
            color: white;
            border-color: transparent;
        }

        #userProfileModal .modal-content {
            border-radius: 15px;
            border: none;
        }

        #userProfileModal .form-control:disabled {
            background-color: #f8f9fa;
            cursor: not-allowed;
        }

        #userProfileModal .form-control:not(:disabled) {
            border-color: #8b31ff;
        }

        .gradient-button {
            background: linear-gradient(45deg, #8b31ff, #6b24c2);
            border: none;
            color: white;
            transition: all 0.3s ease;
        }

        .gradient-button:hover {
            background: linear-gradient(45deg, #6b24c2, #8b31ff);
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(107, 36, 194, 0.3);
        }

        .remove-button {
            background: linear-gradient(45deg, #ff3131, #c28424);
            border: none;
            color: white;
            transition: all 0.3s ease;
            padding: 0.7rem 0;
        }

        .remove-button:hover {
            background: linear-gradient(45deg, #c28424, #ff3131);
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(107, 36, 194, 0.3);
        }

        /* Product Card */

        .product-card {
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .product-card:hover {
            transform: scale(1.05);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }

        .btn-details {
            background: linear-gradient(45deg, #8b31ff, #6b24c2);
            color: white;
            border-radius: 5px;
            transition: all 0.3s;
        }

        .btn-details:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        .carousel-item img {
            height: 400px; /* Adjust the height as needed */
            object-fit: cover; /* Ensures the image scales without distortion */
        }

        /* Loading spinner */
        .loading-spinner {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            z-index: 1000;
        }

        .loading-spinner.show {
            display: block;
        }

        .spinner-border {
            width: 3rem;
            height: 3rem;
            border-width: 5px;
        }

        /*Carousal*/
        .carousel-item {
            object-fit: cover;
        }

        /* General Styles */
        .men-shoes-title {
            font-weight: bold;
            font-size: 2rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 1.5rem;
        }

        .product-card {
            border: none;
            background: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 15px;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
        }

        .product-img {
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
            max-height: 200px;
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

        .f-boarder {
            width: 100%;
            box-sizing: border-box; /* Ensures padding and border are included in width */
        }

        .f-container {
            height: 20px; /* Example height for inner container */
            background: linear-gradient(268deg, #452b4bfa, #a054ff, #452b4bfa);
        }

        .f-container p {
            text-align: center;
            color: white;
            font-weight: bold;
            font-size: 15px;
        }

        /*Footer*/
        :root {
            --primary: #8B31FF;
            --primary-dark: #6B24C2;
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

        .first-image {
            height: 400px;
            object-fit: cover;
        }

        .second-image {
            height: auto;
        }

        .third-image {
            height: 400px;
            object-fit: cover;
        }

    </style>
</head>
<body>
<!-- Loading Spinner -->
<div class="loading-spinner" id="loadingSpinner">
    <div class="spinner-border text-primary" role="status">
        <span class="visually-hidden">Loading...</span>
    </div>
</div>

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
                        <a class="nav-link active" href="#">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#new-arrivals">New Arrivals</a>
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

<!-- Add to Cart Modal -->
<div
        class="modal fade"
        id="addToCartModal"
        tabindex="-1"
        aria-labelledby="addToCartModalLabel"
        aria-hidden="true"
>
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addToCartModalLabel">Add to Cart</h5>
                <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close"
                ></button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <!-- Left Column (Product Image and Details) -->
                    <div class="col-md-3">
                        <img
                                src="assets/shoes-hero.jpg"
                                alt="Product Image"
                                class="img-fluid mb-3"
                        />
                        <h4 class="mb-3">$159.99</h4>
                        <div class="mb-3">
                            <label for="size" class="form-label">Size</label>
                            <select class="form-select" id="size">
                                <option value="34">34</option>
                                <option value="35">35</option>
                                <option value="36">36</option>
                                <option value="37">37</option>
                                <option value="38">38</option>
                                <option value="39">39</option>
                                <option value="40">40</option>
                                <option value="41">41</option>
                                <option value="42">42</option>
                                <option value="43">43</option>
                                <option value="44">44</option>
                                <option value="45">45</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Color</label>
                            <div>
                                <button
                                        class="btn btn-outline-dark me-2 color-btn"
                                        data-color="Black"
                                ></button>
                                <button
                                        class="btn btn-outline-primary me-2 color-btn"
                                        data-color="Blue"
                                ></button>
                                <button
                                        class="btn btn-outline-danger me-2 color-btn"
                                        data-color="Red"
                                ></button>
                                <button
                                        class="btn btn-outline-secondary color-btn"
                                        data-color="Gray"
                                ></button>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="quantity" class="form-label">Quantity</label>
                            <div class="input-group">
                                <button
                                        class="btn btn-outline-secondary"
                                        type="button"
                                        id="decreaseQuantity"
                                >
                                    -
                                </button>
                                <input
                                        type="number"
                                        class="form-control text-center"
                                        id="quantity"
                                        value="1"
                                        min="1"
                                />
                                <button
                                        class="btn btn-outline-secondary"
                                        type="button"
                                        id="increaseQuantity"
                                >
                                    +
                                </button>
                            </div>
                        </div>
                    </div>

                    <!-- Middle Column (Description) -->
                    <div class="col-md-7">
                        <h2>Ultra Boost Running Shoe</h2>
                        <p class="text-muted small">Men's Running</p>
                        <p class="mb-4">
                            Experience ultimate comfort and performance with our latest
                            running shoe. Featuring responsive cushioning and a breathable
                            knit upper, the Ultra Boost is designed to elevate your
                            running experience. The innovative Boost midsole returns
                            energy with every step, while the Prime knit upper adapts to
                            your foot's changing shape during your run, reducing pressure
                            and enhancing comfort.
                        </p>
                        <p>Key Features:</p>
                        <ul>
                            <li>Responsive Boost midsole for energy return</li>
                            <li>Flexible Prime knit upper for adaptive fit</li>
                            <li>Continental™ Rubber outsole for extraordinary grip</li>
                            <li>Torsion System for mid foot integrity</li>
                            <li>Lightweight construction for effortless runs</li>
                        </ul>
                        <h4 class="mt-4">
                            Subtotal: <span id="subtotal">$159.99</span>
                        </h4>
                    </div>

                    <!-- Right Column (Buttons) -->
                    <div class="col-md-2 d-flex flex-column">
                        <button class="btn gradient-button btn-lg mb-3">Buy Now</button>
                        <button
                                class="btn btn-outline-primary remove-button data-bs-dismiss"
                        >
                            Remove Item
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--/////////////////////////////////////////////////////////////////////////////////// -->

<!-- User info modal -->
<div
        class="modal fade"
        id="userProfileModal"
        tabindex="-1"
        aria-labelledby="userProfileModalLabel"
        aria-hidden="true"
>
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header border-0">
                <h5 class="modal-title" id="userProfileModalLabel">
                    Profile Settings
                </h5>
                <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close"
                ></button>
            </div>
            <div class="modal-body">
                <div class="text-center mb-4">
                    <div class="profile-image-container">
                        <img
                                src="/placeholder.svg?height=100&width=100"
                                alt="Profile"
                                id="profileImage"
                                class="profile-image"
                        />
                        <label for="profileImageInput" class="edit-image-button">
                            <i class="fas fa-camera"></i>
                            <input
                                    type="file"
                                    id="profileImageInput"
                                    class="d-none"
                                    accept="image/*"
                            />
                        </label>
                    </div>
                </div>

                <form id="userProfileForm">
                    <div class="mb-3">
                        <label class="form-label">Full Name</label>
                        <div class="input-group">
                            <input
                                    type="text"
                                    class="form-control"
                                    value="John Doe"
                                    disabled
                            />
                            <button
                                    type="button"
                                    class="btn btn-outline-secondary edit-button"
                            >
                                <i class="fas fa-pencil-alt"></i>
                            </button>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <div class="input-group">
                            <input
                                    type="email"
                                    class="form-control"
                                    value="john@example.com"
                                    disabled
                            />
                            <button
                                    type="button"
                                    class="btn btn-outline-secondary edit-button"
                            >
                                <i class="fas fa-pencil-alt"></i>
                            </button>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Mobile Number</label>
                        <div class="input-group">
                            <input
                                    type="tel"
                                    class="form-control"
                                    value="+1 234 567 8900"
                                    disabled
                            />
                            <button
                                    type="button"
                                    class="btn btn-outline-secondary edit-button"
                            >
                                <i class="fas fa-pencil-alt"></i>
                            </button>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Address</label>
                        <div class="input-group">
                    <textarea class="form-control" rows="2" disabled>
  123 Street Name, City, Country</textarea
                    >
                            <button
                                    type="button"
                                    class="btn btn-outline-secondary edit-button"
                            >
                                <i class="fas fa-pencil-alt"></i>
                            </button>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Password</label>
                        <div class="input-group">
                            <input
                                    type="password"
                                    class="form-control"
                                    value="********"
                                    id="passwordField"
                                    disabled
                            />
                            <button
                                    type="button"
                                    class="btn btn-outline-secondary password-toggle"
                                    onclick="togglePasswordVisibility()"
                            >
                                <i class="fas fa-eye"></i>
                            </button>
                            <button
                                    type="button"
                                    class="btn btn-outline-secondary edit-button"
                            >
                                <i class="fas fa-pencil-alt"></i>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer border-0">
                <button
                        type="button"
                        class="btn btn-danger"
                        data-bs-dismiss="modal"
                >
                    Close
                </button>
                <button type="button" class="btn gradient-button">
                    Save Changes
                </button>
            </div>
        </div>
    </div>
</div>

<!-- //////////////////////////////////////////////////////////////////////////////// -->

<div class="container my-5">
    <h2 class="text-center mb-4">Featured Products</h2>
    <div class="row g-4">
        <!-- Product Card -->
        <div class="col-md-4">
            <div class="card product-card">
                <img
                        src="https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800&auto=format&fit=crop&q=80"
                        class="card-img-top first-image"
                        alt="Red Nike Sneakers"
                />
                <div class="card-body">
                    <h5 class="card-title">Product Title</h5>
                    <p class="card-text">$49.99</p>
                    <a href="shoeDetails.jsp" class="btn btn-details">Details</a>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card product-card">
                <img
                        src="https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?w=800&auto=format&fit=crop&q=80"
                        class="card-img-top second-image"
                        alt="White Sport Sneakers"
                />
                <div class="card-body">
                    <h5 class="card-title">Another Product</h5>
                    <p class="card-text">$59.99</p>
                    <a href="shoeDetails.jsp" class="btn btn-details">Details</a>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card product-card">
                <img
                        src="https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?w=800&auto=format&fit=crop&q=80"
                        class="card-img-top third-image"
                        alt="Nike Running Shoes"
                />
                <div class="card-body">
                    <h5 class="card-title">Third Product</h5>
                    <p class="card-text">$39.99</p>
                    <a href="shoeDetails.jsp" class="btn btn-details">Details</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!---////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->

<!-- carosal -->
<div class="container my-5 d-flex justify-content-center">
    <div
            id="imageCarousel"
            class="carousel slide"
            data-bs-ride="carousel"
            data-bs-interval="5000"
            style="width: 90%"
    >
        <div class="carousel-inner">
            <!-- First Slide -->
            <div class="carousel-item active">
                <img
                        src="https://images.unsplash.com/photo-1549298916-b41d501d3772?w=1600&auto=format&fit=crop&q=80"
                        class="d-block w-100 rounded shadow"
                        alt="Premium Sneakers"
                />
                <div class="carousel-caption d-none d-md-block">
                    <h5>Premium Sneakers</h5>
                    <p>Step into style with our exclusive collection of premium sneakers.</p>
                </div>
            </div>

            <!-- Second Slide -->
            <div class="carousel-item">
                <img
                        src="https://images.unsplash.com/photo-1460353581641-37baddab0fa2?w=1600&auto=format&fit=crop&q=80"
                        class="d-block w-100 rounded shadow"
                        alt="Running Shoes Collection"
                />
                <div class="carousel-caption d-none d-md-block">
                    <h5>Running Shoes Collection</h5>
                    <p>Experience ultimate comfort and performance with our running shoes.</p>
                </div>
            </div>

            <!-- Third Slide -->
            <div class="carousel-item">
                <img
                        src="https://images.unsplash.com/photo-1552346154-21d32810aba3?w=1600&auto=format&fit=crop&q=80"
                        class="d-block w-100 rounded shadow"
                        alt="Sport Shoes Display"
                />
                <div class="carousel-caption d-none d-md-block">
                    <h5>Sport Shoes Display</h5>
                    <p>Explore our wide range of sport shoes for every activity.</p>
                </div>
            </div>
        </div>
        <button
                class="carousel-control-prev"
                type="button"
                data-bs-target="#imageCarousel"
                data-bs-slide="prev"
        >
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button
                class="carousel-control-next"
                type="button"
                data-bs-target="#imageCarousel"
                data-bs-slide="next"
        >
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
</div>

<!-- New Arrivals -->
<div class="container my-5" >
    <h2 class="text-center mb-4" id="new-arrivals">New Arrivals</h2>
    <div class="row g-4">
        <!-- Product 1 -->
        <div class="col-md-3">
            <div
                    class="card product-card"
                    style="border: 2px solid #ccc; border-radius: 15px"
            >
                <img
                        src="https://images.unsplash.com/photo-1491553895911-0055eca6402d?w=400&h=300&fit=crop&q=80"
                        class="card-img-top"
                        alt="Stylish Sneakers"
                />
                <div class="card-body text-center">
                    <h5 class="card-title">Stylish Sneakers</h5>
                    <p class="card-text" style="font-weight: bold; color: #ff5722">
                        $79.99
                    </p>
                    <a
                            href="product-details.html"
                            class="btn btn-warning"
                            style="
                    font-weight: bold;
                    padding: 12px 25px;
                    border-radius: 25px;
                    width: 100%;
                  "
                    >Buy Now</a>
                </div>
            </div>
        </div>
        <!-- Product 2 -->
        <div class="col-md-3">
            <div
                    class="card product-card"
                    style="border: 2px solid #ccc; border-radius: 15px"
            >
                <img
                        src="https://images.unsplash.com/photo-1542219550-37153d387c27?w=400&h=300&fit=crop&q=80"
                        class="card-img-top"
                        alt="Running Shoes"
                />
                <div class="card-body text-center">
                    <h5 class="card-title">Running Shoes</h5>
                    <p class="card-text" style="font-weight: bold; color: #ff5722">
                        $89.99
                    </p>
                    <a
                            href="product-details.html"
                            class="btn btn-warning"
                            style="
                    font-weight: bold;
                    padding: 12px 25px;
                    border-radius: 25px;
                    width: 100%;
                  "
                    >Buy Now</a>
                </div>
            </div>
        </div>
        <!-- Product 3 -->
        <div class="col-md-3">
            <div
                    class="card product-card"
                    style="border: 2px solid #ccc; border-radius: 15px"
            >
                <img
                        src="https://images.unsplash.com/photo-1549298916-f52d724204b4?w=400&h=300&fit=crop&q=80"
                        class="card-img-top"
                        alt="Leather Shoes"
                />
                <div class="card-body text-center">
                    <h5 class="card-title">Leather Shoes</h5>
                    <p class="card-text" style="font-weight: bold; color: #ff5722">
                        $99.99
                    </p>
                    <a
                            href="product-details.html"
                            class="btn btn-warning"
                            style="
                    font-weight: bold;
                    padding: 12px 25px;
                    border-radius: 25px;
                    width: 100%;
                  "
                    >Buy Now</a>
                </div>
            </div>
        </div>
        <!-- Product 4 -->
        <div class="col-md-3">
            <div
                    class="card product-card"
                    style="border: 2px solid #ccc; border-radius: 15px"
            >
                <img
                        src="https://images.unsplash.com/photo-1525966222134-fcfa99b8ae77?w=400&h=300&fit=crop&q=80"
                        class="card-img-top"
                        alt="Casual Shoes"
                />
                <div class="card-body text-center">
                    <h5 class="card-title">Casual Shoes</h5>
                    <p class="card-text" style="font-weight: bold; color: #ff5722">
                        $69.99
                    </p>
                    <a
                            href="product-details.html"
                            class="btn btn-warning"
                            style="
                    font-weight: bold;
                    padding: 12px 25px;
                    border-radius: 25px;
                    width: 100%;
                  "
                    >Buy Now</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Men Shoes -->
<div class="container" id="menShoes">
    <div class="row">
        <div class="col text-center mb-4">
            <h2 class="men-shoes-title">Men Shoes</h2>
        </div>
    </div>
    <div class="row">
        <div class="col-md-3 mb-4">
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
        <div class="col-md-3 mb-4">
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
        <div class="col-md-3 mb-4">
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
        <div class="col-md-3 mb-4">
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
    document.addEventListener("DOMContentLoaded", function () {
        // Show loading spinner on page load
        document.getElementById("loadingSpinner").classList.add("show");

        // Hide loading spinner once the content is fully loaded
        window.addEventListener("load", function () {
            document.getElementById("loadingSpinner").classList.remove("show");
        });
    });

    // Initialize default user icon
    const defaultUserIcon =
        '<i class="fa-solid fa-user-circle" style="font-size: 40px; color: #8B31FF;"></i>';
    const headerProfileImage = document.getElementById("headerProfileImage");
    const profileImage = document.getElementById("profileImage");

    // Edit buttons functionality
    document.querySelectorAll(".edit-button").forEach((button) => {
        button.addEventListener("click", function () {
            const input = this.parentElement.querySelector("input, textarea");
            const isDisabled = input.disabled;
            input.disabled = !isDisabled;

            if (!isDisabled) {
                input.focus();
            }
        });
    });

    // Profile image handling
    document
        .getElementById("profileImageInput")
        .addEventListener("change", function (e) {
            if (e.target.files && e.target.files[0]) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    const imageUrl = e.target.result;
                    profileImage.src = imageUrl;
                    headerProfileImage.src = imageUrl;
                };
                reader.readAsDataURL(e.target.files[0]);
            }
        });

    // Password visibility toggle
    function togglePasswordVisibility() {
        const passwordField = document.getElementById("passwordField");
        const toggleButton = document.querySelector(".password-toggle i");

        if (passwordField.type === "password") {
            passwordField.type = "text";
            toggleButton.classList.replace("fa-eye", "fa-eye-slash");
        } else {
            passwordField.type = "password";
            toggleButton.classList.replace("fa-eye-slash", "fa-eye");
        }
    }

    // Handle image error (show default user icon)
    function handleImageError(img) {
        const parent = img.parentElement;
        img.style.display = "none";
        parent.innerHTML += defaultUserIcon;
    }

    // Add error handlers to images
    headerProfileImage.onerror = function () {
        handleImageError(this);
    };
    profileImage.onerror = function () {
        handleImageError(this);
    };

    //Add to cart
    document.addEventListener("DOMContentLoaded", function () {
        const quantityInput = document.getElementById("quantity");
        const subtotalElement = document.getElementById("subtotal");
        const sizeSelect = document.getElementById("size");
        const basePrice = 159.99;

        function updateSubtotal() {
            const quantity = parseInt(quantityInput.value);
            const size = parseInt(sizeSelect.value);
            let price = basePrice;

            if (size > 40) {
                price += (size - 40) * 5;
            }

            const subtotal = (price * quantity).toFixed(2);
            subtotalElement.textContent = `$${subtotal}`;
        }

        document
            .getElementById("decreaseQuantity")
            .addEventListener("click", function () {
                if (quantityInput.value > 1) {
                    quantityInput.value = parseInt(quantityInput.value) - 1;
                    updateSubtotal();
                }
            });

        document
            .getElementById("increaseQuantity")
            .addEventListener("click", function () {
                quantityInput.value = parseInt(quantityInput.value) + 1;
                updateSubtotal();
            });

        quantityInput.addEventListener("input", updateSubtotal);
        sizeSelect.addEventListener("change", updateSubtotal);

        const colorButtons = document.querySelectorAll(".color-btn");
        colorButtons.forEach((button) => {
            button.addEventListener("click", function () {
                colorButtons.forEach((btn) => btn.classList.remove("active"));
                this.classList.add("active");
            });
        });

        // Initial subtotal calculation
        updateSubtotal();
    });
    // ////////////////////////////////////////////////////////////////////////
</script>
</body>
</html>
