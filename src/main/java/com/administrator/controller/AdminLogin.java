package com.administrator.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.administrator.model.AdministratorService;
import com.administrator.model.AdministratorVO;

public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	AdministratorVO adminLoginVO = null;

	protected boolean allowUser(String account, String password) {
		AdministratorService administratorService = new AdministratorService();
		List<AdministratorVO> allAdmin = administratorService.getAll();
		for (AdministratorVO vo : allAdmin) {
			if (vo.getAdmin_acc().equals(account) && vo.getAdmin_pwd().equals(password)) {
				adminLoginVO = vo;
				break;
			}
		}
		if (adminLoginVO != null && adminLoginVO.getAdmin_isdeleted() == 1) {
			return true;
		} else {
			return false;
		}
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();

		String account = req.getParameter("account");
		String password = req.getParameter("password");
		
		HttpSession session = req.getSession();
		String action = req.getParameter("action");

		if ("login".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			if (!allowUser(account, password)) {
				errorMsgs.add("帳號密碼錯誤,請重新登入!");
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/adminLogin/login.jsp");
				failureView.forward(req, res);
				return;
			} else {
				session.setAttribute("account", account);
				session.setAttribute("adminLoginVO", adminLoginVO);
				try {
					String location = (String) session.getAttribute("location");
					if (location != null) {
						session.removeAttribute("location");
						res.sendRedirect(location);
						return;
					}
				} catch (Exception ignored) {}
				res.sendRedirect(req.getContextPath() + "/back-end/administrator/listOneAdmin_s.jsp");
			}
		}

		if ("change_pwd".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				String password1 = req.getParameter("password1");
				String password2 = req.getParameter("password2");
				if (password1 == null || (password1.trim()).length() == 0) {
					errorMsgs.add("請輸入密碼");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/adminLogin/changePwd.jsp");
					failureView.forward(req, res);
					return;
				}
				if (password2 == null || (password2.trim()).length() == 0 || !(password1.equals(password2))) {
					errorMsgs.add("請重新確認密碼");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/adminLogin/changePwd.jsp");
					failureView.forward(req, res);
					return;
				}
				
				
				/***********************************************************/
				
				
				AdministratorService administratorService = new AdministratorService();
				AdministratorVO administratorVO = administratorService.updateAdminPwd(adminLoginVO, password1);
				
				session.setAttribute("adminLoginVO", administratorVO);
				String url = "/back-end/administrator/listOneAdmin_s.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("修改失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/adminLogin/login.jsp");
				failureView.forward(req, res);
			}
		}
	}
}