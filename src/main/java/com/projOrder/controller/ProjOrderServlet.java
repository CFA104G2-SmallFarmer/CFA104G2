package com.projOrder.controller;
import java.io.*;
import java.sql.Date;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import com.projOrder.model.ProjOrderService;
import com.projOrder.model.ProjOrderVO;
import com.projPerk.model.ProjPerkService;
import com.projPerk.model.ProjPerkVO;
import com.project.model.ProjectService;
import com.project.model.ProjectVO;

import oracle.sql.DATE;

public class ProjOrderServlet extends HttpServlet{
	
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
							.getRequestDispatcher("searchOrder.jsp");///***我還沒改
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
							.getRequestDispatcher("searchOrder.jsp");///***我還沒改
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
							.getRequestDispatcher("searchOrder.jsp");///***我還沒改
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
				
				String url = "listOneOrder.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("searchOrder.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		
		/***<<給小農用的>>**/
		if ("getOneByFMem".equals(action)) { // 來自select_page.jsp的請求

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
							.getRequestDispatcher("searchOrderByFMem.jsp");///***我還沒改
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
							.getRequestDispatcher("searchOrderByFMem.jsp");///***我還沒改
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
							.getRequestDispatcher("searchOrderByFMem.jsp");///***我還沒改
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
				
				String url = "listOneOrderByFMem.jsp";///***我還沒改
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("searchOrderByFMem.jsp");///***我還沒改
				failureView.forward(req, res);
			}
		}
		
		
		
		
/*=================================================*/
/*=========         gllAll 區域             ========*/
/*=================================================*/
		
		/***<<給一般會員用的>>*於0204加入****/
		if ("getAllByMem".equals(action)) {
			System.out.println("1");
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String str = req.getParameter("mem_id");
				System.out.println(str);
				if (str == null || (str.trim()).length() == 0) {
					System.out.println(str);
					errorMsgs.add("請輸入專案編號");
					System.out.println(str);
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/project/listAllProj.jsp");
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
					RequestDispatcher failureView = req.getRequestDispatcher("/project/listAllProj.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}
				System.out.println("2");
				/*************************** 2.開始查詢資料 *****************************************/
				ProjOrderService projOrderSvc = new ProjOrderService();
				List<ProjOrderVO> projOrderVO = projOrderSvc.getAllMemOrder(mem_id);
				
				
				for(int i=0; i<projOrderVO.size(); i++) {
					System.out.println(projOrderVO.get(i));
				}
				
				if (projOrderVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/project/listAllProj.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}
				System.out.println("3");
				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("projOrderVO", projOrderVO); // 資料庫取出的projPerkVO物件,存入req
				
				String url = "listAllOrderByMem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 perkoverview.jsp
				successView.forward(req, res);
				System.out.println("成功");
				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				System.out.println("error in final");
				errorMsgs.add("無法取得資料:" + e.getMessage());
				

				
				RequestDispatcher failureView = req.getRequestDispatcher("/project/listAllProj.jsp");
				failureView.forward(req, res);
				
				System.out.println("error in final");
			}
		}
		
		
		/***<<給小農用的>>**/
		if ("getAllByFMem".equals(action)) {
			System.out.println("2");/////////////////
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String str = req.getParameter("f_mem_id");
				System.out.println(str);//////////////////////
				if (str == null || (str.trim()).length() == 0) {
					System.out.println(str);
					errorMsgs.add("請輸入專案編號");
					System.out.println(str);
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("listAllOrderByFMem.jsp");
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
					RequestDispatcher failureView = req.getRequestDispatcher("listAllOrderByFMem.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}
				System.out.println("2");
				/*************************** 2.開始查詢資料 *****************************************/
				ProjOrderService projOrderSvc = new ProjOrderService();
				List<ProjOrderVO> projOrderVO = projOrderSvc.getAllFmemOrder(f_mem_id); 
				//這裡已經過濾是哪個小農
				
				
				for(int i=0; i<projOrderVO.size(); i++) {
					System.out.println(projOrderVO.get(i));
				}
				
				if (projOrderVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("listAllOrderByFMem.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}
				System.out.println("3");
				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("projOrderVO", projOrderVO); // 資料庫取出的projPerkVO物件,存入req
			
				String url = "listAllOrderByMem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 perkoverview.jsp
				successView.forward(req, res);
				System.out.println("成功");
				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				System.out.println("error in final");
				errorMsgs.add("無法取得資料:" + e.getMessage());

				RequestDispatcher failureView = req.getRequestDispatcher("listAllOrderByFMem.jsp");
				failureView.forward(req, res);
				
				System.out.println("error in final");
			}
		}
		
		
		
//		if ("getOne_For_Update".equals(action)) { // 來自listAllEmp.jsp的請求
//
//			List<String> errorMsgs = new LinkedList<String>();
//			// Store this set in the request scope, in case we need to
//			// send the ErrorPage view.
//			req.setAttribute("errorMsgs", errorMsgs);
//			
//			try {
//				/***************************1.接收請求參數****************************************/
//				Integer order_id = new Integer(req.getParameter("order_id"));
//				
//				/***************************2.開始查詢資料****************************************/
//				ProjOrderService projOrderSvc = new ProjOrderService();
//				ProjOrderVO projOrderVO = projOrderSvc.getOneProjOrder(order_id);
//								
//				/***************************3.查詢完成,準備轉交(Send the Success view)************/
//				req.setAttribute("projOrderVO", projOrderVO);         // 資料庫取出的empVO物件,存入req
//				String url = "/emp/update_emp_input.jsp";///***我還沒改
//				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
//				successView.forward(req, res);
//
//				/***************************其他可能的錯誤處理**********************************/
//			} catch (Exception e) {
//				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
//				RequestDispatcher failureView = req
//						.getRequestDispatcher("/emp/listAllEmp.jsp");///***我還沒改
//				failureView.forward(req, res);
//			}
//		}
//		
//
		

		

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
//							.getRequestDispatcher("farmer_listOneProjOrder.jsp");
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
				
				
//0204測試按按鈕完，再回到listOne頁面，依舊拿不到物件，決定轉跳回searchOrderByFMem.jsp頁面
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
				
			
				
				String url = "searchOrderByFMem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);
				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("searchOrderByFMem.jsp");
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
//							.getRequestDispatcher("farmer_listOneProjOrder.jsp");
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
				
				String url = "searchOrderByFMem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);
				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("searchOrderByFMem.jsp");
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
//							.getRequestDispatcher("farmer_listOneProjOrder.jsp");
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
				
				String url = "searchOrderByFMem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);
				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("searchOrderByFMem.jsp");
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
//							.getRequestDispatcher("farmer_listOneProjOrder.jsp");
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
				
				String url = "searchOrderByFMem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);
				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("searchOrderByFMem.jsp");
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
//							.getRequestDispatcher("farmer_listOneProjOrder.jsp");
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
				
				String url = "searchOrderByFMem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);
				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("searchOrderByFMem.jsp");
				failureView.forward(req, res);
			}
		}
		/*************我增加的部分，按按鈕改變訂單狀態變成5：不成立(已解決)，END  *****************/
/*=== Fmem ================ＥＮＤ=====查詢區專用按紐==，按完會回到searchOrderByFMem.jsp查詢頁面=============================*/
		
		
		
		
		
		
		
		
/*== Fmem =================ＳＴＡＲＴ=====全部區 專用按紐==，按完會回到全部頁面=============================*/
		/*************我增加的部分，按按鈕改變訂單狀態變成 1 待出貨* START  ****************/
		if ("update_state_to_1_and_then_show_All".equals(action)) { // 來自update_emp_input.jsp的請求
			
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
//							.getRequestDispatcher("farmer_listOneProjOrder.jsp");
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
				
			String url = "listAllOrderByFMem.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
			successView.forward(req, res);
//				res.sendRedirect("listAllOrderByFMem.jsp");
				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("listAllOrderByFMem.jsp");
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
//							.getRequestDispatcher("farmer_listOneProjOrder.jsp");
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
				
				String url = "listAllOrderByFMem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);
//					res.sendRedirect("listAllOrderByFMem.jsp");
				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("listAllOrderByFMem.jsp");
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
//							.getRequestDispatcher("farmer_listOneProjOrder.jsp");
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
				
				String url = "listAllOrderByFMem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);
//					res.sendRedirect("listAllOrderByFMem.jsp");
				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("listAllOrderByFMem.jsp");
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
//							.getRequestDispatcher("farmer_listOneProjOrder.jsp");
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
				
				String url = "listAllOrderByFMem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);
//					res.sendRedirect("listAllOrderByFMem.jsp");
				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("listAllOrderByFMem.jsp");
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
//							.getRequestDispatcher("farmer_listOneProjOrder.jsp");
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
				
				String url = "listAllOrderByFMem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);
//					res.sendRedirect("listAllOrderByFMem.jsp");
				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("listAllOrderByFMem.jsp");
				failureView.forward(req, res);
			}
		}
		/*************我增加的部分，按按鈕改變訂單狀態變成5：不成立(已解決)，END  *****************/
/*===== Fmem ==============ＥＮＤ=====全部區專用按紐==，按完會回到全部頁面=============================*/	
	
		
		
		
		
//        if ("insert".equals(action)) { // 來自addEmp.jsp的請求  
//			
//			List<String> errorMsgs = new LinkedList<String>();
//			// Store this set in the request scope, in case we need to
//			// send the ErrorPage view.
//			req.setAttribute("errorMsgs", errorMsgs);
//
//			try {
//				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
//String ename = req.getParameter("ename");
//				String enameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
//				if (ename == null || ename.trim().length() == 0) {
//					errorMsgs.add("員工姓名: 請勿空白");
//				} else if(!ename.trim().matches(enameReg)) { //以下練習正則(規)表示式(regular-expression)
//					errorMsgs.add("員工姓名: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
//	            }
//				
//String job = req.getParameter("job").trim();
//				if (job == null || job.trim().length() == 0) {
//					errorMsgs.add("職位請勿空白");
//				}
//				
//				java.sql.Date hiredate = null;
//				try {
//hiredate = java.sql.Date.valueOf(req.getParameter("hiredate").trim());
//				} catch (IllegalArgumentException e) {
//					hiredate=new java.sql.Date(System.currentTimeMillis());
//					errorMsgs.add("請輸入日期!");
//				}
//				
//				Double sal = null;
//				try {
//sal = new Double(req.getParameter("sal").trim());
//				} catch (NumberFormatException e) {
//					sal = 0.0;
//					errorMsgs.add("薪水請填數字.");
//				}
//				
//				Double comm = null;
//				try {
//comm = new Double(req.getParameter("comm").trim());
//				} catch (NumberFormatException e) {
//					comm = 0.0;
//					errorMsgs.add("獎金請填數字.");
//				}
//				
//Integer deptno = new Integer(req.getParameter("deptno").trim());
//
//				EmpVO empVO = new EmpVO();
//				empVO.setEname(ename);
//				empVO.setJob(job);
//				empVO.setHiredate(hiredate);
//				empVO.setSal(sal);
//				empVO.setComm(comm);
//				empVO.setDeptno(deptno);
//
//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//req.setAttribute("empVO", empVO); // 含有輸入格式錯誤的empVO物件,也存入req
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/emp/addEmp.jsp");
//					failureView.forward(req, res);
//					return;
//				}
//				
//				/***************************2.開始新增資料***************************************/
//				EmpService empSvc = new EmpService();
//				//控制器驗證完拿到的碎片，new領班，交給領班去組合。
//				//領班用自己的方法去組合將碎片放入一個EmpVO物件，物件再交給工人去施工新增的動作，然後領班會再回傳一個empVO物件回來
//				empVO = empSvc.addEmp(ename, job, hiredate, sal, comm, deptno);
//				
//				/***************************3.新增完成,準備轉交(Send the Success view)***********/
//				String url = "/emp/listAllEmp.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
//				successView.forward(req, res);				
//				
//				/***************************其他可能的錯誤處理**********************************/
//			} catch (Exception e) {
//				errorMsgs.add(e.getMessage());
//				RequestDispatcher failureView = req
//						.getRequestDispatcher("/emp/addEmp.jsp");
//				failureView.forward(req, res);
//			}
//		}
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
//				String url = "/projOrder/farmer_listOneProjOrder.jsp";//****我還沒改
//				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
//				successView.forward(req, res);
//				
//				/***************************其他可能的錯誤處理**********************************/
//			} catch (Exception e) {
//				errorMsgs.add("刪除資料失敗:"+e.getMessage());
//				RequestDispatcher failureView = req
//						.getRequestDispatcher("/emp/listAllEmp.jsp");//****我還沒改
//				failureView.forward(req, res);
//			}
//		}
	}
}




