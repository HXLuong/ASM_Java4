<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" />
<!-- Nhúng font-awsome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
<script
	src=" https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<body>
	<%@include file="/views/headerAdmin.jsp"%>
	<div class="container mt-5">
		<table class="table table-bordered text-center">
			<thead>
				<tr>
					<th>ID</th>
					<th>Tên người mua</th>
					<th>Tên sản phẩm</th>
					<th>Ngày mua</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="entity" items="${items}">
					<tr>
						<td>${entity.hoaDonId}</td>
						<td>${entity.nguoidung}</td>
						<td>${entity.spten}</td>
						<td>${entity.ngay}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>

