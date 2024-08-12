package model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;

/**
 * The persistent class for the DanhMucSP database table.
 * 
 */
@Entity
@NamedQuery(name = "DanhMucSP.findAll", query = "SELECT d FROM DanhMucSP d")
public class DanhMucSP implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String id_DMSP;

	@Column(name = "GhiChu")
	private String ghiChu;

	@Column(name = "TenDanhMuc")
	private String tenDanhMuc;

	// bi-directional many-to-one association to SanPham
	@OneToMany(mappedBy = "danhMucSp")
	private List<SanPham> sanPhams;

	public DanhMucSP() {
	}

	public String getId_DMSP() {
		return this.id_DMSP;
	}

	public void setId_DMSP(String id_DMSP) {
		this.id_DMSP = id_DMSP;
	}

	public String getGhiChu() {
		return this.ghiChu;
	}

	public void setGhiChu(String ghiChu) {
		this.ghiChu = ghiChu;
	}

	public String getTenDanhMuc() {
		return this.tenDanhMuc;
	}

	public void setTenDanhMuc(String tenDanhMuc) {
		this.tenDanhMuc = tenDanhMuc;
	}

	public List<SanPham> getSanPhams() {
		return this.sanPhams;
	}

	public void setSanPhams(List<SanPham> sanPhams) {
		this.sanPhams = sanPhams;
	}

	public SanPham addSanPham(SanPham sanPham) {
		getSanPhams().add(sanPham);
		sanPham.setDanhMucSp(this);

		return sanPham;
	}

	public SanPham removeSanPham(SanPham sanPham) {
		getSanPhams().remove(sanPham);
		sanPham.setDanhMucSp(null);

		return sanPham;
	}

}