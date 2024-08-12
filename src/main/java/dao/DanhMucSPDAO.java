package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import model.DanhMucSP;
import utils.JpaUtils;

public class DanhMucSPDAO extends DAO<DanhMucSP, String> {
	private EntityManager em = JpaUtils.getEtityManager();

	@Override
	public void insert(DanhMucSP entity) {
		// TODO Auto-generated method stub

	}

	@Override
	public void update(DanhMucSP entity) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(String key) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<DanhMucSP> findAll() {
		String jpql = "Select o from DanhMucSP o";
		TypedQuery<DanhMucSP> query = em.createQuery(jpql, DanhMucSP.class);
		return query.getResultList();
	}

	@Override
	public DanhMucSP findById(String key) {
		return null;
	}

	public DanhMucSP findByMaDM(String maDM) {
		String sql = "SELECT o FROM DanhMucSP o WHERE o.id_DMSP = ?0";
		TypedQuery<DanhMucSP> query = em.createQuery(sql, DanhMucSP.class);
		query.setParameter(0, maDM);
		List<DanhMucSP> result = query.getResultList();
		if (result.isEmpty()) {
			return null;
		}
		return result.get(0);
	}

}
