<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
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
	<div class="container mt-5">
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
		<form action="/ASM_Java4/user/index" method="post"
			class="w-50 offset-sm-3">

			<div class="form-outline mb-4">
				<label class="form-label" for="form2Example1">Mã người dùng:</label>
				<input value="${entity.id_ND}" name="id_ND" type="text"
					class="form-control" />
			</div>

			<div class="form-outline mb-4">
				<label class="form-label" for="form2Example2">Mật khẩu:</label> <input
					value="${entity.matKhau}" name="matKhau" type="password"
					class="form-control" />
			</div>

			<div class="form-outline mb-4">
				<label class="form-label" for="form2Example2">Họ và tên:</label> <input
					value="${entity.hoTen}" name="hoTen" type="text"
					class="form-control" />
			</div>

			<div class="form-outline mb-4">
				<label class="form-label" for="form2Example2">Email:</label> <input
					value="${entity.email}" name="email" type="email"
					class="form-control" />
			</div>

			<div class="row mb-4">
				<label class="form-label" for="form2Example2">Vai trò:</label>
				<div class="col d-flex">
					<input id="admin" class="form-check-input me-1" name="chucVu"
						type="radio" ${entity.chucVu ? 'checked' : ''} /> <label
						class="form-label me-2" for="form2Example2">Quản Lý</label> <input
						id="user" class="form-check-input me-1" name="chucVu" value="user"
						type="radio" ${entity.chucVu ? '' : 'checked'} /> <label
						class="form-label" for="form2Example2">Người Dùng</label>
				</div>
			</div>

			<!-- Submit button -->
			<div class="d-flex justify-content-center mb-4">
				<button formaction="/ASM_Java4/user/create"
					class="btn btn-outline-success me-2">Thêm</button>
				<button formaction="/ASM_Java4/user/update"
					class="btn btn-outline-warning me-2">Sửa</button>
				<button formaction="/ASM_Java4/user/delete"
					class="btn btn-outline-danger me-2">Xóa</button>
				<button formaction="/ASM_Java4/user/reset"
					class="btn btn-outline-info">Mới</button>
			</div>
		</form>

		<form action="/ASM_Java4/user/keyword" method="post"
			class="w-50 offset-sm-3">
			<div class="form-outline mb-3 mt-5 d-flex">
				<input name="keyword" class="form-control"
					placeholder="Tìm kiếm theo Mã hoặc Tên người dùng" />
				<button type="submit" class="btn btn-outline-danger ms-2">Tìm</button>
			</div>
		</form>

		<table class="table table-bordered text-center">
			<thead>
				<tr>
					<th>Mã người dùng</th>
					<th>Mật khẩu</th>
					<th>Họa và tên</th>
					<th>Email</th>
					<th>Vai trò</th>
					<th>Hoạt động</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="entity" items="${entitys}">
					<tr>
						<td>${entity.id_ND}</td>
						<td>${entity.matKhau}</td>
						<td>${entity.hoTen}</td>
						<td>${entity.email}</td>
						<td>${entity.chucVu?'Quản Lý':'Người Dùng'}</td>
						<td><a href="/ASM_Java4/user/edit/?id_ND=${entity.id_ND}"
							class="text-warning me-2">Chỉnh sửa</a> <a
							href="/ASM_Java4/user/delete/?id_ND=${entity.id_ND}"
							class="text-danger">Xóa</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>

