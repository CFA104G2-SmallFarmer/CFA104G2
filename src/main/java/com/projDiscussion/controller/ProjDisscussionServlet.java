package com.projDiscussion.controller;

import com.projDiscussion.model.ProjDiscussionService;
import com.projDiscussion.model.ProjDiscussionVO;
import com.project.model.ProjectService;
import com.project.model.ProjectVO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

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
	}
}
