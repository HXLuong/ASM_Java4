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
	<header class="bg-danger py-3">
		<div class="container">
			<div class="row">
				<div class="d-flex align-items-center justify-content-between">
					<div class="col-sm-3 col-lg-3 p-0">
						<a href="/ASM_Java4/index"
							class="d-flex align-items-center overflow-hidden"> <img
							src="/ASM_Java4/images/logo.png" class="rounded" width="170px"
							height="55px" alt="" />
						</a>
					</div>
					<div class="col-sm-9 co-lg-9 p-0">
						<div class="d-flex gap-3 align-items-center">
							<div style="width: 350px">
								<c:if test="${not empty Title}">
									<h2 class="text-white fw-bold">${Title}</h2>
								</c:if>
							</div>
							<a href="/ASM_Java4/user/index"
								class="border rounded d-lg-flex text-decoration-none d-sm-block d-none"
								style="background-color: rgba(255, 0, 0, 0.1)"> <i
								class="fa-solid fa-users text-white py-3 px-3 fs-5"></i>
								<div class="pe-2">
									<p class="text-white m-0 pt-1" style="font-size: 11px">Quản
										Lý</p>
									<span class="text-white fs-6">Người Dùng</span>
								</div>
							</a> <a href="/ASM_Java4/SanPham/index"
								class="border rounded d-lg-flex text-decoration-none d-sm-block d-none"
								style="background-color: rgba(255, 0, 0, 0.1)"> <i
								class="fa-solid fa-clipboard-list text-white py-3 px-3 fs-5"></i>
								<div class="pe-2">
									<p class="text-white m-0 pt-1" style="font-size: 11px">
										Quản Lý</p>
									<span class="text-white fs-6">Sản Phẩm</span>
								</div>
							</a> <a href="/ASM_Java4/testReport" class="border rounded d-flex text-decoration-none"
								style="background-color: rgba(255, 0, 0, 0.1)"> <i
								class="fa-solid fa-chart-simple text-white py-3 px-3 fs-5"></i>
								<div class="pe-2 d-flex align-items-center">
									<span class="text-white fs-6">Thống Kê</span>
								</div>
							</a>
							<div class="dropdown d-sm-block d-none">
								<c:choose>
									<c:when test="${empty sessionScope.user}">
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
												href="/ASM_Java4/LoginServlet">Đăng Nhập</a></li>
											<li><a class="dropdown-item"
												href="/ASM_Java4/views/dangky.jsp">Đăng Ký</a></li>
										</ul>
									</c:when>
									<c:otherwise>
										<a href="#"
											class="border rounded d-lg-flex text-decoration-none d-sm-block d-none dropdown-center"
											style="background-color: rgba(255, 0, 0, 0.1); width: 125px;"
											data-bs-toggle="dropdown"> <i
											class="fa-solid fa-user text-white py-3 px-3 fs-5"></i>
											<div class="pe-2 text-truncate">
												<p class="text-white m-0 pt-1" style="font-size: 11px">
													Xin chào,</p>
												<span class="text-white fs-6">${sessionScope.user.hoTen}</span>
											</div>
										</a>
										<ul class="dropdown-menu">
											<c:choose>
												<c:when test="${sessionScope.user.chucVu == false}">
												</c:when>
												<c:otherwise>
													<li><a class="dropdown-item"
														href="/ASM_Java4/user/index">Quản Lý</a></li>
												</c:otherwise>
											</c:choose>
											<li><a class="dropdown-item"
												href="/ASM_Java4/views/CapNhatHoSo.jsp">Cập Nhập Hồ Sơ</a></li>
											<li><a class="dropdown-item"
												href="/ASM_Java4/views/DoiMatKhau.jsp">Đổi Mật Khẩu</a></li>
											<li><a class="dropdown-item"
												href="/ASM_Java4/LoginServlet">Đăng Xuất</a></li>

										</ul>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>

</body>
</html>