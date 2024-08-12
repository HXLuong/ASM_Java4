package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import model.SanPham;
import utils.JpaUtils;

public class SanPhamDAO extends DAO<SanPham, String> {
	private EntityManager em = JpaUtils.getEtityManager();

	@Override
	protected void finalize() throws Throwable {
		em.close();
		super.finalize();
	}

	@Override
	public void insert(SanPham entity) {
		try {
			em.getTransaction().begin();
			em.persist(entity);
			em.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			em.getTransaction().rollback();
			throw new RuntimeException(e);
		}
	}

	@Override
	public void update(SanPham entity) {
		try {
			em.getTransaction().begin();
			em.merge(entity);
			em.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			em.getTransaction().rollback();
			throw new RuntimeException(e);
		}
	}

	@Override
	public void delete(String key) {
		try {
			em.getTransaction().begin();
			SanPham entity = this.findById(key);
			em.remove(entity);
			em.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			em.getTransaction().rollback();
			throw new RuntimeException(e);
		}
	}

	@Override
	public List<SanPham> findAll() {
		String jpql = "Select o from SanPham o";
		TypedQuery<SanPham> query = em.createQuery(jpql, SanPham.class);
		return query.getResultList();
	}

	@Override
	public SanPham findById(String key) {
		return em.find(SanPham.class, key);
	}

	public List<SanPham> findAllByIDDM1() {
		String jpql = "SELECT o FROM SanPham o WHERE o.danhMucSp='DM01'";
		TypedQuery<SanPham> query = em.createQuery(jpql, SanPham.class);
		List<SanPham> list = query.getResultList();
		return list;
	}

	public List<SanPham> findAllByIDDM2() {
		String jpql = "SELECT o FROM SanPham o WHERE o.danhMucSp='DM02'";
		TypedQuery<SanPham> query = em.createQuery(jpql, SanPham.class);
		List<SanPham> list = query.getResultList();
		return list;
	}

	public List<SanPham> findAllByIDDM3() {
		String jpql = "SELECT o FROM SanPham o WHERE o.danhMucSp='DM03'";
		TypedQuery<SanPham> query = em.createQuery(jpql, SanPham.class);
		List<SanPham> list = query.getResultList();
		return list;
	}

	public List<SanPham> findAllByMadm(String madm) {
		String sql = "SELECT o FROM SanPham o WHERE o.danhMucSp.id_DMSP = ?0";
		TypedQuery<SanPham> query = em.createQuery(sql, SanPham.class);
		query.setParameter(0, madm);
		return query.getResultList();
	}

}
