package com.homeSlideShow.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.homeSlideShow.model.HomeSlideShowService;
import com.homeSlideShow.model.HomeSlideShowVO;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class HomeSlideShowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

//	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//		doPost(req, res);
//
//		res.setContentType("image/gif");
//		Integer hss_id = new Integer(req.getParameter("hss_id").trim());
//		HomeSlideShowService homeSlideShowService = new HomeSlideShowService();
//
//		ServletOutputStream out = res.getOutputStream();
//		out.write(homeSlideShowService.getOneHSS(hss_id).getHss_img());
//		out.close();
//	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("getOne_For_Display".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				String str = req.getParameter("hss_id");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入hss_id");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/homeSlideShow/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				Integer hss_id = null;
				try {
					hss_id = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("格式不正確");
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/homeSlideShow/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始查詢資料 *****************************************/
				HomeSlideShowService homeSlideShowService = new HomeSlideShowService();
				HomeSlideShowVO homeSlideShowVO = homeSlideShowService.getOneHSS(hss_id);

				if (homeSlideShowVO == null) {
					errorMsgs.add("查無資料");
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/homeSlideShow/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("homeSlideShowVO", homeSlideShowVO);
				String url = "/back-end/homeSlideShow/listOneHss.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/homeSlideShow/select_page.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getOne_For_Update".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				Integer hss_id = new Integer(req.getParameter("hss_id"));
				HomeSlideShowService homeSlideShowService = new HomeSlideShowService();
				HomeSlideShowVO homeSlideShowVO = homeSlideShowService.getOneHSS(hss_id);
				req.setAttribute("homeSlideShowVO", homeSlideShowVO);
				String url = "/back-end/homeSlideShow/update_hss_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureview = req.getRequestDispatcher("/back-end/homeSlideShow/listAllHss.jsp");
				failureview.forward(req, res);
			}
		}

		if ("update".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/*-------------------------------------------------------------------------*/
				Integer hss_id = new Integer(req.getParameter("hss_id").trim());
				/*-------------------------------------------------------------------------*/
				Integer admin_id = new Integer(req.getParameter("admin_id").trim());
				//session取值
				/*-------------------------------------------------------------------------*/
				String hss_text = req.getParameter("hss_text");
				if (hss_text == null || hss_text.trim().length() == 0) {
					errorMsgs.add("請填寫內容");
				}
				/*-------------------------------------------------------------------------*/
				Integer hss_state = new Integer(req.getParameter("hss_state").trim());
				//radio select
				/*-------------------------------------------------------------------------*/
				java.sql.Date hss_time = null;
				try {
					hss_time = java.sql.Date.valueOf(req.getParameter("hss_time").trim());
				} catch (IllegalArgumentException e) {
					hss_time = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}
				/*-------------------------------------------------------------------------*/
				java.sql.Date hss_on_shelf = null;
				try {
					hss_on_shelf = java.sql.Date.valueOf(req.getParameter("hss_on_shelf").trim());
				} catch (IllegalArgumentException e) {
					hss_on_shelf = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}
				/*-------------------------------------------------------------------------*/
				java.sql.Date hss_off_shelf = null;
				try {
					hss_off_shelf = java.sql.Date.valueOf(req.getParameter("hss_off_shelf").trim());
				} catch (IllegalArgumentException e) {
					hss_off_shelf = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}
				/*-------------------------------------------------------------------------*/
				Part part = req.getPart("hss_img");
				InputStream in = part.getInputStream();
				if (in.available() == 0) {
					errorMsgs.add("沒有選擇照片");
				}
			
				
				byte[] buf = new byte[in.available()];
				in.read(buf);
				in.close();
				/*-------------------------------------------------------------------------*/
				HomeSlideShowVO homeSlideShowVO = new HomeSlideShowVO();
				homeSlideShowVO.setHss_id(hss_id);
				homeSlideShowVO.setAdmin_id(admin_id);
				if(buf != null) {
					homeSlideShowVO.setHss_img(buf);
				}
				homeSlideShowVO.setHss_text(hss_text);
				homeSlideShowVO.setHss_time(hss_time);
				homeSlideShowVO.setHss_state(hss_state);
				homeSlideShowVO.setHss_on_shelf(hss_on_shelf);
				homeSlideShowVO.setHss_off_shelf(hss_off_shelf);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("homeSlideShowVO", homeSlideShowVO);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/homeSlideShow/update_hss_input.jsp");
					failureView.forward(req, res);
					return;
				}

				HomeSlideShowService homeSlideShowService = new HomeSlideShowService();
				homeSlideShowVO = homeSlideShowService.updateHSS(hss_id, admin_id, buf, hss_text, hss_time, hss_state,
						hss_on_shelf, hss_off_shelf);

				req.setAttribute("homeSlideShowVO", homeSlideShowVO);
				String url = "/back-end/homeSlideShow/listAllHss.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("修改失敗:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/homeSlideShow/update_hss_input.jsp");
				failureView.forward(req, res);
			}

		}

		if ("insert".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/*-------------------------------------------------------------------------*/
				Integer admin_id = new Integer(req.getParameter("admin_id").trim());
				//session取值
				/*-------------------------------------------------------------------------*/
				String hss_text = req.getParameter("hss_text");
				if (hss_text == null || hss_text.trim().length() == 0) {
					errorMsgs.add("請填寫內容");
				}
				/*-------------------------------------------------------------------------*/
				Integer hss_state = new Integer(req.getParameter("hss_state").trim());
				//radio select
				/*-------------------------------------------------------------------------*/

				java.sql.Date hss_time = null;
				try {
					hss_time = java.sql.Date.valueOf(req.getParameter("hss_time").trim());
				} catch (IllegalArgumentException e) {
					hss_time = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}
				/*-------------------------------------------------------------------------*/
				java.sql.Date hss_on_shelf = null;
				try {
					hss_on_shelf = java.sql.Date.valueOf(req.getParameter("hss_on_shelf").trim());
				} catch (IllegalArgumentException e) {
					hss_on_shelf = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}
				/*-------------------------------------------------------------------------*/
				java.sql.Date hss_off_shelf = null;
				try {
					hss_off_shelf = java.sql.Date.valueOf(req.getParameter("hss_off_shelf").trim());
				} catch (IllegalArgumentException e) {
					hss_off_shelf = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}
				/*-------------------------------------------------------------------------*/
				Part part = req.getPart("hss_img");
				InputStream in = part.getInputStream();
				byte[] buf = new byte[in.available()];
				in.read(buf);
				in.close();
				/*-------------------------------------------------------------------------*/
				HomeSlideShowVO homeSlideShowVO = new HomeSlideShowVO();
				homeSlideShowVO.setAdmin_id(admin_id);
				homeSlideShowVO.setHss_img(buf);
				homeSlideShowVO.setHss_text(hss_text);
				homeSlideShowVO.setHss_time(hss_time);
				homeSlideShowVO.setHss_on_shelf(hss_on_shelf);
				homeSlideShowVO.setHss_off_shelf(hss_off_shelf);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("homeSlideShowVO", homeSlideShowVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/homeSlideShow/addHss.jsp");
					failureView.forward(req, res);
					return;
				}
				HomeSlideShowService homeSlideShowService = new HomeSlideShowService();
				homeSlideShowVO = homeSlideShowService.addHSS(admin_id, buf, hss_text, hss_time, hss_state,
						hss_on_shelf, hss_off_shelf);

				String url = "/back-end/homeSlideShow/listAllHss.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/homeSlideShow/addHss.jsp");
				failureView.forward(req, res);
			}

		}

		if ("delete".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {

				Integer hss_id = new Integer(req.getParameter("hss_id"));
				HomeSlideShowService homeSlideShowService = new HomeSlideShowService();
				homeSlideShowService.deleteHSS(hss_id);

				String url = "/back-end/homeSlideShow/listAllHss.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("刪除失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/homeSlideShow/listAllHss.jsp");
				failureView.forward(req, res);
			}

		}

	}

}
