package com.message.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.message.model.MessageService;
import com.message.model.MessageVO;

public class MessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("getOne_For_Display".equals(action)) { 

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				String str = req.getParameter("msg_no");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入msg_no");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/message/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				Integer msg_no = null;
				try {
					msg_no = new Integer(str); // 不能用自動裝拆箱 也可用Integer.valueOf(str)
				} catch (Exception e) {
					errorMsgs.add("格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/message/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始查詢資料 *****************************************/
				MessageService messageService = new MessageService();
				MessageVO messageVO = messageService.getOneMsg(msg_no);
				
				if (messageVO == null) {
					errorMsgs.add("查無資料");
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/message/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("messageVO", messageVO);
				String url = "/back-end/message/listOneMsg.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/message/select_page.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getOne_For_Update".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				Integer msg_no = new Integer(req.getParameter("msg_no"));
				MessageService messageService = new MessageService();
				MessageVO messageVO = messageService.getOneMsg(msg_no);
				req.setAttribute("messageVO", messageVO);
				String url = "/back-end/message/update_msg_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureview = req.getRequestDispatcher("/back-end/message/listAllMsg.jsp");
				failureview.forward(req, res);
			}
		}

		if ("update".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {

				Integer msg_no = new Integer(req.getParameter("msg_no").trim());
				Integer mem_id = new Integer(req.getParameter("mem_id").trim());
				Integer mem_id_send = new Integer(req.getParameter("mem_id_send").trim());
				String msg = req.getParameter("msg");// 英文或數字
				Integer read_state = new Integer(req.getParameter("read_state").trim());

				java.sql.Date msg_time = null;
				try {
					msg_time = java.sql.Date.valueOf(req.getParameter("msg_time").trim());
				} catch (IllegalArgumentException e) {
					msg_time = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}

				MessageVO messageVO = new MessageVO();
				messageVO.setMsg_no(msg_no);
				messageVO.setMem_id(mem_id);
				messageVO.setMem_id_send(mem_id_send);
				messageVO.setMsg_time(msg_time);
				messageVO.setMsg(msg);
				messageVO.setRead_state(read_state);
				
			
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("messageVO", messageVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/message/update_msg_input.jsp");
					failureView.forward(req, res);
					return;
				}
				MessageService messageService = new MessageService();
				messageVO = messageService.updateMsg(msg_no, mem_id, mem_id_send, msg_time, msg, read_state);
				
				req.setAttribute("messageVO", messageVO);
				String url = "/back-end/message/listOneMsg.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("修改失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/message/update_msg_input.jsp");
				failureView.forward(req, res);
			}

		}

		if ("insert".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {

				
				Integer mem_id = new Integer(req.getParameter("mem_id").trim());
				Integer mem_id_send = new Integer(req.getParameter("mem_id_send").trim());
				String msg = req.getParameter("msg");// 英文或數字
				Integer read_state = new Integer(req.getParameter("read_state").trim());

				java.sql.Date msg_time = null;
				try {
					msg_time = java.sql.Date.valueOf(req.getParameter("msg_time").trim());
				} catch (IllegalArgumentException e) {
					msg_time = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}

				MessageVO messageVO = new MessageVO();
				messageVO.setMem_id(mem_id);
				messageVO.setMem_id_send(mem_id_send);
				messageVO.setMsg_time(msg_time);
				messageVO.setMsg(msg);
				messageVO.setRead_state(read_state);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("messageVO", messageVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/message/addMsg.jsp");
					failureView.forward(req, res);
					return;
				}
				MessageService messageService = new MessageService();
				messageVO = messageService.addMsg(mem_id, mem_id_send, msg_time, msg, read_state);
				
				String url = "/back-end/message/listAllMsg.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/message/addMsg.jsp");
				failureView.forward(req, res);
			}

		}

		if ("delete".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {

				Integer msg_no = new Integer(req.getParameter("msg_no"));
				MessageService messageService = new MessageService();
				messageService.deleteMsg(msg_no);

				String url = "/back-end/message/listAllMsg.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("刪除失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/message/listAllMsg.jsp");
				failureView.forward(req, res);
			}

		}

	}

}
