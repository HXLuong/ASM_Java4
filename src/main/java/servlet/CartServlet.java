package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;

import dao.NguoiDungDAO;
import dao.SanPhamDAO;
import dto.CartDto;
import model.HoaDon;
import model.NguoiDung;
import service.CartService;

/**
 * Servlet implementation class AddCartServlet
 */
@WebServlet("/cart")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CartServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	CartService cartService = new CartService();
	SanPhamDAO spDao = new SanPhamDAO();
	NguoiDungDAO userDao = new NguoiDungDAO();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		CartDto cart = (CartDto) session.getAttribute("cart");
		if (cart == null) {
			session.setAttribute("cart", new CartDto());
		}

		String action = request.getParameter("action");

		if (action.equals("view")) {
			// localhost:8080/asm-java4/cart?action=view
			doGetViewCart(request, response);
		} else if (action.equals("add")) {
			// localhost:8080/asm-java4/cart?action=add&masp={masp}&soluong={soluong}
			String masp = request.getParameter("masp");
			int soluong = Integer.parseInt(request.getParameter("soluong"));
			doGetAddSP(request, response, session, masp, soluong);
		} else if (action.equals("remove")) {
			// localhost:8080/asm-java4/cart?action=remove&masp={masp}
			String masp = request.getParameter("masp");
			doGetRemoveSP(request, response, masp);
		} else if (action.equals("paying")) {
			// localhost:8080/asm-java4/cart?action=paying&phone={phone}&address={address}
			doGetPaying(request, response, session);
		}
	}

	protected void doGetViewCart(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.getRequestDispatcher("/views/cart.jsp").forward(req, resp);
	}

	protected void doGetAddSP(HttpServletRequest req, HttpServletResponse resp, HttpSession session, String masp,
			int soluong) throws ServletException, IOException {
		CartDto cart = (CartDto) session.getAttribute("cart");
		boolean isUpdate = req.getParameter("isUpdate").equals("1");
		cartService.updateCart(cart, masp, soluong, isUpdate);
		ObjectMapper mapper = new ObjectMapper();
		String cartToJsonString = mapper.writeValueAsString(cart);
		resp.setContentType("application/json");
		PrintWriter out = resp.getWriter();
		out.print(cartToJsonString);
		out.flush();
	}

	protected void doGetRemoveSP(HttpServletRequest req, HttpServletResponse resp, String masp)
			throws ServletException, IOException {
		req.getRequestDispatcher("/views/cart.jsp").forward(req, resp);
	}

	protected void doGetPaying(HttpServletRequest req, HttpServletResponse resp, HttpSession session)
			throws ServletException, IOException {

		NguoiDung currentUser = (NguoiDung) session.getAttribute("user");
		if (currentUser != null) {
			Double tongTien = Double.parseDouble(req.getParameter("tongTien"));
			System.out.println(tongTien);
			HoaDon hoaDon = new HoaDon();
			hoaDon.setNguoiDung(currentUser);
			hoaDon.setTongTien(tongTien);
			session.setAttribute("cart", new CartDto());
			resp.setStatus(200); // 200: ma HTTP success
		} else {
			resp.setStatus(400); // 400: bad request
		}
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
