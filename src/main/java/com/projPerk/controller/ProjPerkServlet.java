package com.projPerk.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;


import com.projPerk.model.ProjPerkService;
import com.projPerk.model.ProjPerkVO;
import com.project.model.ProjectService;
import com.project.model.ProjectVO;

@MultipartConfig
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
					RequestDispatcher failureView = req.getRequestDispatcher("/project/listOneProj.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}
				System.out.println("3");
				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("projectVO", projectVO); // 資料庫取出的projPerkVO物件,存入req
//				req.setAttribute("projPerkVO", projPerkVO); // 資料庫取出的projPerkVO物件,存入req

				String url = "listAllPerk.jsp";
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



		if ("update".equals(action)) { // 來自update_emp_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			System.out.println("update in");

			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
				Integer proj_id = new Integer(req.getParameter("proj_id").trim());
				Integer perk_id = new Integer(req.getParameter("perk_id").trim());
				
				String perk_abbr_name = req.getParameter("perk_abbr_name").trim();
				if (perk_abbr_name == null || perk_abbr_name.trim().length() == 0) {
					errorMsgs.add("方案簡稱請勿空白");
				}
				
				String pic_name=req.getParameter("perk_pic");
				System.out.println(pic_name);
				
//				String perk_pic = req.getParameter("perk_pic").trim(); 
				
				InputStream in = req.getPart("perk_pic").getInputStream();
				byte[] perk_pic = null;
				if(in.available()!=0) {
					perk_pic = new byte[in.available()];
					in.read(perk_pic);
					in.close();
					}else {
				
						errorMsgs.add("請上傳圖片");
					}
				
				String perk_intro = req.getParameter("perk_intro").trim();
				if (perk_intro == null || perk_intro.trim().length() == 0) {
					errorMsgs.add("方案回饋內容請勿空白");
				}
				//---------------金額驗證----------------//
				Integer perk_fund = null;
				try {
					perk_fund = new Integer(req.getParameter("perk_fund").trim());
				} catch (NumberFormatException e) {
					perk_fund = 0;
					errorMsgs.add("方案金額請填數字.");
				}
				//-------------------------------------//

			
				//---------------方案限量份數驗證----------------//
//				String perk_limited_string = req.getParameter("perk_limited").trim();
//				String perk_limited_Reg = "^[0-9]*$s";
//				if (perk_limited_string == null || perk_limited_string.trim().length() == 0) {
//					errorMsgs.add("方案限量份數請勿空白");
//				}else if (!perk_limited_string.matches(perk_limited_Reg)) { // 以下練習正則(規)表示式(regular-expression)
//					errorMsgs.add("方案限量份數: 只能是數字");
//				}
//				int perk_limited = Integer.parseInt(perk_limited_string);
				//-------------------------------------//
				
				//---------------方案限量份數驗證----------------//
				Integer perk_limited = null;
				try {
					perk_limited = new Integer(req.getParameter("perk_limited").trim());
				} catch (NumberFormatException e) {
					perk_limited = 0;
					errorMsgs.add("方案限量份數請填數字.");
				}
				//-------------------------------------//
			
				java.sql.Date perk_ship_date = null;
				try {
					perk_ship_date = java.sql.Date.valueOf(req.getParameter("perk_ship_date").trim());
				} catch (IllegalArgumentException e) {
//					perk_ship_date = new java.sql.Date(System.currentTimeMillis());
					perk_ship_date = null;
					errorMsgs.add("請輸入日期!");
				}
				
				
				String perk_ship_area = req.getParameter("perk_ship_area").trim();


				ProjPerkVO projPerkVO = new ProjPerkVO();
				projPerkVO.setProj_id(perk_id);
				projPerkVO.setPerk_pic(perk_pic);
				projPerkVO.setPerk_intro(perk_intro);
				projPerkVO.setPerk_fund(perk_fund);
				projPerkVO.setPerk_limited(perk_limited);
				projPerkVO.setPerk_ship_date(perk_ship_date);
				projPerkVO.setPerk_ship_area(perk_ship_area);
				projPerkVO.setPerk_abbr_name(perk_abbr_name);
			

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					ProjPerkService projPerkSvc = new ProjPerkService();
					ProjPerkVO projPerkVO1 = projPerkSvc.getOneProjPerk(perk_id);
					projPerkVO1.setProj_id(perk_id);
					projPerkVO1.setPerk_intro(perk_intro);
					projPerkVO1.setPerk_fund(perk_fund);
					projPerkVO1.setPerk_limited(perk_limited);
					projPerkVO1.setPerk_ship_date(perk_ship_date);
					projPerkVO1.setPerk_ship_area(perk_ship_area);
					projPerkVO1.setPerk_abbr_name(perk_abbr_name);
					
					
					req.setAttribute("projPerkVO", projPerkVO1); // 含有輸入格式錯誤的projPerkVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/projPerk/update_perk_input.jsp");
					failureView.forward(req, res);
					return;
				}
				System.out.println("fail");
				/*************************** 2.開始修改資料 *****************************************/
				ProjPerkService projPerkSvc = new ProjPerkService();
				// 控制起驗證完拿到的碎片，new領班，交給領班去組合。
				// 領班用自己的方法去組合將碎片放入一個ProjPerkVO物件，物件再交給工人去施工更新 的動作，然後領班會再回傳一個projPerkVO物件回來
				projPerkVO = projPerkSvc.updateProjPerk( perk_pic, perk_intro, perk_fund, perk_limited, perk_ship_date,perk_ship_area,perk_abbr_name,perk_id);
				
				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/		
				ProjectService projectSvc = new ProjectService();
				ProjectVO projectVO = projectSvc.getOneProject(proj_id);
				req.setAttribute("projectVO", projectVO);
				String url = "/projPerk/listAllPerkByFMem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);
//				res.sendRedirect("listAllPerkByFMem.jsp");
				System.out.println("update out");
				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/projPerk/listAllPerkByFMem.jsp");
				failureView.forward(req, res);
				System.out.println("101112");
			}
		}
		
		
//
		
		if ("getOnePerk_For_Update".equals(action)) { // 來自listAllEmp.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			System.out.println("getOnePerk_For_Update in");
			try {
				/***************************1.接收請求參數****************************************/
				Integer proj_id = new Integer(req.getParameter("proj_id").trim());
				Integer perk_id = new Integer(req.getParameter("perk_id"));
				
				/***************************2.開始查詢資料****************************************/
				ProjPerkService projPerkSvc = new ProjPerkService();
				ProjPerkVO projPerkVO = projPerkSvc.getOneProjPerk(perk_id);
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				ProjectService projectSvc = new ProjectService();
				ProjectVO projectVO = projectSvc.getOneProject(proj_id);
				req.setAttribute("projectVO", projectVO);
				req.setAttribute("projPerkVO", projPerkVO);         // 資料庫取出的empVO物件,存入req
				String url ="update_perk_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				System.out.println("getOnePerk_For_Update error occured");
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("listAllPerkByFMem.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		
		
		if ("insert".equals(action)) { // 來自addEmp.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
				Integer proj_id = new Integer(req.getParameter("proj_id").trim());
				
				String perk_abbr_name = req.getParameter("perk_abbr_name").trim();
				if (perk_abbr_name == null || perk_abbr_name.trim().length() == 0) {
					errorMsgs.add("方案簡稱請勿空白");
				}
		
				InputStream in = req.getPart("perk_pic").getInputStream();
				byte[] perk_pic = null;
				if(in.available()!=0) {
					perk_pic = new byte[in.available()];
					in.read(perk_pic);
					in.close();
					}else {
						errorMsgs.add("請上傳圖片");
					}
				
				String perk_intro = req.getParameter("perk_intro").trim();
				if (perk_intro == null || perk_intro.trim().length() == 0) {
					errorMsgs.add("方案回饋內容請勿空白");
				}
				//---------------金額驗證----------------//
				Integer perk_fund = null;
				try {
					perk_fund = new Integer(req.getParameter("perk_fund").trim());
				} catch (NumberFormatException e) {
					perk_fund = 0;
					errorMsgs.add("方案金額請填數字.");
				}
				//-------------------------------------//

			
				//---------------方案限量份數驗證----------------//
//				String perk_limited_string = req.getParameter("perk_limited").trim();
//				String perk_limited_Reg = "^[0-9]*$s";
//				if (perk_limited_string == null || perk_limited_string.trim().length() == 0) {
//					errorMsgs.add("方案限量份數請勿空白");
//				}else if (!perk_limited_string.matches(perk_limited_Reg)) { // 以下練習正則(規)表示式(regular-expression)
//					errorMsgs.add("方案限量份數: 只能是數字");
//				}
//				int perk_limited = Integer.parseInt(perk_limited_string);
				//-------------------------------------//
				
				//---------------方案限量份數驗證----------------//
				Integer perk_limited = null;
				try {
					perk_limited = new Integer(req.getParameter("perk_limited").trim());
				} catch (NumberFormatException e) {
					perk_limited = 0;
					errorMsgs.add("方案限量份數請填數字.");
				}
				//-------------------------------------//
			
				java.sql.Date perk_ship_date = null;
				try {
					perk_ship_date = java.sql.Date.valueOf(req.getParameter("perk_ship_date").trim());
				} catch (IllegalArgumentException e) {
//					perk_ship_date = new java.sql.Date(System.currentTimeMillis());
					perk_ship_date = null;
					errorMsgs.add("請輸入日期!");
				}
				
				
				String perk_ship_area = req.getParameter("perk_ship_area").trim();


				ProjPerkVO projPerkVO = new ProjPerkVO();
				projPerkVO.setProj_id(proj_id);
				projPerkVO.setPerk_pic(perk_pic);
				projPerkVO.setPerk_intro(perk_intro);
				projPerkVO.setPerk_fund(perk_fund);
				projPerkVO.setPerk_limited(perk_limited);
				projPerkVO.setPerk_ship_date(perk_ship_date);
				projPerkVO.setPerk_ship_area(perk_ship_area);
				projPerkVO.setPerk_abbr_name(perk_abbr_name);
			

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("projPerkVO", projPerkVO); // 含有輸入格式錯誤的projPerkVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/projPerk/addPerk.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
				ProjPerkService projSvc = new ProjPerkService();
				// 控制器驗證完拿到的碎片，new領班，交給領班去組合。
				// 領班用自己的方法去組合將碎片放入一個ProjPerkVO物件，物件再交給工人去施工新增的動作，然後領班會再回傳一個projPerkVO物件回來
				projPerkVO = projSvc.addProjPerk(proj_id, perk_pic, perk_intro, perk_fund, perk_limited, perk_ship_date,perk_ship_area,perk_abbr_name);

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				ProjectService projectSvc = new ProjectService();
				ProjectVO projectVO = projectSvc.getOneProject(proj_id);
				req.setAttribute("projectVO", projectVO);
				
				String url = "/projPerk/listAllPerkByFMem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/projPerk/addPerk.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("insert_from_listAllPerkByFMem".equals(action)) {

			Integer proj_id = new Integer(req.getParameter("proj_id").trim());
			System.out.println(proj_id);
			ProjectService projectSvc = new ProjectService();
			ProjectVO projectVO = projectSvc.getOneProject(proj_id);
			req.setAttribute("projectVO", projectVO);

			String url = "/projPerk/addPerk.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
			successView.forward(req, res);
			System.out.println("insert_from_listAllPerkByFMem done");

		}
		
		
		

		if ("delete".equals(action)) { // 來自listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ***************************************/
				Integer perk_id = new Integer(req.getParameter("perk_id"));
				
				
				/*************************** 2.開始刪除資料 ***************************************/
				ProjPerkService projPerkSvc = new ProjPerkService();
				projPerkSvc.deleteProjPerk(perk_id);

				/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
				String url = "listAllPerkByFMem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("listAllPerkByFMem.jsp");
				failureView.forward(req, res);
			}
		}
	}
}
