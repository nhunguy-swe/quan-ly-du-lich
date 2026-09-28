<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="header.jsp" />

<style>
    .feature-card {
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        cursor: pointer;
    }
    .feature-card:hover {
        transform: translateY(-8px);
        box-shadow: 0 1rem 2.5rem rgba(0,0,0,0.15) !important;
    }
    .icon-circle {
        width: 70px;
        height: 70px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 0 auto 20px;
        background-color: rgba(13, 110, 253, 0.1);
    }
    .icon-circle-success { background-color: rgba(25, 135, 84, 0.1); }
</style>

<div class="container py-4">

    <div class="text-center mb-5">
        <h1 class="display-5 fw-bold text-dark">Chào Mừng Đến Với Vận Hành Lữ Hành</h1>
        <p class="lead text-muted">Vui lòng chọn một trong các phân hệ nghiệp vụ dưới đây để bắt đầu xử lý công việc.</p>
        <div class="mx-auto bg-primary" style="width: 80px; height: 3px; border-radius: 2px;"></div>
    </div>

    <div class="row g-4 justify-content-center mb-4">

        <div class="col-md-5">
            <div class="card h-100 border-0 shadow-sm feature-card p-4 text-center text-decoration-none text-dark"
                 onclick="window.location.href='${pageContext.request.contextPath}/register-form'">
                <div class="card-body">
                    <div class="icon-circle">
                        <i class="fa-solid fa-file-signature fa-2x text-primary"></i>
                    </div>
                    <h4 class="card-title fw-bold text-primary mb-3">Phân Hệ Đăng Ký Tour</h4>
                    <p class="card-text text-muted">
                        Tiếp nhận khách hàng đăng ký hành trình mới. Tự động kiểm tra điều kiện ngày khởi hành và giới hạn số lượng người tham gia theo đúng quy định.
                    </p>
                </div>
                <div class="card-footer bg-transparent border-0 pt-0">
                    <span class="btn btn-primary px-4 rounded-pill">
                        Vào chức năng <i class="fa-solid fa-arrow-right ms-1"></i>
                    </span>
                </div>
            </div>
        </div>

        <div class="col-md-5">
            <div class="card h-100 border-0 shadow-sm feature-card p-4 text-center text-decoration-none text-dark"
                 onclick="window.location.href='${pageContext.request.contextPath}/search-form'">
                <div class="card-body">
                    <div class="icon-circle icon-circle-success">
                        <i class="fa-solid fa-chart-line fa-2x text-success"></i>
                    </div>
                    <h4 class="card-title fw-bold text-success mb-3">Tìm Kiếm & Thống Kê Tổng Hợp</h4>
                    <p class="card-text text-muted">
                        Tra cứu dữ liệu tổng hợp liên kết 3 bảng bằng kỹ thuật JOIN. Lọc nâng cao theo điểm đến, ngày đi và tính toán doanh thu tổng tự động.
                    </p>
                </div>
                <div class="card-footer bg-transparent border-0 pt-0">
                    <span class="btn btn-success px-4 rounded-pill">
                        Vào chức năng <i class="fa-solid fa-arrow-right ms-1"></i>
                    </span>
                </div>
            </div>
        </div>

    </div>

    <div class="row g-4 justify-content-center">

        <div class="col-md-5">
            <div class="card h-100 border-0 shadow-sm feature-card p-4 text-center text-decoration-none text-dark"
                 onclick="window.location.href='${pageContext.request.contextPath}/khach-hang/search'">
                <div class="card-body">
                    <div class="icon-circle" style="background-color: rgba(111, 66, 193, 0.1);">
                        <i class="fa-solid fa-users fa-2x" style="color: #6f42c1;"></i>
                    </div>
                    <h4 class="card-title fw-bold mb-3" style="color: #6f42c1;">Quản Lý Khách Hàng</h4>
                    <p class="card-text text-muted">
                        Xem danh sách khách hàng hiện có, thực hiện tra cứu nhanh theo Tên hoặc Số điện thoại. Hỗ trợ biểu mẫu thêm mới khách hàng vào cơ sở dữ liệu.
                    </p>
                </div>
                <div class="card-footer bg-transparent border-0 pt-0">
                    <span class="btn px-4 rounded-pill text-white" style="background-color: #6f42c1;">
                        Xem danh sách <i class="fa-solid fa-arrow-right ms-1"></i>
                    </span>
                </div>
            </div>
        </div>

        <div class="col-md-5">
            <div class="card h-100 border-0 shadow-sm feature-card p-4 text-center text-decoration-none text-dark"
                 onclick="window.location.href='${pageContext.request.contextPath}/tour/search'">
                <div class="card-body">
                    <div class="icon-circle" style="background-color: rgba(253, 126, 20, 0.1);">
                        <i class="fa-solid fa-route fa-2x" style="color: #fd7e14;"></i>
                    </div>
                    <h4 class="card-title fw-bold mb-3" style="color: #fd7e14;">Quản Lý Danh Mục Tour</h4>
                    <p class="card-text text-muted">
                        Tra cứu các tuyến đi hành trình lữ hành (Khởi hành, Điểm đến, Giá vé, Số ngày). Cung cấp chức năng tạo mới chuyến đi dựa theo cấu hình SQL.
                    </p>
                </div>
                <div class="card-footer bg-transparent border-0 pt-0">
                    <span class="btn px-4 rounded-pill text-white" style="background-color: #fd7e14;">
                        Xem danh mục <i class="fa-solid fa-arrow-right ms-1"></i>
                    </span>
                </div>
            </div>
        </div>

    </div>

</div>

<jsp:include page="footer.jsp" />