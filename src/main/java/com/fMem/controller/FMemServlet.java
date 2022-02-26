package com.fMem.controller;
// 等待驗證碼產生util
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.fMem.model.FMemService;
import com.fMem.model.FMemVO;
import com.mem.model.MemService;
import com.mem.model.MemVO;
@MultipartConfig
// 前後台的mem可能需要分開寫servlet，可能解決方法:分別註冊back-end與front-end的url
public class FMemServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		

		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求，已完成

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String str = req.getParameter("f_mem_id");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入小農編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/fMem/listAllFMem.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				Integer f_mem_id = null;
				try {
					f_mem_id = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("小農編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/fMem/listAllFMem.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************2.開始查詢資料*****************************************/
				FMemService fMemSvc = new FMemService();
				FMemVO fMemVO = fMemSvc.getOneFMem(f_mem_id);
				if (fMemVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/fMem/listAllFMem.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("fMemVO", fMemVO); // 資料庫取出的memVO物件,存入req
				String url = "/back-end/fMem/listOneFMem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneMem.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/fMem/listAllFMem.jsp");
				failureView.forward(req, res);
			}
		}
		
        if ("insert".equals(action)) { // 來自addEmp.jsp的請求  
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				Integer mem_id = new Integer(req.getParameter("mem_id").trim());
				
				FMemVO fMemVO = new FMemVO();
				MemService memSvc = new MemService();
				MemVO memVO = memSvc.getOneMem(mem_id);
				
				// 判斷是否已經註冊過
				if(memVO.getMem_id_state() == 1) {
					errorMsgs.add("您已註冊過小農，請勿重複註冊");
				}

String f_mem_acc = req.getParameter("f_mem_acc");
				String fMemAccReg = "^([A-Za-z0-9_\\-\\.])+\\@([A-Za-z0-9_\\-\\.])+\\.([A-Za-z]{2,4})?$";
				if (f_mem_acc == null || f_mem_acc.trim().length() == 0) {
					errorMsgs.add("小農帳號: 請勿空白");
				} else if(!f_mem_acc.trim().matches(fMemAccReg)) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("不符合帳號格式，請輸入正確e-mail");
	            }
				
String f_mem_pwd = req.getParameter("f_mem_pwd").trim();
				String fMemReg = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,}$";
				if (f_mem_pwd == null || f_mem_pwd.trim().length() == 0) {
					errorMsgs.add("請輸入密碼");
				} else if (!f_mem_pwd.trim().matches(fMemReg)) {
					errorMsgs.add("密碼至少8個字符，至少1個大寫字母，1個小寫字母和1個數字");
				}
String f_mem_pwd2 = req.getParameter("f_mem_pwd2").trim();
				if (f_mem_pwd2 == null || f_mem_pwd2.trim().length() == 0) {
					errorMsgs.add("請輸入密碼");
				} else if (f_mem_pwd2 != null && !f_mem_pwd2.equals(f_mem_pwd)) {
					errorMsgs.add("兩次輸入的密碼不一致!");
				}
				
String f_mem_fname = req.getParameter("f_mem_fname").trim();
				if (f_mem_fname == null || f_mem_fname.trim().length() == 0) {
					errorMsgs.add("農場名稱請勿空白");
				}
				
				String f_mem_mobile = req.getParameter("f_mem_mobile").trim();
				String mobileReg = "^09[0-9]{8}$";
				if (f_mem_mobile == null || f_mem_mobile.trim().length() == 0) {
					errorMsgs.add("請填入手機號碼.");
				} else if (!f_mem_mobile.trim().matches(mobileReg)) {
					errorMsgs.add("請輸入正確的手機號碼格式");
				}
				
				Integer f_mem_zipcode = new Integer(req.getParameter("f_mem_zipcode").trim());
				
				String f_mem_city = req.getParameter("f_mem_city").trim();
				if (f_mem_city == null || f_mem_city.trim().length() == 0) {
					errorMsgs.add("縣市請勿空白");
				}

				String f_mem_dist = req.getParameter("f_mem_dist").trim();
				if (f_mem_dist == null || f_mem_dist.trim().length() == 0) {
					errorMsgs.add("鄉鎮區請勿空白");
				} 

				String f_mem_add = req.getParameter("f_mem_add").trim();
				if (f_mem_add == null || f_mem_add.trim().length() == 0) {
					errorMsgs.add("地址請勿空白");
				} 
				
				
//				Part part = req.getPart("f_mem_pic");
//				
//				byte[] f_mem_pic = null;
//				if (part == null || part.getSize() == 0) {
//				} else {
//					req.setAttribute("fMemVO", fMemVO);
//					InputStream in = part.getInputStream();
//					f_mem_pic = new byte[in.available()];
//					in.read(f_mem_pic);
//					in.close();
//				}
//				
//				Part part2 = req.getPart("organic_certi");
//
//				byte[] organic_certi = null;
//				if (part2 == null || part2.getSize() == 0) {
//				} else {
//					req.setAttribute("fMemVO", fMemVO);
//					InputStream in = part.getInputStream();
//					organic_certi = new byte[in.available()];
//					in.read(organic_certi);
//					in.close();
//				}
//				
//				Part part3 = req.getPart("env_friendly_certi");
//
//				byte[] env_friendly_certi = null;
//				if (part3 == null || part3.getSize() == 0) {
//				} else {
//					req.setAttribute("fMemVO", fMemVO);
//					InputStream in = part.getInputStream();
//					env_friendly_certi = new byte[in.available()];
//					in.read(env_friendly_certi);
//					in.close();
//				}
				

				fMemVO.setMem_id(mem_id);
				fMemVO.setF_mem_acc(f_mem_acc);
				fMemVO.setF_mem_pwd(f_mem_pwd);
				fMemVO.setF_mem_fname(f_mem_fname);
				fMemVO.setF_mem_mobile(f_mem_mobile);
				fMemVO.setF_mem_zipcode(f_mem_zipcode);
				fMemVO.setF_mem_city(f_mem_city);
				fMemVO.setF_mem_dist(f_mem_dist);
				fMemVO.setF_mem_add(f_mem_add);
//				fMemVO.setF_mem_pic(f_mem_pic);
//				fMemVO.setOrganic_certi(organic_certi);
//				fMemVO.setEnv_friendly_certi(env_friendly_certi);
				
//				寄送郵件寫這
				
//				String to = f_mem_acc;
//				      
//				String subject = "密碼通知";
//				      
//				String ch_name = memVO.getMem_name();
//				String passRandom = "111";
//				String messageText = "親愛的會員 " + ch_name + " 請謹記此密碼: " + passRandom + "\n" +" (已經啟用)"; 
//				       
//				MailService mailService = new MailService();
//				mailService.sendMail(to, subject, messageText);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
req.setAttribute("fMemVO", fMemVO); // 含有輸入格式錯誤的fMemVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/fMem/addFMem.jsp");//尚未更改
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.開始新增資料***************************************/
				FMemService fMemSvc = new FMemService();
				fMemVO = fMemSvc.addFMem(mem_id, f_mem_acc, f_mem_pwd, f_mem_fname, 
						f_mem_mobile, f_mem_zipcode, f_mem_city, f_mem_dist, f_mem_add);

				memSvc.updateMemIDAccState(mem_id, 1);
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "/front-end/fMem/addFMem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);				
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/fMem/addFMem.jsp");
				failureView.forward(req, res);
			}
		}
        
		if ("updateAccCer".equals(action)) { // 來自listAllMem.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/	
				Integer f_mem_id = new Integer(req.getParameter("f_mem_id").trim());
				
				Integer acc_state = new Integer(req.getParameter("acc_state").trim());
				
				Integer certi_state = new Integer(req.getParameter("certi_state").trim());
				
				
				FMemVO fMemVO = new FMemVO();
				fMemVO.setF_mem_id(f_mem_id);
				fMemVO.setAcc_state(acc_state);
				fMemVO.setCerti_state(certi_state);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
req.setAttribute("fMemVO", fMemVO); // 含有輸入格式錯誤的memVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/fMem/listAllFMem.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				
				/***************************2.開始修改資料*****************************************/
				FMemService fMemSvc = new FMemService();
				fMemVO = fMemSvc.updateAccCer(f_mem_id, acc_state, certi_state);
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("fMemVO", fMemVO); // 資料庫update成功後,正確的的memVO物件,存入req
				String url = "/back-end/fMem/listAllFMem.jsp";
				//印出成功視窗尚未完成，導向位置尚未決定
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listAllMem.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/fMem/listAllFMem.jsp");
				failureView.forward(req, res);
			}
		}
        
if ("updateAuthenticate".equals(action)) { // 來自addEmp.jsp的請求  
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				Integer f_mem_id = new Integer(req.getParameter("f_mem_id").trim());
				
				FMemService fmemSvc = new FMemService();
				FMemVO fMemVO = fmemSvc.getOneFMem(f_mem_id);

				
				Part part1 = req.getPart("organic_certi");

				byte[] organic_certi = null;
				if (part1 == null || part1.getSize() == 0) {
				} else {
					req.setAttribute("fMemVO", fMemVO);
					InputStream in = part1.getInputStream();
					organic_certi = new byte[in.available()];
					in.read(organic_certi);
					in.close();
				}
				
				Part part2 = req.getPart("env_friendly_certi");

				byte[] env_friendly_certi = null;
				if (part2 == null || part2.getSize() == 0) {
				} else {
					req.setAttribute("fMemVO", fMemVO);
					InputStream in = part2.getInputStream();
					env_friendly_certi = new byte[in.available()];
					in.read(env_friendly_certi);
					in.close();
				}
				

				fMemVO.setOrganic_certi(organic_certi);
				fMemVO.setEnv_friendly_certi(env_friendly_certi);
				

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
req.setAttribute("fMemVO", fMemVO); // 含有輸入格式錯誤的fMemVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/fMem/fMemAccreditationVerify.jsp");//尚未更改
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.開始新增資料***************************************/
				FMemService fMemSvc = new FMemService();
				fMemVO = fMemSvc.updateAuthenticate(organic_certi, env_friendly_certi,f_mem_id);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "/front-end/fMem/fMemAccreditationVerify.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);				
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/fMem/fMemAccreditationVerify.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("Update_FMem_Input".equals(action)) { // 來自update_fmem_input.jsp的請求
	
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

		try {
		/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
			FMemVO fMemVO = new FMemVO();
Integer f_mem_id = new Integer(req.getParameter("f_mem_id").trim());

String f_mem_acc = req.getParameter("f_mem_acc");
			String fMemAccReg = "^([A-Za-z0-9_\\-\\.])+\\@([A-Za-z0-9_\\-\\.])+\\.([A-Za-z]{2,4})?$";
			if (f_mem_acc == null || f_mem_acc.trim().length() == 0) {
				errorMsgs.add("小農帳號: 請勿空白");
			} else if(!f_mem_acc.trim().matches(fMemAccReg)) { //以下練習正則(規)表示式(regular-expression)
			errorMsgs.add("不符合帳號格式，請輸入正確e-mail");
			}

String f_mem_pwd = req.getParameter("f_mem_pwd").trim();
			String fMemReg = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,}$";
			if (f_mem_pwd == null || f_mem_pwd.trim().length() == 0) {
				errorMsgs.add("請輸入密碼");
			} else if (!f_mem_pwd.trim().matches(fMemReg)) {
				errorMsgs.add("至少8個字符，至少1個大寫字母，1個小寫字母和1個數字");
			}
		
String f_mem_pwd2 = req.getParameter("f_mem_pwd2").trim();
		if (f_mem_pwd2 == null || f_mem_pwd2.trim().length() == 0) {
			errorMsgs.add("請輸入密碼");
		} else if (f_mem_pwd2 != null && !f_mem_pwd2.equals(f_mem_pwd)) {
			errorMsgs.add("兩次輸入的密碼不一致!");
		}

String f_mem_fname = req.getParameter("f_mem_fname").trim();
			if (f_mem_fname == null || f_mem_fname.trim().length() == 0) {
				errorMsgs.add("農場名稱請勿空白");
			}

String f_mem_info = req.getParameter("f_mem_info").trim();
		

String f_mem_mobile = req.getParameter("f_mem_mobile").trim();
			String mobileReg = "^09[0-9]{8}$";
			if (f_mem_mobile == null || f_mem_mobile.trim().length() == 0) {
				errorMsgs.add("請填入手機號碼.");
			} else if (!f_mem_mobile.trim().matches(mobileReg)) {
				errorMsgs.add("請輸入正確的手機號碼格式");
			}

String f_mem_tel = req.getParameter("f_mem_tel").trim();
			String telReg = "^(^(\\d{3,4}-)?\\d{7,8})$|(13[0-9]{9})$";
			if (!f_mem_mobile.trim().matches(mobileReg)) {
				errorMsgs.add("請輸入正確的市話格式");
			}
		
Integer f_mem_zipcode = new Integer(req.getParameter("f_mem_zipcode").trim());

String f_mem_city = req.getParameter("f_mem_city").trim();
			if (f_mem_city == null || f_mem_city.trim().length() == 0) {
				errorMsgs.add("縣市請勿空白");
			}	

String f_mem_dist = req.getParameter("f_mem_dist").trim();
			if (f_mem_dist == null || f_mem_dist.trim().length() == 0) {
				errorMsgs.add("鄉鎮區請勿空白");
			} 

String f_mem_add = req.getParameter("f_mem_add").trim();
			if (f_mem_add == null || f_mem_add.trim().length() == 0) {
				errorMsgs.add("地址請勿空白");
			} 

		Part part = req.getPart("f_mem_pic");

		byte[] f_mem_pic = null;
		if (part == null || part.getSize() == 0) {
			req.setAttribute("fMemVO", fMemVO);
			FMemService fMemSvc2 = new FMemService();
			FMemVO fMemVO2 = fMemSvc2.getOneFMem(f_mem_id);
			f_mem_pic = fMemVO2.getF_mem_pic();

		} else {
			req.setAttribute("fMemVO", fMemVO);
			InputStream in = part.getInputStream();
			f_mem_pic = new byte[in.available()];
			in.read(f_mem_pic);
			in.close();
		}
		fMemVO.setF_mem_id(f_mem_id);
		fMemVO.setF_mem_acc(f_mem_acc);
		fMemVO.setF_mem_pwd(f_mem_pwd);
		fMemVO.setF_mem_fname(f_mem_fname);
		fMemVO.setF_mem_info(f_mem_info);
		fMemVO.setF_mem_mobile(f_mem_mobile);
		fMemVO.setF_mem_tel(f_mem_tel);
		fMemVO.setF_mem_zipcode(f_mem_zipcode);
		fMemVO.setF_mem_city(f_mem_city);
		fMemVO.setF_mem_dist(f_mem_dist);
		fMemVO.setF_mem_add(f_mem_add);
		fMemVO.setF_mem_pic(f_mem_pic);
		
		// Send the use back to the form, if there were errors
		if (!errorMsgs.isEmpty()) {
req.setAttribute("fMemVO", fMemVO); // 含有輸入格式錯誤的memVO物件,也存入req
			RequestDispatcher failureView = req
					.getRequestDispatcher("/front-end/fMem/update_fmem_input.jsp");
			failureView.forward(req, res);
			return; //程式中斷
		}
		
		/***************************2.開始修改資料*****************************************/
		FMemService fMemSvc = new FMemService();
		fMemVO = fMemSvc.updateFMemInput(f_mem_id, f_mem_acc, f_mem_pwd, f_mem_fname, 
				f_mem_info, f_mem_mobile, f_mem_tel, f_mem_zipcode, f_mem_city, f_mem_dist, 
				f_mem_add, f_mem_pic);
		
		/***************************3.修改完成,準備轉交(Send the Success view)*************/
		req.setAttribute("fMemVO", fMemVO); // 資料庫update成功後,正確的的memVO物件,存入req
		String url = "/front-end/fMem/update_fmem_input.jsp";
		RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交"/front-end/mem/update_mem_input.jsp"
		successView.forward(req, res);

		/***************************其他可能的錯誤處理*************************************/
	} catch (Exception e) {
		errorMsgs.add("修改資料失敗:"+e.getMessage());
		RequestDispatcher failureView = req
				.getRequestDispatcher("/front-end/fMem/update_mem_input.jsp");
		failureView.forward(req, res);
	}
}
		
	}
	// 取出上傳的檔案名稱 (因為API未提供method,所以必須自行撰寫)
	public String getFileNameFromPart(Part part) {
		String header = part.getHeader("content-disposition");
		System.out.println("header=" + header); // 測試用
		String filename = new File(header.substring(header.lastIndexOf("=") + 2, header.length() - 1)).getName();
		System.out.println("filename=" + filename); // 測試用
		if (filename.length() == 0) {
			return null;
		}
		return filename;
	}
}
