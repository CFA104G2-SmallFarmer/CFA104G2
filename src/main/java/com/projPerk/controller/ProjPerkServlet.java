package com.projPerk.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import com.projPerk.model.ProjPerkService;
import com.projPerk.model.ProjPerkVO;
import com.project.model.ProjectService;
import com.project.model.ProjectVO;

public class ProjPerkServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action"); // 表單有用hidden name="action" value="getOne_For_Display"

		// 來自listOneProj.jsp的請求，傳入proj_id後，透過ProjPerkService的getAll列出旗下所有perk
		if ("getAllPerk_For_Display".equals(action)) {
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
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/project/listOneProj.jsp");
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
					RequestDispatcher failureView = req.getRequestDispatcher("/project/listOneProj.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}
				System.out.println("2");
				/*************************** 2.開始查詢資料 *****************************************/
				ProjectService projectSvc = new ProjectService();
				ProjectVO projectVO = projectSvc.getOneProject(proj_id);
				
				ProjPerkService projPerkSvc = new ProjPerkService();
				List<ProjPerkVO> projPerkVO = projPerkSvc.getAll(proj_id);
				
				for(int i=0; i<projPerkVO.size(); i++) {
					System.out.println(projPerkVO.get(i));
				}
				
				if (projPerkVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/project/listOneProj.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}
				System.out.println("3");
				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("projectVO", projectVO); // 資料庫取出的projPerkVO物件,存入req
				req.setAttribute("projPerkVO", projPerkVO); // 資料庫取出的projPerkVO物件,存入req
				String url = "perkoverview.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 perkoverview.jsp
				successView.forward(req, res);
				System.out.println("成功");
				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				System.out.println("error in final");
				errorMsgs.add("無法取得資料:" + e.getMessage());
				
				String str = req.getParameter("proj_id");
				Integer proj_id = null;
				proj_id = new Integer(str);
				ProjectService projectSvc = new ProjectService();
				ProjectVO projectVO = projectSvc.getOneProject(proj_id);
				req.setAttribute("projectVO", projectVO); 
				
				RequestDispatcher failureView = req.getRequestDispatcher("/project/listOneProj.jsp");
				failureView.forward(req, res);
				
				System.out.println("error in final");
			}
		}

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
//				ProjPerkService projPerkSvc = new ProjPerkService();
//				ProjPerkVO projPerkVO = projPerkSvc.getOneProjPerk(proj_id);
//
//				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
//				req.setAttribute("projPerkVO", projPerkVO); // 資料庫取出的projPerkVO物件,存入req
//				String url = "/emp/update_emp_input.jsp";/// ***我還沒改
//				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
//				successView.forward(req, res);
//
//				/*************************** 其他可能的錯誤處理 **********************************/
//			} catch (Exception e) {
//				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
//				RequestDispatcher failureView = req.getRequestDispatcher("/emp/listAllEmp.jsp");/// ***我還沒改
//				failureView.forward(req, res);
//			}
//		}
//
//		if ("update".equals(action)) { // 來自update_emp_input.jsp的請求
//
//			List<String> errorMsgs = new LinkedList<String>();
//			// Store this set in the request scope, in case we need to
//			// send the ErrorPage view.
//			req.setAttribute("errorMsgs", errorMsgs);
//
//			try {
//				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
//				Integer proj_id = new Integer(req.getParameter("proj_id").trim());
//
//				String ename = req.getParameter("ename");
//				String enameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
//				if (ename == null || ename.trim().length() == 0) {
//					errorMsgs.add("員工姓名: 請勿空白");
//				} else if (!ename.trim().matches(enameReg)) { // 以下練習正則(規)表示式(regular-expression)
//					errorMsgs.add("員工姓名: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
//				}
//
//				String job = req.getParameter("job").trim();
//				if (job == null || job.trim().length() == 0) {
//					errorMsgs.add("職位請勿空白");
//				}
//
//				java.sql.Date hiredate = null;
//				try {
//					hiredate = java.sql.Date.valueOf(req.getParameter("hiredate").trim());// 要轉型
//				} catch (IllegalArgumentException e) {
//					hiredate = new java.sql.Date(System.currentTimeMillis());
//					errorMsgs.add("請輸入日期!");
//				}
//
//				Double sal = null;
//				try {
//					sal = new Double(req.getParameter("sal").trim());
//				} catch (NumberFormatException e) {
//					sal = 0.0;
//					errorMsgs.add("薪水請填數字.");
//				}
//
//				Double comm = null;
//				try {
//					comm = new Double(req.getParameter("comm").trim());
//				} catch (NumberFormatException e) {
//					comm = 0.0;
//					errorMsgs.add("獎金請填數字.");
//				}
//
//				Integer deptno = new Integer(req.getParameter("deptno").trim());
//
//				ProjPerkVO projPerkVO = new ProjPerkVO();
//				projPerkVO.setEmpno(proj_id);
//				projPerkVO.setEname(ename);
//				projPerkVO.setJob(job);
//				projPerkVO.setHiredate(hiredate);
//				projPerkVO.setSal(sal);
//				projPerkVO.setComm(comm);
//				projPerkVO.setDeptno(deptno);
//
//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					req.setAttribute("projPerkVO", projPerkVO); // 含有輸入格式錯誤的projPerkVO物件,也存入req
//					RequestDispatcher failureView = req.getRequestDispatcher("/emp/update_emp_input.jsp");
//					failureView.forward(req, res);
//					return; // 程式中斷
//				}
//
//				/*************************** 2.開始修改資料 *****************************************/
//				ProjPerkService projSvc = new ProjPerkService();
//				// 控制起驗證完拿到的碎片，new領班，交給領班去組合。
//				// 領班用自己的方法去組合將碎片放入一個ProjPerkVO物件，物件再交給工人去施工更新 的動作，然後領班會再回傳一個projPerkVO物件回來
//				projPerkVO = projSvc.updateEmp(proj_id, ename, job, hiredate, sal, comm, deptno);
//
//				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
//				req.setAttribute("projPerkVO", projPerkVO); // 資料庫update成功後,正確的的projPerkVO物件,存入req
//				String url = "/emp/listOneEmp.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
//				successView.forward(req, res);
//
//				/*************************** 其他可能的錯誤處理 *************************************/
//			} catch (Exception e) {
//				errorMsgs.add("修改資料失敗:" + e.getMessage());
//				RequestDispatcher failureView = req.getRequestDispatcher("/emp/update_emp_input.jsp");
//				failureView.forward(req, res);
//			}
//		}
//
//		if ("insert".equals(action)) { // 來自addEmp.jsp的請求
//
//			List<String> errorMsgs = new LinkedList<String>();
//			// Store this set in the request scope, in case we need to
//			// send the ErrorPage view.
//			req.setAttribute("errorMsgs", errorMsgs);
//
//			try {
//				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
//				String ename = req.getParameter("ename");
//				String enameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
//				if (ename == null || ename.trim().length() == 0) {
//					errorMsgs.add("員工姓名: 請勿空白");
//				} else if (!ename.trim().matches(enameReg)) { // 以下練習正則(規)表示式(regular-expression)
//					errorMsgs.add("員工姓名: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
//				}
//
//				String job = req.getParameter("job").trim();
//				if (job == null || job.trim().length() == 0) {
//					errorMsgs.add("職位請勿空白");
//				}
//
//				java.sql.Date hiredate = null;
//				try {
//					hiredate = java.sql.Date.valueOf(req.getParameter("hiredate").trim());
//				} catch (IllegalArgumentException e) {
//					hiredate = new java.sql.Date(System.currentTimeMillis());
//					errorMsgs.add("請輸入日期!");
//				}
//
//				Double sal = null;
//				try {
//					sal = new Double(req.getParameter("sal").trim());
//				} catch (NumberFormatException e) {
//					sal = 0.0;
//					errorMsgs.add("薪水請填數字.");
//				}
//
//				Double comm = null;
//				try {
//					comm = new Double(req.getParameter("comm").trim());
//				} catch (NumberFormatException e) {
//					comm = 0.0;
//					errorMsgs.add("獎金請填數字.");
//				}
//
//				Integer deptno = new Integer(req.getParameter("deptno").trim());
//
//				ProjPerkVO projPerkVO = new ProjPerkVO();
//				projPerkVO.setEname(ename);
//				projPerkVO.setJob(job);
//				projPerkVO.setHiredate(hiredate);
//				projPerkVO.setSal(sal);
//				projPerkVO.setComm(comm);
//				projPerkVO.setDeptno(deptno);
//
//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					req.setAttribute("projPerkVO", projPerkVO); // 含有輸入格式錯誤的projPerkVO物件,也存入req
//					RequestDispatcher failureView = req.getRequestDispatcher("/emp/addEmp.jsp");
//					failureView.forward(req, res);
//					return;
//				}
//
//				/*************************** 2.開始新增資料 ***************************************/
//				ProjPerkService projSvc = new ProjPerkService();
//				// 控制器驗證完拿到的碎片，new領班，交給領班去組合。
//				// 領班用自己的方法去組合將碎片放入一個ProjPerkVO物件，物件再交給工人去施工新增的動作，然後領班會再回傳一個projPerkVO物件回來
//				projPerkVO = projSvc.addEmp(ename, job, hiredate, sal, comm, deptno);
//
//				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
//				String url = "/emp/listAllEmp.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
//				successView.forward(req, res);
//
//				/*************************** 其他可能的錯誤處理 **********************************/
//			} catch (Exception e) {
//				errorMsgs.add(e.getMessage());
//				RequestDispatcher failureView = req.getRequestDispatcher("/emp/addEmp.jsp");
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
//				ProjPerkService projSvc = new ProjPerkService();
//				projSvc.deleteProjPerk(proj_id);
//
//				/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
//				String url = "/emp/listAllEmp.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
//				successView.forward(req, res);
//
//				/*************************** 其他可能的錯誤處理 **********************************/
//			} catch (Exception e) {
//				errorMsgs.add("刪除資料失敗:" + e.getMessage());
//				RequestDispatcher failureView = req.getRequestDispatcher("/emp/listAllEmp.jsp");
//				failureView.forward(req, res);
//			}
//		}
	}
}
