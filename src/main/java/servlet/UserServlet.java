package servlet;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import dao.NguoiDungDAO;
import model.NguoiDung;
import utils.JpaUtils;

@WebServlet({ "/user/index", "/user/create", "/user/update", "/user/delete", "/user/reset", "/user/edit/*",
		"/user/delete/*", "/user/keyword" })
public class UserServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = request.getRequestURL().toString();
		request.setCharacterEncoding("utf-8");

		NguoiDung entity = null;

		if (url.contains("delete")) {
			NguoiDungDAO dao = new NguoiDungDAO();
			if (request.getParameter("id_ND") != null) {
				dao.delete(request.getParameter("id_ND"));
				request.setAttribute("message", "Delete Success!");
			}
		} else if (url.contains("edit")) {
			NguoiDungDAO dao = new NguoiDungDAO();
			if (request.getParameter("id_ND") != null) {
				entity = dao.findById(request.getParameter("id_ND"));
				request.setAttribute("entity", entity);
			}
		} else if (url.contains("reset")) {
			entity = new NguoiDung();
			request.setAttribute("entity", entity);
		}
		findAll(request, response);
		request.setAttribute("Title", "Quản Lý Người Dùng");
		request.getRequestDispatcher("/views/QuanLyNguoiDung.jsp").forward(request, response);
	}

	protected void findAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			NguoiDungDAO dao = new NguoiDungDAO();
			List<NguoiDung> list = dao.findAll();
			request.setAttribute("entitys", list);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error:" + e.getMessage());
		}
	}

	protected void create(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			NguoiDung entity = new NguoiDung();
			BeanUtils.populate(entity, request.getParameterMap());
			NguoiDungDAO dao = new NguoiDungDAO();
			dao.insert(entity);
			request.setAttribute("message", "Thêm người dùng thành công!");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error:" + e.getMessage());
		}
	}

	protected void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			NguoiDung entity = new NguoiDung();
			BeanUtils.populate(entity, request.getParameterMap());
			NguoiDungDAO dao = new NguoiDungDAO();
			dao.update(entity);
			request.setAttribute("message", "Sửa người dùng thành công!");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error:" + e.getMessage());
		}
	}

	protected void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			NguoiDung entity = new NguoiDung();
			BeanUtils.populate(entity, request.getParameterMap());
			NguoiDungDAO dao = new NguoiDungDAO();
			if (entity.getId_ND() != null) {
				dao.delete(entity.getId_ND());
			}
			request.setAttribute("message", "Xóa người dùng thành công!");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error:" + e.getMessage());
		}
	}

	private EntityManager em = JpaUtils.getEtityManager();

	protected void findkeyword(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String keyword = request.getParameter("keyword");
		TypedQuery<NguoiDung> query = em.createNamedQuery("NguoiDung.findByKeyword", NguoiDung.class);
		query.setParameter("keyword", "%" + keyword + "%");
		query.setParameter("id", keyword);
		List<NguoiDung> list = query.getResultList();
		request.setAttribute("entitys", list);
	}

	protected void findid(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String keyword = request.getParameter("keyword");
		TypedQuery<NguoiDung> query = em.createNamedQuery("Video.findByUser", NguoiDung.class);
		query.setParameter("id", keyword);
		List<NguoiDung> list = query.getResultList();

		request.setAttribute("entitys", list);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = request.getRequestURL().toString();
		request.setCharacterEncoding("utf-8");

		NguoiDung entity = new NguoiDung();
		if (url.contains("create")) {
			create(request, response);
			findAll(request, response);
		} else if (url.contains("update")) {
			update(request, response);
			findAll(request, response);
		} else if (url.contains("delete")) {
			delete(request, response);
			findAll(request, response);
		} else if (url.contains("keyword")) {
			findkeyword(request, response);
//			findid(request, response);
		} else if (url.contains("reset")) {
			request.setAttribute("entity", new NguoiDung());
			findAll(request, response);
		}
		request.getRequestDispatcher("/views/QuanLyNguoiDung.jsp").forward(request, response);
	}
}
