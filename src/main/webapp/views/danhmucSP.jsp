<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Nhung Jquery -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
	integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- Nhúng boostrap icon -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" />
<!-- Nhúng boostrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous" />
<!-- Nhúng angularjs min và route -->
<link href="https://fonts.googleapis.com/css?family=Satisfy"
	rel="stylesheet" />
<!-- Nhúng font-awsome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
<!-- Nhúng bootrap bundle -->
<script
	src=" https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<title>Insert title here</title>
</head>
<body>
	<%@include file="/views/header.jsp"%>
	<%@include file="/views/nav.jsp"%>

	<div class="container">
		<div class="row mt-3">
			<c:forEach var="item" items="${listProduct}">
				<div class="mb-3 col-sm-4 position-relative">
					<div class="p-2">
						<a class="text-decoration-none w-100"
							href="/ASM_Java4/sanpham?maSP=${item.id_SP}">
							<div class="mb-2 d-flex justify-content-center">
								<img src="/ASM_Java4/images/${item.img}" width="220px" alt=""
									class="anhcarousel" />
							</div>
							<div class="mb-2">
								<div class="d-flex align-items-center">
									<span class="text-warning me-3" style="font-size: 10px">
										<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
										<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
										<i class="fa-solid fa-star"></i>
									</span> <span class="fw-medium text-secondary" style="font-size: 12px">
										${item.trangThai} </span>
								</div>
								<div
									class="mb-2 fw-bolder text-secondary-emphasis text-truncate">
									${item.tenSP}</div>
								<div>
									<span class="fw-bolder fs-5 text-danger"> <c:set
											var="newprice" value="${item.gia * (1- item.giamGia)}" /> <fmt:formatNumber
											value="${newprice}" />đ
									</span> <strike class="fw-bolder fs-6 text-secondary"> <c:set
											var="oldprice" value="${item.gia}" /> <fmt:formatNumber
											value="${oldprice}" />đ
									</strike>
								</div>
							</div>
						</a>
					</div>
				</div>
			</c:forEach>
		</div>
</body>
</html>