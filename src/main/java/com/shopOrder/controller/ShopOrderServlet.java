package com.shopOrder.controller;

import java.io.*;
import java.sql.Date;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import com.shopCart.model.ShopCartService;
import com.shopCart.model.ShopCartVO;
import com.shopOrder.model.ShopOrderService;
import com.shopOrder.model.ShopOrderVO;
import com.shopOrderDetails.model.ShopOrderDetailsVO;
import com.shopProduct.model.ShopProductService;
import com.shopProduct.model.ShopProductVO;

public class ShopOrderServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action"); // 表單有用hidden name="action" value="getOne_For_Display"

		/* ================================================= */
		/* ========= gllOne 區域 ======== */
		/* ================================================= */
		/*** <<給管理員用的>> **/
		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String str = req.getParameter("order_id");
				if (str == null || (str.trim()).length() == 0) {// 當訂單是null或去空白後長度為0
					errorMsgs.add("請輸入訂單編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							// 連結到商城查詢網頁
							.getRequestDispatcher("/front-end/shopOrder/searchOrder.jsp");
					failureView.forward(req, res);
					return;// 程式回到原點
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
							// 連結到商城查詢網頁
							.getRequestDispatcher("/front-end/shopOrder/searchOrder.jsp");
					failureView.forward(req, res);
					return;// 程式回到原點
				}

				/*************************** 2.開始查詢資料 *****************************************/

				ShopOrderService shopOrderSvc = new ShopOrderService();
				ShopOrderVO shopOrderVO = shopOrderSvc.getOneShopOrder(order_id);

				if (shopOrderVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							// 連結到商城查詢網頁
							.getRequestDispatcher("/front-end/shopOrder/listAllOrderByFMem.jsp");/// ***我還沒改
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("shopOrderVO", shopOrderVO); // 資料庫取出的empVO物件,存入req
//				增加部分
				req.setAttribute("order_state", new String[] { "待付款", "待出貨", "已出貨", "已完成", "已取消" });
				req.setAttribute("order_payment", new String[] { "信用卡", "銀行轉帳" });

				String url = "/front-end/shopOrder/listOneOrder.jsp";/// ***我還沒改
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/shopOrder/listAllOrderByFMem.jsp");/// ***我還沒改
				failureView.forward(req, res);
			}
		}

		/*** <<給小農用的>> **/
		if ("getOneByFMem".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				Integer f_mem_id = new Integer(req.getParameter("f_mem_id"));

				String str = req.getParameter("order_id");
				if (str == null || (str.trim()).length() == 0) {// 當訂單是null或去空白後長度為0
					errorMsgs.add("請輸入訂單編號");
				}
				Integer order_id = Integer.valueOf(str);
//				Integer order_id = new Integer(str);
				ShopOrderService shopOrderService = new ShopOrderService();
				ShopOrderVO shopOrderVO = shopOrderService.getOneOrder(order_id);
				System.out.println("1"+f_mem_id);
				System.out.println(shopOrderVO.getF_mem_id());
				System.out.println(!(f_mem_id.equals(shopOrderVO.getF_mem_id())) );
				if (!(f_mem_id.equals(shopOrderVO.getF_mem_id()))) {
					errorMsgs.add("非此賣家訂單");
				}

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							// 連結到小農查詢網頁
							.getRequestDispatcher("/front-end/shopOrder/searchOrderByFMem.jsp");
					failureView.forward(req, res);
					return;// 程式回到原點
				}

				/*************************** 2.開始查詢資料 *****************************************/

				ShopOrderService shopOrderSvc = new ShopOrderService();

				try {
					shopOrderVO = shopOrderSvc.getOneShopOrderByFMem(order_id, f_mem_id);

					req.setAttribute("shopOrderVO", shopOrderVO);

					/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
//				
					req.setAttribute("order_state", new String[] { "待付款", "待出貨", "已出貨", "已完成", "已取消" });
					req.setAttribute("order_payment", new String[] { "信用卡", "銀行轉帳" });
					System.out.println("成功跳轉listone");
					String url = "/front-end/shopOrder/listOneOrder.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
					successView.forward(req, res);
					System.out.println("進入listone");

					/*************************** 其他可能的錯誤處理 *************************************/
				} catch (Exception e) {
					errorMsgs.add("查無資料");
				}
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("======================");
				errorMsgs.add("該筆訂單不存在");
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/shopOrder/searchOrderByFMem.jsp");
				failureView.forward(req, res);
			}
		}
		/*** <<給會員修改用的>> **/

		if ("grtOne_For_Update".equals(action)) { // 來自listAllByMem.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ****************************************/
				Integer order_id = new Integer(req.getParameter("order_id"));

				/*************************** 2.開始查詢資料 ****************************************/
				ShopOrderService shopOrderSvc = new ShopOrderService();
				ShopOrderVO shopOrderVO = shopOrderSvc.getOneOrder(order_id);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("shopOrderVO", shopOrderVO); // 資料庫取出的empVO物件,存入req
				String url = "/front-end/shopOrder/update_order_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
				successView.forward(req, res);
				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/shopOrder/listALLOrderByFMem.jsp");
				failureView.forward(req, res);
			}
		}

		if ("update".equals(action)) { // 來自update_emp_input.jsp的請求
			System.out.println("test001");

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				Integer order_id = new Integer(req.getParameter("order_id").trim());
				System.out.println(order_id);
				Integer order_state = new Integer(req.getParameter("order_state").trim());

//				日期藥用try catch才能收到null值，再設值回去
				java.sql.Date order_ship_date = null;
				try {
					order_ship_date = java.sql.Date.valueOf(req.getParameter("order_ship_date"));// 要轉型

				} catch (Exception e) {
					order_ship_date = null;
				}

				java.sql.Date order_finish_date = null;
				try {
					order_finish_date = java.sql.Date.valueOf(req.getParameter("order_finish_date"));// 要轉型

				} catch (Exception e) {
					order_finish_date = null;
				}

				java.sql.Date order_cancel_date = null;
				try {
					order_cancel_date = java.sql.Date.valueOf(req.getParameter("order_cancel_date"));// 要轉型

				} catch (Exception e) {
					order_cancel_date = null;
				}

//				收件人 檢驗
				String order_receiver = req.getParameter("order_receiver");
				String order_receiverReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (order_receiver == null || order_receiver.trim().length() == 0) {
					errorMsgs.add("收件人姓名: 請勿空白");
				} else if (!order_receiver.trim().matches(order_receiverReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("收件人姓名: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
				}

//				收件人電話 檢驗
				String order_tel = req.getParameter("order_tel");
				String order_telReg = "^[(0-9-)]{1,10}$";
				if (order_tel == null || order_tel.trim().length() == 0) {
					errorMsgs.add("收件人電話: 請勿空白");
				} else if (!order_tel.trim().matches(order_telReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("收件人電話: 只能是數字 , 且長度必需在1到10之間");
				}

//				地址
				String order_add = req.getParameter("order_add").trim();
				if (order_add == null || order_add.trim().length() == 0) {
					errorMsgs.add("收件地址請勿空白");
				}

//				備註
				String order_memo = req.getParameter("order_memo").trim();
//				if (order_memo == null || order_memo.trim().length() == 0) {
//					errorMsgs.add("備註請勿空白");
//				}	

				ShopOrderVO shopOrderVO = new ShopOrderVO();
				shopOrderVO.setOrder_add(order_add);
				shopOrderVO.setOrder_receiver(order_receiver);
				shopOrderVO.setOrder_tel(order_tel);
				shopOrderVO.setOrder_memo(order_memo);
				shopOrderVO.setOrder_state(order_state);
				shopOrderVO.setOrder_ship_date(order_ship_date);
				shopOrderVO.setOrder_finish_date(order_finish_date);
				shopOrderVO.setOrder_cancel_date(order_cancel_date);
				shopOrderVO.setOrder_id(order_id);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("shopOrderVO", shopOrderVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/shopOrder/update_order_input.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				ShopOrderService shopOrderSvc = new ShopOrderService();
				shopOrderVO = shopOrderSvc.updateShopOrder(order_add, order_receiver, order_tel, order_memo,
						order_state, order_ship_date, order_finish_date, order_cancel_date, order_id);
				System.out.println("開始修改資料");
				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("shopOrderVO", shopOrderVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/front-end/shopOrder/listAllOrderByMem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/shopOrder/update_order_input.jsp");
				failureView.forward(req, res);
			}
		}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////		
		/* ================================================= */
		/* ========= getAll 區域 ======== */
		/* ================================================= */

		/*** <<給一般會員用的>> */
		if ("getAllByMem".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String str = req.getParameter("mem_id");
				if (str == null || (str.trim()).length() == 0) {// 當訂單是null或去空白後長度為0
					errorMsgs.add("請輸入訂單編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							// 連結到小農查詢網頁
							.getRequestDispatcher("/front-end/shopOrder/listAllOrderByMem.jsp");
					failureView.forward(req, res);
					return;// 程式回到原點
				}
				Integer mem_id = null;
				try {
					mem_id = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("訂單編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView =
							// 連結到小農查詢網頁
							req.getRequestDispatcher("/front-end/shopOrder/listAllOrderByMem.jsp");
					failureView.forward(req, res);
					return;// 程式回到原點
				}

				/*************************** 2.開始查詢資料 *****************************************/

				ShopOrderService shopOrderSvc = new ShopOrderService();
				List<ShopOrderVO> shopOrderVO = shopOrderSvc.getAllMemOrder(mem_id);

//				for(int i=0; i<shopOrderVO.size(); i++) {
//					System.out.println(projOrderVO.get(i));
//				}

				if (shopOrderVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView =
							// 連結到小農查詢網頁
							req.getRequestDispatcher("/front-end/shopOrder/listAllOrderByMem.jsp");///
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("shopOrderVO", shopOrderVO); // 資料庫取出的empVO物件,存入req
//				增加部分
				req.setAttribute("order_state", new String[] { "待付款", "待出貨", "已出貨", "已完成", "已取消" });
				req.setAttribute("order_payment", new String[] { "信用卡", "銀行轉帳" });

				String url = "/front-end/shopOrder/listAllOrderByMem.jsp";/// 加上?mem_id=77005&action=getAllByMem做測試
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/shopOrder/listAllOrderByMem.jsp");/// ***我還沒改
				failureView.forward(req, res);
			}
		}

		/*** <<給小農會員用的>> ****/
		if ("getAllByFMem".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String str = req.getParameter("f_mem_id");
				if (str == null || (str.trim()).length() == 0) {// 當訂單是null或去空白後長度為0
					errorMsgs.add("請輸入訂單編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							// 連結到小農查詢網頁
							.getRequestDispatcher("/front-end/shopOrder/listAllOrderByFMem.jsp");
					failureView.forward(req, res);
					return;// 程式回到原點
				}
				Integer f_mem_id = null;
				try {
					f_mem_id = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("訂單編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView =
							// 連結到小農查詢網頁
							req.getRequestDispatcher("/front-end/shopOrder/listAllOrderByFMem.jsp");
					failureView.forward(req, res);
					return;// 程式回到原點
				}

				/*************************** 2.開始查詢資料 *****************************************/

				ShopOrderService shopOrderSvc = new ShopOrderService();
				List<ShopOrderVO> shopOrderVO = shopOrderSvc.getAllMemOrder(f_mem_id);

//				for(int i=0; i<shopOrderVO.size(); i++) {
//					System.out.println(projOrderVO.get(i));
//				}

				if (shopOrderVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView =
							// 連結到小農查詢網頁
							req.getRequestDispatcher("/front-end/shopOrder/listAllOrderByFMem.jsp");///
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("shopOrderVO", shopOrderVO); // 資料庫取出的empVO物件,存入req
//				增加部分
				req.setAttribute("order_state", new String[] { "待付款", "待出貨", "已出貨", "已完成", "已取消" });
				req.setAttribute("order_payment", new String[] { "信用卡", "銀行轉帳" });

				String url = "/front-end/shopOrder/listAllOrderByMem.jsp";/// ***?f_mem_id=70001&action=getAllByFMem
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/shopOrder/listAllOrderByMem.jsp");/// ***我還沒改
				failureView.forward(req, res);
			}
		}
		/*
		 * === Fmem
		 * ================ＳＴＡＲＴ=====查詢區專用按紐==，按完會回到查詢頁面=============================
		 */
		/************* 我增加的部分，按按鈕改變訂單狀態變成 1 待出貨* START ****************/

		if ("update_satate_to_1".equals(action)) { // 來自update_emp_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				System.out.println("jdsiojfidsjfio");
				String order_add = (req.getParameter("order_add").trim());
				String order_receiver = (req.getParameter("order_receiver").trim());
				String order_tel = (req.getParameter("order_tel").trim());
				String order_memo = (req.getParameter("order_memo").trim());

//			//訂單狀態設成 1 ，因為確認收款按鈕按了，從待付款變成待出貨
				Integer order_state = 1;

//			日期藥用try catch才能收到null值，再設值回去
				java.sql.Date order_ship_date = null;
				try {
					order_ship_date = java.sql.Date.valueOf(req.getParameter("order_ship_date"));// 要轉型

				} catch (Exception e) {
					order_ship_date = null;
				}

				java.sql.Date order_finish_date = null;
				try {
					order_finish_date = java.sql.Date.valueOf(req.getParameter("order_finish_date"));// 要轉型

				} catch (Exception e) {
					order_finish_date = null;
				}

				java.sql.Date order_cancel_date = null;
				try {
					order_cancel_date = java.sql.Date.valueOf(req.getParameter("order_cancel_date"));// 要轉型

				} catch (Exception e) {
					order_cancel_date = null;
				}

				Integer order_id = new Integer(req.getParameter("order_id").trim());

				ShopOrderVO shopOrderVO = new ShopOrderVO();

				shopOrderVO.setOrder_add(order_add);
				shopOrderVO.setOrder_receiver(order_receiver);
				shopOrderVO.setOrder_tel(order_tel);
				shopOrderVO.setOrder_memo(order_memo);
				shopOrderVO.setOrder_state(order_state);
				shopOrderVO.setOrder_ship_date(order_ship_date);
				shopOrderVO.setOrder_finish_date(order_finish_date);
				shopOrderVO.setOrder_cancel_date(order_cancel_date);
				shopOrderVO.setOrder_id(order_id);

				/*************************** 2.開始修改資料 *****************************************/
				ShopOrderService shopOrderSvc = new ShopOrderService();
				// 控制起驗證完拿到的碎片，new領班，交給領班去組合。
				// 領班用自己的方法去組合將碎片放入一個EmpVO物件，物件再交給工人去施工更新 的動作，然後領班會再回傳一個empVO物件回來
				ShopOrderVO shopOrderVO2 = shopOrderSvc.updateShopOrder(order_add, order_receiver, order_tel,
						order_memo, order_state, order_ship_date, order_finish_date, order_cancel_date, order_id);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("shopOrderVO", shopOrderVO2); // 資料庫update成功後,正確的的empVO物件,存入req

				String url = "/front-end/shopOrder/searchOrderByFMem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);
				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/shopOrder/searchOrderByFMem.jsp");
				failureView.forward(req, res);
			}
		}
		/************* 我增加的部分，按按鈕改變訂單狀態變成 1 待出貨，END *****************/

		/************* 我增加的部分，按按鈕改變訂單狀態變成 2 : 已出貨 START ****************/
		if ("update_satate_to_2".equals(action)) { // 來自update_emp_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				String order_add = (req.getParameter("order_add").trim());
				String order_receiver = (req.getParameter("order_receiver").trim());
				String order_tel = (req.getParameter("order_tel").trim());
				String order_memo = (req.getParameter("order_memo").trim());

//	//訂單狀態設成 2 運送中
				Integer order_state = 2;

//	日期藥用try catch才能收到null值，再設值回去
				java.sql.Date order_ship_date = new java.sql.Date(System.currentTimeMillis());// 要轉型

				java.sql.Date order_finish_date = null;
				try {
					order_finish_date = java.sql.Date.valueOf(req.getParameter("order_finish_date"));// 要轉型

				} catch (Exception e) {
					order_finish_date = null;
				}

				java.sql.Date order_cancel_date = null;
				try {
					order_finish_date = java.sql.Date.valueOf(req.getParameter("order_cancel_date"));// 要轉型

				} catch (Exception e) {
					order_finish_date = null;
				}

				Integer order_id = new Integer(req.getParameter("order_id").trim());

				ShopOrderVO shopOrderVO = new ShopOrderVO();

				shopOrderVO.setOrder_add(order_add);
				shopOrderVO.setOrder_receiver(order_receiver);
				shopOrderVO.setOrder_tel(order_tel);
				shopOrderVO.setOrder_memo(order_memo);
				shopOrderVO.setOrder_state(order_state);
				shopOrderVO.setOrder_ship_date(order_ship_date);
				shopOrderVO.setOrder_finish_date(order_finish_date);
				shopOrderVO.setOrder_cancel_date(order_cancel_date);
				shopOrderVO.setOrder_id(order_id);

				/*************************** 2.開始修改資料 *****************************************/
				ShopOrderService shopOrderSvc = new ShopOrderService();
				// 控制起驗證完拿到的碎片，new領班，交給領班去組合。
				// 領班用自己的方法去組合將碎片放入一個EmpVO物件，物件再交給工人去施工更新 的動作，然後領班會再回傳一個empVO物件回來
				ShopOrderVO shopOrderVO2 = shopOrderSvc.updateShopOrder(order_add, order_receiver, order_tel,
						order_memo, order_state, order_ship_date, order_finish_date, order_cancel_date, order_id);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("shopOrderVO", shopOrderVO2); // 資料庫update成功後,正確的的empVO物件,存入req

				String url = "/front-end/shopOrder/searchOrderByFMem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);
				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/shopOrder/farmer_listOneShopOrder.jsp");
				failureView.forward(req, res);
			}
		}
		/************* 我增加的部分，按按鈕改變訂單狀態變成 2 已出貨，END *****************/

		/************* 我增加的部分，按按鈕改變訂單狀態變成3 訂單已完成* START ****************/
		if ("update_satate_to_3".equals(action)) { // 來自update_emp_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				String order_add = (req.getParameter("order_add").trim());
				String order_receiver = (req.getParameter("order_receiver").trim());
				String order_tel = (req.getParameter("order_tel").trim());
				String order_memo = (req.getParameter("order_memo").trim());

//	//訂單狀態設成 3  已完成
				Integer order_state = 3;

//	日期藥用try catch才能收到null值，再設值回去
				java.sql.Date order_ship_date = null;
				try {
					order_ship_date = java.sql.Date.valueOf(req.getParameter("order_ship_date"));// 要轉型

				} catch (Exception e) {
					order_ship_date = null;
				}

				java.sql.Date order_finish_date = new java.sql.Date(System.currentTimeMillis());// 要轉型

				java.sql.Date order_cancel_date = null;
				try {
					order_finish_date = java.sql.Date.valueOf(req.getParameter("order_cancel_date"));// 要轉型

				} catch (Exception e) {
					order_finish_date = null;
				}

				Integer order_id = new Integer(req.getParameter("order_id").trim());

				ShopOrderVO shopOrderVO = new ShopOrderVO();

				shopOrderVO.setOrder_add(order_add);
				shopOrderVO.setOrder_receiver(order_receiver);
				shopOrderVO.setOrder_tel(order_tel);
				shopOrderVO.setOrder_memo(order_memo);
				shopOrderVO.setOrder_state(order_state);
				shopOrderVO.setOrder_ship_date(order_ship_date);
				shopOrderVO.setOrder_finish_date(order_finish_date);
				shopOrderVO.setOrder_cancel_date(order_cancel_date);
				shopOrderVO.setOrder_id(order_id);

				/*************************** 2.開始修改資料 *****************************************/
				ShopOrderService shopOrderSvc = new ShopOrderService();
				// 控制起驗證完拿到的碎片，new領班，交給領班去組合。
				// 領班用自己的方法去組合將碎片放入一個EmpVO物件，物件再交給工人去施工更新 的動作，然後領班會再回傳一個empVO物件回來
				ShopOrderVO shopOrderVO2 = shopOrderSvc.updateShopOrder(order_add, order_receiver, order_tel,
						order_memo, order_state, order_ship_date, order_finish_date, order_cancel_date, order_id);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("shopOrderVO", shopOrderVO2); // 資料庫update成功後,正確的的empVO物件,存入req

				String url = "/front-end/shopOrder/searchOrderByFMem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);
				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/shopOrder/farmer_listOneShopOrder.jsp");
				failureView.forward(req, res);
			}
		}
		/************* 我增加的部分，按按鈕改變訂單狀態變成 3 訂單已完成，END *****************/

		/************* 我增加的部分，按按鈕改變訂單狀態變成4 : 已取消* START ****************/
		if ("update_satate_to_4".equals(action)) { // 來自update_emp_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				String order_add = (req.getParameter("order_add").trim());
				String order_receiver = (req.getParameter("order_receiver").trim());
				String order_tel = (req.getParameter("order_tel").trim());
				String order_memo = (req.getParameter("order_memo").trim());

//		//訂單狀態設成 4 已取消
				Integer order_state = 4;

//		日期藥用try catch才能收到null值，再設值回去
				java.sql.Date order_ship_date = null;
				try {
					order_ship_date = java.sql.Date.valueOf(req.getParameter("order_ship_date"));// 要轉型

				} catch (Exception e) {
					order_ship_date = null;
				}

				java.sql.Date order_finish_date = null;
				try {
					order_finish_date = java.sql.Date.valueOf(req.getParameter("order_finish_date"));// 要轉型

				} catch (Exception e) {
					order_finish_date = null;
				}

				java.sql.Date order_cancel_date = null;
				try {
					order_finish_date = java.sql.Date.valueOf(req.getParameter("order_cancel_date"));// 要轉型

				} catch (Exception e) {
					order_finish_date = null;
				}

				Integer order_id = new Integer(req.getParameter("order_id").trim());

				ShopOrderVO shopOrderVO = new ShopOrderVO();

				shopOrderVO.setOrder_add(order_add);
				shopOrderVO.setOrder_receiver(order_receiver);
				shopOrderVO.setOrder_tel(order_tel);
				shopOrderVO.setOrder_memo(order_memo);
				shopOrderVO.setOrder_state(order_state);
				shopOrderVO.setOrder_ship_date(order_ship_date);
				shopOrderVO.setOrder_finish_date(order_finish_date);
				shopOrderVO.setOrder_cancel_date(order_cancel_date);
				shopOrderVO.setOrder_id(order_id);

				/*************************** 2.開始修改資料 *****************************************/
				ShopOrderService shopOrderSvc = new ShopOrderService();
				// 控制起驗證完拿到的碎片，new領班，交給領班去組合。
				// 領班用自己的方法去組合將碎片放入一個EmpVO物件，物件再交給工人去施工更新 的動作，然後領班會再回傳一個empVO物件回來
				ShopOrderVO shopOrderVO2 = shopOrderSvc.updateShopOrder(order_add, order_receiver, order_tel,
						order_memo, order_state, order_ship_date, order_finish_date, order_cancel_date, order_id);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("shopOrderVO", shopOrderVO2); // 資料庫update成功後,正確的的empVO物件,存入req

				String url = "/front-end/shopOrder/searchOrderByFMem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);
				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/shopOrder/farmer_listOneShopOrder.jsp");
				failureView.forward(req, res);
			}
		}
		/************* 我增加的部分，按按鈕改變訂單狀態變成4：已取消，END *****************/
		/*
		 * === Fmem
		 * ================ＥＮＤ=====查詢區專用按紐==，按完會回到searchOrderByFMem.jsp查詢頁面=============
		 * ================
		 */

		/*
		 * == Fmem =================ＳＴＡＲＴ=====全部區
		 * 專用按紐==，按完會回到全部頁面=============================
		 */
		/************* 我增加的部分，按按鈕改變訂單狀態變成 1 待出貨* START ****************/

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
					f_mem_id = f_mem_id.trim();
				} else if (membership.equals("buyer")) {
					mem_id = mem_id.trim();
				}

				String order_add = (req.getParameter("order_add").trim());
				String order_receiver = (req.getParameter("order_receiver").trim());
				String order_tel = (req.getParameter("order_tel").trim());
				String order_memo = (req.getParameter("order_memo").trim());

				// 訂單狀態設成 1 ，因為確認收款按鈕按了，從待付款變成待出貨。
				Integer order_state = 1;

				// 日期用try catch才能設收到null值，再設成null回去
				java.sql.Date order_ship_date = null;
				try {
					order_ship_date = java.sql.Date.valueOf(req.getParameter("order_ship_date"));// 要轉型

				} catch (Exception e) {
					order_ship_date = null;
				}

				java.sql.Date order_finish_date = null;
				try {
					order_finish_date = java.sql.Date.valueOf(req.getParameter("order_finish_date"));// 要轉型

				} catch (Exception e) {
					order_finish_date = null;
				}

				java.sql.Date order_cancel_date = null;
				try {
					order_finish_date = java.sql.Date.valueOf(req.getParameter("order_cancel_date"));// 要轉型

				} catch (Exception e) {
					order_finish_date = null;
				}

				Integer order_id = new Integer(req.getParameter("order_id").trim());

				ShopOrderVO shopOrderVO = new ShopOrderVO();

				shopOrderVO.setOrder_add(order_add);
				shopOrderVO.setOrder_receiver(order_receiver);
				shopOrderVO.setOrder_tel(order_tel);
				shopOrderVO.setOrder_memo(order_memo);
				shopOrderVO.setOrder_state(order_state);
				shopOrderVO.setOrder_ship_date(order_ship_date);
				shopOrderVO.setOrder_finish_date(order_finish_date);
				shopOrderVO.setOrder_cancel_date(order_cancel_date);
				shopOrderVO.setOrder_id(order_id);

				// Send the use back to the form, if there were errors
//					if (!errorMsgs.isEmpty()) {
				// req.setAttribute("projOrderVO", projOrderVO); // 含有輸入格式錯誤的empVO物件,也存入req
//						RequestDispatcher failureView = req
//								.getRequestDispatcher("farmer_listOneProjOrder.jsp");
//						failureView.forward(req, res);
//						return; //程式中斷
//					}
//					
				/*************************** 2.開始修改資料 *****************************************/
				ShopOrderService shopOrderSvc = new ShopOrderService();
				// 控制起驗證完拿到的碎片，new領班，交給領班去組合。
				// 領班用自己的方法去組合將碎片放入一個EmpVO物件，物件再交給工人去施工更新 的動作，然後領班會再回傳一個empVO物件回來
				ShopOrderVO shopOrderVO2 = shopOrderSvc.updateShopOrder(order_add, order_receiver, order_tel,
						order_memo, order_state, order_ship_date, order_finish_date, order_cancel_date, order_id);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				List<ShopOrderVO> shopOrderVO3 = null;
				System.out.println(membership);
				System.out.println(mem_id);
				System.out.println(f_mem_id);

				if (membership.equals("seller")) {
					Integer f_mem_id1 = new Integer(req.getParameter("f_mem_id"));
					shopOrderVO3 = shopOrderSvc.getAllFmemOrder(f_mem_id1);
				} else if (membership.equals("buyer")) {
					Integer mem_id1 = new Integer(req.getParameter("mem_id"));
					shopOrderVO3 = shopOrderSvc.getAllMemOrder(mem_id1);

				}

				req.setAttribute("shopOrderVO", shopOrderVO3); // 資料庫update成功後,正確的的empVO物件,存入req

				String url = "";

				if (membership.equals("seller")) {
					req.setAttribute("f_mem_id", f_mem_id);
					url = "/front-end/shopOrder/listAllOrderByFMem.jsp";
					System.out.println(f_mem_id);
				} else if (membership.equals("buyer")) {
					req.setAttribute("mem_id", mem_id);
					url = "/front-end/shopOrder/listAllOrderByMem.jsp";
					System.out.println(mem_id);
				}
				req.setAttribute("membership", membership);
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);
//					res.sendRedirect("listAllOrderByFMem.jsp");
				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				System.out.println("error帶出貨");
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				e.printStackTrace();
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/shopOrder/listAllOrderByFMem.jsp");
				failureView.forward(req, res);
			}
		}
		/************* 我增加的部分，按按鈕改變訂單狀態變成 1 待出貨，END *****************/

		/************* 我增加的部分，按按鈕改變訂單狀態變成 2 : 運送中* START ****************/
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
					f_mem_id = f_mem_id.trim();
				} else if (membership.equals("buyer")) {
					mem_id = mem_id.trim();
				}

				String order_add = (req.getParameter("order_add").trim());
				String order_receiver = (req.getParameter("order_receiver").trim());
				String order_tel = (req.getParameter("order_tel").trim());
				String order_memo = (req.getParameter("order_memo").trim());

				// 訂單狀態設成 2 運送中
				Integer order_state = 2;

				// 日期用try catch才能設收到null值，再設成null回去
				java.sql.Date order_ship_date = new java.sql.Date(System.currentTimeMillis());// 要轉型

				java.sql.Date order_finish_date = null;
				try {
					order_finish_date = java.sql.Date.valueOf(req.getParameter("order_finish_date"));// 要轉型

				} catch (Exception e) {
					order_finish_date = null;
				}

				java.sql.Date order_cancel_date = null;
				try {
					order_finish_date = java.sql.Date.valueOf(req.getParameter("order_cancel_date"));// 要轉型

				} catch (Exception e) {
					order_finish_date = null;
				}

				Integer order_id = new Integer(req.getParameter("order_id").trim());

				ShopOrderVO shopOrderVO = new ShopOrderVO();

				shopOrderVO.setOrder_add(order_add);
				shopOrderVO.setOrder_receiver(order_receiver);
				shopOrderVO.setOrder_tel(order_tel);
				shopOrderVO.setOrder_memo(order_memo);
				shopOrderVO.setOrder_state(order_state);
				shopOrderVO.setOrder_ship_date(order_ship_date);
				shopOrderVO.setOrder_finish_date(order_finish_date);
				shopOrderVO.setOrder_cancel_date(order_cancel_date);
				shopOrderVO.setOrder_id(order_id);

//						
				/*************************** 2.開始修改資料 *****************************************/
				ShopOrderService shopOrderSvc = new ShopOrderService();
				// 控制起驗證完拿到的碎片，new領班，交給領班去組合。
				// 領班用自己的方法去組合將碎片放入一個EmpVO物件，物件再交給工人去施工更新 的動作，然後領班會再回傳一個empVO物件回來
				ShopOrderVO shopOrderVO2 = shopOrderSvc.updateShopOrder(order_add, order_receiver, order_tel,
						order_memo, order_state, order_ship_date, order_finish_date, order_cancel_date, order_id);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				List<ShopOrderVO> shopOrderVO3 = null;
				System.out.println(membership);
				System.out.println(mem_id);
				System.out.println(f_mem_id);

				if (membership.equals("seller")) {
					Integer f_mem_id1 = new Integer(req.getParameter("f_mem_id"));
					shopOrderVO3 = shopOrderSvc.getAllFmemOrder(f_mem_id1);
				} else if (membership.equals("buyer")) {
					Integer mem_id1 = new Integer(req.getParameter("mem_id"));
					shopOrderVO3 = shopOrderSvc.getAllMemOrder(mem_id1);

				}

				req.setAttribute("shopOrderVO", shopOrderVO3); // 資料庫update成功後,正確的的empVO物件,存入req

				String url = "";

				if (membership.equals("seller")) {
					req.setAttribute("f_mem_id", f_mem_id);
					url = "/front-end/shopOrder/listAllOrderByFMem.jsp";
					System.out.println(f_mem_id);
				} else if (membership.equals("buyer")) {
					req.setAttribute("mem_id", mem_id);
					url = "/front-end/shopOrder/listAllOrderByMem.jsp";
					System.out.println(mem_id);
				}
				req.setAttribute("membership", membership);
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);
//						res.sendRedirect("listAllOrderByFMem.jsp");
				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				System.out.println("error運送中");
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				e.printStackTrace();
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/shopOrder/listAllOrderByFMem.jsp");
				failureView.forward(req, res);
			}
		}

		/************* 我增加的部分，按按鈕改變訂單狀態變成3 訂單已完成* START ****************/
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
					f_mem_id = f_mem_id.trim();
				} else if (membership.equals("buyer")) {
					mem_id = mem_id.trim();
				}

				String order_add = (req.getParameter("order_add").trim());
				String order_receiver = (req.getParameter("order_receiver").trim());
				String order_tel = (req.getParameter("order_tel").trim());
				String order_memo = (req.getParameter("order_memo").trim());

				// 訂單狀態設成 3 訂單已完成
				Integer order_state = 3;

				// 日期用try catch才能設收到null值，再設成null回去
				java.sql.Date order_ship_date = null;
				try {
					order_ship_date = java.sql.Date.valueOf(req.getParameter("order_ship_date"));// 要轉型

				} catch (Exception e) {
					order_ship_date = null;
				}

				java.sql.Date order_finish_date = new java.sql.Date(System.currentTimeMillis());// 要轉型

				java.sql.Date order_cancel_date = null;
				try {
					order_cancel_date = java.sql.Date.valueOf(req.getParameter("order_cancel_date"));// 要轉型

				} catch (Exception e) {
					order_cancel_date = null;
				}

				Integer order_id = new Integer(req.getParameter("order_id").trim());

				ShopOrderVO shopOrderVO = new ShopOrderVO();

				shopOrderVO.setOrder_add(order_add);
				shopOrderVO.setOrder_receiver(order_receiver);
				shopOrderVO.setOrder_tel(order_tel);
				shopOrderVO.setOrder_memo(order_memo);
				shopOrderVO.setOrder_state(order_state);
				shopOrderVO.setOrder_ship_date(order_ship_date);
				shopOrderVO.setOrder_finish_date(order_finish_date);
				shopOrderVO.setOrder_cancel_date(order_cancel_date);
				shopOrderVO.setOrder_id(order_id);

				/*************************** 2.開始修改資料 *****************************************/
				ShopOrderService shopOrderSvc = new ShopOrderService();
				// 控制起驗證完拿到的碎片，new領班，交給領班去組合。
				// 領班用自己的方法去組合將碎片放入一個EmpVO物件，物件再交給工人去施工更新 的動作，然後領班會再回傳一個empVO物件回來
				ShopOrderVO shopOrderVO2 = shopOrderSvc.updateShopOrder(order_add, order_receiver, order_tel,
						order_memo, order_state, order_ship_date, order_finish_date, order_cancel_date, order_id);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				List<ShopOrderVO> shopOrderVO3 = null;
				System.out.println(membership);
				System.out.println(mem_id);
				System.out.println(f_mem_id);

				if (membership.equals("seller")) {
					Integer f_mem_id1 = new Integer(req.getParameter("f_mem_id"));
					shopOrderVO3 = shopOrderSvc.getAllFmemOrder(f_mem_id1);
				} else if (membership.equals("buyer")) {
					Integer mem_id1 = new Integer(req.getParameter("mem_id"));
					shopOrderVO3 = shopOrderSvc.getAllMemOrder(mem_id1);

				}

				req.setAttribute("shopOrderVO", shopOrderVO3); // 資料庫update成功後,正確的的empVO物件,存入req

				String url = "";

				if (membership.equals("seller")) {
					req.setAttribute("f_mem_id", f_mem_id);
					url = "/front-end/shopOrder/listAllOrderByFMem.jsp";
					System.out.println(f_mem_id);
				} else if (membership.equals("buyer")) {
					req.setAttribute("mem_id", mem_id);
					url = "/front-end/shopOrder/listAllOrderByMem.jsp";
					System.out.println(mem_id);
				}
				req.setAttribute("membership", membership);
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);
//					res.sendRedirect("listAllOrderByFMem.jsp");
				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				System.out.println("error已完成");
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				e.printStackTrace();
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/shopOrder/listAllOrderByFMem.jsp");
				failureView.forward(req, res);
			}
		}

		/************* 我增加的部分，按按鈕改變訂單狀態變成 3 訂單已完成，END *****************/

		/************* 我增加的部分，按按鈕改變訂單狀態變成4 : 已取消* START ****************/
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
					f_mem_id = f_mem_id.trim();
				} else if (membership.equals("buyer")) {
					mem_id = mem_id.trim();
				}

				String order_add = (req.getParameter("order_add").trim());
				String order_receiver = (req.getParameter("order_receiver").trim());
				String order_tel = (req.getParameter("order_tel").trim());
				String order_memo = (req.getParameter("order_memo").trim());

				// 訂單狀態設成 4 已取消
				Integer order_state = 4;

				// 日期用try catch才能設收到null值，再設成null回去
				java.sql.Date order_ship_date = null;
				try {
					order_ship_date = java.sql.Date.valueOf(req.getParameter("order_ship_date"));// 要轉型

				} catch (Exception e) {
					order_ship_date = null;
				}

				java.sql.Date order_finish_date = null;
				try {
					order_finish_date = java.sql.Date.valueOf(req.getParameter("order_finish_date"));// 要轉型

				} catch (Exception e) {
					order_finish_date = null;
				}

				java.sql.Date order_cancel_date = new java.sql.Date(System.currentTimeMillis());// 要轉型

				Integer order_id = new Integer(req.getParameter("order_id").trim());

				ShopOrderVO shopOrderVO = new ShopOrderVO();

				shopOrderVO.setOrder_add(order_add);
				shopOrderVO.setOrder_receiver(order_receiver);
				shopOrderVO.setOrder_tel(order_tel);
				shopOrderVO.setOrder_memo(order_memo);
				shopOrderVO.setOrder_state(order_state);
				shopOrderVO.setOrder_ship_date(order_ship_date);
				shopOrderVO.setOrder_finish_date(order_finish_date);
				shopOrderVO.setOrder_cancel_date(order_cancel_date);
				shopOrderVO.setOrder_id(order_id);

				/*************************** 2.開始修改資料 *****************************************/
				ShopOrderService shopOrderSvc = new ShopOrderService();
				// 控制起驗證完拿到的碎片，new領班，交給領班去組合。
				// 領班用自己的方法去組合將碎片放入一個EmpVO物件，物件再交給工人去施工更新 的動作，然後領班會再回傳一個empVO物件回來
				ShopOrderVO shopOrderVO2 = shopOrderSvc.updateShopOrder(order_add, order_receiver, order_tel,
						order_memo, order_state, order_ship_date, order_finish_date, order_cancel_date, order_id);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				List<ShopOrderVO> shopOrderVO3 = null;
				System.out.println(membership);
				System.out.println(mem_id);
				System.out.println(f_mem_id);

				if (membership.equals("seller")) {
					Integer f_mem_id1 = new Integer(req.getParameter("f_mem_id"));
					shopOrderVO3 = shopOrderSvc.getAllFmemOrder(f_mem_id1);
				} else if (membership.equals("buyer")) {
					Integer mem_id1 = new Integer(req.getParameter("mem_id"));
					shopOrderVO3 = shopOrderSvc.getAllMemOrder(mem_id1);

				}

				req.setAttribute("shopOrderVO", shopOrderVO3); // 資料庫update成功後,正確的的empVO物件,存入req

				String url = "";

				if (membership.equals("seller")) {
					req.setAttribute("f_mem_id", f_mem_id);
					url = "/front-end/shopOrder/listAllOrderByFMem.jsp";
					System.out.println(f_mem_id);
				} else if (membership.equals("buyer")) {
					req.setAttribute("mem_id", mem_id);
					url = "/front-end/shopOrder/listAllOrderByMem.jsp";
					System.out.println(mem_id);
				}
				req.setAttribute("membership", membership);
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);
//					res.sendRedirect("listAllOrderByFMem.jsp");
				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				System.out.println("error已取消");
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				e.printStackTrace();
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/shopOrder/listAllOrderByFMem.jsp");
				failureView.forward(req, res);
			}
		}
///////////////////////////////  付款	/////////////////////////////////////////////////////////
//				付款pay=新增一筆訂單及多筆訂單明細
		if ("pay".equals(action)) { // 來自addEmp.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
				Integer mem_id = new Integer(req.getParameter("mem_id").trim());
				Integer f_mem_id = new Integer(req.getParameter("f_mem_id").trim());
				Integer order_amount = new Integer(req.getParameter("order_amount").trim());
				String order_memo = new String(req.getParameter("order_memo").trim());
				Integer order_payment = new Integer(req.getParameter("order_payment").trim());

				String order_receiver = req.getParameter("order_receiver");
				String enameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (order_receiver == null || order_receiver.trim().length() == 0) {
					errorMsgs.add("收件人: 請勿空白");
				} else if (!order_receiver.trim().matches(enameReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("收件人: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
				}

				String order_tel = req.getParameter("order_tel");
				String telReg = "^09[0-9]{8}$";
				if (order_tel == null || order_tel.trim().length() == 0) {
					errorMsgs.add("收件人電話: 請勿空白");
				} else if (!order_tel.trim().matches(telReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("收件人電話: 只能是數字 , 且長度必需在10到10之間");
				}

				String order_add = req.getParameter("order_add").trim();
				if (order_add == null || order_add.trim().length() == 0) {
					errorMsgs.add("收件地址請勿空白");
				}
//						訂單參數
				ShopOrderVO shopOrderVO = new ShopOrderVO();
				shopOrderVO.setMem_id(mem_id);
				shopOrderVO.setF_mem_id(f_mem_id);
				shopOrderVO.setOrder_payment(order_payment);
				shopOrderVO.setOrder_add(order_add);
				shopOrderVO.setOrder_receiver(order_receiver);
				shopOrderVO.setOrder_tel(order_tel);
				shopOrderVO.setOrder_memo(order_memo);
				shopOrderVO.setOrder_amount(order_amount);

//						訂單明細參數

				if (!errorMsgs.isEmpty()) {
					/* 跟getParameter無關 */
					req.setAttribute("shopOrderVO", shopOrderVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/shopOrder/checkout.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
				ShopCartService shopCartSVC = new ShopCartService();
				List<ShopCartVO> shopCartList = shopCartSVC.getBreakeList(mem_id, f_mem_id);
//						List<ShopOrderDetailsVO> shopOrderDeatailsVO = List<ShopOrderDetailsVO>.valueof(shopCartList);
				List<ShopOrderDetailsVO> list = new ArrayList<>();

				ShopProductService prodSVC = new ShopProductService();
//						ShopProductVO productVO1 = prodSVC.getOneProduct(prod_id);
//						System.out.println(productVO1.getProd_unit());
				for (ShopCartVO vo : shopCartList) {

					ShopOrderDetailsVO dVO = new ShopOrderDetailsVO();
					dVO.setProd_id(vo.getProd_id());
					dVO.setOrder_unit_price(vo.getCart_unit_price());
					dVO.setOrder_qty(vo.getCart_qty());
					dVO.setOrder_unit_amount(vo.getCart_unit_price() * vo.getCart_qty());

					ShopProductVO productVO1 = prodSVC.getOneProduct(vo.getProd_id());

					dVO.setProd_unit(productVO1.getProd_unit());
					list.add(dVO);
				}
				ShopOrderService shopOrderSvc = new ShopOrderService();
				shopOrderSvc.addWithDetails(shopOrderVO, list);

				shopCartSVC.deleteAllShopCart(mem_id, f_mem_id);
				System.out.println("清除購物車指令執行成功");
				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/front-end/shopOrder/pay_success.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/shopOrder/checkout.jsp");
				failureView.forward(req, res);
			}
		}

	}
}