package com.announcement.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.announcement.model.AnnouncementService;
import com.announcement.model.AnnouncementVO;

public class AnnouncementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				String str = req.getParameter("announce_id");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入announce_id");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/announcement/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				Integer announce_id = null;
				try {
					announce_id = new Integer(str); // 不能用自動裝拆箱 也可用Integer.valueOf(str)
				} catch (Exception e) {
					errorMsgs.add("格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/announcement/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始查詢資料 *****************************************/
				AnnouncementService announcementService = new AnnouncementService();
				AnnouncementVO announcementVO = announcementService.getOneAnnounce(announce_id);
				if (announcementVO == null) {
					errorMsgs.add("查無資料");
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/announcement/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("announcementVO", announcementVO);
				String url = "/back-end/announcement/listOneAnnounce.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/announcement/select_page.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getOne_For_Update".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				Integer announce_id = new Integer(req.getParameter("announce_id"));
				AnnouncementService announcementService = new AnnouncementService();
				AnnouncementVO announcementVO = announcementService.getOneAnnounce(announce_id);
				req.setAttribute("announcementVO", announcementVO);
				String url = "/back-end/announcement/update_announce_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureview = req.getRequestDispatcher("/back-end/announcement/listAllAnnounce.jsp");
				failureview.forward(req, res);
			}
		}

		if ("update".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
			
				
				/*-------------------------------------------------------------------------*/
				Integer announce_id = new Integer(req.getParameter("announce_id").trim());
				
				/*-------------------------------------------------------------------------*/
				Integer announce_type = new Integer(req.getParameter("announce_type").trim());
				//radio select
				/*-------------------------------------------------------------------------*/
				Integer admin_id = new Integer(req.getParameter("admin_id").trim());
				//by acc
				/*-------------------------------------------------------------------------*/
				String announce_title = req.getParameter("announce_title");
				if (announce_title == null || announce_title.trim().length() == 0) {
					errorMsgs.add("標題請勿空白");
				} else if (announce_title.length()>40) {
					errorMsgs.add("字數錯誤,請重新輸入");
				}
				
				/*-------------------------------------------------------------------------*/
				String announce_content = req.getParameter("announce_content");
				if (announce_content == null || announce_content.trim().length() == 0) {
					errorMsgs.add("內容請勿空白");
				} else if (announce_content.length()>1200) {
					errorMsgs.add("字數錯誤,請重新輸入");
				}
				
				/*-------------------------------------------------------------------------*/
				java.sql.Date edit_time = null;
				try {
					edit_time = java.sql.Date.valueOf(req.getParameter("edit_time").trim());
				} catch (IllegalArgumentException e) {
					edit_time = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}

				AnnouncementVO announcementVO = new AnnouncementVO();
				announcementVO.setAnnounce_id(announce_id);
				announcementVO.setAnnounce_type(announce_type);
				announcementVO.setAdmin_id(admin_id);
				announcementVO.setEdit_time(edit_time);
				announcementVO.setAnnounce_title(announce_title);
				announcementVO.setAnnounce_content(announce_content);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("announcementVO", announcementVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/announcement/update_announce_input.jsp");
					failureView.forward(req, res);
					return;
				}
				AnnouncementService announcementService = new AnnouncementService();
				announcementVO = announcementService.updateAnnounce(announce_id, announce_type, admin_id, edit_time,
						announce_title, announce_content);

				req.setAttribute("announcementVO", announcementVO);
				String url = "/back-end/announcement/listOneAnnounce.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("修改失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/announcement/update_announce_input.jsp");
				failureView.forward(req, res);
			}

		}

		if ("insert".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {

				String adminReg1 = "^(.+){2,40}$";
				String adminReg2 = "^(.+){2,1200}$";
				
				/*-------------------------------------------------------------------------*/
				Integer announce_type = new Integer(req.getParameter("announce_type").trim());
				//radio select
				/*-------------------------------------------------------------------------*/
				Integer admin_id = new Integer(req.getParameter("admin_id").trim());
				//by acc
				/*-------------------------------------------------------------------------*/
				String announce_title = req.getParameter("announce_title");
				if (announce_title == null || announce_title.trim().length() == 0) {
					errorMsgs.add("請勿空白");
				} else if (!announce_title.trim().matches(adminReg1)) {
					errorMsgs.add("格式錯誤,請重新輸入");
				}
				/*-------------------------------------------------------------------------*/
				String announce_content = req.getParameter("announce_content");
				if (announce_content == null || announce_content.trim().length() == 0) {
					errorMsgs.add("請勿空白");
				} else if (!announce_content.trim().matches(adminReg2)) {
					errorMsgs.add("格式錯誤,請重新輸入");
				}
				/*-------------------------------------------------------------------------*/
				java.sql.Date edit_time = null;
				try {
					edit_time = java.sql.Date.valueOf(req.getParameter("edit_time").trim());
				} catch (IllegalArgumentException e) {
					edit_time = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}

				AnnouncementVO announcementVO = new AnnouncementVO();
				
				announcementVO.setAnnounce_type(announce_type);
				announcementVO.setAdmin_id(admin_id);
				announcementVO.setEdit_time(edit_time);
				announcementVO.setAnnounce_title(announce_title);
				announcementVO.setAnnounce_content(announce_content);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("announcementVO", announcementVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/announcement/addAnnounce.jsp");
					failureView.forward(req, res);
					return;
				}
				AnnouncementService announcementService = new AnnouncementService();
				announcementVO = announcementService.addAnnounce(announce_type, admin_id, edit_time,
						announce_title, announce_content);

				String url = "/back-end/announcement/listAllAnnounce.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/announcement/addAnnounce.jsp");
				failureView.forward(req, res);
			}

		}

		if ("delete".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {

				Integer announce_id = new Integer(req.getParameter("announce_id"));
				AnnouncementService announcementService = new AnnouncementService();
				announcementService.deleteAnnounce(announce_id);

				String url = "/back-end/announcement/listAllAnnounce.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("刪除失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/announcement/listAllAnnounce.jsp");
				failureView.forward(req, res);
			}

		}

	}

}
