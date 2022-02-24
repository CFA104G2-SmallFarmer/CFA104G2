package com.shopOrderDetails.controller;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

//import com.shopOrder.model.ShopOrderService;
//import com.shopOrder.model.ShopOrderVO;
import com.shopOrderDetails.model.ShopOrderDetailsService;
import com.shopOrderDetails.model.ShopOrderDetailsVO;

public class ShopOrderDetailsServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		/* ================================================= */
		/* ========= getAll 區域 ======== */
		/* ================================================= */

		/*** <<給一般會員用的>> */
		if ("getPKAll".equals(action)) { // 來自select_page.jsp的請求

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
							// 連結到小農查詢網頁
							.getRequestDispatcher("/front-end/shopOrderDetails/listPKALLShopOrderDetails.jsp");
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
					RequestDispatcher failureView =
							// 連結到小農查詢網頁
							req.getRequestDispatcher("/front-end/shopOrderDetails/listPKALLShopOrderDetails.jsp");
					failureView.forward(req, res);
					return;// 程式回到原點
				}

				/*************************** 2.開始查詢資料 *****************************************/

				ShopOrderDetailsService shopOrderDetalsSvc = new ShopOrderDetailsService();
				List<ShopOrderDetailsVO> shopOrderDetailsVO = shopOrderDetalsSvc.getPKAll(order_id);

//			for(int i=0; i<shopOrderVO.size(); i++) {
//				System.out.println(shopOrderVO.get(i));
//			}

				if (shopOrderDetailsVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView =
							// 連結到小農查詢網頁
							req.getRequestDispatcher("/front-end/shopOrderDetails/listPKALLShopOrderDetails.jsp");///
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("shopOrderDetailsVO", shopOrderDetailsVO); // 資料庫取出的empVO物件,存入req
//			增加部分
//				req.setAttribute("prod_star", new String[] { "★", "★★", "★★★", "★★★★", "★★★★★" });
//				req.setAttribute("mem_star", new String[] { "★", "★★", "★★★", "★★★★", "★★★★★" });
			

				String url = "/front-end/shopOrderDetails/listPKALLShopOrderDetails.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); 
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/shopOrderDetails/listPKALLShopOrderDetails.jsp");/// ***我還沒改
				failureView.forward(req, res);
			}
		}
	}
}
