
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modern Shoes Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="css/admin.css" rel="stylesheet">
    <style>

        /* Main Content Styles */
        .main-content {
            margin-left: 250px;
            padding: 20px;
        }

        .top-bar {
            background: white;
            padding: 15px 25px;
            border-radius: 10px;
            box-shadow: var(--card-shadow);
            margin-bottom: 25px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .search-container {
            flex: 1;
            max-width: 400px;
        }

        .search-container .input-group {
            background: var(--light-bg);
            border-radius: 25px;
            overflow: hidden;
        }

        .search-container input {
            border: none;
            background: transparent;
            padding: 10px 20px;
        }

        .search-container .btn {
            background: var(--accent-color);
            color: white;
            border: none;
            padding: 10px 20px;
        }

        .user-profile {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .notification-badge {
            position: relative;
            cursor: pointer;
        }

        .notification-badge .badge {
            position: absolute;
            top: -5px;
            right: -5px;
        }

        /* Stats Cards */
        .stats-card {
            background: white;
            border-radius: 10px;
            padding: 25px;
            margin-bottom: 25px;
            box-shadow: var(--card-shadow);
            transition: var(--hover-transition);
        }

        .stats-card:hover {
            transform: translateY(-5px);
        }

        .stats-icon {
            width: 50px;
            height: 50px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 15px;
        }

        .stats-icon.sales { background: rgba(52, 152, 219, 0.1); color: var(--accent-color); }
        .stats-icon.orders { background: rgba(46, 204, 113, 0.1); color: var(--success-color); }
        .stats-icon.customers { background: rgba(241, 196, 15, 0.1); color: var(--warning-color); }
        .stats-icon.products { background: rgba(231, 76, 60, 0.1); color: var(--danger-color); }

        /* Recent Orders */
        .orders-table {
            background: white;
            border-radius: 10px;
            padding: 25px;
            box-shadow: var(--card-shadow);
        }

        .orders-table .table {
            margin: 0;
        }

        .status-badge {
            padding: 5px 15px;
            border-radius: 15px;
            font-size: 12px;
            font-weight: 500;
        }

        .status-badge.delivered { background: rgba(46, 204, 113, 0.1); color: var(--success-color); }
        .status-badge.processing { background: rgba(241, 196, 15, 0.1); color: var(--warning-color); }
        .status-badge.shipped { background: rgba(52, 152, 219, 0.1); color: var(--accent-color); }

    </style>
</head>
<body>
<%@ include file="admin-sidebar.jsp" %>

<!-- Main Content -->
<div class="main-content">
    <!-- Top Bar -->
    <div class="top-bar">
        <div class="search-container">
            <div class="input-group">
                <input type="text" class="form-control" placeholder="Search...">
                <button class="btn">
                    <i class="fas fa-search"></i>
                </button>
            </div>
        </div>
        <div class="user-profile">
            <div class="notification-badge">
                <i class="fas fa-bell fa-lg"></i>
                <span class="badge bg-danger">3</span>
            </div>
            <img src="https://images.unsplash.com/photo-1633332755192-727a05c4013d?auto=format&fit=crop&w=40&h=40"
                 class="rounded-circle" alt="Profile">
            <div>
                <div class="fw-bold">John Doe</div>
                <small class="text-muted">Admin</small>
            </div>
        </div>
    </div>

    <!-- Stats Cards -->
    <div class="row">
        <div class="col-md-3">
            <div class="stats-card">
                <div class="stats-icon sales">
                    <i class="fas fa-dollar-sign fa-lg"></i>
                </div>
                <h3>$24,500</h3>
                <div class="text-muted">Total Sales</div>
                <div class="mt-2">
                    <small class="text-success">
                        <i class="fas fa-arrow-up"></i> 3.5% from last week
                    </small>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="stats-card">
                <div class="stats-icon orders">
                    <i class="fas fa-shopping-bag fa-lg"></i>
                </div>
                <h3>145</h3>
                <div class="text-muted">Orders</div>
                <div class="mt-2">
                    <small class="text-danger">
                        <i class="fas fa-arrow-down"></i> 2.8% from last week
                    </small>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="stats-card">
                <div class="stats-icon customers">
                    <i class="fas fa-users fa-lg"></i>
                </div>
                <h3>1,243</h3>
                <div class="text-muted">Customers</div>
                <div class="mt-2">
                    <small class="text-success">
                        <i class="fas fa-arrow-up"></i> 5.2% from last week
                    </small>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="stats-card">
                <div class="stats-icon products">
                    <i class="fas fa-box fa-lg"></i>
                </div>
                <h3>89</h3>
                <div class="text-muted">Products</div>
                <div class="mt-2">
                    <small class="text-muted">Total active products</small>
                </div>
            </div>
        </div>
    </div>

    <!-- Recent Orders -->
    <div class="orders-table">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h5 class="mb-0">Recent Orders</h5>
            <button class="btn btn-outline-primary btn-sm">View All</button>
        </div>
        <div class="table-responsive">
            <table class="table">
                <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Product</th>
                    <th>Customer</th>
                    <th>Date</th>
                    <th>Amount</th>
                    <th>Status</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>#12345</td>
                    <td>Nike Air Max 270</td>
                    <td>John Doe</td>
                    <td>2024-02-20</td>
                    <td>$299.99</td>
                    <td><span class="status-badge delivered">Delivered</span></td>
                </tr>
                <tr>
                    <td>#12346</td>
                    <td>Adidas Ultraboost</td>
                    <td>Jane Smith</td>
                    <td>2024-02-19</td>
                    <td>$189.99</td>
                    <td><span class="status-badge processing">Processing</span></td>
                </tr>
                <tr>
                    <td>#12347</td>
                    <td>Puma RS-X</td>
                    <td>Mike Johnson</td>
                    <td>2024-02-18</td>
                    <td>$159.99</td>
                    <td><span class="status-badge shipped">Shipped</span></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Toggle sidebar on mobile
    document.addEventListener('DOMContentLoaded', function() {
        const toggleSidebar = () => {
            const sidebar = document.querySelector('.sidebar');
            const mainContent = document.querySelector('.main-content');

            if (window.innerWidth <= 992) {
                sidebar.classList.toggle('active');
            }
        };

        // Add click event to all nav items
        document.querySelectorAll('.nav-item').forEach(item => {
            item.addEventListener('click', function() {
                // Remove active class from all nav items
                document.querySelectorAll('.nav-item').forEach(navItem => {
                    navItem.classList.remove('active');
                });
                // Add active class to clicked item
                this.classList.add('active');

                // Close sidebar on mobile after clicking a nav item
                if (window.innerWidth <= 992) {
                    toggleSidebar();
                }
            });
        });

        // Add hover effect to stats cards
        document.querySelectorAll('.stats-card').forEach(card => {
            card.addEventListener('mouseenter', function() {
                this.style.transform = 'translateY(-5px)';
            });

            card.addEventListener('mouseleave', function() {
                this.style.transform = 'translateY(0)';
            });
        });
    });
</script>
</body>
</html>
