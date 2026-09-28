<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body { min-height: 100vh; display: flex; flex-direction: column; background-color: #f8f9fa; }
        .main-content { flex: 1; }
        /* Tùy chỉnh nhỏ giúp giao diện dropdown đẹp hơn trên nền tối */
        .dropdown-menu {
            border: none;
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm mb-4">
    <div class="container">
        <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/">
            <i class="fa-solid fa-plane-departure me-2 text-info"></i>Quản Lý Du Lịch
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/register-form">
                        <i class="fa-solid fa-clipboard-list me-1"></i> Đăng Ký Tour
                    </a>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="khDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fa-solid fa-user me-1"></i> Khách Hàng
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="khDropdown">
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/khach-hang/add-form"><i class="fa-solid fa-user-plus me-2 text-muted"></i>Thêm Khách Hàng</a></li>
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/khach-hang/search"><i class="fa-solid fa-magnifying-glass me-2 text-muted"></i>Tìm Kiếm Khách Hàng</a></li>
                    </ul>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="tourDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fa-solid fa-route me-1"></i> Chuyến Đi
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="tourDropdown">
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/add-form"><i class="fa-solid fa-map-location-dot me-2 text-muted"></i>Thêm Chuyến Đi</a></li>
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/tour/search"><i class="fa-solid fa-magnifying-glass me-2 text-muted"></i>Tìm Kiếm Chuyến Đi</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="main-content" />