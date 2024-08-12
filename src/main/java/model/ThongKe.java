package model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class ThongKe {
	@Id
	Serializable hoaDonId;
	String nguoidung;
	String spten;
	String ngay;

	public ThongKe() {

	}

	public Serializable getHoaDonId() {
		return hoaDonId;
	}

	public void setHoaDonId(Serializable hoaDonId) {
		this.hoaDonId = hoaDonId;
	}

	public String getNguoidung() {
		return nguoidung;
	}

	public void setNguoidung(String nguoidung) {
		this.nguoidung = nguoidung;
	}

	public String getSpten() {
		return spten;
	}

	public void setSpten(String spten) {
		this.spten = spten;
	}

	public String getNgay() {
		return ngay;
	}

	public void setNgay(String ngay) {
		this.ngay = ngay;
	}

	public ThongKe(Serializable hoaDonId, String nguoidung, String spten, String ngay) {
		super();
		this.hoaDonId = hoaDonId;
		this.nguoidung = nguoidung;
		this.spten = spten;
		this.ngay = ngay;
	}

	
}

//@Entity
//public class Report {
//	@Id
//	Serializable hoaDonId;
//	String nguoidung;
//	String soluong;
//	String thanhtien;
//
//	public Report() {
//
//	}
//
//	public Serializable getHoaDonId() {
//		return hoaDonId;
//	}
//
//	public void setHoaDonId(Serializable hoaDonId) {
//		this.hoaDonId = hoaDonId;
//	}
//
//	public String getNguoidung() {
//		return nguoidung;
//	}
//
//	public void setNguoidung(String nguoidung) {
//		this.nguoidung = nguoidung;
//	}
//
//	public String getSoluong() {
//		return soluong;
//	}
//
//	public void setSoluong(String soluong) {
//		this.soluong = soluong;
//	}
//
//	public String getThanhtien() {
//		return thanhtien;
//	}
//
//	public void setThanhtien(String thanhtien) {
//		this.thanhtien = thanhtien;
//	}
//
//	public Report(String hoaDonId, String nguoidung, String soluong, String thanhtien) {
//		super();
//		this.hoaDonId = hoaDonId;
//		this.nguoidung = nguoidung;
//		this.soluong = soluong;
//		this.thanhtien = thanhtien;
//	}
//
//}

