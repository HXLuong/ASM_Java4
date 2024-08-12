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

import dao.DanhMucSPDAO;
import dao.SanPhamDAO;
import model.DanhMucSP;
import model.SanPham;
import utils.JpaUtils;

@WebServlet({ "/SanPham/index", "/SanPham/create", "/SanPham/update", "/SanPham/delete", "/SanPham/reset",
		"/SanPham/edit/*", "/SanPham/delete/*", "/SanPham/keyword" })
public class ProductServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = request.getRequestURL().toString();
		request.setCharacterEncoding("utf-8");

		SanPham entity = null;

		if (url.contains("delete")) {
			SanPhamDAO dao = new SanPhamDAO();
			if (request.getParameter("id_SP") != null) {
				dao.delete(request.getParameter("id_SP"));
				request.setAttribute("message", "Delete Success!");
			}
		} else if (url.contains("edit")) {
			SanPhamDAO dao = new SanPhamDAO();
			if (request.getParameter("id_SP") != null) {
				entity = dao.findById(request.getParameter("id_SP"));
				request.setAttribute("entity", entity);
			}
		} else if (url.contains("reset")) {
			entity = new SanPham();
			request.setAttribute("entity", entity);
		}
		combobox_idSP(request, response);
		findAll(request, response);

		request.setAttribute("Title", "Quản Lý Sản Phẩm");
		request.getRequestDispatcher("/views/QuanLySanPham.jsp").forward(request, response);
	}

	protected void findAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			SanPhamDAO dao = new SanPhamDAO();
			List<SanPham> list = dao.findAll();
			request.setAttribute("entitys", list);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error:" + e.getMessage());
		}
	}

	protected void combobox_idSP(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			DanhMucSPDAO dao = new DanhMucSPDAO();
			List<DanhMucSP> list = dao.findAll();
			request.setAttribute("danhMucSPList", list);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error:" + e.getMessage());
		}
	}

	protected void create(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			SanPham entity = new SanPham();
			BeanUtils.populate(entity, request.getParameterMap());
			SanPhamDAO dao = new SanPhamDAO();
			dao.insert(entity);
			request.setAttribute("message", "Thêm Sản phẩm thành công!");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error:" + e.getMessage());
		}
	}

	protected void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			SanPham entity = new SanPham();
			BeanUtils.populate(entity, request.getParameterMap());
			SanPhamDAO dao = new SanPhamDAO();
			dao.update(entity);
			request.setAttribute("message", "Sửa sản phẩm thành công!");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error:" + e.getMessage());
		}
	}

	private EntityManager em = JpaUtils.getEtityManager();

	protected void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			SanPhamDAO dao = new SanPhamDAO();
			if (request.getParameter("id_SP") != null) {
				dao.delete(request.getParameter("id_SP"));
				request.setAttribute("message", "Delete Success!");
			}
			request.setAttribute("message", "Delete success!");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error:" + e.getMessage());
		}
	}

	protected void findkeyword(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String keyword = request.getParameter("keyword");
		TypedQuery<SanPham> query = em.createNamedQuery("SanPham.findByKeywordSp", SanPham.class);
		query.setParameter("keyword", "%" + keyword + "%");
		query.setParameter("id", keyword);
		List<SanPham> list = query.getResultList();
		request.setAttribute("entitys", list);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = request.getRequestURL().toString();
		request.setCharacterEncoding("utf-8");

		SanPham entity = new SanPham();
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

		} else if (url.contains("reset")) {
			request.setAttribute("entity", new SanPham());
			findAll(request, response);
		}

		combobox_idSP(request, response);
		request.getRequestDispatcher("/views/QuanLySanPham.jsp").forward(request, response);
	}
}
