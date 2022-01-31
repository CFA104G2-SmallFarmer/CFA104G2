package com.shopOrder.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.projOrder.model.ProjOrderService;
import com.projOrder.model.ProjOrderVO;
import com.projPerk.model.ProjPerkService;
import com.projPerk.model.ProjPerkVO;
import com.project.model.ProjectService;
import com.project.model.ProjectVO;
import com.shopOrder.model.ShopOrderService;
import com.shopOrder.model.ShopOrderVO;

public class ShopOrderServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action"); //表單有用hidden name="action" value="getOne_For_Display"
		
		
		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
						// send the ErrorPage view.
						req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String str = req.getParameter("order_id");
				if (str == null || (str.trim()).length() == 0) {//當訂單是null或去空白後長度為0
					errorMsgs.add("請輸入訂單編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
													//連結到商城查詢網頁
							.getRequestDispatcher("farmer_searchShopOrderPage.jsp");///***我還沒改
					failureView.forward(req, res);
					return;//程式回到原點
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
													//連結到商城查詢網頁
							.getRequestDispatcher("farmer_searchShopOrderPage.jsp");///***我還沒改
					failureView.forward(req, res);
					return;//程式回到原點
				}

			/***************************2.開始查詢資料*****************************************/

				ShopOrderService shopOrderSvc = new ShopOrderService();
				ShopOrderVO shopOrderVO = shopOrderSvc.getOneShopOrder(order_id);

				if (shopOrderVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
												//連結到商城查詢網頁
							.getRequestDispatcher("farmer_searchShopOrderPage.jsp");///***我還沒改
					failureView.forward(req, res);
					return;//程式中斷
				}
			
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("shopOrderVO", shopOrderVO); // 資料庫取出的empVO物件,存入req
			
				/*****我增加的部分start*****為了拿到專案名稱*/
//				ProjPerkService projPerkSvc = new ProjPerkService();
//				ProjPerkVO projPerkVO = projPerkSvc.getOneProjPerk(projOrderVO.getPerk_id());
//				ProjectService projectSvc = new ProjectService();
//				ProjectVO projectVO = projectSvc.getOneProject(projPerkVO.getProj_id());
//				
//				req.setAttribute("projPerkVO", projPerkVO); // 資料庫取出的empVO物件,存入req
//				req.setAttribute("projectVO", projectVO); // 資料庫取出的empVO物件,存入req
//				
//				req.setAttribute("order_state_arr", new String[]{"待付款","待出貨","運送中","運送中","已完成","不成立/n(未處理)","不成立/n(已解決)"});
//				req.setAttribute("proj_pay_arr", new String[]{"信用卡","銀行轉帳"});
//				req.setAttribute("cancel_reason_arr", new String[]{"","逾期未付款","買家取消","小農取消","專案募資失敗"});
				/*****我增加的部分end******/
				
				String url = "farmer_listOneShopOrder.jsp";///***我還沒改
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("farmer_searchProjOrderPage.jsp");///***我還沒改
				failureView.forward(req, res);
			}
		}
			
	}
}