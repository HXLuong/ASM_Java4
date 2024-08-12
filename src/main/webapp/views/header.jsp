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
					<div class="col-sm-2 col-lg-2 p-0">
						<a href="/ASM_Java4/index"
							class="d-flex align-items-center overflow-hidden"> <img
							src="/ASM_Java4/images/logo.png" class="rounded" width="170px"
							height="55px" alt="" />
						</a>
					</div>
					<div class="col-sm-10 co-lg-10 p-0">
						<div class="d-flex gap-3 align-items-center">
							<div class="position-relative d-sm-block d-none">
								<input class="rounded lh-lg border-white p-2" type="search"
									placeholder="Tìm kiếm"
									style="outline: none; width: 470px; height: 47px" /> <span
									class="position-absolute top-0 end-0"> <a href="#"
									class="text-dark fs-5"><i
										class="fa-solid fa-magnifying-glass pe-3 pt-3"></i></a></span>
							</div>
							<a href="#"
								class="border rounded d-lg-flex text-decoration-none d-sm-block d-none"
								style="background-color: rgba(255, 0, 0, 0.1)"> <i
								class="fa-solid fa-heart text-white py-3 px-3 fs-5"></i>
								<div class="pe-2">
									<p class="text-white m-0 pt-1" style="font-size: 11px">Sản
										phẩm</p>
									<span class="text-white fs-6">Yêu thích</span>
								</div>
							</a> <a href="#"
								class="border rounded d-lg-flex text-decoration-none d-sm-block d-none"
								style="background-color: rgba(255, 0, 0, 0.1)"> <i
								class="fa-solid fa-phone text-white py-3 px-3 fs-5"></i>
								<div class="pe-2">
									<p class="text-white m-0 pt-1" style="font-size: 11px">
										Hotline</p>
									<span class="text-white fs-6">0123 456 789</span>
								</div>
							</a> <a href="<c:url value='/cart?action=view' />"
								class="border rounded d-flex text-decoration-none position-relative"
								style="background-color: rgba(255, 0, 0, 0.1)"> <i
								class="fa-solid fa-cart-shopping text-white py-3 px-3 fs-5"></i>
								<div class="pe-2 d-flex align-items-center">
									<span class="text-white fs-6">Giỏ hàng</span>
								</div> <c:choose>
									<c:when test="${sessionScope.cart.tongsl > 0}">
										<span
											class="position-absolute start-100 translate-middle badge rounded-pill bg-white text-danger" id="countTotal"
											style="top: 8px;">${sessionScope.cart.tongsl}</span>
									</c:when>
									<c:otherwise>
									</c:otherwise>
								</c:choose>
							</a> <input type="hidden" id="checkUserLogin"
								value="${sessionScope.user.hoTen}" />
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