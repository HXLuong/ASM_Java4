<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<body>
	<nav
		class="navbar navbar-expand-lg bg-danger w-100 d-sm-none d-block pt-0">
		<div class="container-fluid">
			<button class="navbar-toggler text-white border" type=" button"
				data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo03"
				aria-controls="navbarTogglerDemo03" aria-expanded="false"
				aria-label="Toggle navigation">
				<i class="bi bi-list text-white" style="font-size: 35px;"></i>
			</button>
			<div class=" position-relative">
				<input class="rounded lh-lg border p-2" type="search"
					placeholder="Tìm kiếm"
					style="outline: none; width: 290px; height: 47px" /> <span
					class="position-absolute top-0 end-0"> <a href="#"
					class="text-dark fs-5"><i
						class="fa-solid fa-magnifying-glass pe-3 pt-3"></i></a></span>
			</div>
			<div class="collapse navbar-collapse" id="navbarTogglerDemo03">
				<div class=" navbar-nav">
					<div class="py-2 px-3">
						<a href="#"
							class="text-decoration-none text-white dropdown-center me-3"
							data-bs-toggle="dropdown"> <i class="fa-solid fa-list-ul"></i>
							<span class="fs-6">Danh mục sản phẩm</span>
						</a>
						<ul class="dropdown-menu">
							<c:forEach var="category" items="${listDM}">
								<li><a class="dropdown-item"
									href="/ASM_Java4/sanpham?maDM=${category.id_DMSP}">${category.tenDanhMuc}</a></li>
							</c:forEach>
						</ul>
					</div>
					<div class="py-2">
						<a href="#" class="text-decoration-none text-white mx-3"> <i
							class="fa-regular fa-newspaper"></i> <span class="fs-6">Tin
								tức sản phẩm</span>
						</a>
					</div>
					<div class="py-2">
						<a href="#" class="text-decoration-none text-white mx-3"> <i
							class="fa-brands fa-youtube"></i> <span class="fs-6">Video</span>
						</a>
					</div>
					<div class="py-2">
						<a href="#" class="text-decoration-none text-white mx-3"> <i
							class="fa-regular fa-credit-card"></i> <span class="fs-6">Hướng
								dẫn thanh toán</span>
						</a>
					</div>
					<div class="py-2">
						<a href="#" class="text-decoration-none text-white mx-3"> <i
							class="bi bi-cash-coin"></i> <span class="fs-6">Hướng dẫn
								trả góp</span>
						</a>
					</div>
					<div class="py-2">
						<a href="#" class="text-decoration-none text-white mx-3"> <i
							class="bi bi-shield-check"></i> <span class="fs-6">Chính
								sách bảo hành</span>
						</a>
					</div>
					<div class="pt-2">
						<a href="#"
							class="text-decoration-none text-white dropdown-center mx-3"
							data-bs-toggle="dropdown"> <i class="fa-solid fa-language"></i>
							<span class="fs-6">Ngôn ngữ</span>
						</a>
						<ul class="dropdown-menu mx-3">
							<li><a class="dropdown-item" href="#">Tiếng Anh</a></li>
							<li><a class="dropdown-item" href="#">Tiếng Việt</a></li>
						</ul>
					</div>
					<div class="py-3 d-flex">
						<div class="dropdown mx-3">
							<a href="#"
								class="border rounded d-flex align-items-center text-decoration-none dropdown-center"
								data-bs-toggle="dropdown"> <i
								class="fa-solid fa-user text-white py-3 px-3 fs-5"></i>
								<div class="pe-2 d-flex align-items-center">
									<span class="text-white fs-6">Tài khoản</span>
								</div>
							</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item"
									href="/ASM_Java4/views/login.jsp">Đăng Nhập</a></li>
								<li><a class="dropdown-item"
									href="/ASM_Java4/views/dangky.jsp">Đăng Ký</a></li>
							</ul>
						</div>
						<div>
							<a href="#" class="border rounded d-flex text-decoration-none"
								style="background-color: rgba(255, 0, 0, 0.1)"> <i
								class="fa-solid fa-heart text-white py-3 px-3 fs-5"></i>
								<div class="pe-2">
									<p class="text-white m-0 pt-1" style="font-size: 11px">Sản
										phẩm</p>
									<span class="text-white fs-6">Yêu thích</span>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</nav>

	<nav class="w-100 border rounded d-sm-block d-none">
		<div class="container">
			<div class="d-flex align-items-center justify-content-between">
				<div class="py-2">
					<a href="#"
						class="text-decoration-none text-dark dropdown-center me-3"
						data-bs-toggle="dropdown"> <i class="fa-solid fa-list-ul"></i>
						<span class="fs-6">Danh mục sản phẩm</span>
					</a>
					<ul class="dropdown-menu">
						<c:forEach var="category" items="${listDM}">
							<li><a class="dropdown-item"
								href="/ASM_Java4/sanpham?maDM=${category.id_DMSP}">${category.tenDanhMuc}</a></li>
						</c:forEach>
					</ul>
					<span class="fs-4">|</span>
				</div>
				<div class="py-2">
					<a href="#" class="text-decoration-none text-dark mx-3"> <i
						class="fa-regular fa-newspaper"></i> <span class="fs-6">Tin
							tức sản phẩm</span>
					</a> <span class="fs-4">|</span>
				</div>
				<div class="py-2">
					<a href="#" class="text-decoration-none text-dark mx-3"> <i
						class="fa-brands fa-youtube"></i> <span class="fs-6">Video</span>
					</a> <span class="fs-4">|</span>
				</div>
				<div class="py-2">
					<a href="#" class="text-decoration-none text-dark mx-3"> <i
						class="fa-regular fa-credit-card"></i> <span class="fs-6">Hướng
							dẫn thanh toán</span>
					</a> <span class="fs-4">|</span>
				</div>
				<div class="py-2">
					<a href="#" class="text-decoration-none text-dark mx-3"> <i
						class="bi bi-cash-coin"></i> <span class="fs-6">Hướng dẫn
							trả góp</span>
					</a> <span class="fs-4">|</span>
				</div>
				<div class="py-2">
					<a href="#" class="text-decoration-none text-dark mx-3"> <i
						class="bi bi-shield-check"></i> <span class="fs-6">Chính
							sách bảo hành</span>
					</a> <span class="fs-4">|</span>
				</div>
				<div class="pt-2">
					<a href="#"
						class="text-decoration-none text-dark dropdown-center mx-3"
						data-bs-toggle="dropdown"> <i class="fa-solid fa-language"></i>
						<span class="fs-6">Ngôn ngữ</span>
					</a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="#">Tiếng Anh</a></li>
						<li><a class="dropdown-item" href="#">Tiếng Việt</a></li>
					</ul>
				</div>
			</div>
		</div>
	</nav>
</body>
</html>