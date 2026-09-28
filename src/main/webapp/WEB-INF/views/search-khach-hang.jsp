<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<jsp:include page="header.jsp" />

<div class="container">
    <div class="card shadow mb-4">
        <div class="card-header bg-primary text-white">
            <h4 class="mb-0"><i class="fa-solid fa-users-viewfinder me-2"></i>Tra Cứu Danh Sách Khách Hàng</h4>
        </div>
        <div class="card-body">
            <form action="${pageContext.request.contextPath}/khach-hang/search" method="GET" class="row g-3">
                <div class="col-md-9">
                    <input type="text" name="keyword" class="form-control" value="${keyword}" placeholder="Nhập tên khách hàng hoặc số điện thoại cần tìm...">
                </div>
                <div class="col-md-3">
                    <button type="submit" class="btn btn-primary w-100"><i class="fa-solid fa-magnifying-glass me-1"></i> Tìm Kiếm</button>
                </div>
            </form>
        </div>
    </div>

    <div class="card shadow">
        <div class="card-body">
            <table class="table table-bordered table-hover text-center align-middle mb-0">
                <thead class="table-dark">
                <tr>
                    <th>Mã KH</th>
                    <th>Tên Khách Hàng</th>
                    <th>Số Điện Thoại</th>
                    <th>Email</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="kh" items="${dsKhachHang}">
                    <tr>
                        <td>${kh.maKhachHang}</td>
                        <td class="text-start fw-bold">${kh.hoTen }</td>
                        <td>${kh.soDienThoai}</td>
                        <td>${kh.email}</td>
                    </tr>
                </c:forEach>
                <c:if test="${empty dsKhachHang}">
                    <tr>
                        <td colspan="4" class="text-muted py-3">Không tìm thấy khách hàng nào khớp với từ khóa!</td>
                    </tr>
                </c:if>
                </tbody>
            </table>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp" />