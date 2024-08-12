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
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<title>ZLAPC Đăng Ký</title>
<style>
.form-container {
	background: linear-gradient(#E9374C, #D31128);
	font-family: 'Roboto', sans-serif;
	font-size: 0;
	padding: 0 15px;
	border: 1px solid #DC2036;
	border-radius: 15px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
}

.form-container .form-icon {
	color: #fff;
	font-size: 13px;
	text-align: center;
	text-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
	width: 50%;
	padding: 160px 0;
	vertical-align: top;
	display: inline-block;
}

.form-container .form-icon i {
	font-size: 124px;
	margin: 0 0 15px;
	display: block;
}

.form-container .form-icon .signup a {
	color: #fff;
	text-transform: capitalize;
	transition: all 0.3s ease;
}

.form-container .form-icon .signup a:hover {
	text-decoration: underline;
}

.form-container .form-horizontal {
	background: rgba(255, 255, 255, 0.99);
	width: 50%;
	padding: 100px 30px;
	margin: -10px 0;
	border-radius: 15px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
	display: inline-block;
}

.form-container .title {
	color: #454545;
	font-size: 23px;
	font-weight: 900;
	text-align: center;
	font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
	text-transform: capitalize;
	letter-spacing: 0.5px;
	margin: 0 0 30px 0;
}

.form-horizontal .form-group {
	background-color: rgba(255, 255, 255, 0.15);
	margin: 0 0 15px;
	border: 1px solid #b5b5b5;
	border-radius: 20px;
}

.form-horizontal .input-icon {
	color: #b5b5b5;
	font-size: 15px;
	text-align: center;
	line-height: 38px;
	height: 35px;
	width: 40px;
	vertical-align: top;
	display: inline-block;
}

.form-horizontal .form-control {
	color: #b5b5b5;
	background-color: transparent;
	font-size: 14px;
	letter-spacing: 1px;
	width: calc(100% - 55px);
	height: 33px;
	padding: 2px 10px 0 0;
	box-shadow: none;
	border: none;
	border-radius: 0;
	display: inline-block;
	transition: all 0.3s;
}

.form-horizontal .form-control:focus {
	box-shadow: none;
	border: none;
}

.form-horizontal .form-control::placeholder {
	color: #b5b5b5;
	font-size: 13px;
	text-transform: capitalize;
}

.form-horizontal .btn {
	color: rgba(255, 255, 255, 0.8);
	background: #E9374C;
	font-size: 15px;
	font-weight: 500;
	text-transform: uppercase;
	letter-spacing: 1px;
	width: 100%;
	margin: 0 0 10px 0;
	border: none;
	border-radius: 20px;
	transition: all 0.3s ease;
}

.form-horizontal .btn:hover, .form-horizontal .btn:focus {
	color: #fff;
	background-color: #D31128;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.5);
}

.form-horizontal .forgot-pass {
	font-size: 12px;
	text-align: center;
	display: block;
}

.form-horizontal .forgot-pass a {
	color: #999;
	transition: all 0.3s ease;
}

.form-horizontal .forgot-pass a:hover {
	color: #777;
	text-decoration: underline;
}

@media only screen and (max-width:576px) {
	.form-container {
		padding-bottom: 15px;
	}
	.form-container .form-icon {
		width: 100%;
		padding: 20px 0;
	}
	.form-container .form-horizontal {
		width: 100%;
		margin: 0;
	}
}
</style>
</head>
<body>
	<%@include file="/views/header.jsp"%>

	<div class="form-bg">
		<div class="container mt-5">
			<div class="row">
				<div
					class="col-lg-offset-3 col-lg-7 col-md-offset-2 col-md-8 mx-auto">
					<div class="form-container">
						<div class="form-icon">
							<i class="fa fa-user-circle"></i> <span class="signup">Đã
								Có Tài Khoản? <a href="/ASM_Java4/views/login.jsp">Đăng Nhập</a>
							</span>
						</div>
						<form class="form-horizontal" action="/ASM_Java4/account/sign-up"
							method="post">
							<h3 class="title">ĐĂNG KÝ</h3>
							<c:if test="${not empty message}">
								<h6 class="text-danger d-flex justify-content-center w-100">${message}</h6>
							</c:if>
							<div class="form-group">
								<span class="input-icon"><i class="fa fa-envelope"></i></span> <input
									class="form-control" type="email" placeholder="Địa Chỉ Email"
									value="${user.email}" name="email">
							</div>
							<div class="form-group">
								<span class="input-icon"><i class="bi bi-person-circle"></i></span>
								<input class="form-control" type="text" placeholder="Họ Và Tên"
									value="${user.hoTen}" name="hoTen">
							</div>
							<div class="form-group">
								<span class="input-icon"><i class="bi bi-person-circle"></i></span>
								<input class="form-control" type="text"
									placeholder="Tên Đăng Nhập" value="${user.id_ND}" name=id_ND>
							</div>
							<div class="form-group">
								<span class="input-icon"><i class="fa fa-lock"></i></span> <input
									class="form-control" type="password" placeholder="Mật Khẩu"
									value="${user.matKhau}" name="matKhau">
							</div>
							<div class="form-group">
								<span class="input-icon"><i class="fa fa-lock"></i></span> <input
									class="form-control" type="password"
									placeholder="Xác Nhận Mật Khẩu" name="ValPassword">
							</div>
							<input name="chucVu" type="hidden" value="false" />

							<button class="btn signin mt-2">ĐĂNG KÝ</button>
							<span class="forgot-pass mt-2"><a href="#">Quên Mật
									Khẩu?</a></span>
						</form>
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
</html>