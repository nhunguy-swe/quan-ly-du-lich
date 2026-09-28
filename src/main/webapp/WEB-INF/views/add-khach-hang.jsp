<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm Khách Hàng Mới</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<jsp:include page="header.jsp" />
<div class="container mt-5" style="max-width: 600px;">
    <div class="card shadow">
        <div class="card-header bg-primary text-white">
            <h3 class="card-title mb-0">Thêm Khách Hàng Mới</h3>
        </div>
        <div class="card-body">
            <form:form action="${pageContext.request.contextPath}/khach-hang/save" method="POST" modelAttribute="khachHang">

                <div class="mb-3">
                    <label class="form-label">Tên Khách Hàng:</label>
                    <form:input path="hoTen" class="form-control" required="required"/>
                </div>

                <div class="mb-3">
                    <label class="form-label">Số Điện Thoại:</label>
                    <form:input path="soDienThoai" class="form-control" required="required"/>
                </div>

                <div class="mb-3">
                    <label class="form-label">Email:</label>
                    <form:input path="email" type="email" class="form-control"/>
                </div>

                <div class="d-flex justify-content-between">
                    <a href="${pageContext.request.contextPath}/register-form" class="btn btn-secondary">Quay lại</a>
                    <button type="submit" class="btn btn-success">Lưu Khách Hàng</button>
                </div>
            </form:form>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>