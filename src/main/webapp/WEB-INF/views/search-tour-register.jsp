<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tìm Kiếm & Thống Kê Tour</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<jsp:include page="header.jsp" />
<div class="container mt-5">

    <div class="card shadow-sm mb-4">
        <div class="card-header bg-dark text-white">
            <h5 class="mb-0"><i class="fa-solid fa-filter me-2"></i> Bộ Lọc Tìm Kiếm Bộ 3 Bảng</h5>
        </div>
        <div class="card-body">
            <form action="${pageContext.request.contextPath}/search-form" method="GET" class="row g-3">
                <div class="col-md-5">
                    <label class="form-label">Điểm đến dự kiến:</label>
                    <input type="text" name="diemDen" class="form-control" value="${diemDenCu}" placeholder="Ví dụ: Quy Nhơn, Đà Nẵng...">
                </div>
                <div class="col-md-5">
                    <label class="form-label">Ngày khởi hành chuẩn:</label>
                    <input type="date" name="ngayKhoiHanh" class="form-control" value="${ngayKhoiHanhCu}">
                </div>
                <div class="col-md-2 d-flex align-items-end">
                    <button type="submit" class="btn btn-primary w-100"><i class="fa-solid fa-magnifying-glass"></i> Tra Cứu</button>
                </div>
            </form>
        </div>
    </div>

    <div class="card shadow-sm">
        <div class="card-header bg-white text-dark d-flex justify-content-between align-items-center">
            <h5 class="mb-0 text-primary"><i class="fa-solid fa-list-check me-2"></i> Báo Cáo Doanh Thu Dự Kiến Đăng Ký</h5>
            <a href="${pageContext.request.contextPath}/register-form" class="btn btn-sm btn-success"><i class="fa-solid fa-plus"></i> Đăng ký thêm mới</a>
        </div>
        <div class="table-responsive">
            <table class="table table-striped table-hover text-center align-middle mb-0">
                <thead class="table-primary">
                <tr>
                    <th>Tên Khách Hàng</th>
                    <th>Số Điện Thoại</th>
                    <th>Tên Gói Tour</th>
                    <th>Điểm Đến</th>
                    <th>Ngày Khởi Hành</th>
                    <th>Số Người</th>
                    <th>Tổng Chi Phí Dự Kiến</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="item" items="${ketQuaTimKiem}">
                    <tr>
                        <td><strong>${item.khachHang.hoTen}</strong></td>
                        <td>${item.khachHang.soDienThoai}</td>
                        <td>${item.tourDuLich.tenTour}</td>
                        <td><span class="badge bg-secondary">${item.tourDuLich.diemDen}</span></td>
                        <td>${item.ngayKhoiHanh}</td>
                        <td>${item.soNguoiThamGia}</td>
                        <td class="text-danger fw-bold">
                            <fmt:formatNumber value="${item.soNguoiThamGia * item.tourDuLich.giaTour}" type="currency" currencySymbol="VND" maxFractionDigits="0"/>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty ketQuaTimKiem}">
                    <tr>
                        <td colspan="7" class="text-muted py-4"><i class="fa-solid fa-folder-open me-1"></i> Không tìm thấy bản ghi đăng ký nào phù hợp với bộ lọc!</td>
                    </tr>
                </c:if>
                </tbody>
            </table>
        </div>
    </div>

</div>
<jsp:include page="footer.jsp" />
</body>
</html>