package com.projPic.controller;

import java.io.*;
import java.sql.Date;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import org.apache.tomcat.util.http.fileupload.IOUtils;

import com.projPic.model.ProjPicService;
import com.projPic.model.ProjPicVO;

public class ProjPicServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action"); // 表單有用hidden name="action" value="getOne_For_Display"

		// 來自select_page.jsp的請求
		if ("getOne_For_Display".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String str = req.getParameter("proj_id");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入專案編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("listAllProj.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				Integer proj_id = null;
				try {
					proj_id = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("專案編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("listAllProj.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始查詢資料 *****************************************/
				ProjPicService projPicSvc = new ProjPicService();
				List<ProjPicVO> projPicVO = projPicSvc.getAllSameProjPic(proj_id);
				if (projPicVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("listAllProj.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}
				
                for (int i=0;i<projPicVO.size();i++) {
                	byte[] buffer = projPicVO.get(i).getProj_pic();
                	String base64Image = Base64.getEncoder().encodeToString(buffer);
                	projPicVO.get(i).setBase64Image(base64Image);
                	System.out.println("圖片轉換成功");
                }
				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("projPicVO", projPicVO); // 資料庫取出的projPicVO物件,存入req
				String url = "listOneProj.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("listAllProj.jsp");
			}
		}

		// 來自listAllEmp.jsp的請求
		if ("getOne_For_Update".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ****************************************/
				Integer proj_id = new Integer(req.getParameter("proj_id"));

				/*************************** 2.開始查詢資料 ****************************************/
				ProjPicService projPicSvc = new ProjPicService();
				ProjPicVO projPicVO = projPicSvc.getOneProjPic(proj_id);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("projPicVO", projPicVO); // 資料庫取出的projPicVO物件,存入req
				String url = "/projPic/update_projPic_input.jsp";///
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 /projPic/update_projPic_input.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("listAllProj.jsp");///
				failureView.forward(req, res);
			}
		}

//		if ("update".equals(action)) { // 來自update_emp_input.jsp的請求
//
//			
//			List<String> errorMsgs = new LinkedList<String>();
//			// Store this set in the request scope, in case we need to
//			// send the ErrorPage view.
//			req.setAttribute("errorMsgs", errorMsgs);
//
//			try {
//				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
//
//				Integer proj_id = new Integer(req.getParameter("proj_id").trim());
//				
//				String proj_name = req.getParameter("proj_name");
//				String enameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,40}$";
//				if (proj_name == null || proj_name.trim().length() == 0) {
//					errorMsgs.add("認養專案名稱: 請勿空白");
//				} else if (!proj_name.trim().matches(enameReg)) {
//					errorMsgs.add("認養專案名稱: 只能是中、英文字母、數字和_ , 且長度必需在2到40之間");
//				}
//
//				Integer proj_state = new Integer(req.getParameter("proj_state").trim());
//
////				------------------處理圖片--------------------
//				InputStream inputStream = null; // input stream of the upload file
//				byte[] proj_main_pic = null;
//				// obtains the upload file part in this multipart request
//				Part filePart = req.getPart("proj_main_pic");
//				if (filePart != null) {
//					// prints out some information for debugging
//					System.out.println(filePart.getName());
//					System.out.println(filePart.getSize());
//					System.out.println(filePart.getContentType());
//					// obtains input stream of the upload file
//					inputStream = filePart.getInputStream();
//					proj_main_pic = new byte[inputStream.available()];// 長度，資料流多少bytes
//				}
////				------------------處理圖片--------------------					
//
//				String proj_abstract = req.getParameter("proj_abstract").trim();
//				if (proj_abstract == null || proj_abstract.trim().length() == 0) {
//					errorMsgs.add("專案摘要請勿空白");
//				}	
//				
//				Integer proj_goal = new Integer(req.getParameter("proj_goal").trim());
//				
//				java.sql.Date excepted_end_date = null;
//				try {
//					excepted_end_date = java.sql.Date.valueOf(req.getParameter("excepted_end_date").trim());// 要轉型
//				} catch (IllegalArgumentException e) {
//					excepted_end_date = new java.sql.Date(System.currentTimeMillis());
//					errorMsgs.add("請輸入日期!");
//				}
//				
//				java.sql.Date actual_end_date = null;
//				try {
//					actual_end_date = java.sql.Date.valueOf(req.getParameter("actual_end_date").trim());// 要轉型
//				} catch (IllegalArgumentException e) {
//					actual_end_date = new java.sql.Date(System.currentTimeMillis());
//					errorMsgs.add("請輸入日期!");
//				}
//				
//				Integer proj_total_fund = new Integer(req.getParameter("proj_total_fund").trim());
//				
//				String proj_intro = req.getParameter("proj_intro").trim();
//				if (proj_abstract == null || proj_abstract.trim().length() == 0) {
//					errorMsgs.add("專案簡介請勿空白");
//				}
//				
//				String proj_risk = req.getParameter("proj_risk").trim();
//				if (proj_abstract == null || proj_abstract.trim().length() == 0) {
//					errorMsgs.add("專案風險請勿空白");
//				}
//
//				Integer proj_total_count = new Integer(req.getParameter("proj_total_count").trim());
//
//				String proj_video = req.getParameter("proj_video").trim();
//				if (proj_abstract == null || proj_abstract.trim().length() == 0) {
//					errorMsgs.add("專案影片連結請勿空白");
//				}
//				
//				Integer mem_report_count = new Integer(req.getParameter("mem_report_count").trim());
//				
//				Integer proj_pay = new Integer(req.getParameter("proj_pay").trim());
//
//				ProjPicVO projPicVO = new ProjPicVO();
//				
//				projPicVO.setProj_id(proj_id);
//				projPicVO.setProj_name(proj_name);
//				projPicVO.setProj_state(proj_state);
//				projPicVO.setProj_main_pic(proj_main_pic);
//				projPicVO.setProj_abstract(proj_abstract);
//				projPicVO.setProj_goal(proj_goal);
//				projPicVO.setExcepted_end_date(excepted_end_date);
//				projPicVO.setActual_end_date(actual_end_date);
//				projPicVO.setProj_total_fund(proj_total_fund);
//				projPicVO.setProj_intro(proj_intro);
//				projPicVO.setProj_risk(proj_risk);
//				projPicVO.setProj_total_count(proj_total_count);
//				projPicVO.setProj_video(proj_video);
//				projPicVO.setMem_report_count(mem_report_count);
//				projPicVO.setProj_pay(proj_pay);
//
//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					req.setAttribute("projPicVO", projPicVO); // 含有輸入格式錯誤的projPicVO物件,也存入req
//					RequestDispatcher failureView = req.getRequestDispatcher("listAllProj.jsp");
//					failureView.forward(req, res);
//					return; // 程式中斷
//				}
//
//				/*************************** 2.開始修改資料 *****************************************/
//				ProjPicService projSvc = new ProjPicService();
//				// 控制起驗證完拿到的碎片，new領班，交給領班去組合。
//				// 領班用自己的方法去組合將碎片放入一個ProjPicVO物件，物件再交給工人去施工更新 的動作，然後領班會再回傳一個projPicVO物件回來
//				projPicVO = projSvc.updateProjPicDetail(proj_name,
//						proj_state,proj_main_pic,proj_abstract,
//						proj_goal,excepted_end_date,
//						actual_end_date,proj_total_fund,proj_intro,
//						proj_risk,proj_total_count,
//						proj_video, mem_report_count,proj_pay, proj_id);
//
//				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
//				req.setAttribute("projPicVO", projPicVO); // 資料庫update成功後,正確的的projPicVO物件,存入req
//				String url = "/projPic/listOneProjPic.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
//				successView.forward(req, res);
//
//				/*************************** 其他可能的錯誤處理 *************************************/
//			} catch (Exception e) {
//				errorMsgs.add("修改資料失敗:" + e.getMessage());
//				RequestDispatcher failureView = req.getRequestDispatcher("listAllProj.jsp");
//				failureView.forward(req, res);
//			}
//		}
//
		if ("insert".equals(action)) { // 來自addEmp.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
				Integer proj_id = new Integer(req.getParameter("proj_id").trim());

				
				String ename = req.getParameter("ename");
				String enameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (ename == null || ename.trim().length() == 0) {
					errorMsgs.add("員工姓名: 請勿空白");
				} else if (!ename.trim().matches(enameReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("員工姓名: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
				}

				String job = req.getParameter("job").trim();
				if (job == null || job.trim().length() == 0) {
					errorMsgs.add("職位請勿空白");
				}

				java.sql.Date hiredate = null;
				try {
					hiredate = java.sql.Date.valueOf(req.getParameter("hiredate").trim());
				} catch (IllegalArgumentException e) {
					hiredate = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}

				Double sal = null;
				try {
					sal = new Double(req.getParameter("sal").trim());
				} catch (NumberFormatException e) {
					sal = 0.0;
					errorMsgs.add("薪水請填數字.");
				}

				Double comm = null;
				try {
					comm = new Double(req.getParameter("comm").trim());
				} catch (NumberFormatException e) {
					comm = 0.0;
					errorMsgs.add("獎金請填數字.");
				}

				Integer deptno = new Integer(req.getParameter("deptno").trim());

				ProjPicVO projPicVO = new ProjPicVO();
				projPicVO.setEname(ename);
				projPicVO.setJob(job);
				projPicVO.setHiredate(hiredate);
				projPicVO.setSal(sal);
				projPicVO.setComm(comm);
				projPicVO.setDeptno(deptno);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("projPicVO", projPicVO); // 含有輸入格式錯誤的projPicVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/emp/addEmp.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
				ProjPicService projSvc = new ProjPicService();
				// 控制器驗證完拿到的碎片，new領班，交給領班去組合。
				// 領班用自己的方法去組合將碎片放入一個ProjPicVO物件，物件再交給工人去施工新增的動作，然後領班會再回傳一個projPicVO物件回來
				projPicVO = projSvc.addEmp(ename, job, hiredate, sal, comm, deptno);

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/emp/listAllEmp.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/emp/addEmp.jsp");
				failureView.forward(req, res);
			}
		}
//
//		if ("delete".equals(action)) { // 來自listAllEmp.jsp
//
//			List<String> errorMsgs = new LinkedList<String>();
//			// Store this set in the request scope, in case we need to
//			// send the ErrorPage view.
//			req.setAttribute("errorMsgs", errorMsgs);
//
//			try {
//				/*************************** 1.接收請求參數 ***************************************/
//				Integer proj_id = new Integer(req.getParameter("proj_id"));
//
//				/*************************** 2.開始刪除資料 ***************************************/
//				ProjPicService projSvc = new ProjPicService();
//				projSvc.deleteProjPic(proj_id);
//
//				/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
//				String url = "listAllProj.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
//				successView.forward(req, res);
//
//				/*************************** 其他可能的錯誤處理 **********************************/
//			} catch (Exception e) {
//				errorMsgs.add("刪除資料失敗:" + e.getMessage());
//				RequestDispatcher failureView = req.getRequestDispatcher("listAllProj.jsp");
//				failureView.forward(req, res);
//			}
//		}
	}


}
