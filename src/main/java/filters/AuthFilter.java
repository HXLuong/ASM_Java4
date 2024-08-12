package filters;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.NguoiDung;

/**
 * Servlet Filter implementation class AuthFilter
 */
@WebFilter(filterName = "AuthFilter", urlPatterns = { "/Bai3_AccountManagementServlet/*", "/UserServletBai3/*" })
public class AuthFilter implements filters.HttpFilter {
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

	@Override
	public void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		String uri = request.getRequestURI();
		NguoiDung user = (NguoiDung) request.getSession().getAttribute("user");
		String error = "";
//		System.out.println("AuthFilter running");
		if (user == null) {
			error = response.encodeURL("Please login to use this function!");
//			System.out.println("Vui lòng Đăng Nhập!");
		} else if (!user.getChucVu() && uri.contains("Bai3_AccountManagementServlet")) {
//			System.out.println("Vui lòng Đăng Nhập với vai trò Admin!");
			error = response.encodeURL("Please login with admin role!");
		}

		if (!error.isEmpty()) {
//			request.setCharacterEncoding("UTF-8");
//			response.setCharacterEncoding("UTF-8");
//			request.getSession().setAttribute("securi", uri);
			request.getSession().setAttribute("securi", error);
			System.out.println("Error!");
			response.sendRedirect("/ASM_Java4/views/login.jsp?error=" + response.encodeRedirectURL(error));
//			request.getRequestDispatcher("/views/login.jsp").forward(request, response);
		} else {
			System.out.println("No Error!");
			chain.doFilter(request, response);
			request.getSession().setMaxInactiveInterval(60);
		}
	}

}
