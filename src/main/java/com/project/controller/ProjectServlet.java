package com.project.controller;

import java.io.*;
import java.sql.Date;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;

import org.apache.tomcat.util.http.fileupload.IOUtils;

import com.project.model.ProjectService;
import com.project.model.ProjectVO;


@MultipartConfig(maxFileSize = 16177215) 
public class ProjectServlet extends HttpServlet {

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
				ProjectService projectSvc = new ProjectService();
				ProjectVO projectVO = projectSvc.getOneProject(proj_id);
				if (projectVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("listAllProj.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("projectVO", projectVO); // 資料庫取出的projectVO物件,存入req
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
				ProjectService projectSvc = new ProjectService();
				ProjectVO projectVO = projectSvc.getOneProject(proj_id);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("projectVO", projectVO); // 資料庫取出的projectVO物件,存入req
				String url = "/project/update_project_input.jsp";///
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 /project/update_project_input.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("listAllProj.jsp");///
				failureView.forward(req, res);
			}
		}

		if ("update".equals(action)) { // 來自update_emp_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/

				Integer proj_id = new Integer(req.getParameter("proj_id").trim());

				String proj_name = req.getParameter("proj_name");
				String enameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,50}$";
				if (proj_name == null || proj_name.trim().length() == 0) {
					errorMsgs.add("認養專案名稱: 請勿空白");
				} else if (!proj_name.trim().matches(enameReg)) {
					errorMsgs.add("認養專案名稱: 只能是中、英文字母、數字和_ , 且長度必需在2到50之間");
				}

				Integer proj_state = new Integer(req.getParameter("proj_state").trim());

//				------------------處理圖片--------------------
				InputStream inputStream = null; // input stream of the upload file
				byte[] proj_main_pic = null;
				// obtains the upload file part in this multipart request
				Part filePart = req.getPart("proj_main_pic");
				if (filePart != null) {
					// prints out some information for debugging
					System.out.println(filePart.getName());
					System.out.println(filePart.getSize());
					System.out.println(filePart.getContentType());
					// obtains input stream of the upload file
					inputStream = filePart.getInputStream();
					proj_main_pic = new byte[inputStream.available()];// 長度，資料流多少bytes
				}
//				------------------處理圖片--------------------					

				String proj_abstract = req.getParameter("proj_abstract").trim();
				if (proj_abstract == null || proj_abstract.trim().length() == 0) {
					errorMsgs.add("專案摘要請勿空白");
				}

				Integer proj_goal = new Integer(req.getParameter("proj_goal").trim());

				java.sql.Date excepted_end_date = null;
				try {
					excepted_end_date = java.sql.Date.valueOf(req.getParameter("excepted_end_date").trim());// 要轉型
				} catch (IllegalArgumentException e) {
					excepted_end_date = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}

				java.sql.Date actual_end_date = null;
				try {
					actual_end_date = java.sql.Date.valueOf(req.getParameter("actual_end_date").trim());// 要轉型
				} catch (IllegalArgumentException e) {
					actual_end_date = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}

				Integer proj_total_fund = new Integer(req.getParameter("proj_total_fund").trim());

				String proj_intro = req.getParameter("proj_intro").trim();
				if (proj_abstract == null || proj_abstract.trim().length() == 0) {
					errorMsgs.add("專案簡介請勿空白");
				}

				String proj_risk = req.getParameter("proj_risk").trim();
				if (proj_abstract == null || proj_abstract.trim().length() == 0) {
					errorMsgs.add("專案風險請勿空白");
				}

				Integer proj_total_count = new Integer(req.getParameter("proj_total_count").trim());

				String proj_video = req.getParameter("proj_video").trim();
				if (proj_abstract == null || proj_abstract.trim().length() == 0) {
					errorMsgs.add("專案影片連結請勿空白");
				}

				Integer mem_report_count = new Integer(req.getParameter("mem_report_count").trim());

				Integer proj_pay = new Integer(req.getParameter("proj_pay").trim());

				ProjectVO projectVO = new ProjectVO();

				projectVO.setProj_id(proj_id);
				projectVO.setProj_name(proj_name);
				projectVO.setProj_state(proj_state);
				projectVO.setProj_main_pic(proj_main_pic);
				projectVO.setProj_abstract(proj_abstract);
				projectVO.setProj_goal(proj_goal);
				projectVO.setExcepted_end_date(excepted_end_date);
				projectVO.setActual_end_date(actual_end_date);
				projectVO.setProj_total_fund(proj_total_fund);
				projectVO.setProj_intro(proj_intro);
				projectVO.setProj_risk(proj_risk);
				projectVO.setProj_total_count(proj_total_count);
				projectVO.setProj_video(proj_video);
				projectVO.setMem_report_count(mem_report_count);
				projectVO.setProj_pay(proj_pay);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("projectVO", projectVO); // 含有輸入格式錯誤的projectVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("listAllProj.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				ProjectService projSvc = new ProjectService();
				// 控制起驗證完拿到的碎片，new領班，交給領班去組合。
				// 領班用自己的方法去組合將碎片放入一個ProjectVO物件，物件再交給工人去施工更新 的動作，然後領班會再回傳一個projectVO物件回來
				projectVO = projSvc.updateProjectDetail(proj_name, proj_state, proj_main_pic, proj_abstract, proj_goal,
						excepted_end_date, actual_end_date, proj_total_fund, proj_intro, proj_risk, proj_total_count,
						proj_video, mem_report_count, proj_pay, proj_id);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("projectVO", projectVO); // 資料庫update成功後,正確的的projectVO物件,存入req
				String url = "/project/listOneProj.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("listAllProj.jsp");
				failureView.forward(req, res);
			}
		}
//
		if ("insert".equals(action)) { // 來自addEmp.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/				
				Integer f_mem_id = new Integer(req.getParameter("f_mem_id").trim());

				String proj_name = req.getParameter("proj_name");
				String enameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,50}$";
				if (proj_name == null || proj_name.trim().length() == 0) {
					errorMsgs.add("認養專案名稱: 請勿空白");
				} else if (!proj_name.trim().matches(enameReg)) {
					errorMsgs.add("認養專案名稱: 只能是中、英文字母、數字和_ , 且長度必需在2到50之間");
				}

//				------------------處理圖片--------------------
				InputStream inputStream = null; // input stream of the upload file
				byte[] proj_main_pic = null;
				// obtains the upload file part in this multipart request
				Part filePart = req.getPart("proj_main_pic");
				if (filePart != null) {
					// prints out some information for debugging
					System.out.println(filePart.getName());
					System.out.println(filePart.getSize());
					System.out.println(filePart.getContentType());
					// obtains input stream of the upload file
					inputStream = filePart.getInputStream();
					proj_main_pic = new byte[inputStream.available()];// 長度，資料流多少bytes
					inputStream.read(proj_main_pic);
					inputStream.close();
				}
//				------------------處理圖片--------------------						
				String proj_abstract = req.getParameter("proj_abstract").trim();
				if (proj_abstract == null || proj_abstract.trim().length() == 0) {
					errorMsgs.add("專案摘要請勿空白");
				}

				Integer proj_goal = new Integer(req.getParameter("proj_goal").trim());

//				System.out.println(proj_goal);
				
				java.sql.Date expected_end_date = null;
				try {
					expected_end_date = java.sql.Date.valueOf(req.getParameter("expected_end_date").trim());// 要轉型
				} catch (IllegalArgumentException e) {
					expected_end_date = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}

				String proj_intro = req.getParameter("proj_intro");
				//	空白沒差 沒有要用proj_intro了

				String proj_risk = req.getParameter("proj_risk").trim();
				if (proj_abstract == null || proj_abstract.trim().length() == 0) {
					errorMsgs.add("專案風險請勿空白");
				}

				String proj_video = req.getParameter("proj_video");
				//	空白沒差 沒有要用proj_video了

				Integer proj_pay = new Integer(req.getParameter("proj_pay").trim());

				ProjectVO projectVO = new ProjectVO();			
				
				projectVO.setProj_id(f_mem_id);
				projectVO.setProj_name(proj_name);
				projectVO.setProj_main_pic(proj_main_pic);
				projectVO.setProj_abstract(proj_abstract);
				projectVO.setProj_goal(proj_goal);
				projectVO.setExcepted_end_date(expected_end_date);
				projectVO.setProj_intro(proj_intro);
				projectVO.setProj_risk(proj_risk);
				projectVO.setProj_video(proj_video);
				projectVO.setProj_pay(proj_pay);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					System.out.println("error3");
					req.setAttribute("projectVO", projectVO); // 含有輸入格式錯誤的projectVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("listAllProj.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				ProjectService projSvc = new ProjectService();
				// 控制起驗證完拿到的碎片，new領班，交給領班去組合。
				// 領班用自己的方法去組合將碎片放入一個ProjectVO物件，物件再交給工人去施工更新 的動作，然後領班會再回傳一個projectVO物件回來
				projectVO = projSvc.addProject(f_mem_id,proj_name,
						proj_main_pic,proj_abstract,
						proj_goal,expected_end_date, proj_intro,
						proj_risk,proj_video, proj_pay);
				
				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("projectVO", projectVO); // 資料庫update成功後,正確的的projectVO物件,存入req
				String url = "/project/addProj2.jsp"; 
				// 轉跳至專案圖片上傳頁面				
				// 因為取不到autoincrement的proj_id，沒辦法透過getOne做base64，要做只能在這支servlet裡面做，乾脆就listallbyfmem，感覺也不錯
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listAllProjByFmem.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				System.out.println("error4");
				e.printStackTrace();
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("listAllProj.jsp");
				failureView.forward(req, res);
			}
		}

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
//				ProjectService projSvc = new ProjectService();
//				projSvc.deleteProject(proj_id);
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
