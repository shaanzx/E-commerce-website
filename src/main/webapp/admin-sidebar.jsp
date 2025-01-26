<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .sidebar {
        position: fixed;
        top: 0;
        left: 0;
        height: 100vh;
        width: 250px;
        color: white;
        padding-top: 20px;
        z-index: 1000;
    }

    .sidebar-header {
        padding: 0 15px;
        margin-bottom: 30px;
    }

    .sidebar-brand {
        color: white;
        text-decoration: none;
        font-size: 1.5rem;
        font-weight: bold;
        display: flex;
        align-items: center;
        gap: 10px;
    }

    .nav-pills .nav-link {
        color: rgba(255, 255, 255, 0.8);
        border-radius: 0;
        padding: 12px 20px;
        display: flex;
        align-items: center;
        gap: 10px;
        transition: all 0.3s ease;
    }

    .nav-pills .nav-link:hover {
        color: white;
        background: rgba(255, 255, 255, 0.1);
    }

    .nav-pills .nav-link.active {
        background: rgba(255, 255, 255, 0.2);
        color: white;
    }

    .sidebar-footer {
        position: absolute;
        bottom: 0;
        width: 100%;
        padding: 15px;
        background: rgba(0, 0, 0, 0.1);
    }

    .user-info {
        display: flex;
        align-items: center;
        gap: 10px;
        padding: 10px;
    }

    .user-avatar {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        background: rgba(255, 255, 255, 0.2);
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .user-details {
        flex: 1;
    }

    .user-name {
        font-weight: bold;
        margin: 0;
    }

    .user-role {
        font-size: 0.8rem;
        opacity: 0.8;
        margin: 0;
    }
</style>

<div class="sidebar">
    <div class="sidebar-header">
        <a href="#" class="sidebar-brand">
            <i class="fas fa-cubes"></i>
            Stepz With Shanz Admin
        </a>
    </div>

    <ul class="nav nav-pills flex-column mb-auto">
        <li class="nav-item">
            <a href="admin-Dashboard.jsp" class="nav-link <%= request.getRequestURI().endsWith("admin-Dashboard.jsp") ? "active" : "" %>">
                <i class="fas fa-home"></i>
                Dashboard
            </a>
        </li>
        <li class="nav-item">
            <a href="product" class="nav-link <%= request.getRequestURI().endsWith("admin-ItemManagement.jsp") ? "active" : "" %>">
                <i class="fas fa-box"></i>
                Products
            </a>
        </li>
        <li class="nav-item">
            <a href="orders.jsp" class="nav-link <%= request.getRequestURI().endsWith("orders.jsp") ? "active" : "" %>">
                <i class="fas fa-shopping-cart"></i>
                Orders
            </a>
        </li>
        <li class="nav-item">
            <a href="customer-view-servlet" class="nav-link <%= request.getRequestURI().endsWith("admin-customerView.jsp") ? "active" : "" %>">
                <i class="fas fa-users"></i>
                Customers
            </a>
        </li>
        <li class="nav-item">
            <a href="category-servlet" class="nav-link <%= request.getRequestURI().endsWith("admin-categoryManagement.jsp") ? "active" : "" %>">
                <i class="fas fa-tags"></i>
                Categories
            </a>
        </li>
        <li class="nav-item">
            <a href="reports.jsp" class="nav-link <%= request.getRequestURI().endsWith("reports.jsp") ? "active" : "" %>">
                <i class="fas fa-chart-bar"></i>
                Reports
            </a>
        </li>
        <li class="nav-item">
            <a href="settings.jsp" class="nav-link <%= request.getRequestURI().endsWith("settings.jsp") ? "active" : "" %>">
                <i class="fas fa-cog"></i>
                Settings
            </a>
        </li>
    </ul>

    <div class="sidebar-footer">
        <div class="user-info">
            <div class="user-avatar">
                <i class="fas fa-user"></i>
            </div>
            <div class="user-details">
                <p class="user-name">Admin User</p>
                <p class="user-role">Administrator</p>
            </div>
            <a href="index.jsp" class="text-white">
                <i class="fas fa-sign-out-alt"></i>
            </a>
        </div>
    </div>
</div>