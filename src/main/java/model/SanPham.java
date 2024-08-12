package model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;

/**
 * The persistent class for the SanPham database table.
 * 
 */
@Entity
@NamedQuery(name = "SanPham.findAll", query = "SELECT s FROM SanPham s")
public class SanPham implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String id_SP;

	@Column(name = "Gia")
	private int gia;

	@Column(name = "GiamGia")
	private double giamGia;

	private String img;

	@Column(name = "MoTa")
	private String moTa;

	@Column(name = "TenSP")
	private String tenSP;

	@Column(name = "TrangThai")
	private String trangThai;

	@Column(name = "SoLuong")
	private int soluong;

	// bi-directional many-to-one association to HoaDonChiTiet
	@OneToMany(mappedBy = "sanPham")
	private List<HoaDonChiTiet> hoaDonChiTiets;

	// bi-directional many-to-one association to DanhMucSP
	@ManyToOne
	@JoinColumn(name = "id_DMSP", insertable = false, updatable = false)
	private DanhMucSP danhMucSp;

	@Column(name = "id_DMSP", insertable = true, updatable = true)
	private String iddm;

	public SanPham() {
	}

	public String getId_SP() {
		return id_SP;
	}

	public void setId_SP(String id_SP) {
		this.id_SP = id_SP;
	}

	public int getGia() {
		return gia;
	}

	public void setGia(int gia) {
		this.gia = gia;
	}

	public double getGiamGia() {
		return giamGia;
	}

	public void setGiamGia(double giamGia) {
		this.giamGia = giamGia;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getMoTa() {
		return moTa;
	}

	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}

	public String getTenSP() {
		return tenSP;
	}

	public void setTenSP(String tenSP) {
		this.tenSP = tenSP;
	}

	public String getTrangThai() {
		return trangThai;
	}

	public void setTrangThai(String trangThai) {
		this.trangThai = trangThai;
	}

	public List<HoaDonChiTiet> getHoaDonChiTiets() {
		return hoaDonChiTiets;
	}

	public void setHoaDonChiTiets(List<HoaDonChiTiet> hoaDonChiTiets) {
		this.hoaDonChiTiets = hoaDonChiTiets;
	}

	public DanhMucSP getDanhMucSp() {
		return danhMucSp;
	}

	public void setDanhMucSp(DanhMucSP danhMucSp) {
		this.danhMucSp = danhMucSp;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public int getSoluong() {
		return soluong;
	}

	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}

	public String getIddm() {
		return iddm;
	}

	public void setIddm(String iddm) {
		this.iddm = iddm;
	}

}