package com.administrator.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.administrator.model.AdministratorService;
import com.administrator.model.AdministratorVO;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
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
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/administrator/listOneAdmin_s.jsp");
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
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/administrator/listOneAdmin_s.jsp");
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
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/administrator/listOneAdmin_s.jsp");
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
				RequestDispatcher failureview = req.getRequestDispatcher("/back-end/administrator/listOneAdmin_s.jsp");
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
			/*-------------------------------------------------------------------------*/
				String adminReg1 = "^[(a-zA-Z0-9_)]{2,20}$";
				String adminReg2 = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,20}$";
				String adminReg3 = "^[0-9]{10}$";
				String emailReg = "^(.+)@(.+)$";
			/*-------------------------------------------------------------------------*/
				Integer admin_id = new Integer(req.getParameter("admin_id").trim());
			
			/*-------------------------------------------------------------------------*/
				String admin_type_id_str = req.getParameter("admin_type_id");
				Integer admin_type_id =null;
				if(admin_type_id_str==null || (admin_type_id_str.trim()).length()==0) {
					errorMsgs.add("請選擇管理員類別");
				}else {
					admin_type_id = new Integer(admin_type_id_str.trim());
				}
			/*-------------------------------------------------------------------------*/
				String admin_acc = req.getParameter("admin_acc");// 英文|數字
				if (admin_acc == null || admin_acc.trim().length() == 0) {
					errorMsgs.add("帳號請勿空白");
				} else if (!admin_acc.trim().matches(adminReg1)) {
					errorMsgs.add("帳號格式錯誤,請重新輸入");
				}
			/*-------------------------------------------------------------------------*/
				String admin_pwd = req.getParameter("admin_pwd");// 英文|數字
				if (admin_pwd == null || admin_pwd.trim().length() == 0) {
					errorMsgs.add("密碼請勿空白");
				} else if (!admin_pwd.trim().matches(adminReg1)) {
					errorMsgs.add("密碼格式錯誤,請重新輸入");
				}
			/*-------------------------------------------------------------------------*/
				Integer admin_isdeleted = new Integer(req.getParameter("admin_isdeleted").trim());
				//radio select
			/*-------------------------------------------------------------------------*/
				String admin_name = req.getParameter("admin_name");// 中文|英文|數字
				if (admin_name == null || admin_name.trim().length() == 0) {
					errorMsgs.add("姓名請勿空白");
				} else if (!admin_name.trim().matches(adminReg2)) {
					errorMsgs.add("姓名格式錯誤,請重新輸入");
				}
			/*-------------------------------------------------------------------------*/
				String admin_email = req.getParameter("admin_email");
				if (admin_email == null || admin_email.trim().length() == 0) {
					errorMsgs.add("email請勿空白");
				} else if (!admin_email.trim().matches(emailReg)) {
					errorMsgs.add("email格式錯誤,請重新輸入");
				}
			/*-------------------------------------------------------------------------*/
				String admin_mobile = req.getParameter("admin_mobile");
				if (admin_mobile == null || admin_mobile.trim().length() == 0) {
					errorMsgs.add("手機號碼請勿空白");
				} else if (!admin_mobile.trim().matches(adminReg3)) {
					errorMsgs.add("手機格式錯誤,請重新輸入");
				}
			/*-------------------------------------------------------------------------*/
				Integer admin_zipcode = null;
				try {
					admin_zipcode = new Integer(req.getParameter("admin_zipcode").trim());
				} catch (Exception e) {
				    admin_zipcode = 100;
					errorMsgs.add("郵遞區號格式錯誤,請重新輸入");
				}
				if(admin_zipcode>=1000 || admin_zipcode<0) {
					errorMsgs.add("郵遞區號錯誤");
				}
			/*-------------------------------------------------------------------------*/
				String admin_city = req.getParameter("admin_city");// 中文|英文|數字
				if (admin_city == null || admin_city.trim().length() == 0) {
					errorMsgs.add("縣市請勿空白");
				} else if (!admin_city.trim().matches(adminReg2)) {
					errorMsgs.add("縣市格式錯誤,請重新輸入");
				}
				String admin_dist = req.getParameter("admin_dist");// 中文|英文|數字
				if (admin_dist == null || admin_dist.trim().length() == 0) {
					errorMsgs.add("地區請勿空白");
				} else if (!admin_dist.trim().matches(adminReg2)) {
					errorMsgs.add("地區格式錯誤,請重新輸入");
				}
				String admin_addr = req.getParameter("admin_addr");// 中文|英文|數字
				if (admin_addr == null || admin_addr.trim().length() == 0) {
					errorMsgs.add("地址請勿空白");
				} else if (!admin_addr.trim().matches(adminReg2)) {
					errorMsgs.add("地址格式錯誤,請重新輸入");
				}
			/*-------------------------------------------------------------------------*/
				java.sql.Date admin_hiredate = null;
				try {
					admin_hiredate = java.sql.Date.valueOf(req.getParameter("admin_hiredate").trim());
				} catch (IllegalArgumentException e) {
					admin_hiredate = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}
			/*-------------------------------------------------------------------------*/
				java.sql.Date admin_leavedate = null;
				try {
					admin_leavedate = java.sql.Date.valueOf(req.getParameter("admin_leavedate").trim());
				} catch (IllegalArgumentException e) {
					if (admin_isdeleted==1 && admin_leavedate==null) {
					} else {
						admin_leavedate = new java.sql.Date(System.currentTimeMillis());
						errorMsgs.add("請輸入日期!");
					}
				}
			/*-------------------------------------------------------------------------*/
				Part part = req.getPart("admin_pic");
				InputStream in = part.getInputStream();
//				if(in.available()==0) {
//					errorMsgs.add("沒有選擇照片");
//				}
				
				byte[] admin_pic = new byte[in.available()];
				in.read(admin_pic);
				in.close();
			/*-------------------------------------------------------------------------*/
				AdministratorService administratorService = new AdministratorService();
				AdministratorVO administratorVO = administratorService.getOneAdmin(admin_id);
				
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
				if(admin_pic.length == 0) {
					admin_pic = administratorVO.getAdmin_pic();
				}else {
					administratorVO.setAdmin_pic(admin_pic);
				}
				administratorVO.setAdmin_hiredate(admin_hiredate);
				if (admin_leavedate != null) {
					administratorVO.setAdmin_leavedate(admin_leavedate);
				}

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("administratorVO", administratorVO);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/administrator/update_admin_input.jsp");
					failureView.forward(req, res);
					return;
				}

				administratorVO = administratorService.updateAdmin(admin_id, admin_type_id, admin_acc, admin_pwd,
						admin_isdeleted, admin_name, admin_email, admin_mobile, admin_zipcode, admin_city, admin_dist,
						admin_addr, admin_hiredate, admin_leavedate, admin_pic);

				req.setAttribute("administratorVO", administratorVO);
				String url = "/back-end/administrator/listOneAdmin.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("修改失敗:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/administrator/update_admin_input.jsp");
				failureView.forward(req, res);
			}

		}

		if ("insert".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
			/*-------------------------------------------------------------------------*/
				String adminReg1 = "^[(a-zA-Z0-9_)]{2,20}$";
				String adminReg2 = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,20}$";
				String adminReg3 = "^[0-9]{10}$";
				String emailReg = "^(.+)@(.+)$";
			/*-------------------------------------------------------------------------*/
				String admin_type_id_str = req.getParameter("admin_type_id");
				Integer admin_type_id =null;
				if(admin_type_id_str==null || (admin_type_id_str.trim()).length()==0) {
					errorMsgs.add("請選擇管理員類別");
				}else {
					admin_type_id = new Integer(admin_type_id_str.trim());
				}
				//radio select
			/*-------------------------------------------------------------------------*/
				String admin_acc = req.getParameter("admin_acc");// 英文|數字
				if (admin_acc == null || admin_acc.trim().length() == 0) {
					errorMsgs.add("帳號請勿空白");
				} else if (!admin_acc.trim().matches(adminReg1)) {
					errorMsgs.add("帳號格式錯誤,請重新輸入");
				}
			/*-------------------------------------------------------------------------*/
				String admin_pwd = req.getParameter("admin_pwd");// 英文|數字
				if (admin_pwd == null || admin_pwd.trim().length() == 0) {
					errorMsgs.add("密碼請勿空白");
				} else if (!admin_pwd.trim().matches(adminReg1)) {
					errorMsgs.add("密碼格式錯誤,請重新輸入");
				}
			/*-------------------------------------------------------------------------*/
				Integer admin_isdeleted = new Integer(req.getParameter("admin_isdeleted").trim());
				//radio select
			/*-------------------------------------------------------------------------*/
				String admin_name = req.getParameter("admin_name");// 中文|英文|數字
				if (admin_name == null || admin_name.trim().length() == 0) {
					errorMsgs.add("姓名請勿空白");
				} else if (!admin_name.trim().matches(adminReg2)) {
					errorMsgs.add("姓名格式錯誤,請重新輸入");
				}
			/*-------------------------------------------------------------------------*/
				String admin_email = req.getParameter("admin_email");
				if (admin_email == null || admin_email.trim().length() == 0) {
					errorMsgs.add("email請勿空白");
				} else if (!admin_email.trim().matches(emailReg)) {
					errorMsgs.add("email格式錯誤,請重新輸入");
				}
			/*-------------------------------------------------------------------------*/
				String admin_mobile = req.getParameter("admin_mobile");
				if (admin_mobile == null || admin_mobile.trim().length() == 0) {
					errorMsgs.add("手機號碼請勿空白");
				} else if (!admin_mobile.trim().matches(adminReg3)) {
					errorMsgs.add("手機格式錯誤,請重新輸入");
				}
			/*-------------------------------------------------------------------------*/
				Integer admin_zipcode = null;
				try {
					admin_zipcode = new Integer(req.getParameter("admin_zipcode").trim());
				} catch (Exception e) {
					admin_zipcode = 100;
					errorMsgs.add("郵遞區號格式錯誤,請重新輸入");
				}
				if(admin_zipcode>=1000 || admin_zipcode<0) {
					errorMsgs.add("郵遞區號錯誤");
				}
			/*-------------------------------------------------------------------------*/
				String admin_city = req.getParameter("admin_city");// 中文|英文|數字
				if (admin_city == null || admin_city.trim().length() == 0) {
					errorMsgs.add("縣市請勿空白");
				} else if (!admin_city.trim().matches(adminReg2)) {
					errorMsgs.add("縣市格式錯誤,請重新輸入");
				}
				String admin_dist = req.getParameter("admin_dist");// 中文|英文|數字
				if (admin_dist == null || admin_dist.trim().length() == 0) {
					errorMsgs.add("地區請勿空白");
				} else if (!admin_dist.trim().matches(adminReg2)) {
					errorMsgs.add("地區格式錯誤,請重新輸入");
				}
				String admin_addr = req.getParameter("admin_addr");// 中文|英文|數字
				if (admin_addr == null || admin_addr.trim().length() == 0) {
					errorMsgs.add("地址請勿空白");
				} else if (!admin_addr.trim().matches(adminReg2)) {
					errorMsgs.add("地址格式錯誤,請重新輸入");
				}
			/*-------------------------------------------------------------------------*/
				java.sql.Date admin_hiredate = null;
				try {
					admin_hiredate = java.sql.Date.valueOf(req.getParameter("admin_hiredate").trim());
				} catch (IllegalArgumentException e) {
					admin_hiredate = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}
			/*-------------------------------------------------------------------------*/
				java.sql.Date admin_leavedate = null;
				try {
					admin_leavedate = java.sql.Date.valueOf(req.getParameter("admin_leavedate").trim());
				} catch (IllegalArgumentException e) {
					if (admin_isdeleted==1 && admin_leavedate==null) {
					} else {
						admin_leavedate = new java.sql.Date(System.currentTimeMillis());
						errorMsgs.add("請輸入日期!");
					}
				}
			/*-------------------------------------------------------------------------*/
				Part part = req.getPart("admin_pic");
				InputStream in = part.getInputStream();
				if (in.available() == 0) {
					errorMsgs.add("沒有選擇照片");
				}
				byte[] admin_pic = new byte[in.available()];
				in.read(admin_pic);
				in.close();
			/*-------------------------------------------------------------------------*/
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
				administratorVO.setAdmin_pic(admin_pic);
				administratorVO.setAdmin_hiredate(admin_hiredate);
				if (admin_leavedate != null) {
					administratorVO.setAdmin_leavedate(admin_leavedate);
				}

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("administratorVO", administratorVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/administrator/addAdmin.jsp");
					failureView.forward(req, res);
					return;
				}

				AdministratorService administratorService = new AdministratorService();
				administratorVO = administratorService.addAdmin(admin_type_id, admin_acc, admin_pwd, admin_isdeleted,
						admin_name, admin_email, admin_mobile, admin_zipcode, admin_city, admin_dist, admin_addr,
						admin_hiredate, admin_leavedate, admin_pic);

				String url = "/back-end/administrator/listAllAdmin.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/administrator/addAdmin.jsp");
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
				errorMsgs.add("刪除失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/administrator/listAllAdmin.jsp");
				failureView.forward(req, res);
			}

		}

		if ("logout".equals(action)) {
			HttpSession session = req.getSession();
			session.invalidate();

			String url = "/back-end/adminLogin/login.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		}
	}

}
