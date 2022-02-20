package com.login;

import java.io.*;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.*;
import javax.servlet.http.*;

import com.fMem.model.FMemService;
import com.fMem.model.FMemVO;
import com.mem.model.MemService;
import com.mem.model.MemVO;

import javax.servlet.annotation.WebServlet;

@WebServlet("/login/LoginHandler.do")
public class LoginHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected boolean allowUser = false;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		
//		-----------------------------------------------小農登入-----------------------------------------------
		if ("fmem_login".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				// 【取得使用者 帳號(account) 密碼(password)】
				String account = (req.getParameter("f_mem_acc").trim());
				System.out.println(account);
				if (account == null || (account.trim()).length() == 0) {
					System.out.println(account);
					errorMsgs.add("請輸入帳號");
				}
				// 【取得使用者 帳號(account) 密碼(password)】
				String password = (req.getParameter("f_mem_pwd").trim());
				System.out.println(password);
				if (password == null || (password.trim()).length() == 0) {
					System.out.println(password);
					errorMsgs.add("請輸入密碼");
				}

				/*************************** 2.開始查詢資料 *****************************************/
				FMemService fmemSvc = new FMemService();
				FMemVO fMemVO = fmemSvc.findUserByFMem_acc(account);
				
				// 【檢查使用者輸入的帳號(account) 是否有效】
				if (fMemVO == null) {
					errorMsgs.add("帳號未註冊");
				}

				System.out.println("帳號有註冊");

				
				// 【檢查使用者輸入的密碼(password)是否有效】
				String passwordForValidate = fMemVO.getF_mem_pwd();
				if (passwordForValidate.equals(password)) {
					allowUser = true;
					System.out.println("密碼正確");
				} else {
					allowUser = false;
					errorMsgs.add("密碼不正確");
				}
				
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/login/loginByFmem.jsp");
					failureView.forward(req, res);
					return;// 帳密無效重回登入頁面
				}
				
				// 會員物件也查出來供轉交
				Integer mem_id = fMemVO.getMem_id();
				MemService memSvc = new MemService();
				MemVO memVO = memSvc.getOneMem(mem_id);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/

				// 【帳號 , 密碼有效時, 才做以下工作】
				HttpSession session = req.getSession();
				session.setAttribute("login", mem_id); // *工作1: 才在session內做已經登入過的標識
				// 為方便整合，小農與會員VO也一併轉交
				session.setAttribute("fMemVO", fMemVO);
				session.setAttribute("memVO", memVO);

				try {
					String location = (String) session.getAttribute("location");
					if (location != null) {
						session.removeAttribute("location"); // *工作2: 看看有無來源網頁 (-->如有來源網頁:則重導至來源網頁)
				        res.sendRedirect(location);  
						return;	
					}
				} catch (Exception ignored) {
				}

				RequestDispatcher successView = req.getRequestDispatcher("/front-end/home/home.jsp");
				successView.forward(req, res);
				// *工作3: // (-->如無來源網頁:則重導至首頁)

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				System.out.println("error in final");
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/login/loginByFmem.jsp");
				failureView.forward(req, res);
				System.out.println("登入失敗 error in final");
				e.printStackTrace();
			}
		}

		
		
//		-----------------------------------------------會員登入-----------------------------------------------
		if ("mem_login".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				// 【取得使用者 帳號(account) 密碼(password)】
				String account = (req.getParameter("mem_acc").trim());
				System.out.println(account);
				if (account == null || (account.trim()).length() == 0) {
					System.out.println(account);
					errorMsgs.add("請輸入帳號");
				}
				// 【取得使用者 帳號(account) 密碼(password)】
				String password = (req.getParameter("mem_pwd").trim());
				System.out.println(password);
				if (password == null || (password.trim()).length() == 0) {
					System.out.println(password);
					errorMsgs.add("請輸入密碼");
				}

				/*************************** 2.開始查詢資料 *****************************************/
				MemService memSvc = new MemService();
				MemVO memVO = memSvc.findUserByMem_acc(account);
				
				// 【檢查使用者輸入的帳號(account) 是否有效】
				if (memVO == null) {
					errorMsgs.add("帳號未註冊");
				}

				System.out.println("帳號有註冊");
				
				// 【檢查使用者輸入的密碼(password)是否有效】
				String passwordForValidate = memVO.getMem_pwd();
				if (passwordForValidate.equals(password)) {
					allowUser = true;
					System.out.println("密碼正確");
				} else {
					allowUser = false;
					errorMsgs.add("密碼不正確");
				}

				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/login/loginByMem.jsp");
					failureView.forward(req, res);
					return;// 帳密無效重回登入頁面
				}
				
				// 查出mem_id供未來識別是否登入過
				Integer mem_id = memVO.getMem_id();
				
				// 查出FMemVO供轉交
				FMemService fMemSvc = new FMemService();
				FMemVO fMemVO = fMemSvc.findUserByFMem_acc(account);
				// 【檢查使用者輸入的帳號(account) 是否有效】
				if (fMemVO == null) {
					System.out.println("小農身分未註冊");
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/

				// 【帳號 , 密碼有效時, 才做以下工作】
				HttpSession session = req.getSession();
				session.setAttribute("login", mem_id); // *工作1: 才在session內做已經登入過的標識
				// 會員VO也一併轉交
				session.setAttribute("memVO", memVO);
				session.setAttribute("fMemVO", fMemVO);
				
				try {
					String location = (String) session.getAttribute("location");
					if (location != null) {
						session.removeAttribute("location"); // *工作2: 看看有無來源網頁 (-->如有來源網頁:則重導至來源網頁)
				        res.sendRedirect(location);  
						return;
					}
				} catch (Exception ignored) {
				}

				RequestDispatcher successView = req.getRequestDispatcher("/front-end/home/home.jsp");
				successView.forward(req, res);
				// *工作3: // (-->如無來源網頁:則重導至首頁)

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				System.out.println("error in final");
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/login/loginByMem.jsp");
				failureView.forward(req, res);
				System.out.println("登入失敗 error in final");
				e.printStackTrace();
			}
		}
		
		
	}
}