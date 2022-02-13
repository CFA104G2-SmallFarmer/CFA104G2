package com.shopProduct.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.shopProduct.model.ShopProductService;
import com.shopProduct.model.ShopProductVO;
import com.shopProductPic.model.ShopProductPicVO;


@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)

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
				
				
				/* 這邊是為了拿到原本的圖，設給一個變數p */
				ShopProductService projPerkSvc2 = new ShopProductService();
				ShopProductVO projPerkVO2 = projPerkSvc2.getOneProduct(prod_id);
				byte[] p = projPerkVO2.getProd_pic();
				
				
				/* 圖片區 */

//老師
//				Collection<Part> parts = req.getParts();
//				for (Part part : parts) {
//					String filename = getFileNameFromPart(part); // 方法寫在此頁最下面
//					if (filename != null && part.getContentType() != null) {

//              伺服器端程式設計要點:
//				檢查Part是普通表單控制元件還是文字上傳控制元件,判斷content-type的值是否是null
//				檢查檔名是否為null,為空則表示未選擇上傳檔案,判斷檔名是否是””

				Part part = req.getPart("prod_pic");

				String filename = getFileNameFromPart(part); // 方法寫在此頁最下面
				
				byte[] prod_pic = null;
			if (filename != null && part.getContentType() != null) { // 如果有傳圖片

					InputStream in = req.getPart("prod_pic").getInputStream();

					if (in.available() != 0) {
						prod_pic = new byte[in.available()];
						in.read(prod_pic);
						in.close();
					}	

				ShopProductVO shopProductVO = new ShopProductVO();
				
				shopProductVO.setProd_id(prod_id);
				shopProductVO.setF_mem_id(f_mem_id);
				shopProductVO.setProd_pic(prod_pic);
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
				shopProductVO = shopProductSvc.updateProductVO(prod_id,f_mem_id,prod_pic, prod_name, prod_type_id, prod_status, prod_price,
						prod_unit, prod_qty, prod_reg_date, prod_intro);


				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				ShopProductVO shopProductVO1 = shopProductSvc.getOneProduct(prod_id);
				req.setAttribute("shopProductVO", shopProductVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/Product/listOneProduct.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);
				
			} else {
				// 如果沒更新圖片
				ShopProductVO shopProductVO = new ShopProductVO();
				
				shopProductVO.setProd_id(prod_id);
				shopProductVO.setF_mem_id(f_mem_id);
				shopProductVO.setProd_pic(p);
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
				shopProductVO = shopProductSvc.updateProductVO(prod_id,f_mem_id,p, prod_name, prod_type_id, prod_status, prod_price,
						prod_unit, prod_qty, prod_reg_date, prod_intro);


				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				ShopProductVO shopProductVO1 = shopProductSvc.getOneProduct(prod_id);
				req.setAttribute("shopProductVO", shopProductVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/Product/listOneProduct.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);		
				
			}

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
				
//				------------------處理圖片--------------------
				InputStream in = req.getPart("prod_pic").getInputStream();
				byte[] prod_pic = null;
				if (in.available() != 0) {
					prod_pic = new byte[in.available()];
					in.read(prod_pic);
					in.close();
				} else {
					errorMsgs.add("請上傳圖片");
				}
//				------------------處理圖片--------------------						
			
				
				
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
				shopProductVO.setProd_pic(prod_pic);
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
				shopProductVO = shopProductSvc.addProductVO(f_mem_id,prod_pic, prod_name, prod_type_id, prod_status, prod_price,
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
	// 取出上傳的檔案名稱 (因為API未提供method,所以必須自行撰寫)
			public String getFileNameFromPart(Part part) {
				String header = part.getHeader("content-disposition");
				System.out.println("header=" + header); // 測試用
//				String filename = header.substring(header.lastIndexOf("=") + 2, header.length() - 1);   此版本chrome可以用,除了IE
				String filename = new File(header.substring(header.lastIndexOf("=") + 2, header.length() - 1)).getName();  //為了讓IE能跑得動
				System.out.println("filename=" + filename); // 測試用
				if (filename.length() == 0) {
					return null;
				}
				return filename;
			}

}
