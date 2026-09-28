<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<jsp:include page="header.jsp" />

<div class="container">
    <div class="card shadow mb-4">
        <div class="card-header bg-warning text-dark">
            <h4 class="mb-0"><i class="fa-solid fa-route me-2"></i>Tra Cứu Chuyến Đi (Tour Du Lịch)</h4>
        </div>
        <div class="card-body">
            <form action="${pageContext.request.contextPath}/tour/search" method="GET" class="row g-3">
                <div class="col-md-9">
                    <input type="text" name="keyword" class="form-control" value="${keyword}" placeholder="Nhập tên chuyến đi hoặc điểm đến cần tìm...">
                </div>
                <div class="col-md-3">
                    <button type="submit" class="btn btn-dark w-100"><i class="fa-solid fa-magnifying-glass me-1"></i> Tìm Chuyến</button>
                </div>
            </form>
        </div>
    </div>

    <div class="card shadow">
        <div class="card-body">
            <table class="table table-bordered table-hover text-center align-middle mb-0">
                <thead class="table-warning">
                <tr>
                    <th>Mã Tour</th>
                    <th>Tên Chuyến Đi (Tour)</th>
                    <th>Điểm Khởi Hành</th>
                    <th>Điểm Đến</th>
                    <th>Thời Gian</th>
                    <th>Giá Tour</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="t" items="${dsTour}">
                    <tr>
                        <td>${t.maTour}</td>
                        <td class="text-start fw-bold text-primary">${t.tenTour}</td>
                        <td>${t.diemKhoiHanh}</td>
                        <td><span class="badge bg-success fs-6">${t.diemDen}</span></td>
                        <td>${t.thoiGian} ngày</td>
                        <td class="text-danger fw-bold">
                            <fmt:formatNumber value="${t.giaTour}" type="currency" currencySymbol="đ" maxFractionDigits="0"/>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty dsTour}">
                    <tr>
                        <td colspan="6" class="text-muted py-3">Không tìm thấy chuyến đi nào khớp với từ khóa trên!</td>
                    </tr>
                </c:if>
                </tbody>
            </table>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp" />