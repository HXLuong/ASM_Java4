<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</head>
<body>

	<%@include file="/views/headerAdmin.jsp"%>
	<div class="container mt-4">
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

		<form action="/ASM_Java4/SanPham/index" method="post"
			class="w-50 offset-sm-3">

			<div class="form-outline mb-4">
				<label class="form-label" for="form2Example1">Mã sản phẩm:</label> <input
					value="${entity.id_SP}" name="id_SP" type="text"
					class="form-control" />
			</div>

			<div class="form-outline mb-4">
				<label class="form-label" for="form2Example2">Tên danh mục
					sản phẩm:</label> <select class="form-control" name="iddm">
					<c:forEach var="item" items="${danhMucSPList}">
						<option value="${item.id_DMSP}"
							<c:if test="${item.id_DMSP == entity.danhMucSp.id_DMSP}">selected</c:if>>
							${item.id_DMSP}</option>
					</c:forEach>
				</select>
			</div>

			<div class="form-outline mb-4">
				<label class="form-label" for="form2Example2">Tên sản phẩm:</label>
				<input value="${entity.tenSP}" name="tenSP" class="form-control" />
			</div>

			<div class="form-outline mb-4">
				<label class="form-label" for="form2Example2">Mô Tả:</label> <input
					value="${entity.moTa}" name="moTa" type="text" class="form-control" />
			</div>

			<div class="form-outline mb-4">
				<label class="form-label" for="form2Example2">Giá:</label> <input
					value="${entity.gia}" name="gia" type="text" class="form-control" />
			</div>

			<div class="form-outline mb-4">
				<label class="form-label" for="form2Example2">Giảm giá:</label> <input
					value="${entity.giamGia}" name="giamGia" type="text"
					class="form-control" />
			</div>

			<div class="form-outline mb-4">
				<label class="form-label" for="form2Example2">Hình ảnh:</label> <input
					value="${entity.img}" name="img" type="file" = class="form-control" />
			</div>

			<div class="form-outline mb-4">
				<label class="form-label" for="form2Example2">Trạng thái:</label> <input
					value="${entity.trangThai}" name="trangThai" class="form-control" />
			</div>

			<div class="form-outline mb-4">
				<label class="form-label" for="form2Example2">Số lượng:</label> <input
					value="${entity.soluong}" name="soluong" class="form-control" />
			</div>

			<!-- Submit button -->
			<div class="d-flex justify-content-center mb-4">
				<button formaction="/ASM_Java4/SanPham/create"
					class="btn btn-outline-success me-2">Thêm</button>
				<button formaction="/ASM_Java4/SanPham/update"
					class="btn btn-outline-warning me-2">Sửa</button>
				<button formaction="/ASM_Java4/SanPham/delete"
					class="btn btn-outline-danger me-2">Xóa</button>
				<button formaction="/ASM_Java4/SanPham/reset"
					class="btn btn-outline-info">Mới</button>
			</div>
		</form>



		<form action="/ASM_Java4/SanPham/keyword" method="post"
			class="w-50 offset-sm-3">
			<div class="form-outline mb-3 mt-5 d-flex">
				<input name="keyword" class="form-control"
					placeholder="Tìm kiếm theo Mã hoặc Tên sản phẩm" />
				<button type="submit" class="btn btn-outline-danger ms-2">Tìm</button>
			</div>
		</form>

		<table class="table table-bordered text-center align-middle">
			<thead class="text-center align-middle">
				<tr>
					<th>Mã sản phẩm</th>
					<th>Mã danh mục sản phẩm</th>
					<th>Tên sản phẩm</th>
					<th>Mô tả</th>
					<th>Giá</th>
					<th>Giảm giá</th>
					<th>Hình ảnh</th>
					<th>Trạng thái</th>
					<th>Số lượng</th>
					<th>Hoạt động</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="entity" items="${entitys}">
					<tr>
						<td>${entity.id_SP}</td>
						<td>${entity.danhMucSp.tenDanhMuc}</td>
						<td>${entity.tenSP}</td>
						<td>${entity.moTa}</td>
						<td><fmt:formatNumber type="number" maxFractionDigits="3"
								value="${entity.gia}" /></td>
						<td>${entity.giamGia}</td>
						<td>${entity.img}</td>
						<td>${entity.trangThai}</td>
						<td>${entity.soluong}</td>
						<td><a href="/ASM_Java4/SanPham/edit/?id_SP=${entity.id_SP}"
							class="text-warning me-2">Chỉnh sửa</a> <a
							href="/ASM_Java4/SanPham/delete/?id_SP=${entity.id_SP}"
							class="text-danger">Xóa</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>

