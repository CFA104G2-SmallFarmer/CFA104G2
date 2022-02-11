package com.shopProduct.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import com.shopProduct.model.ShopProductService;
import com.shopProduct.model.ShopProductVO;

public class ShopProductServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("getOne_For_Update".equals(action)) { // 來自listAllProduct.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ****************************************/
				Integer prod_id = new Integer(req.getParameter("prod_id"));

				/*************************** 2.開始查詢資料 ****************************************/
				ShopProductService shopProductSvc = new ShopProductService();
				ShopProductVO shopProductVO = shopProductSvc.getOneProduct(prod_id);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("shopProductVO", shopProductVO); // 資料庫取出的empVO物件,存入req
				String url = "/Product/update_Product_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/Product/listAllProduct.jsp");
				failureView.forward(req, res);
			}
		}

		if ("update".equals(action)) { // 來自update_Product_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				Integer prod_id = new Integer(req.getParameter("prod_id").trim());

				Integer f_mem_id = new Integer(req.getParameter("f_mem_id").trim());

				String prod_name = req.getParameter("prod_name");
				String prod_nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (prod_name == null || prod_name.trim().length() == 0) {
					errorMsgs.add("商品名稱: 請勿空白");
				} else if (!prod_name.trim().matches(prod_nameReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("商品名稱: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
				}

				Integer prod_type_id = new Integer(req.getParameter("prod_type_id").trim());
				Integer prod_status = new Integer(req.getParameter("prod_status").trim());

				Integer prod_price = new Integer(req.getParameter("prod_price").trim());

				String prod_unit = req.getParameter("prod_unit");
				String prod_unitReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9/)]{1,10}$";
				if (prod_unit == null || prod_unit.trim().length() == 0) {
					errorMsgs.add("商品單位: 請勿空白");
				} else if (!prod_unit.trim().matches(prod_unitReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("商品單位: 只能是中、英文字母、數字和/ , 且長度必需在1到10之間");
				}

				Integer prod_qty = new Integer(req.getParameter("prod_qty").trim());

				java.sql.Date prod_reg_date = null;
				try {
					prod_reg_date = java.sql.Date.valueOf(req.getParameter("prod_reg_date").trim());
				} catch (IllegalArgumentException e) {
					prod_reg_date = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!"); 
				}

				String prod_intro = req.getParameter("prod_intro");
				if (prod_intro == null || prod_intro.trim().length() == 0) {
					errorMsgs.add("商品介紹: 請勿空白");
				} 

				ShopProductVO shopProductVO = new ShopProductVO();
				
				shopProductVO.setProd_id(prod_id);
				shopProductVO.setF_mem_id(f_mem_id);
				shopProductVO.setProd_name(prod_name);
				shopProductVO.setProd_type_id(prod_type_id);
				shopProductVO.setProd_status(prod_status);
				shopProductVO.setProd_price(prod_price);
				shopProductVO.setProd_unit(prod_unit);
				shopProductVO.setProd_qty(prod_qty);
				shopProductVO.setProd_reg_date(prod_reg_date);
				shopProductVO.setProd_intro(prod_intro);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("shopProductVO", shopProductVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/Product/listAllProduct.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始修改資料 *****************************************/
			
				
				ShopProductService shopProductSvc = new ShopProductService();
				shopProductVO = shopProductSvc.updateProductVO(prod_id,f_mem_id, prod_name, prod_type_id, prod_status, prod_price,
						prod_unit, prod_qty, prod_reg_date, prod_intro);


				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("shopProductVO", shopProductVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/Product/listOneProduct.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/Product/listAllProduct.jsp");
				failureView.forward(req, res);
			}
		}

		if ("insert".equals(action)) { // 來自addProduct.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/

				Integer f_mem_id = new Integer(req.getParameter("f_mem_id").trim());

				String prod_name = req.getParameter("prod_name");
				String prod_nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (prod_name == null || prod_name.trim().length() == 0) {
					errorMsgs.add("商品名稱: 請勿空白");
				} else if (!prod_name.trim().matches(prod_nameReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("商品名稱: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
				}

				Integer prod_type_id = new Integer(req.getParameter("prod_type_id").trim());
				Integer prod_status = new Integer(req.getParameter("prod_status").trim());

				Integer prod_price = new Integer(req.getParameter("prod_price").trim());

				String prod_unit = req.getParameter("prod_unit");
				String prod_unitReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9/)]{1,10}$";
				if (prod_unit == null || prod_unit.trim().length() == 0) {
					errorMsgs.add("商品單位: 請勿空白");
				} else if (!prod_unit.trim().matches(prod_unitReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("商品單位: 只能是中、英文字母、數字和/, 且長度必需在1到10之間");
				}

				Integer prod_qty = new Integer(req.getParameter("prod_qty").trim());

				java.sql.Date prod_reg_date = null;
				try {
					prod_reg_date = java.sql.Date.valueOf(req.getParameter("prod_reg_date").trim());
				} catch (IllegalArgumentException e) {
					prod_reg_date = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}

				String prod_intro = req.getParameter("prod_intro");
				if (prod_intro == null || prod_intro.trim().length() == 0) {
					errorMsgs.add("商品介紹: 請勿空白");
				} 
				
				ShopProductVO shopProductVO = new ShopProductVO();

				shopProductVO.setF_mem_id(f_mem_id);
				shopProductVO.setProd_name(prod_name);
				shopProductVO.setProd_type_id(prod_type_id);
				shopProductVO.setProd_status(prod_status);
				shopProductVO.setProd_price(prod_price);
				shopProductVO.setProd_unit(prod_unit);
				shopProductVO.setProd_qty(prod_qty);
				shopProductVO.setProd_reg_date(prod_reg_date);
				shopProductVO.setProd_intro(prod_intro);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("shopProductVO", shopProductVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/Product/addProduct.jsp");
					failureView.forward(req, res); 
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
				ShopProductService shopProductSvc = new ShopProductService();
				shopProductVO = shopProductSvc.addProductVO(f_mem_id, prod_name, prod_type_id, prod_status, prod_price,
						prod_unit, prod_qty, prod_reg_date, prod_intro);

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/Product/listAllProduct.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/Product/addProduct.jsp");
				failureView.forward(req, res);
			}
		}

			if ("delete".equals(action)) { // 來自listAllEmp.jsp

				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);
		
				try {
					/***************************1.接收請求參數***************************************/
				
					Integer prod_id = new Integer(req.getParameter("prod_id").trim());

					
					/***************************2.開始刪除資料***************************************/
					ShopProductService shopProductSvc = new ShopProductService();
					shopProductSvc.deleteProduct(prod_id);
						
					/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
					String url = "/Product/listAllProduct.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
					successView.forward(req, res);
					
					/***************************其他可能的錯誤處理**********************************/
				} catch (Exception e) {
					errorMsgs.add("刪除資料失敗:"+e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/Product/listAllProduct.jsp");
					failureView.forward(req, res);
				}
			}

	}

}
