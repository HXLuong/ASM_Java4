package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import dao.NguoiDungDAO;
import model.NguoiDung;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet({ "/LoginServlet", "/account/log-in", "/account/sign-up", "/account/edit-profile", "/account/change-pass",
		"/LoginServlet/*" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getSession().setAttribute("user", null);

		request.getRequestDispatcher("/views/login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");

		String uri = request.getRequestURI();
		if (uri.contains("log-in")) {
			logIn(request, response);
		} else if (uri.contains("sign-up")) {
			signUp(request, response);
		} else if (uri.contains("edit-profile")) {
			editProfile(request, response);
		} else if (uri.contains("change-pass")) {
			changePass(request, response);
		}
	}

	private void logIn(HttpServletRequest request, HttpServletResponse response) {
		try {
			String id = request.getParameter("userID");
			String pw = request.getParameter("password");

			NguoiDungDAO dao = new NguoiDungDAO();

			NguoiDung user = dao.findById(id);
//			System.out.println("user: " + user.getId_ND());
//			System.out.println("password: " + user.getMatKhau());

			if (!user.getMatKhau().equalsIgnoreCase(pw)) {
				request.setAttribute("message", "Mật khẩu không đúng!");
				request.getRequestDispatcher("/views/login.jsp").forward(request, response);
			} else if (!user.getChucVu()) {
				request.getSession().setAttribute("user", user);
				request.getSession().setMaxInactiveInterval(60);
				request.getRequestDispatcher("/index").forward(request, response);
			} else {
				request.getSession().setAttribute("user", user);
				request.getSession().setMaxInactiveInterval(60);
				request.setAttribute("Title", "Quản Lý Người Dùng");
				request.getRequestDispatcher("/user/index").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void signUp(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String pw = request.getParameter("matKhau");
			String Vpw = request.getParameter("ValPassword");
			if (pw.equalsIgnoreCase(Vpw)) {
				NguoiDung user = new NguoiDung();
				BeanUtils.populate(user, request.getParameterMap());
				NguoiDungDAO dao = new NguoiDungDAO();
				dao.insert(user);
				request.setAttribute("message", "Đăng ký thành công!");
				request.getRequestDispatcher("/views/login.jsp").forward(request, response);
			} else {
				request.setAttribute("message", "Xác nhận mật khẩu không đúng!");
				request.getRequestDispatcher("/views/dangky.jsp").forward(request, response);
			}
		} catch (Exception e) {
			request.setAttribute("message", "Đăng ký không thành công!");
			request.getRequestDispatcher("/views/dangky.jsp").forward(request, response);
		}
	}

	private void editProfile(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		NguoiDung user = (NguoiDung) request.getSession().getAttribute("user");
		String method = request.getMethod();
		if (method.equalsIgnoreCase("POST")) {
			try {
				BeanUtils.populate(user, request.getParameterMap());
				NguoiDungDAO dao = new NguoiDungDAO();
				dao.update(user);
				request.setAttribute("message", "Cập nhật thành công!");
				request.getRequestDispatcher("/views/CapNhatHoSo.jsp").forward(request, response);
			} catch (Exception e) {
				request.setAttribute("error", "Cập nhật không thành công!");
				request.getRequestDispatcher("/views/CapNhatHoSo.jsp").forward(request, response);
			}

		}
	}

	private void changePass(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		NguoiDung user = (NguoiDung) request.getSession().getAttribute("user");
		String Opw = request.getParameter("Oldpassword");
		String Npw = request.getParameter("Newpassword");
		String Vpw = request.getParameter("Valpassword");
		String method = request.getMethod();
		if (method.equalsIgnoreCase("POST")) {
			try {
				if (!user.getMatKhau().equalsIgnoreCase(Opw)) {
					request.setAttribute("error", "Mật khẩu cũ không đúng!");
					request.getRequestDispatcher("/views/DoiMatKhau.jsp").forward(request, response);
				} else if (!Npw.equalsIgnoreCase(Vpw)) {
					request.setAttribute("error", "Xác nhận mật khẩu không đúng!");
					request.getRequestDispatcher("/views/DoiMatKhau.jsp").forward(request, response);
				} else {
					BeanUtils.populate(user, request.getParameterMap());
					user.setMatKhau(Npw);
					NguoiDungDAO dao = new NguoiDungDAO();
					dao.update(user);
					request.setAttribute("message", "Đổi mật khẩu thành công!");
					request.getRequestDispatcher("/views/DoiMatKhau.jsp").forward(request, response);
				}
			} catch (Exception e) {
				request.setAttribute("error", "Đổi mật khẩu không thành công!");
				request.getRequestDispatcher("/views/DoiMatKhau.jsp").forward(request, response);
			}
		}
	}
}
