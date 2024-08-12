<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
	integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
<title>Insert title here</title>
</head>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<body>
	<%@include file="/views/header.jsp"%>
	<%@include file="/views/nav.jsp"%>

	<h3 class="fs-3 text-center text-danger fw-bold my-4">Giỏ hàng</h3>
	<div class="w-100">
		<div class="form-group">
			<table class="table">
				<tbody class="text-center align-middle fw-bold">
					<c:choose>
						<c:when test="${sessionScope.cart.tongsl > 0}">
							<tr class="m-0">
								<td class="p-0"></td>
								<td class="p-0"></td>
								<td class="p-0"></td>
								<td class="p-0"></td>
							</tr>
							<tr>
								<th class="w-50">Tên Sản Phẩm</th>
								<th>Số Lượng</th>
								<th>Giá</th>
								<th></th>
							</tr>
							<c:forEach var="cartDetail" items="${sessionScope.cart.detail}">
								<tr id="tr-${cartDetail.value.masp}">
									<td>
										<div class="d-flex align-items-center justify-content-between">
											<p class="ms-5">${cartDetail.value.tensp}</p>
											<a href="/ASM_Java4/images/${cartDetail.value.hinh}"
												class="me-5"> <img
												src="/ASM_Java4/images/${cartDetail.value.hinh}" alt=""
												style="max-width: 250px; height: 250px; object-fit: cover;">
											</a>
										</div>
									</td>
									<td><input id="slMua-${cartDetail.value.masp}"
										onchange="updateCart('${cartDetail.value.masp}')"
										class="w-100 border text-center" type="number" min="1"
										value="${cartDetail.value.slMua}"></td>
									<td><span id="totalSP-${cartDetail.value.masp}"> <fmt:formatNumber
												type="number" maxFractionDigits="3"
												value="${cartDetail.value.giasp * cartDetail.value.slMua}" />
									</span>đ</td>
									<td>
										<div>
											<button type="button"
												onclick="removeSP('${cartDetail.value.masp}')"
												class="btn btn-outline-danger d-flex gap-1 justify-content-center">
												<i class="bi bi-trash3"></i> Xóa
											</button>
										</div>
									</td>
								</tr>
								<input type="hidden" id="giaSP-${cartDetail.value.masp}"
									value="${cartDetail.value.giasp}" />
							</c:forEach>

							<tr>
								<td class="py-4 text-danger">Tổng:</td>
								<td class="py-4 text-danger"><span id="countTotal">${sessionScope.cart.tongsl}</span></td>
								<td class="py-4 text-danger"><span id="tongTien"><fmt:formatNumber
											type="number" maxFractionDigits="3"
											value="${sessionScope.cart.tongtien}" /></span>đ</td>
								<td><button type="button" class="btn btn-danger"
										id="payNow">Thanh Toán</button></td>
							</tr>
						</c:when>
						<c:otherwise>
							<hr class="mb-0">
							<td class="text-danger fs-3 p-5" colspan="4">Giỏ hàng trống
								<i class="bi bi-bag-x-fill"></i>
							</td>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
	</div>

	<%@include file="/views/footer.jsp"%>
</body>
<script>
	function removeSP(maSP) {
		$.ajax({
			url : 'cart?action=add&masp=' + maSP + '&soluong=0&isUpdate=0',
			dataType : 'json'
		}).then(function(data) {
			$('#tongTien').text(numberWithDot(data.tongtien));
			$('#countTotal').text(data.tongsl);
			var idRemoveTag = '#tr-' + maSP;
			$(idRemoveTag).remove();
		}).fail(function(error) {
			alert('Xóa thất bại, vui lòng thử lại!');
		});
	}

	function updateCart(maSP) {
		var idInputSL = '#slMua-' + maSP;
		var slUpdate = $(idInputSL).val();
		var idInputGiaSP = '#giaSP-' + maSP;
		var giaSP = parseFloat($(idInputGiaSP).val());
		if (parseInt(slUpdate) < 1) {
			removeSP(maSP);
		} else {
			$.ajax(
					{
						url : 'cart?action=add&masp=' + maSP + '&soluong='
								+ slUpdate + '&isUpdate=1',
						dataType : 'json'
					}).then(function(data) {
				$('#tongTien').text(numberWithDot(data.tongtien));
				$('#countTotal').text(data.tongsl);
				var tongTienSPUpdate = parseFloat(giaSP * parseInt(slUpdate));
				let idTongGiaSP = '#totalSP-' + maSP;
				$(idTongGiaSP).text(numberWithDot(tongTienSPUpdate));
			}).fail(function(error) {
				alert('Cập nhật thất bại, vui lòng thử lại!');
			});
		}
	}

	$('#payNow').click(function() {
		var tongTien = $('#tongTien').text();
		$.ajax({
			url : 'cart?action=paying',
			dataType : 'json'
		}).then(function(data) {
			alert('Thanh toán thành công!');
			window.location.href = "index";
		}).fail(function(jqXHR, textStatus, errorThrown) { // Thêm xử lý lỗi cụ thể
			alert('Thanh toán thất bại, vui lòng thử lại!' + errorThrown); // Hiển thị lỗi cụ thể
			console.log(errorThrown);
		});
	})

	function numberWithDot(x) {
		return x.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	}
</script>
</html>