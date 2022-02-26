package com.mem.controller;

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

import com.mem.model.GenerateLinkUtils;
import com.mem.model.MailService;
import com.mem.model.MemService;
import com.mem.model.MemVO;
@MultipartConfig
// 前後台的mem可能需要分開寫servlet，可能解決方法:分別註冊back-end與front-end的url
public class MemServlet extends HttpServlet {
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
				String str = req.getParameter("mem_id");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入會員編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/mem/listAllMem.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				Integer mem_id = null;
				try {
					mem_id = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("會員編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/mem/listAllMem.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************2.開始查詢資料*****************************************/
				MemService memSvc = new MemService();
				MemVO memVO = memSvc.getOneMem(mem_id);
				if (memVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/mem/listAllMem.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("memVO", memVO); // 資料庫取出的memVO物件,存入req
				String url = "/back-end/mem/listOneMem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneMem.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/mem/listAllMem.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("Update_Mem_Input".equals(action)) { // 來自update_emp_input.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				MemVO memVO = new MemVO();
Integer mem_id = new Integer(req.getParameter("mem_id").trim());
				String mem_name = req.getParameter("mem_name");
				String enameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (mem_name == null || mem_name.trim().length() == 0) {
					errorMsgs.add("會員姓名: 請勿空白");
				} else if(!mem_name.trim().matches(enameReg)) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("會員姓名: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
	            }

				String mem_acc = req.getParameter("mem_acc").trim();

				
String mem_nickname = req.getParameter("mem_nickname").trim();
				if (mem_nickname == null || mem_nickname.trim().length() == 0) {
					errorMsgs.add("暱稱請勿空白");
				}	

				String mem_pwd = req.getParameter("mem_pwd").trim();
				String memReg = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,}$";
				if (mem_pwd == null || mem_pwd.trim().length() == 0) {
					errorMsgs.add("請輸入密碼");
				} else if (!mem_pwd.trim().matches(memReg)) {
					errorMsgs.add("至少8個字符，至少1個大寫字母，1個小寫字母和1個數字");
				}
				
				String mem_mobile = req.getParameter("mem_mobile").trim();
				String mobileReg = "^09[0-9]{8}$";
				if (mem_mobile == null || mem_mobile.trim().length() == 0) {
					errorMsgs.add("請填入手機號碼.");
				} else if (!mem_mobile.trim().matches(mobileReg)) {
					errorMsgs.add("請輸入正確的手機號碼格式");
				}

				String mem_tel = req.getParameter("mem_tel").trim();
				if (mem_tel == null || mem_tel.trim().length() == 0) {
					errorMsgs.add("請填入市話號碼.");
				}

				String mem_city = req.getParameter("mem_city").trim();
				if (mem_city == null || mem_city.trim().length() == 0) {
					errorMsgs.add("縣市請勿空白");
				}	

				String mem_dist = req.getParameter("mem_dist").trim();
				if (mem_dist == null || mem_dist.trim().length() == 0) {
					errorMsgs.add("鄉鎮區請勿空白");
				}	

				String mem_addr = req.getParameter("mem_addr").trim();
				if (mem_addr == null || mem_addr.trim().length() == 0) {
					errorMsgs.add("地址請勿空白");
				}	
				
				Integer mem_zipcode = new Integer(req.getParameter("mem_zipcode"));
				System.out.print(mem_zipcode);
				if (mem_zipcode == null || mem_zipcode == 0) {
					errorMsgs.add("郵遞區號請勿空白");
//				} else if(!(mem_zipcode == 3)) { //以下練習正則(規)表示式(regular-expression)
//					errorMsgs.add("郵遞區號長度必需為3");// 尚未處理
	            }
				
				Part part = req.getPart("mem_pic");

				byte[] mem_pic = null;
				if (part == null || part.getSize() == 0) {
					req.setAttribute("memVO", memVO);
					MemService memSvc2 = new MemService();
					MemVO memVO2 = memSvc2.getOneMem(mem_id);
					mem_pic = memVO2.getMem_pic();

				} else {
					req.setAttribute("memVO", memVO);
					InputStream in = part.getInputStream();
					mem_pic = new byte[in.available()];
					in.read(mem_pic);
					in.close();
				}
			
				memVO.setMem_id(mem_id);
				memVO.setMem_acc(mem_acc);
				memVO.setMem_pwd(mem_pwd);
				memVO.setMem_name(mem_name);
				memVO.setMem_nickname(mem_nickname);
				memVO.setMem_mobile(mem_mobile);
				memVO.setMem_tel(mem_tel);
				memVO.setMem_zipcode(mem_zipcode);
				memVO.setMem_city(mem_city);
				memVO.setMem_dist(mem_dist);
				memVO.setMem_addr(mem_addr);
				memVO.setMem_pic(mem_pic);
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
req.setAttribute("memVO", memVO); // 含有輸入格式錯誤的memVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/mem/update_mem_input.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				
				/***************************2.開始修改資料*****************************************/
				MemService memSvc = new MemService();
				memVO = memSvc.updateMemInput(mem_id, mem_acc, mem_pwd, mem_name, mem_nickname, mem_mobile, 
						mem_tel, mem_zipcode, mem_city, mem_dist, mem_addr, mem_pic);
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("memVO", memVO); // 資料庫update成功後,正確的的memVO物件,存入req
				String url = "/front-end/mem/update_mem_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交"/front-end/mem/update_mem_input.jsp"
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/mem/update_mem_input.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("updateAccState".equals(action)) { // 來自listAllMem.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/	
				Integer mem_id = new Integer(req.getParameter("mem_id").trim());
				
				Integer acc_state = new Integer(req.getParameter("acc_state"));

				
				MemVO memVO = new MemVO();
				memVO.setMem_id(mem_id);
				memVO.setAcc_state(acc_state);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
req.setAttribute("memVO", memVO); // 含有輸入格式錯誤的memVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/mem/listAllMem.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				
				/***************************2.開始修改資料*****************************************/
				MemService memSvc = new MemService();
				memVO = memSvc.updateMemAccState(mem_id, acc_state);
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("memVO", memVO); // 資料庫update成功後,正確的的memVO物件,存入req
				String url = "/back-end/mem/listAllMem.jsp";
				//印出成功視窗尚未完成，導向位置尚未決定
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listAllMem.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/mem/listAllMem.jsp");
				failureView.forward(req, res);
			}
		}

		
		
		/*=================================================*/
		/*=========         yupei 區域   register   ========*/
		/*=================================================*/	
		        if ("register".equals(action)) { // 來自addEmp.jsp的請求  
					
					List<String> errorMsgs = new LinkedList<String>();
					// Store this set in the request scope, in case we need to
					// send the ErrorPage view.
					req.setAttribute("errorMsgs", errorMsgs);

					try {
						
						MemService memSvc=new MemService();
						
						/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
						String mem_nickname = req.getParameter("mem_nickname");
						String mem_acc = req.getParameter("mem_acc");
						if (mem_acc != null && memSvc.findUserByMem_acc(mem_acc) != null) {
							errorMsgs.add("該用戶已註冊過!");
							
						}


						String mem_pwd = req.getParameter("mem_pwd");


						MemVO memVO = new MemVO();
						memVO.setMem_nickname(mem_nickname);
						memVO.setMem_acc(mem_acc);
						memVO.setMem_pwd(mem_pwd);

						// Send the use back to the form, if there were errors
						if (!errorMsgs.isEmpty()) {
		req.setAttribute("memVO", memVO); // 含有輸入格式錯誤的empVO物件,也存入req
							RequestDispatcher failureView = req
									.getRequestDispatcher("/front-end/mem/addMemByMem.jsp");
							failureView.forward(req, res);
							return;
						}
						
						/***************************2.開始新增資料***************************************/
						MemService memSvc2 = new MemService();
						MemVO memVO1 = memSvc2.registerMem(mem_acc, mem_pwd, mem_nickname);
						MemVO memVO2 = memSvc2.findUserByMem_acc(memVO1.getMem_acc());
						// 注册成功后,发送帐户激活链接
						MailService.sendAccountActivateEmail(memVO2);
						/***************************3.新增完成,準備轉交(Send the Success view)***********/
						String url = "/front-end/mem/success_addMem_page.jsp";
						RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
						successView.forward(req, res);				
						
						/***************************其他可能的錯誤處理**********************************/
					} catch (Exception e) {
						errorMsgs.add(e.getMessage());
						RequestDispatcher failureView = req
								.getRequestDispatcher("/front-end/mem/addMemByMem.jsp");
						failureView.forward(req, res);
					}
				}
		        
		/*=================================================*/
		/*=========         yupei 區域   ActivateAccount ===*/
		/*=================================================*/  
		        
				if ("ActivateAccount".equals(action)) { // 來自listAllEmp.jsp

					List<String> errorMsgs = new LinkedList<String>();
					// Store this set in the request scope, in case we need to
					// send the ErrorPage view.
					req.setAttribute("errorMsgs", errorMsgs);
			
					try {
						/***************************1.接收請求參數***************************************/
						
						String idValue = req.getParameter("mem_id");
						int mem_id = -1;
						try {
							mem_id = Integer.parseInt(idValue);
						} catch (NumberFormatException e) {
							throw new RuntimeException("無效的用戶！");
						}
						
						
						/***************************2.開始刪除資料***************************************/
						MemService memSvc = new MemService();		
						MemVO memVO = memSvc.getOneMem(mem_id);// 得到要激活的帐户

						if(GenerateLinkUtils.verifyCheckcode(memVO, req)){
							// 校验验证码是否和注册时发送的一致，以此设置是否激活该帐户
							 //如果一致返回true，否则返回false
							memSvc.updateMemAccState(mem_id, 1);
							
						}else {
							errorMsgs.add("驗證失敗");
							
						}

						/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
						String url = "/front-end/mem/success_email_activated_page.jsp";
						RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
						successView.forward(req, res);
						
						/***************************其他可能的錯誤處理**********************************/
					} catch (Exception e) {
						errorMsgs.add("有錯誤發生:"+e.getMessage());
						RequestDispatcher failureView = req
								.getRequestDispatcher("/front-end/mem/addMemByMem.jsp");
						failureView.forward(req, res);
					}
				}
				
				
		/*===========================================================*/
		/*=========         yupei 區域   send_resetPWD_mail_ByMem ===*/
		/*==========================================================*/ 
				
		        if ("send_resetPWD_mail_ByMem".equals(action)) { // 來自addEmp.jsp的請求  
					
					List<String> errorMsgs = new LinkedList<String>();
					// Store this set in the request scope, in case we need to
					// send the ErrorPage view.
					req.setAttribute("errorMsgs", errorMsgs);

					try {			
						MemService memSvc = new MemService();
						/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/

						String mem_acc = req.getParameter("mem_acc");
						if (mem_acc == null || memSvc.findUserByMem_acc(mem_acc) == null) {
							errorMsgs.add("該用戶未註冊過! 請輸入正確信箱");
						}

						MemVO memVO = new MemVO();

						memVO.setMem_acc(mem_acc);


						// Send the use back to the form, if there were errors
						if (!errorMsgs.isEmpty()) {
							req.setAttribute("memVO", memVO); // 含有輸入格式錯誤的empVO物件,也存入req
							RequestDispatcher failureView = req
									.getRequestDispatcher("/front-end/mem/go_to_send_resetPWD_mail_ByMem.jsp");
							failureView.forward(req, res);
							return;
						}
						
						/***************************2.開始新增資料***************************************/
						MemService memSvc2 = new MemService();

						MemVO memVO2 = memSvc2.findUserByMem_acc(mem_acc);
						// 注册成功后,发送帐户激活链接
						MailService.sendResetPasswordEmail(memVO2);
						/***************************3.新增完成,準備轉交(Send the Success view)***********/
						String url = "/front-end/mem/success_send_resetPWD_email_ByMem_page.jsp";
						RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
						successView.forward(req, res);				
						
						/***************************其他可能的錯誤處理**********************************/
					} catch (Exception e) {
						errorMsgs.add(e.getMessage());
						RequestDispatcher failureView = req
								.getRequestDispatcher("/front-end/mem/go_to_send_resetPWD_mail_ByMem.jsp");
						failureView.forward(req, res);
					}
				}
				
		/*===========================================================*/
		/*=========       yupei 區域   go_to_reset_PWD_page_ByMem ===*/
		/*==========================================================*/ 		
				if ("go_to_reset_PWD_page_ByMem".equals(action)) { // 來自listAllEmp.jsp

					List<String> errorMsgs = new LinkedList<String>();
					// Store this set in the request scope, in case we need to
					// send the ErrorPage view.
					req.setAttribute("errorMsgs", errorMsgs);
			
					try {
						
						System.out.println("進到go_to_reset_PWD_page_ByMem 區域");
						/***************************1.接收請求參數***************************************/
						
						String mem_acc = req.getParameter("mem_acc");

						/***************************2.開始刪除資料***************************************/
						MemService memSvc2 = new MemService();
						MemVO memVO2 = memSvc2.findUserByMem_acc(mem_acc);// 得到要重設密碼的帳戶

						if(GenerateLinkUtils.verifyCheckcode(memVO2, req)){
							System.out.println("go_to_reset_PWD_page_ByMem checkcode是"+(GenerateLinkUtils.verifyCheckcode(memVO2, req)));
							// 校验验证码是否和申請重設密碼时发送的一致
							 //如果一致返回true，否则返回false

							req.setAttribute("memVO", memVO2);   
							System.out.println("有拿到"+memVO2.getMem_acc());
							String url = "/front-end/mem/resetPWD_ByMem.jsp";
							RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
							successView.forward(req, res);
							System.out.println("成功去resetPWD_ByMem.jsp");
							return;
						}else {
							errorMsgs.add("申請重設密碼失敗");
							
						}
						// Send the use back to the form, if there were errors
						if (!errorMsgs.isEmpty()) {
		//req.setAttribute("empVO", empVO); // 含有輸入格式錯誤的empVO物件,也存入req
							RequestDispatcher failureView = req
									.getRequestDispatcher("/front-end/mem/addMemByMem.jsp");
							failureView.forward(req, res);
							return;
						}
					

						/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
//						String url = "/front-end/mem/success_email_activated_page.jsp";
//						RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
//						successView.forward(req, res);
						
						/***************************其他可能的錯誤處理**********************************/
					} catch (Exception e) {
						errorMsgs.add("有錯誤發生:"+e.getMessage());
						RequestDispatcher failureView = req
								.getRequestDispatcher("/front-end/mem/addMemByMem.jsp");
						failureView.forward(req, res);
					}
				}
				
		        
		/*===========================================================*/
		/*=========       yupei 區域   reset_PWD_ByMem   ============*/
		/*==========================================================*/
				if ("reset_PWD_ByMem".equals(action)) { // 來自addEmp.jsp的請求  
						
						List<String> errorMsgs = new LinkedList<String>();
						// Store this set in the request scope, in case we need to
						// send the ErrorPage view.
						req.setAttribute("errorMsgs", errorMsgs);

						try {
							
							MemService memSvc=new MemService();
							
//							memSvc.getOneMem(Integer mem_id)
							/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/

							String mem_acc = req.getParameter("mem_acc");
							String mem_pwd = req.getParameter("mem_pwd");

		System.out.println("reset_PWD_ByMem 收到"+mem_acc);
							
							/***************************2.開始新增資料***************************************/
							MemService memSvc2 = new MemService();
							MemVO memVO1 = memSvc2.updatePWD_ByMem_acc(mem_pwd,mem_acc);
//							MemVO memVO2 = memSvc2.findUserByMem_acc(memVO1.getMem_acc());
//							// 注册成功后,发送帐户激活链接
//							MailService.sendAccountActivateEmail(memVO2);
							/***************************3.新增完成,準備轉交(Send the Success view)***********/
							String url = "/front-end/mem/success_resetPWD_ByMem_page.jsp";
							RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
							successView.forward(req, res);				
							
							/***************************其他可能的錯誤處理**********************************/
						} catch (Exception e) {
							errorMsgs.add(e.getMessage());
							RequestDispatcher failureView = req
									.getRequestDispatcher("/front-end/mem/resetPWD_ByMem.jsp");
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
