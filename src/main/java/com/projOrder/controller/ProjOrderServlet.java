package com.projOrder.controller;
import java.io.*;
import java.sql.Date;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import com.mem.model.MemService;
import com.mem.model.MemVO;
import com.projOrder.model.ProjOrderService;
import com.projOrder.model.ProjOrderVO;
import com.projPerk.model.ProjPerkService;
import com.projPerk.model.ProjPerkVO;
import com.project.model.ProjectService;
import com.project.model.ProjectVO;

import oracle.sql.DATE;

public class ProjOrderServlet extends HttpServlet{
//	862 update_state_to_1_and_then_show_All	
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action"); //表單有用hidden name="action" value="getOne_For_Display"
		
/*=================================================*/
/*=========         gllOne 區域             ========*/
/*=================================================*/		
		/***<<給管理員用的>>**/
		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String str = req.getParameter("order_id");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入訂單編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/projOrder/searchOrder.jsp");///***我還沒改
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				Integer order_id = null;
				try {
					order_id = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("訂單編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/projOrder/searchOrder.jsp");///***我還沒改
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************2.開始查詢資料*****************************************/
				ProjOrderService projOrderSvc = new ProjOrderService();
				ProjOrderVO projOrderVO = projOrderSvc.getOneProjOrder(order_id);

				if (projOrderVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/projOrder/searchOrder.jsp");///***我還沒改
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("projOrderVO", projOrderVO); // 資料庫取出的empVO物件,存入req
			
				/*****我增加的部分start*****為了拿到專案名稱*/
				ProjPerkService projPerkSvc = new ProjPerkService();
				ProjPerkVO projPerkVO = projPerkSvc.getOneProjPerk(projOrderVO.getPerk_id());
				ProjectService projectSvc = new ProjectService();
				ProjectVO projectVO = projectSvc.getOneProject(projPerkVO.getProj_id());
				
				req.setAttribute("projPerkVO", projPerkVO); // 資料庫取出的empVO物件,存入req
				req.setAttribute("projectVO", projectVO); // 資料庫取出的empVO物件,存入req
				
				req.setAttribute("order_state_arr", new String[]{"待付款","待出貨","運送中","已完成","不成立<br>(未處理)","不成立<br>(已解決)"});
				req.setAttribute("proj_pay_arr", new String[]{"信用卡","銀行轉帳"});
				req.setAttribute("cancel_reason_arr", new String[]{"","逾期未付款","買家取消","小農取消","專案募資失敗"});
				/*****我增加的部分end******/
				
				String url = "/front-end/projOrder/listOneOrder.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/projOrder/searchOrder.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		
		/***<<給小農用的>>**/
		if ("getOneByFmem".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String str1 = req.getParameter("f_mem_id");
//				System.out.println(str1);//////////////////////
				if (str1 == null || (str1.trim()).length() == 0) {
//					System.out.println(str1);
					errorMsgs.add("請輸入專案編號");
//					System.out.println(str1);
				}
				Integer f_mem_id = null;
				try {
					f_mem_id = new Integer(str1);
				} catch (Exception e) {
					errorMsgs.add("訂單編號格式不正確");
				}
				
				String str = req.getParameter("order_id");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入訂單編號");
				}
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/projOrder/listAllOrderByFmem.jsp");///***我還沒改
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				Integer order_id = null;
				try {
					order_id = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("訂單編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/projOrder/listAllOrderByFmem.jsp");///***我還沒改
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************2.開始查詢資料*****************************************/
				ProjOrderService projOrderSvc = new ProjOrderService();
				try {
				ProjOrderVO projOrderVO = projOrderSvc.getOneProjOrderByFMem(order_id, f_mem_id);
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("projOrderVO", projOrderVO); // 資料庫取出的empVO物件,存入req
			
				/*****我增加的部分start*****為了拿到專案名稱*/
				ProjPerkService projPerkSvc = new ProjPerkService();
				ProjPerkVO projPerkVO = projPerkSvc.getOneProjPerk(projOrderVO.getPerk_id());
				ProjectService projectSvc = new ProjectService();
				ProjectVO projectVO = projectSvc.getOneProject(projPerkVO.getProj_id());
				
				req.setAttribute("projPerkVO", projPerkVO); // 資料庫取出的empVO物件,存入req
				req.setAttribute("projectVO", projectVO); // 資料庫取出的empVO物件,存入req
				
				req.setAttribute("order_state_arr", new String[]{"待付款","待出貨","運送中","已完成","不成立<br>(未處理)","不成立<br>(已解決)"});
				req.setAttribute("proj_pay_arr", new String[]{"信用卡","銀行轉帳"});
				req.setAttribute("cancel_reason_arr", new String[]{"","逾期未付款","買家取消","小農取消","專案募資失敗"});
				/*****我增加的部分end******/
				
				String url = "/front-end/projOrder/listOneOrderByFmem.jsp";///***我還沒改
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				}catch (Exception e) {
					errorMsgs.add("查無資料");
				}
//				if (projOrderVO == null) {
//					errorMsgs.add("查無資料");
//				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/projOrder/listAllOrderByFmem.jsp");///***我還沒改
					failureView.forward(req, res);
					return;//程式中斷
				}
				
//				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
//				req.setAttribute("projOrderVO", projOrderVO); // 資料庫取出的empVO物件,存入req
//			
//				/*****我增加的部分start*****為了拿到專案名稱*/
//				ProjPerkService projPerkSvc = new ProjPerkService();
//				ProjPerkVO projPerkVO = projPerkSvc.getOneProjPerk(projOrderVO.getPerk_id());
//				ProjectService projectSvc = new ProjectService();
//				ProjectVO projectVO = projectSvc.getOneProject(projPerkVO.getProj_id());
//				
//				req.setAttribute("projPerkVO", projPerkVO); // 資料庫取出的empVO物件,存入req
//				req.setAttribute("projectVO", projectVO); // 資料庫取出的empVO物件,存入req
//				
//				req.setAttribute("order_state_arr", new String[]{"待付款","待出貨","運送中","已完成","不成立<br>(未處理)","不成立<br>(已解決)"});
//				req.setAttribute("proj_pay_arr", new String[]{"信用卡","銀行轉帳"});
//				req.setAttribute("cancel_reason_arr", new String[]{"","逾期未付款","買家取消","小農取消","專案募資失敗"});
//				/*****我增加的部分end******/
//				
//				String url = "/front-end/projOrder/listOneOrderByFmem.jsp";///***我還沒改
//				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
//				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("該筆訂單不存在");
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/projOrder/listAllOrderByFmem.jsp");///***我還沒改
				failureView.forward(req, res);
			}
		}
		
		
		
		
/*=================================================*/
/*=========         getAll 區域             ========*/
/*=================================================*/
		
		/***<<給一般會員用的>>*於0204加入****/
		if ("getAllByMem".equals(action)) {
//			System.out.println("1");
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String str = req.getParameter("mem_id");
//				System.out.println(str);
				if (str == null || (str.trim()).length() == 0) {
//					System.out.println(str);
					errorMsgs.add("請輸入專案編號");
//					System.out.println(str);
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/projOrder/listAllProjByMem.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				Integer mem_id = null;
				try {
					mem_id = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("專案編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/projOrder/listAllProjByMem.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}
//				System.out.println("2");
				/*************************** 2.開始查詢資料 *****************************************/
				ProjOrderService projOrderSvc = new ProjOrderService();
				List<ProjOrderVO> projOrderVO = projOrderSvc.getAllMemOrder(mem_id);
				
				
//				for(int i=0; i<projOrderVO.size(); i++) {
//					System.out.println(projOrderVO.get(i));
//				}
				
				if (projOrderVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/projOrder/listAllProjByMem.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}
//				System.out.println("3");
				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("projOrderVO", projOrderVO); // 資料庫取出的projPerkVO物件,存入req
				
				String url = "/front-end/projOrder/listAllOrderByMem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 perkoverview.jsp
				successView.forward(req, res);
//				System.out.println("成功");
				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				System.out.println("error in final");
				errorMsgs.add("無法取得資料:" + e.getMessage());
				

				
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/projOrder/listAllProjByMem.jsp");
				failureView.forward(req, res);
				
				System.out.println("error in final");
			}
		}
		
		
		/***<<給小農用的>>**/
		if ("getAllByFmem".equals(action)) {
//			System.out.println("2");/////////////////
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String str = req.getParameter("f_mem_id");
//				System.out.println(str);//////////////////////
				if (str == null || (str.trim()).length() == 0) {
//					System.out.println(str);
					errorMsgs.add("請輸入專案編號");
//					System.out.println(str);
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/projOrder/listAllProjByFmem.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				Integer f_mem_id = null;
				try {
					f_mem_id = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("專案編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/projOrder/listAllProjByFmem.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}
//				System.out.println("2");
				/*************************** 2.開始查詢資料 *****************************************/
				ProjOrderService projOrderSvc = new ProjOrderService();
				List<ProjOrderVO> projOrderVO = projOrderSvc.getAllFmemOrder(f_mem_id); 
				//這裡已經過濾是哪個小農
				
				
//				for(int i=0; i<projOrderVO.size(); i++) {
//					System.out.println(projOrderVO.get(i));
//				}
				
				if (projOrderVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/projOrder/listAllProjByFmem.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}
//				System.out.println("3");
				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("projOrderVO", projOrderVO); // 資料庫取出的projPerkVO物件,存入req
			
				String url = "/front-end/projOrder/listAllOrderByFmem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 perkoverview.jsp
				successView.forward(req, res);
				System.out.println("成功getAllByFmem");
				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
//				System.out.println("error in final");
				errorMsgs.add("無法取得資料:" + e.getMessage());

				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/projOrder/listAllProjByFmem.jsp");
				failureView.forward(req, res);
				
//				System.out.println("error in final");
			}
		}
		
		
		
		
		/*給會員用的*/
		if ("getOne_For_Update_ByMem".equals(action)) { // 來自listAllEmp.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數****************************************/
				
				Integer mem_id = new Integer(req.getParameter("mem_id").trim());
				System.out.println(mem_id);

				Integer order_id = new Integer(req.getParameter("order_id").trim());
				System.out.println(order_id);
				/***************************2.開始查詢資料****************************************/ 
				MemService memSvc3 = new MemService();  
				MemVO memVO3 = memSvc3.getOneMem(mem_id);  
			

				ProjOrderService projOrderSvc = new ProjOrderService();
				ProjOrderVO projOrderVO = projOrderSvc.getOneProjOrder(order_id);
				
				ProjPerkService projPerkSvc = new ProjPerkService();  
				ProjPerkVO projPerkVO = projPerkSvc.getOneProjPerk(projOrderVO.getPerk_id()); 
							
				ProjectService projectSvc = new ProjectService();
				ProjectVO projectVO = projectSvc.getOneProject(projPerkVO.getProj_id());
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("projectVO", projectVO);
				req.setAttribute("projPerkVO",projPerkVO); 
				req.setAttribute("memVO",memVO3); 
				req.setAttribute("projOrderVO", projOrderVO);    // 資料庫取出的empVO物件,存入req
				
				String url = "/front-end/projOrder/update_order_input_ByMem.jsp";///***我還沒改
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/projOrder/listAllOrderByMem.jsp");///***我還沒改
				failureView.forward(req, res);
			}
		}
		
	      if ("update_ByMem".equals(action)) { // 來自addEmp.jsp的請求  
				
				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);

				try {
					Integer order_id = new Integer(req.getParameter("order_id").trim());
					Integer mem_id = new Integer(req.getParameter("mem_id").trim());
					
					// ---------------order_zipcode驗證----------------//
					String order_addr = (req.getParameter("order_addr").trim());
					
					order_addr=order_addr.replace("\n", "&nbsp;");
					order_addr=order_addr.replace("\r", "&nbsp;");
					order_addr=order_addr.replace("<", "&lt;");
					order_addr=order_addr.replace(">", "&gt;");
					order_addr=order_addr.replace("\"", "&quot;");
					order_addr=order_addr.replace("\'", "&quot;");
					
					
					
					
					String order_addrReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,40}$";
					if (order_addr == null || order_addr.trim().length() == 0) {
						errorMsgs.add("地址: 請勿空白");
					} else if(!order_addr.trim().matches(order_addrReg)) { //以下練習正則(規)表示式(regular-expression)
						errorMsgs.add("地址: 只能是中、英文字母、數字和_ , 且長度必需在40字以內");
		            }
					
					
					String order_zipcode_str = (req.getParameter("order_zipcode").trim());
					String order_zipcodeReg = "^.{3}$";

					if (order_zipcode_str == null || order_zipcode_str.trim().length() == 0) {
						errorMsgs.add("郵遞區號: 請勿空白");
					} else if(!order_zipcode_str.trim().matches(order_zipcodeReg)) { //以下練習正則(規)表示式(regular-expression)
						errorMsgs.add("郵遞區號: 只能是數字，且長度必需在3字以內");
		            }
									
					Integer order_zipcode = null;
					try {
						order_zipcode = new Integer(req.getParameter("order_zipcode").trim());
					} catch (NumberFormatException e) {
						order_zipcode=null;
						errorMsgs.add("郵遞區號請填數字.");
					}

					String order_receiver =(req.getParameter("order_receiver").trim());
					String order_receiverReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,25}$";
					if (order_receiver == null || order_receiver.trim().length() == 0) {
						errorMsgs.add("收件人姓名: 請勿空白");
					} else if(!order_receiver.trim().matches(order_receiverReg)) { //以下練習正則(規)表示式(regular-expression)
						errorMsgs.add("收件人姓名: 只能是中、英文字母、數字和_ , 且長度必需在2到25之間");
		            }
					
					
//					String order_tel =(req.getParameter("order_tel").trim());
					String order_tel = (req.getParameter("order_tel").trim());
					String order_telReg = "^{0,1}[0-9]*$";
					if (order_tel == null || order_tel.trim().length() == 0) {
						errorMsgs.add("聯絡電話: 請勿空白");
					} else if(!order_tel.trim().matches(order_telReg)) { //以下練習正則(規)表示式(regular-expression)
						errorMsgs.add("聯絡電話: 只能是數字");
		            }
					
					/*----這裡是沒有讓客人修改的---*/
					ProjOrderService projOrderSvc = new ProjOrderService();
					ProjOrderVO projOrderVO3=projOrderSvc.getOneProjOrder(order_id);
					
					Integer perk_id = projOrderVO3.getPerk_id();
					Integer order_pay = projOrderVO3.getOrder_pay();
										
					//日期用try catch才能設收到null值，再設成null回去
					java.sql.Date order_ship_time = null;  //宣告
					try {
						order_ship_time =projOrderVO3.getOrder_ship_time();
					}catch (Exception e) {
						// TODO: handle exception
						order_ship_time=null;
					}
					
					java.sql.Date order_completion_time = null;  //宣告
					try {
						order_completion_time =projOrderVO3.getOrder_ship_time();
					}catch (Exception e) {
						// TODO: handle exception
						order_completion_time=null;
					}
					
					java.sql.Date order_cancel_time = null;  //宣告
					try {
						order_cancel_time =projOrderVO3.getOrder_ship_time();
					}catch (Exception e) {
						// TODO: handle exception
						order_cancel_time=null;
					}
					
					
					Integer order_state =projOrderVO3.getOrder_state();
					Integer order_cancel_reason =projOrderVO3.getOrder_cancel_reason();
					/*----------------------------*/
					
						ProjOrderVO projOrderVO = new ProjOrderVO();
						projOrderVO.setOrder_zipcode(order_zipcode);
						projOrderVO.setOrder_addr(order_addr);
						projOrderVO.setOrder_receiver(order_receiver);
						projOrderVO.setOrder_tel(order_tel);
						projOrderVO.setOrder_pay(order_pay);
						projOrderVO.setOrder_id(order_id);

						
						// Send the use back to the form, if there were errors
						ProjPerkService projPerkSvc3 = new ProjPerkService(); 
						ProjPerkVO projPerkVO3 = projPerkSvc3.getOneProjPerk(perk_id);   
						
						ProjectService projectSvc3 = new ProjectService();
						ProjectVO projectVO3 = projectSvc3.getOneProject(projPerkVO3.getProj_id());
						
						MemService memSvc3 = new MemService();  
						MemVO memVO3 = memSvc3.getOneMem(mem_id); 
						
						if (!errorMsgs.isEmpty()) { //錯誤回去
	/**備註：為了測試，MemVO暫時用req帶過去*******/
							req.setAttribute("projOrderVO", projOrderVO);
							req.setAttribute("projectVO", projectVO3);
							req.setAttribute("projPerkVO",projPerkVO3);
							req.setAttribute("memVO",memVO3);
//		req.setAttribute("projOrderVO", projOrderVO); // 含有輸入格式錯誤的empVO物件,也存入req
							RequestDispatcher failureView = req
									.getRequestDispatcher("/front-end/projOrder/update_order_input_ByMem.jsp");
							failureView.forward(req, res);
							return; //程式中斷
						}
						
						/***************************2.開始修改資料*****************************************/
						ProjOrderService projOrderSvc4 = new ProjOrderService();
						//控制起驗證完拿到的碎片，new領班，交給領班去組合。
						//領班用自己的方法去組合將碎片放入一個EmpVO物件，物件再交給工人去施工更新   的動作，然後領班會再回傳一個empVO物件回來
						ProjOrderVO projOrderVO2 = projOrderSvc4.updateProjOrder(order_zipcode, order_addr, order_receiver, order_tel, order_state,order_ship_time, order_completion_time,order_cancel_time,order_cancel_reason,order_id);
					
					/***************************3.新增完成,準備轉交(Send the Success view)***********/
	/**備註：為了測試，MemVO暫時用req帶過去*******/
						List<ProjOrderVO> projOrderVO5=projOrderSvc4.getAllMemOrder(mem_id);
					req.setAttribute("memVO",memVO3);
					req.setAttribute("projOrderVO", projOrderVO5);
					String url = "/front-end/projOrder/listAllOrderByMem.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
					successView.forward(req, res);				
					
					/***************************其他可能的錯誤處理**********************************/
				} catch (Exception e) {
					errorMsgs.add(e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/projOrder/update_order_input_ByMem.jsp");
					failureView.forward(req, res);
				}
			}

		

		

/*=== Fmem ================ＳＴＡＲＴ=====查詢區專用按紐==，按完會回到查詢頁面=============================*/
		/*************我增加的部分，按按鈕改變訂單狀態變成 1 待出貨* START  ****************/
		if ("update_state_to_1".equals(action)) { // 來自update_emp_input.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		try {
				Integer order_zipcode = new Integer(req.getParameter("order_zipcode").trim());
				String order_addr = (req.getParameter("order_addr").trim());
				String order_receiver =(req.getParameter("order_receiver").trim());
				String order_tel =(req.getParameter("order_tel").trim());
				
				//訂單狀態設成 1 ，因為確認收款按鈕按了，從待付款變成待出貨。 
				Integer order_state =1;
				
				//日期用try catch才能設收到null值，再設成null回去
				java.sql.Date order_ship_time = null;  //宣告
				try {
					order_ship_time = java.sql.Date.valueOf(req.getParameter("order_ship_time"));//要轉型
				}catch (Exception e) {
					// TODO: handle exception
					order_ship_time=null;
				}
				
				java.sql.Date order_completion_time = null; //宣告
				try {
					order_completion_time = java.sql.Date.valueOf(req.getParameter("order_completion_time"));//要轉型
				}catch (Exception e) {
					// TODO: handle exception
					order_completion_time=null;
				}
				
				java.sql.Date order_cancel_time = null; //宣告
				try {
					order_cancel_time = java.sql.Date.valueOf(req.getParameter("order_cancel_time"));//要轉型
				}catch (Exception e) {
					// TODO: handle exception
					order_cancel_time=null;
				}
				

				Integer order_cancel_reason = new Integer(req.getParameter("order_cancel_reason"));
				Integer order_id = new Integer(req.getParameter("order_id").trim());
				

				ProjOrderVO projOrderVO = new ProjOrderVO();
				
				projOrderVO.setOrder_zipcode(order_zipcode);
				projOrderVO.setOrder_addr(order_addr);
				projOrderVO.setOrder_receiver(order_receiver);
				projOrderVO.setOrder_tel(order_tel);
				projOrderVO.setOrder_state(order_state);
				projOrderVO.setOrder_ship_time(order_ship_time);
				projOrderVO.setOrder_completion_time(order_completion_time);
				projOrderVO.setOrder_cancel_time(order_cancel_time);
				projOrderVO.setOrder_cancel_reason(order_cancel_reason);
				projOrderVO.setOrder_id(order_id);

				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//req.setAttribute("projOrderVO", projOrderVO); // 含有輸入格式錯誤的empVO物件,也存入req
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/front-end/projOrder/farmer_listOneProjOrder.jsp");
//					failureView.forward(req, res);
//					return; //程式中斷
//				}
//				
				/***************************2.開始修改資料*****************************************/
				ProjOrderService projOrderSvc = new ProjOrderService();
				//控制起驗證完拿到的碎片，new領班，交給領班去組合。
				//領班用自己的方法去組合將碎片放入一個EmpVO物件，物件再交給工人去施工更新   的動作，然後領班會再回傳一個empVO物件回來
				ProjOrderVO projOrderVO2 = projOrderSvc.updateProjOrder(order_zipcode, order_addr, order_receiver, order_tel, order_state,order_ship_time, order_completion_time,order_cancel_time,order_cancel_reason,order_id);
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("projOrderVO", projOrderVO2); // 資料庫update成功後,正確的的empVO物件,存入req	
				
				
//0204測試按按鈕完，再回到listOne頁面，依舊拿不到物件，決定轉跳回searchOrderByFmem.jsp頁面
//				/*****我增加的部分start*****為了拿到專案名稱*/
//				ProjPerkService projPerkSvc = new ProjPerkService();
//				ProjPerkVO projPerkVO = projPerkSvc.getOneProjPerk(projOrderVO2.getPerk_id());
//				ProjectService projectSvc = new ProjectService();
//				ProjectVO projectVO = projectSvc.getOneProject(projPerkVO.getProj_id());
//				
//				req.setAttribute("projPerkVO", projPerkVO); // 資料庫取出的empVO物件,存入req
//				req.setAttribute("projectVO", projectVO); // 資料庫取出的empVO物件,存入req
//				
//				req.setAttribute("order_state_arr", new String[]{"待付款","待出貨","運送中","已完成","不成立<br>(未處理)","不成立<br>(已解決)"});
//				req.setAttribute("proj_pay_arr", new String[]{"信用卡","銀行轉帳"});
//				req.setAttribute("cancel_reason_arr", new String[]{"","逾期未付款","買家取消","小農取消","專案募資失敗"});
//				/*****我增加的部分end******/
				
			
				
				String url = "/front-end/projOrder/searchOrderByFmem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);
				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/projOrder/searchOrderByFmem.jsp");
				failureView.forward(req, res);
			}
		}
		/*************我增加的部分，按按鈕改變訂單狀態變成 1 待出貨，END  *****************/
		
		/*************我增加的部分，按按鈕改變訂單狀態變成 2 : 運送中* START  ****************/
		if ("update_state_to_2".equals(action)) { // 來自update_emp_input.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		try {
			Integer order_zipcode = new Integer(req.getParameter("order_zipcode").trim());
			String order_addr = (req.getParameter("order_addr").trim());
			String order_receiver =(req.getParameter("order_receiver").trim());
			String order_tel =(req.getParameter("order_tel").trim());
			
			//訂單狀態設成 2 運送中 
			Integer order_state =2;
			
			//日期用try catch才能設收到null值，再設成null回去
			 //出貨時間為按按鈕當下
			java.sql.Date order_ship_time = new java.sql.Date(System.currentTimeMillis());
			
			
			java.sql.Date order_completion_time = null; //宣告
			try {
				order_completion_time = java.sql.Date.valueOf(req.getParameter("order_completion_time"));//要轉型
			}catch (Exception e) {
				// TODO: handle exception
				order_completion_time=null;
			}
			
			java.sql.Date order_cancel_time = null; //宣告
			try {
				order_cancel_time = java.sql.Date.valueOf(req.getParameter("order_cancel_time"));//要轉型
			}catch (Exception e) {
				// TODO: handle exception
				order_cancel_time=null;
			}
			

			Integer order_cancel_reason = new Integer(req.getParameter("order_cancel_reason"));
			System.out.println(order_cancel_reason);
			Integer order_id = new Integer(req.getParameter("order_id").trim());
				

				ProjOrderVO projOrderVO = new ProjOrderVO();
				
				projOrderVO.setOrder_zipcode(order_zipcode);
				projOrderVO.setOrder_addr(order_addr);
				projOrderVO.setOrder_receiver(order_receiver);
				projOrderVO.setOrder_tel(order_tel);
				projOrderVO.setOrder_state(order_state);
				projOrderVO.setOrder_ship_time(order_ship_time);
				projOrderVO.setOrder_completion_time(order_completion_time);
				projOrderVO.setOrder_cancel_time(order_cancel_time);
				projOrderVO.setOrder_cancel_reason(order_cancel_reason);
				projOrderVO.setOrder_id(order_id);

				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//req.setAttribute("projOrderVO", projOrderVO); // 含有輸入格式錯誤的empVO物件,也存入req
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/front-end/projOrder/farmer_listOneProjOrder.jsp");
//					failureView.forward(req, res);
//					return; //程式中斷
//				}
//				
				/***************************2.開始修改資料*****************************************/
				ProjOrderService projOrderSvc = new ProjOrderService();
				//控制起驗證完拿到的碎片，new領班，交給領班去組合。
				//領班用自己的方法去組合將碎片放入一個EmpVO物件，物件再交給工人去施工更新   的動作，然後領班會再回傳一個empVO物件回來
				ProjOrderVO projOrderVO2 = projOrderSvc.updateProjOrder(order_zipcode, order_addr, order_receiver, order_tel, order_state,order_ship_time, order_completion_time,order_cancel_time,order_cancel_reason,order_id);
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("projOrderVO", projOrderVO2); // 資料庫update成功後,正確的的empVO物件,存入req	
				
				String url = "/front-end/projOrder/searchOrderByFmem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);
				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/projOrder/searchOrderByFmem.jsp");
				failureView.forward(req, res);
			}
		}
		/*************我增加的部分，按按鈕改變訂單狀態變成 2  運送中，END  *****************/
		
		/*************我增加的部分，按按鈕改變訂單狀態變成3  訂單已完成* START  ****************/
		if ("update_state_to_3".equals(action)) { // 來自update_emp_input.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		try {
			Integer order_zipcode = new Integer(req.getParameter("order_zipcode").trim());
			String order_addr = (req.getParameter("order_addr").trim());
			String order_receiver =(req.getParameter("order_receiver").trim());
			String order_tel =(req.getParameter("order_tel").trim());
			
			//訂單狀態設成 3  訂單已完成 
			Integer order_state =3;
			
			//日期用try catch才能設收到null值，再設成null回去
			java.sql.Date order_ship_time = null;  //宣告
			try {
				order_ship_time = java.sql.Date.valueOf(req.getParameter("order_ship_time"));//要轉型
			}catch (Exception e) {
				// TODO: handle exception
				order_ship_time=null;
			}
			
		
			 //完成時間為按按鈕當下
			java.sql.Date order_completion_time = new java.sql.Date(System.currentTimeMillis());
			
			java.sql.Date order_cancel_time = null; //宣告
			try {
				order_cancel_time = java.sql.Date.valueOf(req.getParameter("order_cancel_time"));//要轉型
			}catch (Exception e) {
				// TODO: handle exception
				order_cancel_time=null;
			}
			

			Integer order_cancel_reason = new Integer(req.getParameter("order_cancel_reason"));
			Integer order_id = new Integer(req.getParameter("order_id").trim());
				

				ProjOrderVO projOrderVO = new ProjOrderVO();
				
				projOrderVO.setOrder_zipcode(order_zipcode);
				projOrderVO.setOrder_addr(order_addr);
				projOrderVO.setOrder_receiver(order_receiver);
				projOrderVO.setOrder_tel(order_tel);
				projOrderVO.setOrder_state(order_state);
				projOrderVO.setOrder_ship_time(order_ship_time);
				projOrderVO.setOrder_completion_time(order_completion_time);
				projOrderVO.setOrder_cancel_time(order_cancel_time);
				projOrderVO.setOrder_cancel_reason(order_cancel_reason);
				projOrderVO.setOrder_id(order_id);

				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//req.setAttribute("projOrderVO", projOrderVO); // 含有輸入格式錯誤的empVO物件,也存入req
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/front-end/projOrder/farmer_listOneProjOrder.jsp");
//					failureView.forward(req, res);
//					return; //程式中斷
//				}
//				
				/***************************2.開始修改資料*****************************************/
				ProjOrderService projOrderSvc = new ProjOrderService();
				//控制起驗證完拿到的碎片，new領班，交給領班去組合。
				//領班用自己的方法去組合將碎片放入一個EmpVO物件，物件再交給工人去施工更新   的動作，然後領班會再回傳一個empVO物件回來
				ProjOrderVO projOrderVO2 = projOrderSvc.updateProjOrder(order_zipcode, order_addr, order_receiver, order_tel, order_state,order_ship_time, order_completion_time,order_cancel_time,order_cancel_reason,order_id);
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("projOrderVO", projOrderVO2); // 資料庫update成功後,正確的的empVO物件,存入req	
				
				String url = "/front-end/projOrder/searchOrderByFmem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);
				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/projOrder/searchOrderByFmem.jsp");
				failureView.forward(req, res);
			}
		}
		/*************我增加的部分，按按鈕改變訂單狀態變成 3  訂單已完成，END  *****************/
		
		/*************我增加的部分，按按鈕改變訂單狀態變成4 : 不成立(未處理)* START  ****************/
		if ("update_state_to_4".equals(action)) { // 來自update_emp_input.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		try {
				Integer order_zipcode = new Integer(req.getParameter("order_zipcode").trim());
				String order_addr = (req.getParameter("order_addr").trim());
				String order_receiver =(req.getParameter("order_receiver").trim());
				String order_tel =(req.getParameter("order_tel").trim());
				
				//訂單狀態設成 4 : 不成立(未處理) 
				Integer order_state =4;
				
				//日期用try catch才能設收到null值，再設成null回去
				java.sql.Date order_ship_time = null;  //宣告
				try {
					order_ship_time = java.sql.Date.valueOf(req.getParameter("order_ship_time"));//要轉型
				}catch (Exception e) {
					// TODO: handle exception
					order_ship_time=null;
				}
				
				java.sql.Date order_completion_time = null; //宣告
				try {
					order_completion_time = java.sql.Date.valueOf(req.getParameter("order_completion_time"));//要轉型
				}catch (Exception e) {
					// TODO: handle exception
					order_completion_time=null;
				}
				
				
			 //取消時間為按按鈕當下
			java.sql.Date order_cancel_time = new java.sql.Date(System.currentTimeMillis());
		
			//取消原因為小農取消 3
			Integer order_cancel_reason = 3;
				Integer order_id = new Integer(req.getParameter("order_id").trim());
				

				ProjOrderVO projOrderVO = new ProjOrderVO();
				
				projOrderVO.setOrder_zipcode(order_zipcode);
				projOrderVO.setOrder_addr(order_addr);
				projOrderVO.setOrder_receiver(order_receiver);
				projOrderVO.setOrder_tel(order_tel);
				projOrderVO.setOrder_state(order_state);
				projOrderVO.setOrder_ship_time(order_ship_time);
				projOrderVO.setOrder_completion_time(order_completion_time);
				projOrderVO.setOrder_cancel_time(order_cancel_time);
				projOrderVO.setOrder_cancel_reason(order_cancel_reason);
				projOrderVO.setOrder_id(order_id);

				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//req.setAttribute("projOrderVO", projOrderVO); // 含有輸入格式錯誤的empVO物件,也存入req
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/front-end/projOrder/farmer_listOneProjOrder.jsp");
//					failureView.forward(req, res);
//					return; //程式中斷
//				}
//				
				/***************************2.開始修改資料*****************************************/
				ProjOrderService projOrderSvc = new ProjOrderService();
				//控制起驗證完拿到的碎片，new領班，交給領班去組合。
				//領班用自己的方法去組合將碎片放入一個EmpVO物件，物件再交給工人去施工更新   的動作，然後領班會再回傳一個empVO物件回來
				ProjOrderVO projOrderVO2 = projOrderSvc.updateProjOrder(order_zipcode, order_addr, order_receiver, order_tel, order_state,order_ship_time, order_completion_time,order_cancel_time,order_cancel_reason,order_id);
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("projOrderVO", projOrderVO2); // 資料庫update成功後,正確的的empVO物件,存入req	
				
				String url = "/front-end/projOrder/searchOrderByFmem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);
				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/projOrder/searchOrderByFmem.jsp");
				failureView.forward(req, res);
			}
		}
		/*************我增加的部分，按按鈕改變訂單狀態變成 4 : 不成立(未處理)，END  *****************/
		
		/*************我增加的部分，按按鈕改變訂單狀態變成5：不成立(已解決)* START  ****************/
		if ("update_state_to_5".equals(action)) { // 來自update_emp_input.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		try {
				Integer order_zipcode = new Integer(req.getParameter("order_zipcode").trim());
				String order_addr = (req.getParameter("order_addr").trim());
				String order_receiver =(req.getParameter("order_receiver").trim());
				String order_tel =(req.getParameter("order_tel").trim());
				
				//訂單狀態設成 5：不成立(已解決) 
				Integer order_state =5;
				
				//日期用try catch才能設收到null值，再設成null回去
				java.sql.Date order_ship_time = null;  //宣告
				try {
					order_ship_time = java.sql.Date.valueOf(req.getParameter("order_ship_time"));//要轉型
				}catch (Exception e) {
					// TODO: handle exception
					order_ship_time=null;
				}
				
				java.sql.Date order_completion_time = null; //宣告
				try {
					order_completion_time = java.sql.Date.valueOf(req.getParameter("order_completion_time"));//要轉型
				}catch (Exception e) {
					// TODO: handle exception
					order_completion_time=null;
				}
				
				java.sql.Date order_cancel_time = null; //宣告
				try {
					order_cancel_time = java.sql.Date.valueOf(req.getParameter("order_cancel_time"));//要轉型
				}catch (Exception e) {
					// TODO: handle exception
					order_cancel_time=null;
				}
				

				Integer order_cancel_reason = new Integer(req.getParameter("order_cancel_reason"));
				Integer order_id = new Integer(req.getParameter("order_id").trim());
				

				ProjOrderVO projOrderVO = new ProjOrderVO();
				
				projOrderVO.setOrder_zipcode(order_zipcode);
				projOrderVO.setOrder_addr(order_addr);
				projOrderVO.setOrder_receiver(order_receiver);
				projOrderVO.setOrder_tel(order_tel);
				projOrderVO.setOrder_state(order_state);
				projOrderVO.setOrder_ship_time(order_ship_time);
				projOrderVO.setOrder_completion_time(order_completion_time);
				projOrderVO.setOrder_cancel_time(order_cancel_time);
				projOrderVO.setOrder_cancel_reason(order_cancel_reason);
				projOrderVO.setOrder_id(order_id);

				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//req.setAttribute("projOrderVO", projOrderVO); // 含有輸入格式錯誤的empVO物件,也存入req
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/front-end/projOrder/farmer_listOneProjOrder.jsp");
//					failureView.forward(req, res);
//					return; //程式中斷
//				}
//				
				/***************************2.開始修改資料*****************************************/
				ProjOrderService projOrderSvc = new ProjOrderService();
				//控制起驗證完拿到的碎片，new領班，交給領班去組合。
				//領班用自己的方法去組合將碎片放入一個EmpVO物件，物件再交給工人去施工更新   的動作，然後領班會再回傳一個empVO物件回來
				ProjOrderVO projOrderVO2 = projOrderSvc.updateProjOrder(order_zipcode, order_addr, order_receiver, order_tel, order_state,order_ship_time, order_completion_time,order_cancel_time,order_cancel_reason,order_id);
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("projOrderVO", projOrderVO2); // 資料庫update成功後,正確的的empVO物件,存入req	
				
				String url = "/front-end/projOrder/searchOrderByFmem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);
				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/projOrder/searchOrderByFmem.jsp");
				failureView.forward(req, res);
			}
		}
		/*************我增加的部分，按按鈕改變訂單狀態變成5：不成立(已解決)，END  *****************/
/*=== Fmem ================ＥＮＤ=====查詢區專用按紐==，按完會回到searchOrderByFmem.jsp查詢頁面=============================*/
		
		
		
		
		
		
		
		
/*== Fmem =================ＳＴＡＲＴ=====全部區 專用按紐==，按完會回到全部頁面=============================*/
		/*************我增加的部分，按按鈕改變訂單狀態變成 1 待出貨* START  ****************/
		if ("update_state_to_1_and_then_show_All".equals(action)) { // 來自update_emp_input.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		try {
			
			String membership = (req.getParameter("membership").trim());
			String mem_id = (req.getParameter("mem_id"));
			String f_mem_id = (req.getParameter("f_mem_id"));
			if (membership.equals("seller")) {
				f_mem_id=f_mem_id.trim();
			}else if (membership.equals("buyer")) {
				mem_id=mem_id.trim();
			}
				
			
				Integer order_zipcode = new Integer(req.getParameter("order_zipcode").trim());
				String order_addr = (req.getParameter("order_addr").trim());
				String order_receiver =(req.getParameter("order_receiver").trim());
				String order_tel =(req.getParameter("order_tel").trim());
				
				//訂單狀態設成 1 ，因為確認收款按鈕按了，從待付款變成待出貨。 
				Integer order_state =1;
				
				//日期用try catch才能設收到null值，再設成null回去
				java.sql.Date order_ship_time = null;  //宣告
				try {
					order_ship_time = java.sql.Date.valueOf(req.getParameter("order_ship_time"));//要轉型
				}catch (Exception e) {
					// TODO: handle exception
					order_ship_time=null;
				}
				
				java.sql.Date order_completion_time = null; //宣告
				try {
					order_completion_time = java.sql.Date.valueOf(req.getParameter("order_completion_time"));//要轉型
				}catch (Exception e) {
					// TODO: handle exception
					order_completion_time=null;
				}
				
				java.sql.Date order_cancel_time = null; //宣告
				try {
					order_cancel_time = java.sql.Date.valueOf(req.getParameter("order_cancel_time"));//要轉型
				}catch (Exception e) {
					// TODO: handle exception
					order_cancel_time=null;
				}
				

				Integer order_cancel_reason = new Integer(req.getParameter("order_cancel_reason"));
				Integer order_id = new Integer(req.getParameter("order_id").trim());
				

				ProjOrderVO projOrderVO = new ProjOrderVO();
				
				projOrderVO.setOrder_zipcode(order_zipcode);
				projOrderVO.setOrder_addr(order_addr);
				projOrderVO.setOrder_receiver(order_receiver);
				projOrderVO.setOrder_tel(order_tel);
				projOrderVO.setOrder_state(order_state);
				projOrderVO.setOrder_ship_time(order_ship_time);
				projOrderVO.setOrder_completion_time(order_completion_time);
				projOrderVO.setOrder_cancel_time(order_cancel_time);
				projOrderVO.setOrder_cancel_reason(order_cancel_reason);
				projOrderVO.setOrder_id(order_id);

				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//req.setAttribute("projOrderVO", projOrderVO); // 含有輸入格式錯誤的empVO物件,也存入req
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/front-end/projOrder/farmer_listOneProjOrder.jsp");
//					failureView.forward(req, res);
//					return; //程式中斷
//				}
//				
				/***************************2.開始修改資料*****************************************/
				ProjOrderService projOrderSvc = new ProjOrderService();
				//控制起驗證完拿到的碎片，new領班，交給領班去組合。
				//領班用自己的方法去組合將碎片放入一個EmpVO物件，物件再交給工人去施工更新   的動作，然後領班會再回傳一個empVO物件回來
				ProjOrderVO projOrderVO2 = projOrderSvc.updateProjOrder(order_zipcode, order_addr, order_receiver, order_tel, order_state,order_ship_time, order_completion_time,order_cancel_time,order_cancel_reason,order_id);
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				List<ProjOrderVO> projOrderVO3=null;
				System.out.println(membership);
				System.out.println(mem_id);
				System.out.println(f_mem_id);
				
				if (membership.equals("seller")) {
					Integer f_mem_id1 = new Integer(req.getParameter("f_mem_id"));
					projOrderVO3= projOrderSvc.getAllFmemOrder(f_mem_id1);
					}
				else if(membership.equals("buyer")) {
					Integer mem_id1 = new Integer(req.getParameter("mem_id"));
					projOrderVO3= projOrderSvc.getAllMemOrder(mem_id1);
					
					}
				
				req.setAttribute("projOrderVO", projOrderVO3); // 資料庫update成功後,正確的的empVO物件,存入req	
				
				String url ="";
				
				if (membership.equals("seller")) {
					req.setAttribute("f_mem_id", f_mem_id);
					url = "/front-end/projOrder/listAllOrderByFmem.jsp";	
					System.out.println(f_mem_id);
				}else if(membership.equals("buyer")) {
					req.setAttribute("mem_id", mem_id);
					url = "/front-end/projOrder/listAllOrderByMem.jsp";
					System.out.println(mem_id);
				}
				req.setAttribute("membership", membership);
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);
//				res.sendRedirect("listAllOrderByFmem.jsp");
				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				System.out.println("error4");
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				e.printStackTrace();
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/home/home.jsp");
				failureView.forward(req, res);
			}
		}
		/*************我增加的部分，按按鈕改變訂單狀態變成 1 待出貨，END  *****************/
		
		/*************我增加的部分，按按鈕改變訂單狀態變成 2 : 運送中* START  ****************/
		if ("update_state_to_2_and_then_show_All".equals(action)) { // 來自update_emp_input.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		try {
			
			String membership = (req.getParameter("membership").trim());
			String mem_id = (req.getParameter("mem_id"));
			String f_mem_id = (req.getParameter("f_mem_id"));
			if (membership.equals("seller")) {
				f_mem_id=f_mem_id.trim();
			}else if (membership.equals("buyer")) {
				mem_id=mem_id.trim();
			}
			
			Integer order_zipcode = new Integer(req.getParameter("order_zipcode").trim());
			String order_addr = (req.getParameter("order_addr").trim());
			String order_receiver =(req.getParameter("order_receiver").trim());
			String order_tel =(req.getParameter("order_tel").trim());
			
			//訂單狀態設成 2 運送中 
			Integer order_state =2;
			
			//日期用try catch才能設收到null值，再設成null回去
			 //出貨時間為按按鈕當下
			java.sql.Date order_ship_time = new java.sql.Date(System.currentTimeMillis());
			
			
			java.sql.Date order_completion_time = null; //宣告
			try {
				order_completion_time = java.sql.Date.valueOf(req.getParameter("order_completion_time"));//要轉型
			}catch (Exception e) {
				// TODO: handle exception
				order_completion_time=null;
			}
			
			java.sql.Date order_cancel_time = null; //宣告
			try {
				order_cancel_time = java.sql.Date.valueOf(req.getParameter("order_cancel_time"));//要轉型
			}catch (Exception e) {
				// TODO: handle exception
				order_cancel_time=null;
			}
			

			Integer order_cancel_reason = new Integer(req.getParameter("order_cancel_reason"));
			System.out.println(order_cancel_reason);
			Integer order_id = new Integer(req.getParameter("order_id").trim());
				

				ProjOrderVO projOrderVO = new ProjOrderVO();
				
				projOrderVO.setOrder_zipcode(order_zipcode);
				projOrderVO.setOrder_addr(order_addr);
				projOrderVO.setOrder_receiver(order_receiver);
				projOrderVO.setOrder_tel(order_tel);
				projOrderVO.setOrder_state(order_state);
				projOrderVO.setOrder_ship_time(order_ship_time);
				projOrderVO.setOrder_completion_time(order_completion_time);
				projOrderVO.setOrder_cancel_time(order_cancel_time);
				projOrderVO.setOrder_cancel_reason(order_cancel_reason);
				projOrderVO.setOrder_id(order_id);

				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//req.setAttribute("projOrderVO", projOrderVO); // 含有輸入格式錯誤的empVO物件,也存入req
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/front-end/projOrder/farmer_listOneProjOrder.jsp");
//					failureView.forward(req, res);
//					return; //程式中斷
//				}
//				
				/***************************2.開始修改資料*****************************************/
				ProjOrderService projOrderSvc = new ProjOrderService();
				//控制起驗證完拿到的碎片，new領班，交給領班去組合。
				//領班用自己的方法去組合將碎片放入一個EmpVO物件，物件再交給工人去施工更新   的動作，然後領班會再回傳一個empVO物件回來
				ProjOrderVO projOrderVO2 = projOrderSvc.updateProjOrder(order_zipcode, order_addr, order_receiver, order_tel, order_state,order_ship_time, order_completion_time,order_cancel_time,order_cancel_reason,order_id);
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				List<ProjOrderVO> projOrderVO3=null;
				System.out.println(membership);
				System.out.println(mem_id);
				System.out.println(f_mem_id);
				
				if (membership.equals("seller")) {
					Integer f_mem_id1 = new Integer(req.getParameter("f_mem_id"));
					projOrderVO3= projOrderSvc.getAllFmemOrder(f_mem_id1);
					}
				else if(membership.equals("buyer")) {
					Integer mem_id1 = new Integer(req.getParameter("mem_id"));
					projOrderVO3= projOrderSvc.getAllMemOrder(mem_id1);
					
					}
				
				req.setAttribute("projOrderVO", projOrderVO3); // 資料庫update成功後,正確的的empVO物件,存入req	
				
				String url ="";
				
				if (membership.equals("seller")) {
					req.setAttribute("f_mem_id", f_mem_id);
					url = "/front-end/projOrder/listAllOrderByFmem.jsp";	
					System.out.println(f_mem_id);
				}else if(membership.equals("buyer")) {
					req.setAttribute("mem_id", mem_id);
					url = "/front-end/projOrder/listAllOrderByMem.jsp";
					System.out.println(mem_id);
				}
				req.setAttribute("membership", membership);
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);
//				res.sendRedirect("/front-end/projOrder/listAllOrderByFmem.jsp");
				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				e.printStackTrace();
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/home/home.jsp");
				failureView.forward(req, res);
			}
		}
		/*************我增加的部分，按按鈕改變訂單狀態變成 2  運送中，END  *****************/
		
		/*************我增加的部分，按按鈕改變訂單狀態變成3  訂單已完成* START  ****************/
		if ("update_state_to_3_and_then_show_All".equals(action)) { // 來自update_emp_input.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		try {
			
			String membership = (req.getParameter("membership").trim());
			String mem_id = (req.getParameter("mem_id"));
			String f_mem_id = (req.getParameter("f_mem_id"));
			if (membership.equals("seller")) {
				f_mem_id=f_mem_id.trim();
			}else if (membership.equals("buyer")) {
				mem_id=mem_id.trim();
			}
			
			Integer order_zipcode = new Integer(req.getParameter("order_zipcode").trim());
			String order_addr = (req.getParameter("order_addr").trim());
			String order_receiver =(req.getParameter("order_receiver").trim());
			String order_tel =(req.getParameter("order_tel").trim());
			
			//訂單狀態設成 3  訂單已完成 
			Integer order_state =3;
			
			//日期用try catch才能設收到null值，再設成null回去
			java.sql.Date order_ship_time = null;  //宣告
			try {
				order_ship_time = java.sql.Date.valueOf(req.getParameter("order_ship_time"));//要轉型
			}catch (Exception e) {
				// TODO: handle exception
				order_ship_time=null;
			}
			
		
			 //完成時間為按按鈕當下
			java.sql.Date order_completion_time = new java.sql.Date(System.currentTimeMillis());
			
			java.sql.Date order_cancel_time = null; //宣告
			try {
				order_cancel_time = java.sql.Date.valueOf(req.getParameter("order_cancel_time"));//要轉型
			}catch (Exception e) {
				// TODO: handle exception
				order_cancel_time=null;
			}
			

			Integer order_cancel_reason = new Integer(req.getParameter("order_cancel_reason"));
			Integer order_id = new Integer(req.getParameter("order_id").trim());
				

				ProjOrderVO projOrderVO = new ProjOrderVO();
				
				projOrderVO.setOrder_zipcode(order_zipcode);
				projOrderVO.setOrder_addr(order_addr);
				projOrderVO.setOrder_receiver(order_receiver);
				projOrderVO.setOrder_tel(order_tel);
				projOrderVO.setOrder_state(order_state);
				projOrderVO.setOrder_ship_time(order_ship_time);
				projOrderVO.setOrder_completion_time(order_completion_time);
				projOrderVO.setOrder_cancel_time(order_cancel_time);
				projOrderVO.setOrder_cancel_reason(order_cancel_reason);
				projOrderVO.setOrder_id(order_id);

				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//req.setAttribute("projOrderVO", projOrderVO); // 含有輸入格式錯誤的empVO物件,也存入req
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/front-end/projOrder/farmer_listOneProjOrder.jsp");
//					failureView.forward(req, res);
//					return; //程式中斷
//				}
//				
				/***************************2.開始修改資料*****************************************/
				ProjOrderService projOrderSvc = new ProjOrderService();
				//控制起驗證完拿到的碎片，new領班，交給領班去組合。
				//領班用自己的方法去組合將碎片放入一個EmpVO物件，物件再交給工人去施工更新   的動作，然後領班會再回傳一個empVO物件回來
				ProjOrderVO projOrderVO2 = projOrderSvc.updateProjOrder(order_zipcode, order_addr, order_receiver, order_tel, order_state,order_ship_time, order_completion_time,order_cancel_time,order_cancel_reason,order_id);
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				List<ProjOrderVO> projOrderVO3=null;
				System.out.println(membership);
				System.out.println(mem_id);
				System.out.println(f_mem_id);
				
				if (membership.equals("seller")) {
					Integer f_mem_id1 = new Integer(req.getParameter("f_mem_id"));
					projOrderVO3= projOrderSvc.getAllFmemOrder(f_mem_id1);
					}
				else if(membership.equals("buyer")) {
					Integer mem_id1 = new Integer(req.getParameter("mem_id"));
					projOrderVO3= projOrderSvc.getAllMemOrder(mem_id1);
					
					}
				
				req.setAttribute("projOrderVO", projOrderVO3); // 資料庫update成功後,正確的的empVO物件,存入req	
				
				String url ="";
				
				if (membership.equals("seller")) {
					req.setAttribute("f_mem_id", f_mem_id);
					url = "/front-end/projOrder/listAllOrderByFmem.jsp";	
					System.out.println(f_mem_id);
				}else if(membership.equals("buyer")) {
					req.setAttribute("mem_id", mem_id);
					url = "/front-end/projOrder/listAllOrderByMem.jsp";
					System.out.println(mem_id);
				}
				req.setAttribute("membership", membership);
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);
//				res.sendRedirect("/front-end/projOrder/listAllOrderByFmem.jsp");
				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				e.printStackTrace();
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/home/home.jsp");
				failureView.forward(req, res);
			}
		}
		/*************我增加的部分，按按鈕改變訂單狀態變成 3  訂單已完成，END  *****************/
		
		/*************我增加的部分，按按鈕改變訂單狀態變成4 : 不成立(未處理)* START  ****************/
		if ("update_state_to_4_and_then_show_All".equals(action)) { // 來自update_emp_input.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		try {
			
			String membership = (req.getParameter("membership").trim());
			String mem_id = (req.getParameter("mem_id"));
			String f_mem_id = (req.getParameter("f_mem_id"));
			if (membership.equals("seller")) {
				f_mem_id=f_mem_id.trim();
			}else if (membership.equals("buyer")) {
				mem_id=mem_id.trim();
			}
			
				Integer order_zipcode = new Integer(req.getParameter("order_zipcode").trim());
				String order_addr = (req.getParameter("order_addr").trim());
				String order_receiver =(req.getParameter("order_receiver").trim());
				String order_tel =(req.getParameter("order_tel").trim());
				
				//訂單狀態設成 4 : 不成立(未處理) 
				Integer order_state =4;
				
				//日期用try catch才能設收到null值，再設成null回去
				java.sql.Date order_ship_time = null;  //宣告
				try {
					order_ship_time = java.sql.Date.valueOf(req.getParameter("order_ship_time"));//要轉型
				}catch (Exception e) {
					// TODO: handle exception
					order_ship_time=null;
				}
				
				java.sql.Date order_completion_time = null; //宣告
				try {
					order_completion_time = java.sql.Date.valueOf(req.getParameter("order_completion_time"));//要轉型
				}catch (Exception e) {
					// TODO: handle exception
					order_completion_time=null;
				}
				
				
			 //取消時間為按按鈕當下
			java.sql.Date order_cancel_time = new java.sql.Date(System.currentTimeMillis());
		
			Integer order_cancel_reason=null;
			Integer order_id=null;
			
			//取消原因為小農取消 3
			if (membership.equals("seller")) {
				order_cancel_reason = 3;
				order_id = new Integer(req.getParameter("order_id").trim());
				}
			//取消原因為會員取消 2
			else if(membership.equals("buyer")) {
				order_cancel_reason = 2;
				order_id = new Integer(req.getParameter("order_id").trim());
				
				}
			

				ProjOrderVO projOrderVO = new ProjOrderVO();
				
				projOrderVO.setOrder_zipcode(order_zipcode);
				projOrderVO.setOrder_addr(order_addr);
				projOrderVO.setOrder_receiver(order_receiver);
				projOrderVO.setOrder_tel(order_tel);
				projOrderVO.setOrder_state(order_state);
				projOrderVO.setOrder_ship_time(order_ship_time);
				projOrderVO.setOrder_completion_time(order_completion_time);
				projOrderVO.setOrder_cancel_time(order_cancel_time);
				projOrderVO.setOrder_cancel_reason(order_cancel_reason);
				projOrderVO.setOrder_id(order_id);

				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//req.setAttribute("projOrderVO", projOrderVO); // 含有輸入格式錯誤的empVO物件,也存入req
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/front-end/projOrder/farmer_listOneProjOrder.jsp");
//					failureView.forward(req, res);
//					return; //程式中斷
//				}
//				
				/***************************2.開始修改資料*****************************************/
				ProjOrderService projOrderSvc = new ProjOrderService();
				//控制起驗證完拿到的碎片，new領班，交給領班去組合。
				//領班用自己的方法去組合將碎片放入一個EmpVO物件，物件再交給工人去施工更新   的動作，然後領班會再回傳一個empVO物件回來
				ProjOrderVO projOrderVO2 = projOrderSvc.updateProjOrder(order_zipcode, order_addr, order_receiver, order_tel, order_state,order_ship_time, order_completion_time,order_cancel_time,order_cancel_reason,order_id);
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				List<ProjOrderVO> projOrderVO3=null;
				System.out.println(membership);
				System.out.println(mem_id);
				System.out.println(f_mem_id);
				
				if (membership.equals("seller")) {
					Integer f_mem_id1 = new Integer(req.getParameter("f_mem_id"));
					projOrderVO3= projOrderSvc.getAllFmemOrder(f_mem_id1);
					}
				else if(membership.equals("buyer")) {
					Integer mem_id1 = new Integer(req.getParameter("mem_id"));
					projOrderVO3= projOrderSvc.getAllMemOrder(mem_id1);
					
					}
				
				req.setAttribute("projOrderVO", projOrderVO3); // 資料庫update成功後,正確的的empVO物件,存入req	
				
				String url ="";
				
				if (membership.equals("seller")) {
					req.setAttribute("f_mem_id", f_mem_id);
					url = "/front-end/projOrder/listAllOrderByFmem.jsp";	
					System.out.println(f_mem_id);
				}else if(membership.equals("buyer")) {
					req.setAttribute("mem_id", mem_id);
					url = "/front-end/projOrder/listAllOrderByMem.jsp";
					System.out.println(mem_id);
				}
				req.setAttribute("membership", membership);
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);
//				res.sendRedirect("/front-end/projOrder/listAllOrderByFmem.jsp");
				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				e.printStackTrace();
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/home/home.jsp");
				failureView.forward(req, res);
			}
		}
		/*************我增加的部分，按按鈕改變訂單狀態變成 4 : 不成立(未處理)，END  *****************/
		
		/*************我增加的部分，按按鈕改變訂單狀態變成5：不成立(已解決)* START  ****************/
		if ("update_state_to_5_and_then_show_All".equals(action)) { // 來自update_emp_input.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		try {
			
			Integer perk_id = new Integer(req.getParameter("perk_id").trim());
			String membership = (req.getParameter("membership").trim());
			String mem_id = (req.getParameter("mem_id"));
			String f_mem_id = (req.getParameter("f_mem_id"));
			if (membership.equals("seller")) {
				f_mem_id=f_mem_id.trim();
			}else if (membership.equals("buyer")) {
				mem_id=mem_id.trim();
			}
			
			
				Integer order_zipcode = new Integer(req.getParameter("order_zipcode").trim());
				String order_addr = (req.getParameter("order_addr").trim());
				String order_receiver =(req.getParameter("order_receiver").trim());
				String order_tel =(req.getParameter("order_tel").trim());
				
				//訂單狀態設成 5：不成立(已解決) 
				Integer order_state =5;
				
				//日期用try catch才能設收到null值，再設成null回去
				java.sql.Date order_ship_time = null;  //宣告
				try {
					order_ship_time = java.sql.Date.valueOf(req.getParameter("order_ship_time"));//要轉型
				}catch (Exception e) {
					// TODO: handle exception
					order_ship_time=null;
				}
				
				java.sql.Date order_completion_time = null; //宣告
				try {
					order_completion_time = java.sql.Date.valueOf(req.getParameter("order_completion_time"));//要轉型
				}catch (Exception e) {
					// TODO: handle exception
					order_completion_time=null;
				}
				
				java.sql.Date order_cancel_time = null; //宣告
				try {
					order_cancel_time = java.sql.Date.valueOf(req.getParameter("order_cancel_time"));//要轉型
				}catch (Exception e) {
					// TODO: handle exception
					order_cancel_time=null;
				}
				

				Integer order_cancel_reason = new Integer(req.getParameter("order_cancel_reason"));
				Integer order_id = new Integer(req.getParameter("order_id").trim());
				

				ProjOrderVO projOrderVO = new ProjOrderVO();
				
				projOrderVO.setOrder_zipcode(order_zipcode);
				projOrderVO.setOrder_addr(order_addr);
				projOrderVO.setOrder_receiver(order_receiver);
				projOrderVO.setOrder_tel(order_tel);
				projOrderVO.setOrder_state(order_state);
				projOrderVO.setOrder_ship_time(order_ship_time);
				projOrderVO.setOrder_completion_time(order_completion_time);
				projOrderVO.setOrder_cancel_time(order_cancel_time);
				projOrderVO.setOrder_cancel_reason(order_cancel_reason);
				projOrderVO.setOrder_id(order_id);

				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//req.setAttribute("projOrderVO", projOrderVO); // 含有輸入格式錯誤的empVO物件,也存入req
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/front-end/projOrder/farmer_listOneProjOrder.jsp");
//					failureView.forward(req, res);
//					return; //程式中斷
//				}
//				
				/***************************2.開始修改資料*****************************************/
				ProjOrderService projOrderSvc = new ProjOrderService();
				//控制起驗證完拿到的碎片，new領班，交給領班去組合。
				//領班用自己的方法去組合將碎片放入一個EmpVO物件，物件再交給工人去施工更新   的動作，然後領班會再回傳一個empVO物件回來
				ProjOrderVO projOrderVO2 = projOrderSvc.updateProjOrder(order_zipcode, order_addr, order_receiver, order_tel, order_state,order_ship_time, order_completion_time,order_cancel_time,order_cancel_reason,order_id);
				
				
				
//				新增後要更新募資總人數跟募資總額及方案總人數
				ProjPerkService projPerkSvc = new ProjPerkService();
				projPerkSvc.autoUpdateTotalCountAFund(perk_id);
				System.out.println("PERK_TOTAL_COUNT、PROJ_TOTAL_FUND及PROJ_TOTAL_COUNT更新成功");
				
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				List<ProjOrderVO> projOrderVO3=null;
				System.out.println(membership);
				System.out.println(mem_id);
				System.out.println(f_mem_id);
				if (membership.equals("seller")) {
					Integer f_mem_id1 = new Integer(req.getParameter("f_mem_id"));
					projOrderVO3= projOrderSvc.getAllFmemOrder(f_mem_id1);
					}
				else if(membership.equals("buyer")) {
					Integer mem_id1 = new Integer(req.getParameter("mem_id"));
					projOrderVO3= projOrderSvc.getAllMemOrder(mem_id1);
					
					}
				
				req.setAttribute("projOrderVO", projOrderVO3); // 資料庫update成功後,正確的的empVO物件,存入req	
				
				String url ="";
				
				if (membership.equals("seller")) {
					req.setAttribute("f_mem_id", f_mem_id);
					url = "/front-end/projOrder/listAllOrderByFmem.jsp";	
					System.out.println(f_mem_id);
				}else if(membership.equals("buyer")) {
					req.setAttribute("mem_id", mem_id);
					url = "/front-end/projOrder/listAllOrderByMem.jsp";
					System.out.println(mem_id);
				}
				req.setAttribute("membership", membership);
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);
//				res.sendRedirect("/front-end/projOrder/listAllOrderByFmem.jsp");
				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				e.printStackTrace();
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/home/home.jsp");
				failureView.forward(req, res);
			}
		}
		/*************我增加的部分，按按鈕改變訂單狀態變成5：不成立(已解決)，END  *****************/
/*===== Fmem ==============ＥＮＤ=====全部區專用按紐==，按完會回到全部頁面=============================*/	
	
		
		
		
		
        if ("insert".equals(action)) { // 來自addEmp.jsp的請求  
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				System.out.println("projOrderServlet insert in");

				
			Integer mem_id = new Integer(req.getParameter("mem_id").trim());
				Integer perk_id = new Integer(req.getParameter("perk_id").trim());
				
				// ---------------order_zipcode驗證----------------//
				String order_addr = (req.getParameter("order_addr").trim());
				
				
				order_addr=order_addr.replace("\n", "&nbsp;");
				order_addr=order_addr.replace("\r", "&nbsp;");
				order_addr=order_addr.replace("<", "&lt;");
				order_addr=order_addr.replace(">", "&gt;");
				order_addr=order_addr.replace("\"", "&quot;");
				order_addr=order_addr.replace("\'", "&quot;");
				
				
				String order_addrReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,40}$";
				if (order_addr == null || order_addr.trim().length() == 0) {
					errorMsgs.add("地址: 請勿空白");
				} else if(!order_addr.trim().matches(order_addrReg)) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("地址: 只能是中、英文字母、數字和_ , 且長度必需在40字以內");
	            }
				
				
				String order_zipcode_str = (req.getParameter("order_zipcode").trim());
				String order_zipcodeReg = "^.{3}$";

				if (order_zipcode_str == null || order_zipcode_str.trim().length() == 0) {
					errorMsgs.add("郵遞區號: 請勿空白");
				} else if(!order_zipcode_str.trim().matches(order_zipcodeReg)) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("郵遞區號: 只能是數字，且長度必需在3字以內");
	            }
								
				Integer order_zipcode = null;
				try {
					order_zipcode = new Integer(req.getParameter("order_zipcode").trim());
				} catch (NumberFormatException e) {
					order_zipcode=null;
					errorMsgs.add("郵遞區號請填數字.");
				}

				String order_receiver =(req.getParameter("order_receiver").trim());
				String order_receiverReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,25}$";
				if (order_receiver == null || order_receiver.trim().length() == 0) {
					errorMsgs.add("收件人姓名: 請勿空白");
				} else if(!order_receiver.trim().matches(order_receiverReg)) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("收件人姓名: 只能是中、英文字母、數字和_ , 且長度必需在2到25之間");
	            }
				
				
//				String order_tel =(req.getParameter("order_tel").trim());
				String order_tel = (req.getParameter("order_tel").trim());
				String order_telReg = "^{0,1}[0-9]*$";
				if (order_tel == null || order_tel.trim().length() == 0) {
					errorMsgs.add("聯絡電話: 請勿空白");
				} else if(!order_tel.trim().matches(order_telReg)) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("聯絡電話: 只能是數字");
	            }
				
				String order_pay_str =(req.getParameter("order_pay").trim());
				
				Integer order_pay = Integer.parseInt(order_pay_str);

					ProjOrderVO projOrderVO = new ProjOrderVO();
				
					projOrderVO.setMem_id(mem_id);
					projOrderVO.setPerk_id(perk_id);
					projOrderVO.setOrder_zipcode(order_zipcode);
					projOrderVO.setOrder_addr(order_addr);
					projOrderVO.setOrder_receiver(order_receiver);
					projOrderVO.setOrder_tel(order_tel);
					projOrderVO.setOrder_pay(order_pay);

					
					// Send the use back to the form, if there were errors
					ProjPerkService projPerkSvc3 = new ProjPerkService(); 
					ProjPerkVO projPerkVO3 = projPerkSvc3.getOneProjPerk(perk_id);   
					
					ProjectService projectSvc3 = new ProjectService();
					ProjectVO projectVO3 = projectSvc3.getOneProject(projPerkVO3.getProj_id());
					System.out.println("insert projPerkVO3.getProj_id()="+projPerkVO3.getProj_id());
//					MemService memSvc3 = new MemService();  
//					MemVO memVO3 = memSvc3.getOneMem(mem_id); 
					

				
					if (!errorMsgs.isEmpty()) { //錯誤回去
/**備註：為了測試，MemVO暫時用req帶過去*******/
						req.setAttribute("projOrderVO", projOrderVO);
						
//						req.setAttribute("projectVO", projectVO3);
//						req.setAttribute("projPerkVO",projPerkVO3);
//						req.setAttribute("memVO",memVO3);
//	req.setAttribute("projOrderVO", projOrderVO); // 含有輸入格式錯誤的empVO物件,也存入req
						RequestDispatcher failureView = req
								.getRequestDispatcher("/front-end/projOrder/addOrderByMem.jsp");
						failureView.forward(req, res);
						return; //程式中斷
					}
					
					/***************************2.開始修改資料*****************************************/
					ProjOrderService projOrderSvc = new ProjOrderService();
					//控制起驗證完拿到的碎片，new領班，交給領班去組合。
					//領班用自己的方法去組合將碎片放入一個EmpVO物件，物件再交給工人去施工更新   的動作，然後領班會再回傳一個empVO物件回來
					ProjOrderVO projOrderVO2 = projOrderSvc.addProjOrder(mem_id, perk_id, order_zipcode, order_addr, order_receiver,order_tel, order_pay);
					
					
					//	新增後要更新募資總人數跟募資總額及方案總人數
					ProjPerkService projPerkSvc = new ProjPerkService();
					projPerkSvc.autoUpdateTotalCountAFund(perk_id);
					System.out.println("PERK_TOTAL_COUNT、PROJ_TOTAL_FUND及PROJ_TOTAL_COUNT更新成功");
					
					
					
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
/**備註：為了測試，MemVO暫時用req帶過去*******/
//				req.setAttribute("memVO",memVO3);
				req.setAttribute("projectVO", projectVO3);
				String url = "/front-end/projOrder/success_addOrderByMem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);				
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/project/listAllProjByMem.jsp");
				failureView.forward(req, res);
			}
		}
        
        
        
if ("logout_By_Proj".equals(action)) { // 來自addEmp.jsp的請求  
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
        
     // 取得session，若session為null，不建立新的session
        HttpSession session = req.getSession(false);

        // 若session不為空，讓此session失效
        if (session != null) {
            session.invalidate();
            session = null;
        }
			}catch (Exception e) {
				// TODO: handle exception
			}
		
			String url = "/front-end/home/home.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
			successView.forward(req, res);

}
        
        
//		
//		//***********************我不會用到刪除訂單這個功能**********************/
//		if ("delete".equals(action)) { // 來自listAllEmp.jsp 
//
//			List<String> errorMsgs = new LinkedList<String>();
//			// Store this set in the request scope, in case we need to
//			// send the ErrorPage view.
//			req.setAttribute("errorMsgs", errorMsgs);
//	
//			try {
//				/***************************1.接收請求參數***************************************/
//				Integer order_id = new Integer(req.getParameter("order_id"));
//				
//				/***************************2.開始刪除資料***************************************/
//				ProjOrderService projOrderSvc = new ProjOrderService();
//				projOrderSvc.deleteProjOrder(order_id);
//				
//				/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
//				String url = "/front-end/projOrder/farmer_listOneProjOrder.jsp";//****我還沒改
//				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
//				successView.forward(req, res);
//				
//				/***************************其他可能的錯誤處理**********************************/
//			} catch (Exception e) {
//				errorMsgs.add("刪除資料失敗:"+e.getMessage());
//				RequestDispatcher failureView = req
//						.getRequestDispatcher("/front-end/projOrder/emp/listAllEmp.jsp");//****我還沒改
//				failureView.forward(req, res);
//			}
//		}
	}
}


