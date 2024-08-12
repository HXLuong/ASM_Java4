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
<title>${item.tenSP}</title>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<style>
.btn_hver:hover {
	color: #dc3545;
	background-color: white;
}

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
</head>
<body>
	<%@include file="/views/header.jsp"%>
	<%@include file="/views/nav.jsp"%>

	<div class="container">
		<div class="row mt-4">
			<h3 class="fs-4 fw-bold">${item.tenSP}</h3>
			<div class="col-sm-4 mt-3">
				<a href="/ASM_Java4/images/${item.img}"><img
					src="/ASM_Java4/images/${item.img}" alt="" width="400px"
					class="img-thumbnail"></a>
			</div>
			<div class="col-sm-4 mt-3 ps-0">
				<div>
					<span class="text-warning me-3"> <i
						class="bi bi-star-fill me-1"></i> <i class="bi bi-star-fill"></i>
						<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> <i
						class="bi bi-star-fill"></i>
					</span> ${item.trangThai}
				</div>
				<div>
					<h4 class="text-danger fw-bold">
						<c:set var="newprice" value="${item.gia * (1- item.giamGia)}" />
						<fmt:formatNumber value="${newprice}" />
						đ <span class="fs-6 text-body-tertiary fw-bold"><del>
								<c:set var="oldprice" value="${item.gia}" />
								<fmt:formatNumber value="${oldprice}" />
								đ
							</del></span>
					</h4>
				</div>
				<input type="hidden" id="maSP" value="${item.id_SP}" /> <input
					type="hidden" id="soLuongTrongKho" value="${item.soluong}" />
				<div class="d-flex align-items-center mt-3">
					<label>Số lượng:</label> <input id="soLuongMua" type="number"
						value="1" class="ms-2 form-control" placeholder="1" min="1"
						max="${item.soluong}" style="width: 175px">
				</div>
				<div class="mt-3">
					<button type="button" id="addToCart"
						class="btn_hver btn btn-danger py-1 me-1" style="width: 250px;">
						<i class="bi bi-cart-plus"></i> <br>
						<p class="fs-6 fw-bold m-0">Thêm vào giỏ</p>
					</button>
					<button type="button"
						class="btn_hver btn btn-danger me-1 fs-5 fw-bold"
						style="width: 150px; height: 58px;">Mua Ngay</button>
				</div>
			</div>
			<div class="col-sm-4 ">
				<div class="card" style="width: 22rem;">
					<div class="card-header">Yên tâm mua hàng</div>
					<ul class="mt-2">
						<li>Uy tín 20 năm xây dựng và phát triển</li>
						<li>Sản phẩm chính hãng 100%</li>
						<li>Trả góp lãi suất 0% toàn bộ giỏ hàng</li>
						<li>Bảo hành tận nơi cho doanh nghiệp</li>
						<li>Ưu đãi riêng cho học sinh sinh viên</li>
						<li>Vệ sinh miễn phí trọn đời PC, Laptop</li>
					</ul>
				</div>
			</div>
		</div>

		<div class="container row">
			<div class="col-sm-7 ps-0 ">
				<div class=" mt-3">
					<h4 class="fw-bold">${item.tenSP}</h4>
					<h5 class="fw-bold">THÔNG SỐ KĨ THUẬT :</h5>
				</div>
				<table class="table table-bordered">
					<tbody>
						<tr>
							<td>Thương hiệu</td>
							<td>Logitech</td>
						</tr>
						<tr>
							<td>Màu sắc</td>
							<td>Đen</td>
						</tr>
						<tr>
							<td>Màu sắc</td>
							<td>Đen</td>
						</tr>
						<tr>
							<td>Kiểu kết nối</td>
							<td>Có dây</td>
						</tr>
						<tr>
							<td>Cổng kết nối</td>
							<td>USB port</td>
						</tr>
						<tr>
							<td>Chiều dài dây</td>
							<td>2.10m</td>
						</tr>
						<tr>
							<td>Đèn LED</td>
							<td>Tùy chọn 7 màu sắc khác nhau</td>
						</tr>
						<tr>
							<td>Kiểu thiết kế</td>
							<td>Công thái học</td>
						</tr>
						<tr>
							<td>Độ nhạy (DPI)</td>
							<td>200 - 2500</td>
						</tr>
						<tr>
							<td>Cảm biến</td>
							<td>Quang học</td>
						</tr>
						<tr>
							<td>Số nút bấm</td>
							<td>9</td>
						</tr>
						<tr>
							<td>Kích thước (H x W x D)</td>
							<td>115 x 72 x 37 (mm)</td>
						</tr>
						<tr>
							<td>Trọng lượng</td>
							<td>82 g</td>
						</tr>
						<tr>
							<td>Hệ điều hành tương thích</td>
							<td>
								<p>Windows® 7 or later</p>
								<p>macOS® 10.11 or later</p>
								<p>Chrome OS</p>
							</td>
						</tr>
					</tbody>
				</table>
			</div>

			<div class=" col-sm-5 mt-4">
				<div class="card">
					<div class="card-header">Tin tức sản phẩm</div>
					<div class="card-body">
						<blockquote class="blockquote mb-0">
							<div class="card mt-2"
								style="max-width: 450px; max-height: 100px;">
								<div class="row g-0">
									<div class="col-md-5 ">
										<img src="/ASM_Java4/images/imgThongTin1.webp"
											class="img-fluid rounded-start" alt="..."
											style="height: 99px; width: 200px;">
									</div>
									<div class="col-md-7 mb-5">
										<div class="card-body">
											<p class="card-text  fs-6">Cách tải và chơi game One
												Piece Fighting Path trên PC siêu mượt.</p>
										</div>
									</div>
								</div>
							</div>

							<div class="card mt-2"
								style="max-width: 450px; max-height: 100px;">
								<div class="row g-0">
									<div class="col-md-5 ">
										<img src="/ASM_Java4/images/imgThongTin2.webp"
											class="img-fluid rounded-start"
											style="height: 99px; width: 200px;" alt="...">
									</div>
									<div class="col-md-7 mb-5">
										<div class="card-body">
											<p class="card-text  fs-6">Hướng dẫn cách cài báo thức
												cho máy tính Windows 10, 11 siêu đơn giản</p>
										</div>
									</div>
								</div>
							</div>

							<div class="card mt-2"
								style="max-width: 450px; max-height: 100px;">
								<div class="row g-0">
									<div class="col-md-5 ">
										<img src="/ASM_Java4/images/imgThongTin3.webp"
											class="img-fluid rounded-start"
											style="height: 99px; width: 200px;" alt="...">
									</div>
									<div class="col-md-7 mb-5">
										<div class="card-body">
											<p class="card-text  fs-6">Monica ứng dụng AI miễn phí đa
												dụng</p>
										</div>
									</div>
								</div>
							</div>
							<div class="card mt-2"
								style="max-width: 450px; max-height: 100px;">
								<div class="row g-0">
									<div class="col-md-5 ">
										<img src="/ASM_Java4/images/imgThongTin14.webp"
											class="img-fluid rounded-start"
											style="height: 99px; width: 200px;" alt="...">
									</div>
									<div class="col-md-7 mb-5">
										<div class="card-body">
											<p class="card-text  fs-6">Hướng dẫn cách tải
												Character.AI trên PC và mobile</p>
										</div>
									</div>
								</div>
							</div>
							<div class="card mt-2"
								style="max-width: 450px; max-height: 100px;">
								<div class="row g-0">
									<div class="col-md-5 ">
										<img src="/ASM_Java4/images/imgThongTin5.webp"
											class="img-fluid rounded-start"
											style="height: 99px; width: 200px;" alt="...">
									</div>
									<div class="col-md-7 mb-5">
										<div class="card-body">
											<p class="card-text  fs-6">Cách tải ảnh, video trên
												Shopee về máy tính cực đơn giản</p>
										</div>
									</div>
								</div>
							</div>


						</blockquote>
					</div>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="position-relative mb-2">
				<h2 class="pb-2 border-bottom border-danger">
					<a href="#"
						class="text-white bg-danger rounded-top p-2 d-inline fw-bold fs-4 text-decoration-none">Sản
						Phẩm Liên Quan</a>
				</h2>
			</div>
			<div class="owl-carousel owl-theme">
				<div class="item">
					<div class="position-relative">
						<div class="p-2">
							<a class="text-decoration-none w-100" href="#">
								<div class="mb-2 d-flex justify-content-center">
									<img src="/ASM_Java4/images/xps-13-9310-220x220.jpg" alt=""
										class="anhcarousel" />
								</div>
								<div class="mb-2">
									<div class="d-flex align-items-center">
										<span class="text-warning me-3" style="font-size: 10px">
											<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
											<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
											<i class="fa-solid fa-star"></i>
										</span> <span class="fw-medium text-secondary"
											style="font-size: 12px"> 0 đánh giá </span>
									</div>
									<div
										class="mb-2 fw-bolder text-secondary-emphasis text-truncate">
										Laptop Dell XPS 13 9310 i5 1135G7/8GB/256GB/13.4 inch
										FHDTouch/Win 10</div>
									<div>
										<span class="fw-bolder fs-5 text-danger">38,990,000đ</span> <strike
											class="fw-bolder fs-6 text-secondary">42,990,000đ</strike>
									</div>
								</div>
							</a>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="position-relative">
						<div class="p-2">
							<a class="text-decoration-none w-100" href="#">
								<div class="mb-2 d-flex justify-content-center">
									<img src="/ASM_Java4/images/xps-13-9310-220x220.jpg" alt=""
										class="anhcarousel" />
								</div>
								<div class="mb-2">
									<div class="d-flex align-items-center">
										<span class="text-warning me-3" style="font-size: 10px">
											<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
											<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
											<i class="fa-solid fa-star"></i>
										</span> <span class="fw-medium text-secondary"
											style="font-size: 12px"> 0 đánh giá </span>
									</div>
									<div
										class="mb-2 fw-bolder text-secondary-emphasis text-truncate">
										Laptop Dell XPS 13 9310 i5 1135G7/8GB/256GB/13.4 inch
										FHDTouch/Win 10</div>
									<div>
										<span class="fw-bolder fs-5 text-danger">38,990,000đ</span> <strike
											class="fw-bolder fs-6 text-secondary">42,990,000đ</strike>
									</div>
								</div>
							</a>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="position-relative">
						<div class="p-2">
							<a class="text-decoration-none w-100" href="#">
								<div class="mb-2 d-flex justify-content-center">
									<img src="/ASM_Java4/images/xps-13-9310-220x220.jpg" alt=""
										class="anhcarousel" />
								</div>
								<div class="mb-2">
									<div class="d-flex align-items-center">
										<span class="text-warning me-3" style="font-size: 10px">
											<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
											<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
											<i class="fa-solid fa-star"></i>
										</span> <span class="fw-medium text-secondary"
											style="font-size: 12px"> 0 đánh giá </span>
									</div>
									<div
										class="mb-2 fw-bolder text-secondary-emphasis text-truncate">
										Laptop Dell XPS 13 9310 i5 1135G7/8GB/256GB/13.4 inch
										FHDTouch/Win 10</div>
									<div>
										<span class="fw-bolder fs-5 text-danger">38,990,000đ</span> <strike
											class="fw-bolder fs-6 text-secondary">42,990,000đ</strike>
									</div>
								</div>
							</a>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="position-relative">
						<div class="p-2">
							<a class="text-decoration-none w-100" href="#">
								<div class="mb-2 d-flex justify-content-center">
									<img src="/ASM_Java4/images/xps-13-9310-220x220.jpg" alt=""
										class="anhcarousel" />
								</div>
								<div class="mb-2">
									<div class="d-flex align-items-center">
										<span class="text-warning me-3" style="font-size: 10px">
											<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
											<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
											<i class="fa-solid fa-star"></i>
										</span> <span class="fw-medium text-secondary"
											style="font-size: 12px"> 0 đánh giá </span>
									</div>
									<div
										class="mb-2 fw-bolder text-secondary-emphasis text-truncate">
										Laptop Dell XPS 13 9310 i5 1135G7/8GB/256GB/13.4 inch
										FHDTouch/Win 10</div>
									<div>
										<span class="fw-bolder fs-5 text-danger">38,990,000đ</span> <strike
											class="fw-bolder fs-6 text-secondary">42,990,000đ</strike>
									</div>
								</div>
							</a>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="position-relative">
						<div class="p-2">
							<a class="text-decoration-none w-100" href="#">
								<div class="mb-2 d-flex justify-content-center">
									<img src="/ASM_Java4/images/xps-13-9310-220x220.jpg" alt=""
										class="anhcarousel" />
								</div>
								<div class="mb-2">
									<div class="d-flex align-items-center">
										<span class="text-warning me-3" style="font-size: 10px">
											<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
											<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
											<i class="fa-solid fa-star"></i>
										</span> <span class="fw-medium text-secondary"
											style="font-size: 12px"> 0 đánh giá </span>
									</div>
									<div
										class="mb-2 fw-bolder text-secondary-emphasis text-truncate">
										Laptop Dell XPS 13 9310 i5 1135G7/8GB/256GB/13.4 inch
										FHDTouch/Win 10</div>
									<div>
										<span class="fw-bolder fs-5 text-danger">38,990,000đ</span> <strike
											class="fw-bolder fs-6 text-secondary">42,990,000đ</strike>
									</div>
								</div>
							</a>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="position-relative">
						<div class="p-2">
							<a class="text-decoration-none w-100" href="#">
								<div class="mb-2 d-flex justify-content-center">
									<img src="/ASM_Java4/images/xps-13-9310-220x220.jpg" alt=""
										class="anhcarousel" />
								</div>
								<div class="mb-2">
									<div class="d-flex align-items-center">
										<span class="text-warning me-3" style="font-size: 10px">
											<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
											<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
											<i class="fa-solid fa-star"></i>
										</span> <span class="fw-medium text-secondary"
											style="font-size: 12px"> 0 đánh giá </span>
									</div>
									<div
										class="mb-2 fw-bolder text-secondary-emphasis text-truncate">
										Laptop Dell XPS 13 9310 i5 1135G7/8GB/256GB/13.4 inch
										FHDTouch/Win 10</div>
									<div>
										<span class="fw-bolder fs-5 text-danger">38,990,000đ</span> <strike
											class="fw-bolder fs-6 text-secondary">42,990,000đ</strike>
									</div>
								</div>
							</a>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="position-relative">
						<div class="p-2">
							<a class="text-decoration-none w-100" href="#">
								<div class="mb-2 d-flex justify-content-center">
									<img src="/ASM_Java4/images/xps-13-9310-220x220.jpg" alt=""
										class="anhcarousel" />
								</div>
								<div class="mb-2">
									<div class="d-flex align-items-center">
										<span class="text-warning me-3" style="font-size: 10px">
											<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
											<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
											<i class="fa-solid fa-star"></i>
										</span> <span class="fw-medium text-secondary"
											style="font-size: 12px"> 0 đánh giá </span>
									</div>
									<div
										class="mb-2 fw-bolder text-secondary-emphasis text-truncate">
										Laptop Dell XPS 13 9310 i5 1135G7/8GB/256GB/13.4 inch
										FHDTouch/Win 10</div>
									<div>
										<span class="fw-bolder fs-5 text-danger">38,990,000đ</span> <strike
											class="fw-bolder fs-6 text-secondary">42,990,000đ</strike>
									</div>
								</div>
							</a>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="position-relative">
						<div class="p-2">
							<a class="text-decoration-none w-100" href="#">
								<div class="mb-2 d-flex justify-content-center">
									<img src="/ASM_Java4/images/xps-13-9310-220x220.jpg" alt=""
										class="anhcarousel" />
								</div>
								<div class="mb-2">
									<div class="d-flex align-items-center">
										<span class="text-warning me-3" style="font-size: 10px">
											<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
											<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
											<i class="fa-solid fa-star"></i>
										</span> <span class="fw-medium text-secondary"
											style="font-size: 12px"> 0 đánh giá </span>
									</div>
									<div
										class="mb-2 fw-bolder text-secondary-emphasis text-truncate">
										Laptop Dell XPS 13 9310 i5 1135G7/8GB/256GB/13.4 inch
										FHDTouch/Win 10</div>
									<div>
										<span class="fw-bolder fs-5 text-danger">38,990,000đ</span> <strike
											class="fw-bolder fs-6 text-secondary">42,990,000đ</strike>
									</div>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
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

	$('#addToCart').click(
			function() {
				var checkUserLogin = $('#checkUserLogin').val();
				if (checkUserLogin.length == 0) {
					alert('Bạn phải đăng nhập để thêm vào Giỏ hàng!');
					window.location.href = "LoginServlet";
					return;
				}

				var maSP = $('#maSP').val();
				var soLuongMua = parseInt($('#soLuongMua').val());
				var soLuongTrongKho = parseInt($('#soLuongTrongKho').val());

				if (soLuongMua > soLuongTrongKho || soLuongMua < 1) {
					alert('Kiểm tra lại số lượng');
				} else {
					$.ajax(
							{
								url : 'cart?action=add&masp=' + maSP
										+ '&soluong=' + soLuongMua
										+ '&isUpdate=0',
								dataType : 'json'
							}).then(function(data) {
						alert('Thêm thành công vào giỏ hàng!');
						$('#countTotal').text(data.tongsl);
					}).fail(function(error) {
						alert('Thêm thất bại, vui lòng thử lại!');
					});
				}
			})
</script>
</html>