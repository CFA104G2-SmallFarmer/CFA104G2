package com.filters;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.mem.model.MemVO;

public class fMemLoginFilter implements Filter {

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

		HttpSession session = req.getSession();
		
		MemVO memVO = (MemVO)session.getAttribute("memVO");
		
		try {
			Integer mem_id_state = memVO.getMem_id_state();
			// 判斷是否註冊過小農
			if (mem_id_state == 0) {
				String message="請先註冊小農!!";
			    session.setAttribute("message", message);
				res.sendRedirect(req.getContextPath() + "/front-end/home/home.jsp"); 
				return;
			} else {
				chain.doFilter(request, response);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ServletException e) {
			e.printStackTrace();
		}
	}
}