package com.administrator.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.administrator.model.AdministratorService;
import com.administrator.model.AdministratorVO;

public class AdministratorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("getOne_For_Display".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				String str = req.getParameter("admin_id");

				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入編號");
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/administrator/select_page.jsp");
					failureView.forward(req, res);
					return;
				}

				Integer admin_id = null;
				try {
					admin_id = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("格式不正確");
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/administrator/select_page.jsp");
					failureView.forward(req, res);
					return;
				}

				/***********************************************************/

				AdministratorService administratorService = new AdministratorService();
				AdministratorVO administratorVO = administratorService.getOneAdmin(admin_id);
				if (administratorVO == null) {
					errorMsgs.add("查無資料");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/administrator/select_page.jsp");
					failureView.forward(req, res);
					return;
				}

				/***********************************************************/

				req.setAttribute("administratorVO", administratorVO);
				String url = "/back-end/administrator/listOneAdmin.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/***********************************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureview = req.getRequestDispatcher("/back-end/administrator/select_page.jsp");
				failureview.forward(req, res);
			}

		}

		if ("getOne_For_Update".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				Integer admin_id = new Integer(req.getParameter("admin_id"));
				AdministratorService administratorService = new AdministratorService();
				AdministratorVO administratorVO = administratorService.getOneAdmin(admin_id);
				req.setAttribute("administratorVO", administratorVO);
				String url = "/back-end/administrator/update_admin_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureview = req.getRequestDispatcher("/back-end/administrator/listAllAdmin.jsp");
				failureview.forward(req, res);
			}
		}

		if ("update".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				
				Integer admin_id = new Integer(req.getParameter("admin_id").trim());
				Integer admin_type_id = new Integer(req.getParameter("admin_type_id").trim());
				String admin_acc = req.getParameter("admin_acc");// 英文或數字
				String admin_pwd = req.getParameter("admin_pwd");// 英文或數字
				Integer admin_isdeleted = new Integer(req.getParameter("admin_isdeleted").trim());
				
				String admin_name = req.getParameter("admin_name");
				String adminNameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if(admin_name==null || admin_name.trim().length()==0) {
					errorMsgs.add("admin_name請勿空白");
				}else if(!admin_name.trim().matches(adminNameReg)) {
					errorMsgs.add("只能是中、英文字母、數字和_,長度必需在2到10之間,請重新輸入");
				}
				
				String admin_email = req.getParameter("admin_email");
				String admin_mobile = req.getParameter("admin_mobile");
				Integer admin_zipcode = new Integer(req.getParameter("admin_zipcode").trim());
				String admin_city = req.getParameter("admin_city");
				String admin_dist = req.getParameter("admin_dist");
				String admin_addr = req.getParameter("admin_addr");
				java.sql.Date admin_hiredate = null;
				try {
					admin_hiredate = java.sql.Date.valueOf(req.getParameter("admin_hiredate").trim());
				} catch (IllegalArgumentException e) {
					admin_hiredate = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}
				java.sql.Date admin_leavedate = null;
				
				try {
					admin_leavedate = java.sql.Date.valueOf(req.getParameter("admin_leavedate").trim());
				} catch (IllegalArgumentException e) {
					admin_leavedate = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");//timestamp
				}
				
				AdministratorVO administratorVO = new AdministratorVO();
				administratorVO.setAdmin_id(admin_id);
				administratorVO.setAdmin_type_id(admin_type_id);
				administratorVO.setAdmin_acc(admin_acc);
				administratorVO.setAdmin_pwd(admin_pwd);
				administratorVO.setAdmin_isdeleted(admin_isdeleted);
				administratorVO.setAdmin_name(admin_name);
				administratorVO.setAdmin_email(admin_email);
				administratorVO.setAdmin_mobile(admin_mobile);
				administratorVO.setAdmin_zipcode(admin_zipcode);
				administratorVO.setAdmin_city(admin_city);
				administratorVO.setAdmin_dist(admin_dist);
				administratorVO.setAdmin_addr(admin_addr);
				administratorVO.setAdmin_hiredate(admin_hiredate);
				administratorVO.setAdmin_leavedate(admin_leavedate);

				if(!errorMsgs.isEmpty()) {
					req.setAttribute("administratorVO", administratorVO);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/administrator/update_admin_input.jsp");
					failureView.forward(req, res);
					return;
				}
				
				AdministratorService administratorService = new AdministratorService();
				administratorVO = administratorService.updateAdmin(admin_id, admin_type_id, admin_acc, admin_pwd, admin_isdeleted, admin_name, admin_email, admin_mobile, admin_zipcode, admin_city, admin_dist, admin_addr, admin_hiredate, admin_leavedate, null);
				
				req.setAttribute("administratorVO", administratorVO);
				String url = "/back-end/administrator/listOneAdmin.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
			} catch (Exception e) {
				errorMsgs.add("修改失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/administrator/update_admin_input.jsp");
				failureView.forward(req, res);
			}

		}

		if ("insert".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				
				Integer admin_type_id = new Integer(req.getParameter("admin_type_id").trim());
				String admin_acc = req.getParameter("admin_acc");// 英文或數字
				String admin_pwd = req.getParameter("admin_pwd");// 英文或數字
				Integer admin_isdeleted = new Integer(req.getParameter("admin_isdeleted").trim());
				
				String admin_name = req.getParameter("admin_name");
				String adminNameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if(admin_name==null || admin_name.trim().length()==0) {
					errorMsgs.add("admin_name請勿空白");
				}else if(!admin_name.trim().matches(adminNameReg)) {
					errorMsgs.add("只能是中、英文字母、數字和_,長度必需在2到10之間,請重新輸入");
				}
				
				String admin_email = req.getParameter("admin_email");
				String admin_mobile = req.getParameter("admin_mobile");
				Integer admin_zipcode = new Integer(req.getParameter("admin_zipcode").trim());
				String admin_city = req.getParameter("admin_city");
				String admin_dist = req.getParameter("admin_dist");
				String admin_addr = req.getParameter("admin_addr");
				
				java.sql.Date admin_hiredate = null;
				try {
					admin_hiredate = java.sql.Date.valueOf(req.getParameter("admin_hiredate").trim());
				} catch (IllegalArgumentException e) {
					admin_hiredate = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}
				
				java.sql.Date admin_leavedate = null;
				
				try {
					admin_leavedate = java.sql.Date.valueOf(req.getParameter("admin_leavedate").trim());
				} catch (IllegalArgumentException e) {
					admin_leavedate = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");//timestamp
				}
				
				AdministratorVO administratorVO = new AdministratorVO();
				administratorVO.setAdmin_type_id(admin_type_id);
				administratorVO.setAdmin_acc(admin_acc);
				administratorVO.setAdmin_pwd(admin_pwd);
				administratorVO.setAdmin_isdeleted(admin_isdeleted);
				administratorVO.setAdmin_name(admin_name);
				administratorVO.setAdmin_email(admin_email);
				administratorVO.setAdmin_mobile(admin_mobile);
				administratorVO.setAdmin_zipcode(admin_zipcode);
				administratorVO.setAdmin_city(admin_city);
				administratorVO.setAdmin_dist(admin_dist);
				administratorVO.setAdmin_addr(admin_addr);
				administratorVO.setAdmin_hiredate(admin_hiredate);
				administratorVO.setAdmin_leavedate(admin_leavedate);

				if(!errorMsgs.isEmpty()) {
					req.setAttribute("administratorVO", administratorVO);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/administrator/addAdmin.jsp");
					failureView.forward(req, res);
					return;
				}
				
				AdministratorService administratorService = new AdministratorService();
				administratorVO = administratorService.addAdmin(admin_type_id, admin_acc, admin_pwd, admin_isdeleted, admin_name, admin_email, admin_mobile, admin_zipcode, admin_city, admin_dist, admin_addr, admin_hiredate, admin_leavedate, null);
				
				String url = "/back-end/administrator/listAllAdmin.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/administrator/addAdmin.jsp");
				failureView.forward(req, res);
			}

		}

		if ("delete".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				
				Integer admin_id = new Integer(req.getParameter("admin_id"));
				AdministratorService administratorService = new AdministratorService();
				administratorService.deleteAdmin(admin_id);
				
				String url = "/back-end/administrator/listAllAdmin.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
				
			} catch (Exception e) {
				errorMsgs.add("刪除失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/administrator/listAllAdmin.jsp");
				failureView.forward(req, res);
			}

		}
	}


}
