package model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;

/**
 * The persistent class for the NguoiDung database table.
 * 
 */
@NamedQueries({
		@NamedQuery(name = "NguoiDung.findByKeyword", query = "SELECT o FROM NguoiDung o WHERE o.hoTen LIKE :keyword OR o.id_ND=:id"),
		@NamedQuery(name = "SanPham.findByKeywordSp", query = "SELECT o FROM SanPham o WHERE o.tenSP LIKE :keyword OR o.id_SP=:id") })
@Entity
@NamedQuery(name = "NguoiDung.findAll", query = "SELECT n FROM NguoiDung n")
public class NguoiDung implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String id_ND;

	@Column(name = "ChucVu")
	private boolean chucVu;

	@Column(name = "Email")
	private String email;

	@Column(name = "HoTen")
	private String hoTen;

	@Column(name = "MatKhau")
	private String matKhau;

	// bi-directional many-to-one association to HoaDon
	@OneToMany(mappedBy = "nguoiDung")
	private List<HoaDon> hoaDons;

	public NguoiDung() {
	}

	public String getId_ND() {
		return this.id_ND;
	}

	public void setId_ND(String id_ND) {
		this.id_ND = id_ND;
	}

	public boolean getChucVu() {
		return this.chucVu;
	}

	public void setChucVu(boolean chucVu) {
		this.chucVu = chucVu;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getHoTen() {
		return this.hoTen;
	}

	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}

	public String getMatKhau() {
		return this.matKhau;
	}

	public void setMatKhau(String matKhau) {
		this.matKhau = matKhau;
	}

	public List<HoaDon> getHoaDons() {
		return this.hoaDons;
	}

	public void setHoaDons(List<HoaDon> hoaDons) {
		this.hoaDons = hoaDons;
	}

	public HoaDon addHoaDon(HoaDon hoaDon) {
		getHoaDons().add(hoaDon);
		hoaDon.setNguoiDung(this);

		return hoaDon;
	}

	public HoaDon removeHoaDon(HoaDon hoaDon) {
		getHoaDons().remove(hoaDon);
		hoaDon.setNguoiDung(null);

		return hoaDon;
	}

}