package model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;

/**
 * The persistent class for the HoaDonChiTiet database table.
 * 
 */
@Entity
@NamedQuery(name = "HoaDonChiTiet.findAll", query = "SELECT h FROM HoaDonChiTiet h")
public class HoaDonChiTiet implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id_HDCT;

	@Column(name = "NgayMua")
	private String ngayMua;

	@Column(name = "SoLuong")
	private int soLuong;

	@Column(name = "ThanhTien")
	private double thanhTien;

	// bi-directional many-to-one association to HoaDon
	@ManyToOne
	@JoinColumn(name = "id_HD")
	private HoaDon hoaDon;

	// bi-directional many-to-one association to SanPham
	@ManyToOne
	@JoinColumn(name = "id_SP")
	private SanPham sanPham;

	public HoaDonChiTiet() {
	}

	public int getId_HDCT() {
		return id_HDCT;
	}

	public void setId_HDCT(int id_HDCT) {
		this.id_HDCT = id_HDCT;
	}

	public String getNgayMua() {
		return ngayMua;
	}

	public void setNgayMua(String ngayMua) {
		this.ngayMua = ngayMua;
	}

	public int getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}

	public double getThanhTien() {
		return thanhTien;
	}

	public void setThanhTien(double thanhTien) {
		this.thanhTien = thanhTien;
	}

	public HoaDon getHoaDon() {
		return hoaDon;
	}

	public void setHoaDon(HoaDon hoaDon) {
		this.hoaDon = hoaDon;
	}

	public SanPham getSanPham() {
		return sanPham;
	}

	public void setSanPham(SanPham sanPham) {
		this.sanPham = sanPham;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}