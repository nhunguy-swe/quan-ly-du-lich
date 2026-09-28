<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm Chuyến Đi Mới</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<jsp:include page="header.jsp" />
<div class="container mt-5" style="max-width: 600px;">
    <div class="card shadow">
        <div class="card-header bg-warning text-dark">
            <h3 class="card-title mb-0">Thêm Chuyến Đi (Tour) Mới</h3>
        </div>
        <div class="card-body">
            <form:form action="${pageContext.request.contextPath}/save" method="POST" modelAttribute="tour">

                <div class="mb-3">
                    <label class="form-label">Tên Chuyến Đi (Tour):</label>
                    <form:input path="tenTour" class="form-control" required="required" placeholder="Ví dụ: Tour Du Lịch Nha Trang Hè 2026"/>
                </div>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Điểm Khởi Hành:</label>
                        <form:input path="diemKhoiHanh" class="form-control" required="required" placeholder="Ví dụ: Hà Nội"/>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Điểm Đến:</label>
                        <form:input path="diemDen" class="form-control" required="required" placeholder="Ví dụ: Nha Trang"/>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Giá Tour (VNĐ):</label>
                        <form:input path="giaTour" type="number" step="0.01" class="form-control" required="required" placeholder="Nhập số tiền"/>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Thời Gian (Số ngày):</label>
                        <form:input path="thoiGian" type="number" class="form-control" required="required" placeholder="Ví dụ: 3"/>
                    </div>
                </div>

                <div class="d-flex justify-content-between mt-3">
                    <a href="${pageContext.request.contextPath}/register-form" class="btn btn-secondary">Quay lại</a>
                    <button type="submit" class="btn btn-warning fw-bold">Lưu Chuyến Đi</button>
                </div>
            </form:form>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>