package service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import dao.CartDao;
import dao.NguoiDungDAO;
import dao.SanPhamDAO;
import dto.CartDetailDto;
import dto.CartDto;
import model.HoaDon;
import model.HoaDonChiTiet;
import model.NguoiDung;
import model.SanPham;

public class CartService {

	SanPhamDAO spDao = new SanPhamDAO();
	NguoiDungDAO userDao = new NguoiDungDAO();
	CartDao cartDao = new CartDao();

	public boolean checkBeforeInsert(CartDto cart) {
		// kiem tra cart co ton tai sp hay khong, neu khong ton tai thi ko insert
		if (cart.getTongsl() == 0) {
			return false;
		}
		return insertHoaDon(cart);
	}

	public boolean insertHoaDon(CartDto cartDto) {
		HoaDon hoadon = mappingDtoToOrderEntity(cartDto);
		List<HoaDonChiTiet> listHDCT = mappingDtoToOrderDetailEntity(cartDto.getDetail(), hoadon);
		return cartDao.insertCart(hoadon, listHDCT);
	}

	public CartDto updateCart(CartDto cart, String masp, int soLuong, boolean isUpdate) {
		SanPham product = spDao.findById(masp);

		HashMap<String, CartDetailDto> cartDetail = cart.getDetail();

		if (cartDetail.containsKey(masp)) {
			if (soLuong < 1) {
				cartDetail.remove(masp);
			} else {
				if (isUpdate) {
					cartDetail.get(masp).setSlMua(soLuong);
				} else {
					int slCu = cartDetail.get(masp).getSlMua();
					cartDetail.get(masp).setSlMua(slCu + soLuong);
				}
			}
		} else {
			CartDetailDto cartDetailDto = new CartDetailDto();
			cartDetailDto.setTensp(product.getTenSP());
			cartDetailDto.setGiasp(product.getGia());
			cartDetailDto.setMasp(product.getId_SP());
			cartDetailDto.setHinh(product.getImg());
			cartDetailDto.setSlMua(soLuong);
			cartDetail.put(masp, cartDetailDto);
		}

		cart.setTongsl(this.getTongSL(cart));
		cart.setTongtien(this.getTongTien(cart));

		return cart;
	}

	public double getTongTien(CartDto cart) {
		HashMap<String, CartDetailDto> cartDetail = cart.getDetail();
		Double tongTien = 0D;
		for (CartDetailDto cartDetailDto : cartDetail.values()) {
			SanPham product = spDao.findById(cartDetailDto.getMasp());
			tongTien += product.getGia() * cartDetailDto.getSlMua();
		}
		return tongTien;
	}

	public int getTongSL(CartDto cart) {
		HashMap<String, CartDetailDto> cartDetail = cart.getDetail();
		int tongSL = 0;
		for (CartDetailDto productDto : cartDetail.values()) {
			tongSL += productDto.getSlMua();
		}
		return tongSL;
	}

	private HoaDon mappingDtoToOrderEntity(CartDto cartDto) {
		HoaDon hoadon = new HoaDon();
		hoadon.setTongTien(cartDto.getTongtien());
		NguoiDung user = userDao.findById(String.valueOf(cartDto.getUserId()));
		hoadon.setNguoiDung(user);
		return hoadon;
	}

	private List<HoaDonChiTiet> mappingDtoToOrderDetailEntity(HashMap<String, CartDetailDto> details, HoaDon hoadon) {
		List<HoaDonChiTiet> result = new ArrayList<>();
		details.forEach((key, hdct) -> {
			HoaDonChiTiet hoadonchitiet = new HoaDonChiTiet();
			SanPham sanpham = spDao.findById(hdct.getMasp());
			hoadonchitiet.setSanPham(sanpham);
			hoadonchitiet.setThanhTien(hdct.getGiasp());
			hoadonchitiet.setSoLuong(hdct.getSlMua());
			hoadonchitiet.setHoaDon(hoadon);
			result.add(hoadonchitiet);
		});
		return result;
	}
}
