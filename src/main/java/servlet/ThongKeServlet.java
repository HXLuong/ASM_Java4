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

import model.ThongKe;
import utils.JpaUtils;

/**
 * Servlet implementation class testReport
 */
@WebServlet("/testReport")
public class ThongKeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ThongKeServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	private EntityManager em = JpaUtils.getEtityManager();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String jpql = "SELECT NEW ThongKe(o.id_HD, o.nguoiDung.hoTen, t.sanPham.tenSP, t.ngayMua) FROM HoaDon o JOIN o.hoaDonChiTiets t";
		TypedQuery<ThongKe> query = em.createQuery(jpql, ThongKe.class);
		List<ThongKe> list = query.getResultList();
		request.setAttribute("items", list);
		request.setAttribute("Title", "Thống Kê");
		request.getRequestDispatcher("/views/ThongKe.jsp").forward(request, response);
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
