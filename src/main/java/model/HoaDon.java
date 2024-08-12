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
 * The persistent class for the HoaDon database table.
 * 
 */
@Entity
@NamedQuery(name = "HoaDon.findAll", query = "SELECT h FROM HoaDon h")
public class HoaDon implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id_HD;

	@Column(name = "tongTien")
	private double tongTien;

	// bi-directional many-to-one association to NguoiDung
	@ManyToOne
	@JoinColumn(name = "id_ND")
	private NguoiDung nguoiDung;

	// bi-directional many-to-one association to HoaDonChiTiet
	@OneToMany(mappedBy = "hoaDon")
	private List<HoaDonChiTiet> hoaDonChiTiets;

	public HoaDon() {
	}

	public int getId_HD() {
		return id_HD;
	}

	public void setId_HD(int id_HD) {
		this.id_HD = id_HD;
	}

	public double getTongTien() {
		return tongTien;
	}

	public void setTongTien(double tongTien) {
		this.tongTien = tongTien;
	}

	public NguoiDung getNguoiDung() {
		return nguoiDung;
	}

	public void setNguoiDung(NguoiDung nguoiDung) {
		this.nguoiDung = nguoiDung;
	}

	public List<HoaDonChiTiet> getHoaDonChiTiets() {
		return hoaDonChiTiets;
	}

	public void setHoaDonChiTiets(List<HoaDonChiTiet> hoaDonChiTiets) {
		this.hoaDonChiTiets = hoaDonChiTiets;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}