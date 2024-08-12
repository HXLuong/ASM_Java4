<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${sessionScope.user.chucVu == false}">
			<%@include file="/views/header.jsp"%>
		</c:when>
		<c:otherwise>
			<%@include file="/views/headerAdmin.jsp"%>
		</c:otherwise>
	</c:choose>
	<%@include file="/views/nav.jsp"%>

	<div class="container mt-4">
		<h2 class="text-danger d-flex justify-content-center mb-4 fw-bold">Đổi
			Mật Khẩu</h2>
		<div>
			<c:if test="${not empty message}">
				<h5
					class="text-success d-flex justify-content-center w-50 offset-sm-3">${message}</h5>
			</c:if>
			<c:if test="${not empty error}">
				<h5
					class="text-danger d-flex justify-content-center w-50 offset-sm-3">${error}</h5>
			</c:if>
		</div>
		<form action="/ASM_Java4/account/change-pass" method="post"
			class="w-50 offset-sm-3">

			<div class="form-outline mb-4">
				<label class="form-label" for="form2Example1">Mật khẩu cũ *</label>
				<input name="Oldpassword" type="password" class="form-control" />
			</div>

			<div class="form-outline mb-4">
				<label class="form-label" for="form2Example2">Mật khẩu mới *</label>
				<input value="${user.matKhau}" name="Newpassword" type="password"
					class="form-control" />
			</div>

			<div class="form-outline mb-4">
				<label class="form-label" for="form2Example2">Xác nhận mật
					khẩu *</label> <input name="Valpassword" type="password"
					class="form-control" />
			</div>

			<!-- Submit button -->
			<div class="d-flex justify-content-center mb-4">
				<button type="submit" class="btn btn-outline-danger me-2">Đổi
					mật khẩu</button>
			</div>
		</form>
	</div>

	<%@include file="/views/footer.jsp"%>
</body>
</html>