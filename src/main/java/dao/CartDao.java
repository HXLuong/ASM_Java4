package dao;

import java.util.List;

import javax.persistence.EntityManager;

import model.HoaDon;
import model.HoaDonChiTiet;
import utils.JpaUtils;

public class CartDao {
	private EntityManager em = JpaUtils.getEtityManager();

	public boolean insertCart(HoaDon hoadon, List<HoaDonChiTiet> listHDCT) {

		/*
		 * Insert vao table HoaDon truoc sau do moi insert vao table HoaDonChiTiet Neu
		 * insert vao HoaDon that bai thi khong insert vao HDCT Neu insert vao HDCT that
		 * bai thi rollback data (tuc la huy data da insert vao HoaDon)
		 */
		try {
			em.getTransaction().begin();
			em.persist(hoadon);
			int maHDVuaInsert = hoadon.getId_HD();
			if (maHDVuaInsert > 0) {
				// neu insert thanh cong thi insert tiep HDCT
				hoadon.setId_HD(maHDVuaInsert);
				listHDCT.forEach(hdct -> em.persist(hdct));
			} else {
				return false;
			}
			em.getTransaction().commit();
			System.out.println("Create succeed");
			return true;
		} catch (Exception e) {
			em.getTransaction().rollback();
			System.out.println("Cannot insert entity");
			e.printStackTrace();
			return false;
		}
	}
}
