package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.microsoft.sqlserver.jdbc.StringUtils;

import dao.DanhMucSPDAO;
import dao.SanPhamDAO;
import model.DanhMucSP;
import model.NguoiDung;
import model.SanPham;

/**
 * Servlet implementation class ProductServlet
 */
@WebServlet({ "/index", "/index/*", "/sanpham" })
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	SanPhamDAO spDAO = new SanPhamDAO();
	DanhMucSPDAO dmDAO = new DanhMucSPDAO();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public IndexServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		NguoiDung user = (NguoiDung) request.getSession().getAttribute("user");
		request.setAttribute("user", user);

		DanhMucSPDAO daoDM = new DanhMucSPDAO();
		List<DanhMucSP> listDM = daoDM.findAll();

		String maDM = request.getParameter("maDM");
		String maSP = request.getParameter("maSP");

		String uri = request.getRequestURI();
		SanPhamDAO daoSP = new SanPhamDAO();
		List<SanPham> listProd = (List<SanPham>) daoSP.findAllByIDDM1();
		List<SanPham> listProd2 = (List<SanPham>) daoSP.findAllByIDDM2();
		List<SanPham> listProd3 = (List<SanPham>) daoSP.findAllByIDDM3();

		if (!StringUtils.isEmpty(maSP)) {
			doGetSanPham(request, response, maSP);
		} else if (!StringUtils.isEmpty(maDM)) {
			request.setAttribute("listDM", listDM);
			doGetDanhMuc(request, response, maDM);
		}

		if (uri.contains("index")) {
			request.setAttribute("listDM", listDM);
			request.setAttribute("listProd", listProd);
			request.setAttribute("listProd2", listProd2);
			request.setAttribute("listProd3", listProd3);
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
	}

	protected void doGetSanPham(HttpServletRequest request, HttpServletResponse response, String maSP)
			throws ServletException, IOException {
		SanPham item = spDAO.findById(maSP);
		request.setAttribute("item", item);
		request.getRequestDispatcher("/views/ChiTietSP.jsp").forward(request, response);
	}

	protected void doGetDanhMuc(HttpServletRequest req, HttpServletResponse resp, String maDM)
			throws ServletException, IOException {
		List<SanPham> listProduct = spDAO.findAllByMadm(maDM);
		req.setAttribute("listProduct", listProduct);

		DanhMucSP category = dmDAO.findByMaDM(maDM);
		req.setAttribute("category", category);

		req.getRequestDispatcher("/views/danhmucSP.jsp").forward(req, resp);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
