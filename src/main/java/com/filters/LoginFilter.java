package com.filters;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class LoginFilter implements Filter {

	private FilterConfig config;

	public void init(FilterConfig config) {
		this.config = config;
	}

	public void destroy() {
		config = null;
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws ServletException, IOException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		// 【取得 session】
		HttpSession session = req.getSession();
		// 【從 session 判斷此user是否登入過】
		Object login = session.getAttribute("login");
		if (login == null) {
			session.setAttribute("location", req.getRequestURI());
			res.sendRedirect(req.getContextPath() + "/front-end/login/loginByMem.jsp"); 
			//未登入者一律導至會員登入頁面，欲以小農身分登入者，自行點按"小農登入"鈕
			return;
		} else {
			chain.doFilter(request, response);
		}
	}
}