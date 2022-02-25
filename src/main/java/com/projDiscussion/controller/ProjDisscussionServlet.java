package com.projDiscussion.controller;

import java.io.*;
import java.sql.Date;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import org.apache.tomcat.util.http.fileupload.IOUtils;

import com.projDiscussion.model.ProjDiscussionService;
import com.projDiscussion.model.ProjDiscussionVO;
import com.projPerk.model.ProjPerkVO;
import com.project.model.ProjectService;
import com.project.model.ProjectVO;

@WebServlet("/projDiscussion/projDiscussion.do")
@MultipartConfig(maxFileSize = 16177215)
public class ProjDisscussionServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action"); // 表單有用hidden name="action" value="getOne_For_Display"

		// 來自select_page.jsp的請求
		if ("getAllDisc_For_Display_By_Fmem".equals(action)) {
			System.out.println("1");
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String str = req.getParameter("proj_id");
				System.out.println(str);
				if (str == null || (str.trim()).length() == 0) {
					System.out.println(str);
					errorMsgs.add("請輸入專案編號");
					System.out.println(str);
				}
//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					RequestDispatcher failureView = req.getRequestDispatcher("/project/listOneProj.jsp");
//					failureView.forward(req, res);
//					return;// 程式中斷
//				}

				Integer proj_id = null;
				try {
					proj_id = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("專案編號格式不正確");
				}
//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					RequestDispatcher failureView = req.getRequestDispatcher("/project/listOneProj.jsp");
//					failureView.forward(req, res);
//					return;// 程式中斷
//				}
//				System.out.println("2");
				/*************************** 2.開始查詢資料 *****************************************/
				ProjectService projectSvc = new ProjectService();
				ProjectVO projectVO = projectSvc.getOneProject(proj_id);

//				ProjPerkService projPerkSvc = new ProjPerkService();
//				List<ProjPerkVO> projPerkVO = projPerkSvc.getAll(proj_id);
//				
//				for(int i=0; i<projPerkVO.size(); i++) {
//					System.out.println(projPerkVO.get(i));
//				}

				if (projectVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/project/listAllProjByFmem.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}
				System.out.println("查詢完成,準備轉交");
				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
//				req.setAttribute("projectVO", projectVO); // 資料庫取出的projPerkVO物件,存入req
//				req.setAttribute("projPerkVO", projPerkVO); // 資料庫取出的projPerkVO物件,存入req

				
				 HttpSession session=req.getSession();
			       session.setAttribute("projectVO", projectVO);
				
				
				
				String url = "/front-end/projDiscussion/listAllProjDiscByProjByFmem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 perkoverview.jsp
				successView.forward(req, res);
				System.out.println("成功");
				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				System.out.println("error in final");
				errorMsgs.add("請再試一次");

				String str = req.getParameter("proj_id");
				Integer proj_id = null;
				proj_id = new Integer(str);
				ProjectService projectSvc = new ProjectService();
				ProjectVO projectVO = projectSvc.getOneProject(proj_id);
				req.setAttribute("projectVO", projectVO);

				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/project/listAllProjByFmem.jsp");
				failureView.forward(req, res);

				System.out.println("Mem error in final");
			}
		}



		if ("insertByFmem".equals(action)) { // 來自addEmp.jsp的請求
			System.out.println("insert in");
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
				Integer proj_id = new Integer(req.getParameter("proj_id").trim());
				System.out.println(proj_id);
				Integer discussion_id = new Integer(req.getParameter("discussion_id").trim());

				System.out.println(discussion_id);
				//	有空值是否會報錯
				
				Integer mem_id=null;
				if  (req.getParameter("mem_id")==null) {
					mem_id=-1;
				}else {
				mem_id = new Integer(req.getParameter("mem_id"));
				System.out.println(mem_id);
				}
				
				Integer f_mem_id=null;
				if  (req.getParameter("f_mem_id")==null) {
					f_mem_id=-1;
				}else {
				f_mem_id = new Integer(req.getParameter("f_mem_id"));
				System.out.println(f_mem_id );
				}
				
				String comment_content = req.getParameter("comment_content").trim();
				if (comment_content == null || comment_content.trim().length() == 0) {
					errorMsgs.add("留言內容: 請勿空白");
				} 
				
				comment_content=comment_content.replace("\r\n", "<br>");
				comment_content=comment_content.replace("<", "&lt;");
				comment_content=comment_content.replace(">", "&gt;");
				comment_content=comment_content.replace("\"", "&quot;");
				comment_content=comment_content.replace("\'", "&quot;");
				comment_content=comment_content.replace("&lt;br&gt;", "<br>");
				

				System.out.println(comment_content);

				ProjDiscussionVO projDiscussionVO = new ProjDiscussionVO();

				projDiscussionVO.setProj_id(proj_id);
				projDiscussionVO.setDiscussion_id(discussion_id);
				//	考慮預設自增一下
				projDiscussionVO.setMem_id(mem_id);
				projDiscussionVO.setF_mem_id(f_mem_id);
				projDiscussionVO.setComment_content(comment_content);
				

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					ProjectService projectSvc = new ProjectService();
					ProjectVO projectVO = projectSvc.getOneProject(proj_id);
					
					req.setAttribute("projectVO", projectVO);
					
					System.out.println("error3");
					req.setAttribute("projDiscussionVO", projDiscussionVO); // 含有輸入格式錯誤的projectVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/projDiscussion/listAllProjDiscByProjByFmem.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				ProjDiscussionService projDiscSvc = new ProjDiscussionService();
				projDiscussionVO = projDiscSvc.addProjDiscussion(proj_id,discussion_id,mem_id,f_mem_id, comment_content);

				// System.out.println(projectVO.getProj_id());

				/*************************** 3.新增完成,準備轉交(Send the Success view) *************/
				ProjectService projectSvc = new ProjectService();
				ProjectVO projectVO = projectSvc.getOneProject(proj_id);
				
				 HttpSession session=req.getSession();
			       session.setAttribute("projectVO", projectVO);
				
				
//				req.setAttribute("projectVO", projectVO); // 資料庫update成功後,正確的的projectVO物件,存入req
				String url = "/front-end/projDiscussion/listAllProjDiscByProjByFmem.jsp";
				// 轉跳至專案圖片上傳頁面
				// 因為取不到autoincrement的proj_id，沒辦法透過getOne做base64，要做只能在這支servlet裡面做，乾脆就listallbyfmem，感覺也不錯
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listAllProjByFmem.jsp
				successView.forward(req, res);
				System.out.println("good");
				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				Integer proj_id = new Integer(req.getParameter("proj_id").trim());
				ProjectService projectSvc = new ProjectService();
				ProjectVO projectVO = projectSvc.getOneProject(proj_id);
				
				req.setAttribute("projectVO", projectVO);
				
				System.out.println("error4");
				e.printStackTrace();
				errorMsgs.add("新增留言失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/projDiscussion/listAllProjDiscByProjByFmem.jsp");
				failureView.forward(req, res);
			}
		}

//		---------------------------------小農-end---------------------------------------------------------
		
//		---------------------------------會員-start---------------------------------------------------------
		
		if ("getAllDisc_For_Display_By_Mem".equals(action)) {
			System.out.println("1");
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
//				String mem_id = req.getParameter("mem_id");
//				mem_id = new Integer(mem_id);
				
				
				String str = req.getParameter("proj_id");
				System.out.println(str);
				if (str == null || (str.trim()).length() == 0) {
					System.out.println(str);
					errorMsgs.add("請輸入專案編號");
					System.out.println(str);
				}


				Integer proj_id = null;
				try {
					proj_id = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("專案編號格式不正確");
				}
//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					RequestDispatcher failureView = req.getRequestDispatcher("/project/listOneProj.jsp");
//					failureView.forward(req, res);
//					return;// 程式中斷
//				}
				System.out.println("proj_id是"+proj_id);
				/*************************** 2.開始查詢資料 *****************************************/
				ProjectService projectSvc = new ProjectService();
				ProjectVO projectVO = projectSvc.getOneProject(proj_id);

//				ProjPerkService projPerkSvc = new ProjPerkService();
//				List<ProjPerkVO> projPerkVO = projPerkSvc.getAll(proj_id);
//				
//				for(int i=0; i<projPerkVO.size(); i++) {
//					System.out.println(projPerkVO.get(i));
//				}

				if (projectVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/project/listAllProjByMem.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}
				System.out.println("3");
				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
//				req.setAttribute("projectVO", projectVO); // 資料庫取出的projPerkVO物件,存入req
//				req.setAttribute("projPerkVO", projPerkVO); // 資料庫取出的projPerkVO物件,存入req
				
				 HttpSession session=req.getSession();
			       session.setAttribute("projectVO", projectVO);
				
				
				
				String url = "/front-end/projDiscussion/listAllProjDiscByProjByMem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 perkoverview.jsp
				successView.forward(req, res);
				System.out.println("成功");
				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				System.out.println("error in final");
				errorMsgs.add("請再試一次");

				String str = req.getParameter("proj_id");
				Integer proj_id = null;
				proj_id = new Integer(str);
				ProjectService projectSvc = new ProjectService();
				ProjectVO projectVO = projectSvc.getOneProject(proj_id);
				req.setAttribute("projectVO", projectVO);

				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/project/listAllProjByMem.jsp");
				failureView.forward(req, res);

				System.out.println("Mem error in final");
			}
		}



		if ("insertByMem".equals(action)) { // 來自addEmp.jsp的請求
			System.out.println("insert in");
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
				Integer proj_id = new Integer(req.getParameter("proj_id").trim());
				System.out.println(proj_id);
				Integer discussion_id = new Integer(req.getParameter("discussion_id").trim());

				System.out.println(discussion_id);
				//	有空值是否會報錯
				
				Integer mem_id=null;
				if  (req.getParameter("mem_id")==null) {
					mem_id=-1;
				}else {
				mem_id = new Integer(req.getParameter("mem_id"));
				System.out.println(mem_id);
				}
				
				Integer f_mem_id=null;
				if  (req.getParameter("f_mem_id")==null) {
					f_mem_id=-1;
				}else {
				f_mem_id = new Integer(req.getParameter("f_mem_id"));
				System.out.println(f_mem_id );
				}
				
				String comment_content = req.getParameter("comment_content").trim();
				if (comment_content == null || comment_content.trim().length() == 0) {
					errorMsgs.add("留言內容: 請勿空白");
				} 
				
				comment_content=comment_content.replace("\r\n", "<br>");
				comment_content=comment_content.replace("<", "&lt;");
				comment_content=comment_content.replace(">", "&gt;");
				comment_content=comment_content.replace("\"", "&quot;");
				comment_content=comment_content.replace("\'", "&quot;");
				comment_content=comment_content.replace("&lt;br&gt;", "<br>");
				
				System.out.println(comment_content);

				ProjDiscussionVO projDiscussionVO = new ProjDiscussionVO();

				projDiscussionVO.setProj_id(proj_id);
				projDiscussionVO.setDiscussion_id(discussion_id);
				//	考慮預設自增一下
				projDiscussionVO.setMem_id(mem_id);
				projDiscussionVO.setF_mem_id(f_mem_id);
				projDiscussionVO.setComment_content(comment_content);
				

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					ProjectService projectSvc = new ProjectService();
					ProjectVO projectVO = projectSvc.getOneProject(proj_id);
					
					req.setAttribute("projectVO", projectVO);
					
					System.out.println("error3");
					req.setAttribute("projDiscussionVO", projDiscussionVO); // 含有輸入格式錯誤的projectVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/projDiscussion/listAllProjDiscByProjByMem.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				ProjDiscussionService projDiscSvc = new ProjDiscussionService();
				projDiscussionVO = projDiscSvc.addProjDiscussion(proj_id,discussion_id,mem_id,f_mem_id, comment_content);

				// System.out.println(projectVO.getProj_id());

				/*************************** 3.新增完成,準備轉交(Send the Success view) *************/
				ProjectService projectSvc = new ProjectService();
				ProjectVO projectVO = projectSvc.getOneProject(proj_id);
				
				
				 HttpSession session=req.getSession();
			       session.setAttribute("projectVO", projectVO);
			       session.setAttribute("mem_id", mem_id);
				
//				req.setAttribute("mem_id",mem_id); 
				
				req.setAttribute("projectVO", projectVO); // 資料庫update成功後,正確的的projectVO物件,存入req
				String url = "/front-end/projDiscussion/listAllProjDiscByProjByMem.jsp";
				// 轉跳至專案圖片上傳頁面
				// 因為取不到autoincrement的proj_id，沒辦法透過getOne做base64，要做只能在這支servlet裡面做，乾脆就listallbyfmem，感覺也不錯
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listAllProjByFmem.jsp
				successView.forward(req, res);
				System.out.println("good");
				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				Integer proj_id = new Integer(req.getParameter("proj_id").trim());
				ProjectService projectSvc = new ProjectService();
				ProjectVO projectVO = projectSvc.getOneProject(proj_id);
				
				req.setAttribute("projectVO", projectVO);
				
				System.out.println("error4");
				e.printStackTrace();
				errorMsgs.add("新增留言失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/projDiscussion/listAllProjDiscByProjByMem.jsp");
				failureView.forward(req, res);
			}
		}
//		------------------------------會員end------------------------------------------------
		
//		// 來自listAllEmp.jsp的請求
//		if ("getOne_For_Update".equals(action)) {
//
//			List<String> errorMsgs = new LinkedList<String>();
//			// Store this set in the request scope, in case we need to
//			// send the ErrorPage view.
//			req.setAttribute("errorMsgs", errorMsgs);
//
//			try {
//				/*************************** 1.接收請求參數 ****************************************/
//				Integer proj_id = new Integer(req.getParameter("proj_id"));
//
//				/*************************** 2.開始查詢資料 ****************************************/
//				ProjectService projectSvc = new ProjectService();
//				ProjectVO projectVO = projectSvc.getOneProject(proj_id);
//
//				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
//				req.setAttribute("projectVO", projectVO); // 資料庫取出的projectVO物件,存入req
//				String url = "/front-end/project/update_proj_input.jsp";///
//				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 /project/update_project_input.jsp
//				successView.forward(req, res);
//
//				/*************************** 其他可能的錯誤處理 **********************************/
//			} catch (Exception e) {
//				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
//				RequestDispatcher failureView = req.getRequestDispatcher("listAllProjByMem.jsp");///
//				failureView.forward(req, res);
//			}
//		}
//
//		if ("update".equals(action)) { // 來自update_emp_input.jsp的請求
//			System.out.println("in");
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
//				String enameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,50}$";
//				if (proj_name == null || proj_name.trim().length() == 0) {
//					errorMsgs.add("認養專案名稱: 請勿空白");
//				} else if (!proj_name.trim().matches(enameReg)) {
//					errorMsgs.add("認養專案名稱: 只能是中、英文字母、數字和_ , 且長度必需在2到50之間");
//				}
//
//				Integer proj_state = new Integer(req.getParameter("proj_state").trim());
//
////				------------------處理圖片--------------------
//				InputStream inputStream = null; // input stream of the upload file
//				byte[] proj_main_pic = null;
//				// obtains the upload file part in this multipart request
//				Part filePart = req.getPart("proj_main_pic");
////				System.out.println("______________");
////				System.out.println(filePart);
////				System.out.println("______________");
//				// prints out some information for debugging
//				System.out.println(filePart.getName());
//				System.out.println(filePart.getSize());
//				System.out.println(filePart.getContentType());
//				// obtains input stream of the upload file
//				inputStream = filePart.getInputStream();
//				
//				if (inputStream.available() != 0) {
//					proj_main_pic = new byte[inputStream.available()];// 長度，資料流多少bytes
//					inputStream.read(proj_main_pic);
//					inputStream.close();
//				} else {
//					ProjectService projSvc = new ProjectService();
//					ProjectVO projectVO2 = projSvc.getOneProject(proj_id);
//					proj_main_pic = projectVO2.getProj_main_pic();
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
//				java.sql.Date expected_end_date = null;
//				try {
//					expected_end_date = java.sql.Date.valueOf(req.getParameter("expected_end_date").trim());// 要轉型
//				} catch (IllegalArgumentException e) {
//					expected_end_date = new java.sql.Date(System.currentTimeMillis());
//					errorMsgs.add("請輸入日期!");
//				}
//
//				System.out.println(req.getParameter("actual_end_date"));
//
//				java.sql.Date actual_end_date = null;
//				if (req.getParameter("actual_end_date").equals("null")) {
//					actual_end_date = null;
//				} else {
//					actual_end_date = java.sql.Date.valueOf(req.getParameter("actual_end_date"));
//				}
//				// 這個不會給小農改到，應當是在訂單總金額達標時自動生成
//
//				Integer proj_total_fund = new Integer(req.getParameter("proj_total_fund").trim());
//
//				String proj_intro = req.getParameter("proj_intro");
//				// 空白沒差 沒有要用proj_intro了
//
//				String proj_risk = req.getParameter("proj_risk").trim();
//				if (proj_abstract == null || proj_abstract.trim().length() == 0) {
//					errorMsgs.add("專案風險請勿空白");
//				}
//
//				Integer proj_total_count = new Integer(req.getParameter("proj_total_count").trim());
//
//				String proj_video = req.getParameter("proj_video");
//				// 空白沒差 沒有要用proj_video了
//
//				Integer mem_report_count = new Integer(req.getParameter("mem_report_count").trim());
//
//				Integer proj_pay = new Integer(req.getParameter("proj_pay").trim());
//
//				ProjectVO projectVO = new ProjectVO();
//
//				projectVO.setProj_id(proj_id);
//				projectVO.setProj_name(proj_name);
//				projectVO.setProj_state(proj_state);
//				projectVO.setProj_main_pic(proj_main_pic);
//				projectVO.setProj_abstract(proj_abstract);
//				projectVO.setProj_goal(proj_goal);
//				projectVO.setExpected_end_date(expected_end_date);
//				projectVO.setActual_end_date(actual_end_date);
//				projectVO.setProj_total_fund(proj_total_fund);
//				projectVO.setProj_intro(proj_intro);
//				projectVO.setProj_risk(proj_risk);
//				projectVO.setProj_total_count(proj_total_count);
//				projectVO.setProj_video(proj_video);
//				projectVO.setMem_report_count(mem_report_count);
//				projectVO.setProj_pay(proj_pay);
//
//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					req.setAttribute("projectVO", projectVO); // 含有輸入格式錯誤的projectVO物件,也存入req
//					RequestDispatcher failureView = req.getRequestDispatcher("listAllProjByFmem.jsp");
//					failureView.forward(req, res);
//					return; // 程式中斷
//				}
//				System.out.println("fail");
//				/*************************** 2.開始修改資料 *****************************************/
//				ProjectService projSvc = new ProjectService();
//				// 控制起驗證完拿到的碎片，new領班，交給領班去組合。
//				// 領班用自己的方法去組合將碎片放入一個ProjectVO物件，物件再交給工人去施工更新 的動作，然後領班會再回傳一個projectVO物件回來
//				projectVO = projSvc.updateProjectDetail(proj_name, proj_state, proj_main_pic, proj_abstract, proj_goal,
//						expected_end_date, actual_end_date, proj_total_fund, proj_intro, proj_risk, proj_total_count,
//						proj_video, mem_report_count, proj_pay, proj_id);
//				System.out.println("updateProject完成");
//				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
//				ProjectVO projectVO1 = projSvc.getOneProject(proj_id);
//				req.setAttribute("projectVO", projectVO1); // 資料庫update成功後,正確的的projectVO物件,存入req
//				String url = "/front-end/project/listOneProjByFmem.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
//				successView.forward(req, res);
//				System.out.println("update out");
//				/*************************** 其他可能的錯誤處理 *************************************/
//			} catch (Exception e) {
//				errorMsgs.add("修改資料失敗:" + e.getMessage());
//				e.printStackTrace();
//				RequestDispatcher failureView = req.getRequestDispatcher("listAllProjByFmem.jsp");
//				failureView.forward(req, res);
//			}
//		}
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
//				ProjectService projSvc = new ProjectService();
//				projSvc.deleteProject(proj_id);
//
//				/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
//				String url = "listAllProjByMem.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
//				successView.forward(req, res);
//
//				/*************************** 其他可能的錯誤處理 **********************************/
//			} catch (Exception e) {
//				errorMsgs.add("刪除資料失敗:" + e.getMessage());
//				RequestDispatcher failureView = req.getRequestDispatcher("listAllProjByMem.jsp");
//				failureView.forward(req, res);
//			}
//		}
	}
}
