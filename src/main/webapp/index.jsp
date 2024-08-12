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
<!-- Nhung owlcarousel -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"
	integrity="sha512-tS3S5qG0BlhnQROyJXvNjeEM4UpMXHrQfTGmbQ1gKmelCxlSEBUaxhRBj/EFTzpbP4RVSrpEikbmdJobCvhE3g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css"
	integrity="sha512-sMXtMNL1zRzolHYKEujM2AqCLUR9F2C4/05cdbxjjLSRvMQIciEPCQZo++nk7go3BtSuK9kfa/s+a4f4i5pLkw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<style>
@media only screen and (max-width: 768px) {
	.owl-carousel {
		margin-left: 4px !important;
	}
	.anhcarousel {
		width: 100% !important;
	}
}

.owl-carousel {
	margin-left: 10px !important;
}

.anhcarousel {
	width: 75% !important;
}

.owl-prev {
	width: 40px;
	height: 40px;
	position: absolute;
	top: 50%;
	margin-left: -40px;
	display: block !important;
	border: 0px solid black;
}

.owl-next {
	width: 40px;
	height: 40px;
	position: absolute;
	top: 50%;
	right: -1px;
	display: block !important;
	border: 0px solid black;
}

.owl-theme .owl-nav:hover [class*=owl-] {
	border-radius: 50px;
	background-color: red;
	color: white;
}

@media only screen and (max-width: 768px) {
	.owl-prev {
		width: 40px;
		height: 40px;
		position: absolute;
		top: 40%;
		margin-left: -40px;
		display: block !important;
		border: 0px solid black;
	}
	.owl-next {
		width: 40px;
		height: 40px;
		position: absolute;
		top: 40%;
		right: 5px;
		display: block !important;
		border: 0px solid black;
	}
}
</style>
<title>ZLAPC Trang chủ</title>
</head>
<body>
	<%@include file="/views/header.jsp"%>
	<%@include file="/views/nav.jsp"%>

	<div class="container my-4">
		<div class="row">
			<div class="col-lg-9 col-md-9 col-xs-12 col-12">
				<div id="carouselExample" class="carousel slide">
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="/ASM_Java4/images/main_banner-970x400.png"
								class="d-block w-100" alt="..." />
						</div>
						<div class="carousel-item">
							<img src="/ASM_Java4/images/super sale.png" class="d-block w-100"
								alt="..." />
						</div>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExample" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExample" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
			</div>
			<div class="col-lg-3 col-md-3 col-xs-12 col-12 d-sm-block d-none">
				<a href="#"> <img class="mb-4"
					src="/ASM_Java4/images/side_banner_1-400x150.png" width="100%"
					height="117px" alt="" />
				</a> <a href="#"> <img class="mb-4"
					src="/ASM_Java4/images/side_banner_2-400x150.png" width="100%"
					height="117px" alt="" />
				</a> <a href="#"> <img class="mb-4"
					src="/ASM_Java4/images/side_banner_3-400x150.png" width="100%"
					height="117px" alt="" />
				</a>
			</div>
		</div>
		<a class="d-sm-block d-none" href="#"> <img
			src="/ASM_Java4/images/wide_banner-1920x150.png" width="100%" alt="" />
		</a>
	</div>

	<div class="container">
		<div class="position-relative mb-2">
			<h2 class="pb-2 border-bottom border-danger">
				<a href="#"
					class="text-white bg-danger rounded-top p-2 d-inline fw-bold fs-4 text-decoration-none">Laptop</a>
			</h2>
			<div class="d-sm-block d-none">
				<ul class="position-absolute end-0 bottom-0 d-flex m-0">
					<li class="py-1 px-2 list-group-item mb-2 border-white me-2"
						style="background-color: rgb(248, 248, 248)"><a
						class="text-decoration-none text-dark" href=""><span>Laptop
								Asus</span></a></li>
					<li class="py-1 px-2 list-group-item mb-2 border-white me-2"
						style="background-color: rgb(248, 248, 248)"><a
						class="text-decoration-none text-dark" href=""><span>Laptop
								Dell</span></a></li>
					<li class="py-1 px-2 list-group-item mb-2 border-white me-2"
						style="background-color: rgb(248, 248, 248)"><a
						class="text-decoration-none text-dark" href=""><span>Laptop
								HP</span></a></li>
					<li class="py-1 px-2 list-group-item mb-2 border-white"
						style="background-color: rgb(248, 248, 248)"><a
						class="text-decoration-none text-dark" href=""><span>Laptop
								Lenovo</span></a></li>
				</ul>
			</div>
		</div>
		<br>
		<div class="position-relative mb-2 mt-4">
			<div class="d-sm-none d-block">
				<ul
					class="position-absolute end-0 bottom-0 d-flex m-0 w-100 justify-content-center p-0">
					<li class="py-1 px-2 list-group-item mb-2 border-white me-2"
						style="background-color: rgb(248, 248, 248)"><span>Laptop:</span>
					</li>
					<li class="py-1 px-2 list-group-item mb-2 border-white me-2"
						style="background-color: rgb(248, 248, 248)"><a
						class="text-decoration-none text-dark" href=""><span>Asus</span></a>
					</li>
					<li class="py-1 px-2 list-group-item mb-2 border-white me-2"
						style="background-color: rgb(248, 248, 248)"><a
						class="text-decoration-none text-dark" href=""><span>Dell</span></a>
					</li>
					<li class="py-1 px-2 list-group-item mb-2 border-white me-2"
						style="background-color: rgb(248, 248, 248)"><a
						class="text-decoration-none text-dark" href=""><span>HP</span></a>
					</li>
					<li class="py-1 px-2 list-group-item mb-2 border-white"
						style="background-color: rgb(248, 248, 248)"><a
						class="text-decoration-none text-dark" href=""><span>Lenovo</span></a>
					</li>
				</ul>
			</div>
		</div>
		<div class="owl-carousel owl-theme">
			<c:forEach var="item" items="${listProd}">
				<div class="item">
					<div class="position-relative">
						<div class="p-2">
							<a class="text-decoration-none w-100"
								href="/ASM_Java4/sanpham?maSP=${item.id_SP}">
								<div class="mb-2 d-flex justify-content-center">
									<img src="/ASM_Java4/images/${item.img}" alt=""
										class="anhcarousel" />
								</div>
								<div class="mb-2">
									<div class="d-flex align-items-center">
										<span class="text-warning me-3" style="font-size: 10px">
											<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
											<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
											<i class="fa-solid fa-star"></i>
										</span> <span class="fw-medium text-secondary"
											style="font-size: 12px"> ${item.trangThai} </span>
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
				</div>
			</c:forEach>
		</div>
	</div>

	<div class="container">
		<div class="position-relative mb-2">
			<h2 class="pb-2 border-bottom border-danger">
				<a href="#"
					class="text-white bg-danger rounded-top p-2 d-inline fw-bold fs-4 text-decoration-none">Điện
					thoại</a>
			</h2>
			<div class="d-sm-block d-none">
				<ul class="position-absolute end-0 bottom-0 d-flex m-0">
					<li class="py-1 px-2 list-group-item mb-2 border-white me-2"
						style="background-color: rgb(248, 248, 248)"><a
						class="text-decoration-none text-dark" href=""><span>Apple</span></a></li>
					<li class="py-1 px-2 list-group-item mb-2 border-white me-2"
						style="background-color: rgb(248, 248, 248)"><a
						class="text-decoration-none text-dark" href=""><span>Samsung</span></a></li>
					<li class="py-1 px-2 list-group-item mb-2 border-white me-2"
						style="background-color: rgb(248, 248, 248)"><a
						class="text-decoration-none text-dark" href=""><span>Xiaomi</span></a></li>
					<li class="py-1 px-2 list-group-item mb-2 border-white"
						style="background-color: rgb(248, 248, 248)"><a
						class="text-decoration-none text-dark" href=""><span>Nokia</span></a></li>
				</ul>
			</div>
		</div>
		<br>
		<div class="position-relative mb-2 mt-4">
			<div class="d-sm-none d-block">
				<ul
					class="position-absolute end-0 bottom-0 d-flex m-0 w-100 justify-content-center p-0">
					<li class="py-1 px-2 list-group-item mb-2 border-white me-2"
						style="background-color: rgb(248, 248, 248)"><span>Điện thoại:</span></li>
					<li class="py-1 px-2 list-group-item mb-2 border-white me-2"
						style="background-color: rgb(248, 248, 248)"><a
						class="text-decoration-none text-dark" href=""><span>Apple</span></a>
					</li>
					<li class="py-1 px-2 list-group-item mb-2 border-white me-2"
						style="background-color: rgb(248, 248, 248)"><a
						class="text-decoration-none text-dark" href=""><span>Samsung</span></a>
					</li>
					<li class="py-1 px-2 list-group-item mb-2 border-white me-2"
						style="background-color: rgb(248, 248, 248)"><a
						class="text-decoration-none text-dark" href=""><span>Xiaomi</span></a>
					</li>
				</ul>
			</div>
		</div>
		<div class="owl-carousel owl-theme">
			<c:forEach var="item" items="${listProd2}">
				<div class="item">
					<div class="position-relative">
						<div class="p-2">
							<a class="text-decoration-none w-100"
								href="/ASM_Java4/sanpham?maSP=${item.id_SP}">
								<div class="mb-2 d-flex justify-content-center">
									<img src="/ASM_Java4/images/${item.img}" alt=""
										class="anhcarousel" />
								</div>
								<div class="mb-2">
									<div class="d-flex align-items-center">
										<span class="text-warning me-3" style="font-size: 10px">
											<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
											<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
											<i class="fa-solid fa-star"></i>
										</span> <span class="fw-medium text-secondary"
											style="font-size: 12px"> ${item.trangThai} </span>
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
				</div>
			</c:forEach>
		</div>
	</div>

	<div class="container">
		<div class="position-relative mb-2">
			<h2 class="pb-2 border-bottom border-danger">
				<a href="#"
					class="text-white bg-danger rounded-top p-2 d-inline fw-bold fs-4 text-decoration-none">Máy tính bảng</a>
			</h2>
			<div class="d-sm-block d-none">
				<ul class="position-absolute end-0 bottom-0 d-flex m-0">
					<li class="py-1 px-2 list-group-item mb-2 border-white me-2"
						style="background-color: rgb(248, 248, 248)"><a
						class="text-decoration-none text-dark" href=""><span>Ipad Pro</span></a></li>
					<li class="py-1 px-2 list-group-item mb-2 border-white me-2"
						style="background-color: rgb(248, 248, 248)"><a
						class="text-decoration-none text-dark" href=""><span>Ipad Air</span></a></li>
					<li class="py-1 px-2 list-group-item mb-2 border-white me-2"
						style="background-color: rgb(248, 248, 248)"><a
						class="text-decoration-none text-dark" href=""><span>Ipad Mini</span></a></li>
					<li class="py-1 px-2 list-group-item mb-2 border-white"
						style="background-color: rgb(248, 248, 248)"><a
						class="text-decoration-none text-dark" href=""><span>Samsung tablet</span></a></li>
				</ul>
			</div>
		</div>
		<br>
		<div class="position-relative mb-2 mt-4">
			<div class="d-sm-none d-block">
				<ul
					class="position-absolute end-0 bottom-0 d-flex m-0 w-100 justify-content-center p-0">
					<li class="py-1 px-2 list-group-item mb-2 border-white me-2"
						style="background-color: rgb(248, 248, 248)"><span>Máy tính bảng:</span></li>
					<li class="py-1 px-2 list-group-item mb-2 border-white me-2"
						style="background-color: rgb(248, 248, 248)"><a
						class="text-decoration-none text-dark" href=""><span>Pro</span></a>
					</li>
					<li class="py-1 px-2 list-group-item mb-2 border-white me-2"
						style="background-color: rgb(248, 248, 248)"><a
						class="text-decoration-none text-dark" href=""><span>Air</span></a>
					</li>
					<li class="py-1 px-2 list-group-item mb-2 border-white me-2"
						style="background-color: rgb(248, 248, 248)"><a
						class="text-decoration-none text-dark" href=""><span>Mini</span></a>
					</li>
				</ul>
			</div>
		</div>
		<div class="owl-carousel owl-theme">
			<c:forEach var="item" items="${listProd3}">
				<div class="item">
					<div class="position-relative">
						<div class="p-2">
							<a class="text-decoration-none w-100"
								href="/ASM_Java4/sanpham?maSP=${item.id_SP}">
								<div class="mb-2 d-flex justify-content-center">
									<img src="/ASM_Java4/images/${item.img}" alt=""
										class="anhcarousel" />
								</div>
								<div class="mb-2">
									<div class="d-flex align-items-center">
										<span class="text-warning me-3" style="font-size: 10px">
											<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
											<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
											<i class="fa-solid fa-star"></i>
										</span> <span class="fw-medium text-secondary"
											style="font-size: 12px"> ${item.trangThai} </span>
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
				</div>
			</c:forEach>
		</div>
	</div>

	<%@include file="/views/footer.jsp"%>
</body>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"
	integrity="sha512-bPs7Ae6pVvhOSiIcyUClR7/q2OAsRiovw4vAkX+zJbw3ShAeeqezq50RIIcIURq7Oa20rW2n2q+fyXBNcU9lrw=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script
	src=" https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<script>
	var owl = $(".owl-carousel");
	owl.owlCarousel({
		items : 4,
		loop : true,
		margin : 10,
		autoplay : true,
		dots : false,
		nav : true,
		navText : [ '<i class="fa fa-angle-left" aria-hidden="true"></i>',
				'<i class="fa fa-angle-right" aria-hidden="true"></i>', ],
		autoplayTimeout : 3000,
		autoplayHoverPause : false,
		responsiveClass : true,
		responsive : {
			0 : {
				items : 2,
				nav : true,
			},
			400 : {
				items : 1,
				nav : false,
			},
			700 : {
				items : 2,
				nav : false,
			},
			1000 : {
				items : 4,
				nav : true,
				loop : true,
			},
		},
	});
</script>
</html>