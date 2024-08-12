package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import model.NguoiDung;
import utils.JpaUtils;

public class NguoiDungDAO extends DAO<NguoiDung, String> {
	private EntityManager em = JpaUtils.getEtityManager();

	@Override
	protected void finalize() throws Throwable {
		em.close();
		super.finalize();
	}

	@Override
	public void insert(NguoiDung entity) {
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
	public void update(NguoiDung entity) {
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
			NguoiDung entity = this.findById(key);
			em.remove(entity);
			em.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			em.getTransaction().rollback();
			throw new RuntimeException(e);
		}
	}

	@Override
	public List<NguoiDung> findAll() {
		String jpql = "Select o from NguoiDung o";
		TypedQuery<NguoiDung> query = em.createQuery(jpql, NguoiDung.class);
		return query.getResultList();
	}

	@Override
	public NguoiDung findById(String key) {
		return em.find(NguoiDung.class, key);
	}

}
