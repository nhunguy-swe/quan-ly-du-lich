<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Đăng Ký Tour Du Lịch</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<jsp:include page="header.jsp" />
<div class="container mt-5" style="max-width: 600px;">
    <div class="card shadow-sm">
        <div class="card-header bg-primary text-white text-center text-uppercase">
            <h4><i class="fa-solid fa-plane-departure me-2"></i> Form Đăng Ký Tour</h4>
        </div>
        <div class="card-body p-4">

            <c:if test="${not empty errorMessage}">
                <div class="alert alert-danger d-flex align-items-center" role="alert">
                    <i class="fa-solid fa-circle-exclamation me-2"></i>
                    <div>${errorMessage}</div>
                </div>
            </c:if>

            <div class="mb-3 d-flex gap-2">
                <a href="${pageContext.request.contextPath}/khach-hang/add-form" class="btn btn-sm btn-outline-primary">+ Thêm nhanh Khách hàng</a>
                <a href="${pageContext.request.contextPath}/add-form" class="btn btn-sm btn-outline-warning">+ Thêm nhanh Chuyến đi</a>
            </div>

            <form action="${pageContext.request.contextPath}/save-registration" method="POST">
                <div class="mb-3">
                    <label class="form-label font-weight-bold"><i class="fa-solid fa-user me-1"></i> Chọn khách hàng:</label>
                    <select name="maKhachHang" class="form-select" required>
                        <option value="">-- Chọn khách hàng sẵn có --</option>
                        <c:forEach var="kh" items="${danhSachKhachHang}">
                            <option value="${kh.maKhachHang}">${kh.hoTen} - ${kh.soDienThoai}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="mb-3">
                    <label class="form-label"><i class="fa-solid fa-map-location-dot me-1"></i> Chọn Gói Tour:</label>
                    <select name="maTour" class="form-select" required>
                        <option value="">-- Chọn gói hành trình hành hương/du lịch --</option>
                        <c:forEach var="t" items="${danhSachTour}">
                            <option value="${t.maTour}">${t.tenTour} (Từ: ${t.diemKhoiHanh} -> Đến: ${t.diemDen})</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label"><i class="fa-solid fa-calendar-check me-1"></i> Ngày đăng ký:</label>
                        <input type="date" name="ngayDangKy" class="form-control" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label"><i class="fa-solid fa-calendar-days me-1"></i> Ngày khởi hành:</label>
                        <input type="date" name="ngayKhoiHanh" class="form-control" required>
                    </div>
                </div>

                <div class="mb-4">
                    <label class="form-label"><i class="fa-solid fa-users me-1"></i> Số lượng khách đi kèm:</label>
                    <input type="number" name="soNguoiThamGia" class="form-control" placeholder="Từ 1 đến 19 người" required>
                </div>

                <div class="d-grid gap-2">
                    <button type="submit" class="btn btn-success"><i class="fa-solid fa-bookmark me-1"></i> Xác Nhận Đăng Ký</button>
                    <a href="${pageContext.request.contextPath}/search-form" class="btn btn-outline-secondary"><i class="fa-solid fa-magnifying-glass me-1"></i> Đến Form Tìm Kiếm & Thống Kê</a>
                </div>
            </form>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>