package com.shopCart.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.mem.model.MemService;
import com.mem.model.MemVO;
import com.shopCart.model.*;
import com.shopOrder.model.ShopOrderVO;
import com.shopOrderDetails.model.ShopOrderDetailsVO;

public class ShopCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		if ("getOneList".equals(action)) { // 來自listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				HttpSession session = req.getSession();
				MemVO memVO = (MemVO) session.getAttribute("memberVO");

				if (memVO == null) {
//					req.setAttribute("shopCartVO", shopCartVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/shopCart/shopCart.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}

				int mem_id = memVO.getMem_id();
				ShopCartService scSVC = new ShopCartService();
				List<ShopCartVO> shopCartVO = scSVC.getOneList(mem_id);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/shopCart/shopCart.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}
				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("shopCartVO", shopCartVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/front-end/shopCart/shopCart.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/

			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/shopCart/success_checkout.jsp");
				failureView.forward(req, res);
			}
		}

		/*** <<刪除按鈕用的>> */
		if ("delete".equals(action)) { // 來自listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ***************************************/
				Integer mem_id = new Integer(req.getParameter("mem_id"));
//				mem_id = Integer.valueOf(req.getParameter("mem_id"));
				Integer prod_id = new Integer(req.getParameter("prod_id"));

				/*************************** 2.開始刪除資料 ***************************************/
				ShopCartService shopCartSvc = new ShopCartService();
				shopCartSvc.deleteShopCart(mem_id, prod_id);

				/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
				String url = "/front-end/shopCart/shopCart.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/shopCart/shopCart.jsp");
				failureView.forward(req, res);
			}
		}

		/*** <<plus按鈕用的>> */
		if ("plus".equals(action)) {
			System.out.println("+++++++++++++");
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ***************************************/
				Integer mem_id = new Integer(req.getParameter("mem_id"));
				Integer prod_id = new Integer(req.getParameter("prod_id"));

				Integer cart_qty1 = new Integer(req.getParameter("cart_qty"));
				Integer cart_qty = cart_qty1 + 1;

				Integer cart_unit_price = new Integer(req.getParameter("cart_unit_price"));

				ShopCartVO shopCartVO = new ShopCartVO();
				shopCartVO.setMem_id(mem_id);
				shopCartVO.setProd_id(prod_id);
				shopCartVO.setCart_qty(cart_qty);
				shopCartVO.setCart_unit_price(cart_unit_price);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("shopCartVO", shopCartVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/shopCart/shopCart.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}
				/*************************** 2.開始刪除資料 ***************************************/
				ShopCartService shopCartSvc = new ShopCartService();
				shopCartVO = shopCartSvc.updateShopCart(mem_id, prod_id, cart_qty, cart_unit_price);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("shopCartVO", shopCartVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/front-end/shopCart/shopCart.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/shopCart/shopCart.jsp");
				failureView.forward(req, res);
			}
		}

		/*** <<minus按鈕用的>> */
		if ("minus".equals(action)) {
			System.out.println("------------------");
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ***************************************/
				Integer mem_id = new Integer(req.getParameter("mem_id"));
				Integer prod_id = new Integer(req.getParameter("prod_id"));

				Integer cart_qty1 = new Integer(req.getParameter("cart_qty"));
				Integer cart_qty = cart_qty1 - 1;
				if (cart_qty < 1) {
					cart_qty = 1;
				}

				Integer cart_unit_price = new Integer(req.getParameter("cart_unit_price"));

				ShopCartVO shopCartVO = new ShopCartVO();
				shopCartVO.setMem_id(mem_id);
				shopCartVO.setProd_id(prod_id);
				shopCartVO.setCart_qty(cart_qty);
				shopCartVO.setCart_unit_price(cart_unit_price);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("shopCartVO", shopCartVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/shopCart/shopCart.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}
				/*************************** 2.開始修改資料 ***************************************/
				ShopCartService shopCartSvc = new ShopCartService();
				shopCartVO = shopCartSvc.updateShopCart(mem_id, prod_id, cart_qty, cart_unit_price);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("shopCartVO", shopCartVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/front-end/shopCart/shopCart.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/shopCart/shopCart.jsp");
				failureView.forward(req, res);
			}
		}

		if ("add".equals(action)) { // 來自addEmp.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
				Integer mem_id = new Integer(req.getParameter("mem_id"));
				Integer prod_id = new Integer(req.getParameter("prod_id"));
				Integer f_mem_id = new Integer(req.getParameter("f_mem_id"));
				Integer cart_qty = new Integer(req.getParameter("cart_qty"));
				Integer cart_unit_price = new Integer(req.getParameter("cart_unit_price"));

				ShopCartVO shopCartVO = new ShopCartVO();
				shopCartVO.setMem_id(mem_id);
				shopCartVO.setProd_id(prod_id);
				shopCartVO.setCart_qty(cart_qty);
				shopCartVO.setCart_unit_price(cart_unit_price);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("shopCartVO", shopCartVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/shopCart/shopCart.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}
				/*************************** 2.開始刪除資料 ***************************************/
				ShopCartService shopCartSvc = new ShopCartService();
				shopCartVO = shopCartSvc.addShopCart(mem_id, f_mem_id, prod_id, cart_qty, cart_unit_price);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("shopCartVO", shopCartVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/front-end/shopCart/shopCart.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/shopCart/shopCart.jsp");
				failureView.forward(req, res);
			}
		}
		//////// 加入購物車////////////////////////////////////////////////////////////
		if ("addShopCart".equals(action)) { // 來自listAllEmp.jsp
			System.out.println("成功執行加入購物車按鈕");

			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.

			System.out.println("111");
			Integer mem_id = new Integer(req.getParameter("mem_id").trim());
			System.out.println(mem_id);
			System.out.println("111");
			//			Integer mem_id = 77003;
			Integer f_mem_id = new Integer(req.getParameter("f_mem_id").trim());
			Integer prod_id = new Integer(req.getParameter("prod_id").trim());
			Integer cart_unit_price = new Integer(req.getParameter("prod_price").trim());
			Integer cart_qty = 1;

			System.out.println("商品編號" + prod_id);
//			判斷是否有重複商品Start/////////////////////////////////////
			ShopCartService shopCartSvc = new ShopCartService();
			ShopCartVO scVO = shopCartSvc.getOneShopCart(mem_id, prod_id);
			int x = 0;
			try {
				x = scVO.getProd_id();
			} catch (Exception e) {
				x = 0;
			}

			System.out.println("準備執行判斷式");
			if (x == 0) {
				System.out.println("判斷是if");
				List<String> errorMsgs = new LinkedList<String>();
				req.setAttribute("errorMsgs", errorMsgs);
				try {
					/*************************** 1.接收請求參數 ***************************************/
					System.out.println("新增車車");

					ShopCartVO shopCartVO = new ShopCartVO();
					shopCartVO.setMem_id(mem_id);
					shopCartVO.setF_mem_id(f_mem_id);
					shopCartVO.setProd_id(prod_id);
					shopCartVO.setCart_qty(cart_qty);
					shopCartVO.setCart_unit_price(cart_unit_price);

					if (!errorMsgs.isEmpty()) {
						/* 跟getParameter無關 */
						req.setAttribute("shopCartVO", shopCartVO); // 含有輸入格式錯誤的empVO物件,也存入req
						RequestDispatcher failureView = req.getRequestDispatcher("/front-end/Product/shop.jsp");
						failureView.forward(req, res);
						return;
					}
					/*************************** 2.開始新增資料 ***************************************/
//				ShopCartService shopCartSvc = new ShopCartService();
					shopCartSvc.addShopCart(mem_id, prod_id, f_mem_id, cart_qty, cart_unit_price);

					/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
					String url = "/front-end/Product/shop.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
					successView.forward(req, res);
//				res.sendRedirect("/CFA104G2_MVC/Product/browseProduct.jsp");
					/*************************** 其他可能的錯誤處理 **********************************/
				} catch (Exception e) {
					errorMsgs.add("新增資料失敗:" + e.getMessage());
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/Product/shop.jsp");
					failureView.forward(req, res);
				}
			} else {
				System.out.println("判斷是else");
				List<String> errorMsgs = new LinkedList<String>();
				req.setAttribute("errorMsgs", errorMsgs);
				try {
					System.out.println("修改車車");
//					/***************************1.接收請求參數***************************************/
//					mem_id = new Integer(req.getParameter("mem_id"));
//					f_mem_id = new Integer(req.getParameter("f_mem_id"));
//					prod_id = new Integer(req.getParameter("prod_id"));
//					cart_unit_price = new Integer(req.getParameter("cart_unit_price"));

					ShopCartService scSVC = new ShopCartService();
					ShopCartVO a = scSVC.getOneShopCart(mem_id, prod_id);
					Integer Cqty = a.getCart_qty();
					
					Integer cart_qty1 = new Integer(req.getParameter("cart_qty"));
//					cart_qty = cart_qty1 + 1;
					cart_qty = Cqty + 1;


					ShopCartVO shopCartVO = new ShopCartVO();
					shopCartVO.setMem_id(mem_id);
					shopCartVO.setF_mem_id(f_mem_id);
					shopCartVO.setProd_id(prod_id);
					shopCartVO.setCart_qty(cart_qty);
					shopCartVO.setCart_unit_price(cart_unit_price);

					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {
						req.setAttribute("shopCartVO", shopCartVO); // 含有輸入格式錯誤的empVO物件,也存入req
						RequestDispatcher failureView = req.getRequestDispatcher("/front-end/Product/shop.jsp");
						failureView.forward(req, res);
						return; // 程式中斷
					}
					/*************************** 2.開始刪除資料 ***************************************/
					shopCartVO = shopCartSvc.updateShopCart(mem_id, prod_id, cart_qty, cart_unit_price);

//					/***************************3.修改完成,準備轉交(Send the Success view)*************/
					req.setAttribute("shopCartVO", shopCartVO); // 資料庫update成功後,正確的的empVO物件,存入req
					String url = "/front-end/Product/shop.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
					successView.forward(req, res);

					/*************************** 其他可能的錯誤處理 *************************************/
				} catch (Exception e) {
					errorMsgs.add("修改資料失敗:" + e.getMessage());
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/Product/shop.jsp");
					failureView.forward(req, res);
				}
			}
		}

//			判斷是否有重複商品End/////////////////////////////////////
		//////// 結帳////////////////////////////////////////////////////////////
		if ("checkout".equals(action)) { // 來自addEmp.jsp的請求
			System.out.println("0000");
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				System.out.println("1111");
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/

				Integer mem_id = new Integer(req.getParameter("mem_id"));
				Integer f_mem_id = new Integer(req.getParameter("f_mem_id"));

				Integer sum = new Integer(req.getParameter("sum"));
				System.out.println(mem_id);
				System.out.println(f_mem_id);
				System.out.println(sum);

				ShopOrderVO shopOrderVO = new ShopOrderVO();
				shopOrderVO.setMem_id(mem_id);
				shopOrderVO.setF_mem_id(f_mem_id);
				shopOrderVO.setOrder_amount(sum);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					System.out.println("2222");
//					req.setAttribute("shopOrderVO", shopOrderVO); 

					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/shopOrder/checkout.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}
				/*************************** 2.開始新增資料 ***************************************/
//				ShopCartService shopCartSvc = new ShopCartService();
//				shopCartVO = shopCartSvc.addShopCart(mem_id, prod_id, cart_qty, cart_unit_price);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
//				req.setAttribute("shopCartVO", shopCartVO); // 資料庫update成功後,正確的的empVO物件,存入req
				System.out.println("3333");
				req.setAttribute("shopOrderVO", shopOrderVO);

				String url = "/front-end/shopOrder/checkout.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/shopCart/shopCart.jsp");
				failureView.forward(req, res);
			}
		}

	}
}
