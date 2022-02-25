package com.projPerk.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;

import com.mem.model.MemService;
import com.mem.model.MemVO;
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

		/* <一般會員的> */
		// 來自listOneProj.jsp的請求，傳入proj_id後，透過ProjPerkService的getAll列出旗下所有perk
		if ("getAllPerk_For_Display_ByMem".equals(action)) {
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
//					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/project/listOneProj.jsp");
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
//					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/project/listOneProj.jsp");
//					failureView.forward(req, res);
//					return;// 程式中斷
//				}
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
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/project/listOneProjByMem.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}
				System.out.println("3");
				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("projectVO", projectVO); // 資料庫取出的projPerkVO物件,存入req
//				req.setAttribute("projPerkVO", projPerkVO); // 資料庫取出的projPerkVO物件,存入req

				String url = "/front-end/projPerk/listAllPerkByMem.jsp";
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

				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/project/listOneProjByMem.jsp");
				failureView.forward(req, res);

				System.out.println("Mem error in final");
			}
		}

		
// 來自listOneProj.jsp的請求，傳入proj_id後，透過ProjPerkService的getAll列出旗下所有perk
		if ("getAllPerk_For_Display_ByFmem".equals(action)) {
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
//					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/project/listOneProjByFmem.jsp");
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
//					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/project/listOneProjByFmem.jsp");
//					failureView.forward(req, res);
//					return;// 程式中斷
//				}

				String str2 = req.getParameter("f_mem_id");
				System.out.println(str2);
				if (str2 == null || (str2.trim()).length() == 0) {
					System.out.println(str2);
					errorMsgs.add("請輸入小農編號");
					System.out.println(str2);
				}
//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/project/listOneProjByFmem.jsp");
//					failureView.forward(req, res);
//					return;// 程式中斷
//				}

				Integer f_mem_id = null;
				try {
					f_mem_id = new Integer(str2);
				} catch (Exception e) {
					errorMsgs.add("小農編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/project/listOneProjByFmem.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}
				System.out.println("2");
				/*************************** 2.開始查詢資料 *****************************************/
				ProjectService projectSvc = new ProjectService();
				ProjectVO projectVO = projectSvc.getOneProject(proj_id);

//		ProjPerkService projPerkSvc = new ProjPerkService();
//		List<ProjPerkVO> projPerkVO = projPerkSvc.getAll(proj_id);
//		
//		for(int i=0; i<projPerkVO.size(); i++) {
//			System.out.println(projPerkVO.get(i));
//		}

				if (projectVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/project/listOneProjByFmem.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("projectVO", projectVO); // 資料庫取出的projPerkVO物件,存入req
//		req.setAttribute("projPerkVO", projPerkVO); // 資料庫取出的projPerkVO物件,存入req
				req.setAttribute("f_mem_id", f_mem_id);
				String url = "/front-end/projPerk/listAllPerkByFmem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 perkoverview.jsp
				successView.forward(req, res);
				System.out.println("去小農listAllPerkByFmem.jsp成功");
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

				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/project/listOneProjByFmem.jsp");
				failureView.forward(req, res);

				System.out.println("getAllPerk_For_Display_ByFmem error in final");
			}
		}
//////////////////////////////

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

				perk_abbr_name=perk_abbr_name.replace("\r\n", "<br>");
//				perk_abbr_name=perk_abbr_name.replace("\r", "<br>");
//				perk_abbr_name=perk_abbr_name.replace("<", "&lt;");
//				perk_abbr_name=perk_abbr_name.replace(">", "&gt;");
//				perk_abbr_name=perk_abbr_name.replace("\"", "&quot;");
//				perk_abbr_name=perk_abbr_name.replace("\'", "&quot;");
				
				
				
				String perk_intro = req.getParameter("perk_intro").trim();
				if (perk_intro == null || perk_intro.trim().length() == 0) {
					errorMsgs.add("方案回饋內容請勿空白");
				}
				
				perk_intro=perk_intro.replace("\r\n", "<br>");
//				perk_intro=perk_intro.replace("\r", "<br>");
//				perk_intro=perk_intro.replace("<", "<br>");
//				perk_intro=perk_intro.replace(">", "<br>");
//				perk_intro=perk_intro.replace("\"", "<br>");
//				perk_intro=perk_intro.replace("\'", "<br>");
				
				
				
				
				// ---------------金額驗證----------------//
				Integer perk_fund = null;
				try {
					perk_fund = new Integer(req.getParameter("perk_fund").trim());
				} catch (NumberFormatException e) {
					perk_fund = 0;
					errorMsgs.add("方案金額請填數字.");
				}

				// ---------------方案限量份數驗證----------------//
				Integer perk_limited = null;
				try {
					perk_limited = new Integer(req.getParameter("perk_limited").trim());
				} catch (NumberFormatException e) {
					perk_limited = 0;
					errorMsgs.add("方案限量份數請填數字.");
				}
				// -------------------------------------//

				java.sql.Date perk_ship_date = null;
				try {
					perk_ship_date = java.sql.Date.valueOf(req.getParameter("perk_ship_date").trim());
				} catch (IllegalArgumentException e) {
//					perk_ship_date = new java.sql.Date(System.currentTimeMillis());
					perk_ship_date = null;
					errorMsgs.add("請輸入日期!");
				}

				String perk_ship_area = req.getParameter("perk_ship_area").trim();

				/* 這邊是為了拿到原本的圖，設給一個變數p */
				ProjPerkService projPerkSvc2 = new ProjPerkService();
				ProjPerkVO projPerkVO2 = projPerkSvc2.getOneProjPerk(perk_id);
				byte[] p = projPerkVO2.getPerk_pic();

//				System.out.println("p.toString()"+p.toString());

				/* 圖片區 */

//老師
//				Collection<Part> parts = req.getParts();
//				for (Part part : parts) {
//					String filename = getFileNameFromPart(part); // 方法寫在此頁最下面
//					if (filename != null && part.getContentType() != null) {

//              伺服器端程式設計要點:
//				檢查Part是普通表單控制元件還是文字上傳控制元件,判斷content-type的值是否是null
//				檢查檔名是否為null,為空則表示未選擇上傳檔案,判斷檔名是否是””

				Part part = req.getPart("perk_pic");

				String filename = getFileNameFromPart(part); // 方法寫在此頁最下面

				byte[] perk_pic = null;
				if (filename != null && part.getContentType() != null) { // 如果有傳圖片

					InputStream in = req.getPart("perk_pic").getInputStream();

					if (in.available() != 0) {
						perk_pic = new byte[in.available()];
						in.read(perk_pic);
						in.close();
					}
					ProjPerkVO projPerkVO = new ProjPerkVO();
					projPerkVO.setPerk_id(perk_id);
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

						ProjectService projectSvc = new ProjectService();
						ProjectVO projectVO = projectSvc.getOneProject(proj_id);
						req.setAttribute("projectVO", projectVO);

						RequestDispatcher failureView = req.getRequestDispatcher("/front-end/projPerk/update_perk_input.jsp");
						failureView.forward(req, res);
						return;
					}
					System.out.println("fail");
					/*************************** 2.開始修改資料 *****************************************/
					ProjPerkService projPerkSvc = new ProjPerkService();
					// 控制起驗證完拿到的碎片，new領班，交給領班去組合。
					// 領班用自己的方法去組合將碎片放入一個ProjPerkVO物件，物件再交給工人去施工更新 的動作，然後領班會再回傳一個projPerkVO物件回來
					projPerkVO = projPerkSvc.updateProjPerk(perk_pic, perk_intro, perk_fund, perk_limited,
							perk_ship_date, perk_ship_area, perk_abbr_name, perk_id);
					System.out.println("updateProjPerk完成");
					/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
					ProjectService projectSvc = new ProjectService();
					ProjectVO projectVO = projectSvc.getOneProject(proj_id);
					req.setAttribute("projectVO", projectVO);
					String url = "/front-end/projPerk/listAllPerkByFmem.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
					successView.forward(req, res);

					System.out.println("update out");

				} else {
					// 如果沒更新圖片
					System.out.println("//如果沒更新圖片");
					System.out.println(req.getPart("perk_pic").getInputStream());
					ProjPerkVO projPerkVO = new ProjPerkVO();
					projPerkVO.setPerk_id(perk_id);
					projPerkVO.setProj_id(proj_id);

					projPerkVO.setPerk_pic(p); // set原本的圖

					projPerkVO.setPerk_intro(perk_intro);
					projPerkVO.setPerk_fund(perk_fund);
					projPerkVO.setPerk_limited(perk_limited);
					projPerkVO.setPerk_ship_date(perk_ship_date);
					projPerkVO.setPerk_ship_area(perk_ship_area);
					projPerkVO.setPerk_abbr_name(perk_abbr_name);

					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {
//					
						req.setAttribute("projPerkVO", projPerkVO); // 含有輸入格式錯誤的projPerkVO物件,也存入req

						ProjectService projectSvc = new ProjectService();
						ProjectVO projectVO = projectSvc.getOneProject(proj_id);
						req.setAttribute("projectVO", projectVO);

						RequestDispatcher failureView = req.getRequestDispatcher("/front-end/projPerk/update_perk_input.jsp");
						failureView.forward(req, res);
						return;
					}
					System.out.println("fail");
					/*************************** 2.開始修改資料 *****************************************/
					ProjPerkService projPerkSvc = new ProjPerkService();
					// 控制起驗證完拿到的碎片，new領班，交給領班去組合。
					// 領班用自己的方法去組合將碎片放入一個ProjPerkVO物件，物件再交給工人去施工更新 的動作，然後領班會再回傳一個projPerkVO物件回來

					// 注意這裡圖片是 p
					projPerkVO = projPerkSvc.updateProjPerk(p, perk_intro, perk_fund, perk_limited, perk_ship_date,
							perk_ship_area, perk_abbr_name, perk_id);
					System.out.println("updateProjPerk_without_pic Controller成功");
					/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
					ProjectService projectSvc = new ProjectService();
					ProjectVO projectVO = projectSvc.getOneProject(proj_id);
					req.setAttribute("projectVO", projectVO);
					String url = "/front-end/projPerk/listAllPerkByFmem.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
					successView.forward(req, res);
//					res.sendRedirect("listAllPerkByFmem.jsp");
					System.out.println("updateProjPerk_without_pic成功轉交");

				}

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/projPerk/listAllPerkByFmem.jsp");
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
				/*************************** 1.接收請求參數 ****************************************/
				Integer proj_id = new Integer(req.getParameter("proj_id").trim());
				Integer perk_id = new Integer(req.getParameter("perk_id"));
				

				/*************************** 2.開始查詢資料 ****************************************/
				ProjPerkService projPerkSvc = new ProjPerkService();
				ProjPerkVO projPerkVO = projPerkSvc.getOneProjPerk(perk_id);
				String perk_intro1=projPerkVO.getPerk_intro();
				String perk_intro2=perk_intro1.replace("<br>", "\r\n");
				

				projPerkVO.setPerk_intro(perk_intro2);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				ProjectService projectSvc = new ProjectService();
				ProjectVO projectVO = projectSvc.getOneProject(proj_id);
				req.setAttribute("projectVO", projectVO);
				req.setAttribute("projPerkVO", projPerkVO); // 資料庫取出的empVO物件,存入req
				String url = "/front-end/projPerk/update_perk_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				System.out.println("getOnePerk_For_Update error occured");
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/projPerk/listAllPerkByFmem.jsp");
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
				System.out.println("12111111");
				String perk_abbr_name = req.getParameter("perk_abbr_name").trim();
				if (perk_abbr_name == null || perk_abbr_name.trim().length() == 0) {
					errorMsgs.add("方案簡稱請勿空白");
				}

				perk_abbr_name=perk_abbr_name.replace("\r\n", "<br>");
//				perk_abbr_name=perk_abbr_name.replace("\r", "<br>");
//				perk_abbr_name=perk_abbr_name.replace("<br><br>", "<br>");				
//				perk_abbr_name=perk_abbr_name.replace("<", "&lt;");
//				perk_abbr_name=perk_abbr_name.replace(">", "&gt;");
//				perk_abbr_name=perk_abbr_name.replace("\"", "&quot;");
//				perk_abbr_name=perk_abbr_name.replace("\'", "&quot;");
				
				
				
				InputStream in = req.getPart("perk_pic").getInputStream();
				byte[] perk_pic = null;
				if (in.available() != 0) {
					perk_pic = new byte[in.available()];
					in.read(perk_pic);
					in.close();
				} else {
					errorMsgs.add("請上傳圖片");
				}

				String perk_intro = req.getParameter("perk_intro").trim();
				if (perk_intro == null || perk_intro.trim().length() == 0) {
					errorMsgs.add("方案回饋內容請勿空白");
				}
				
				perk_intro=perk_intro.replace("\r\n", "<br>");
//				perk_intro=perk_intro.replace("\r", "<br>");
//				perk_intro=perk_intro.replace("<", "&lt;");
//				perk_intro=perk_intro.replace(">", "&gt;");
//				perk_intro=perk_intro.replace("\"", "&quot;");
//				perk_intro=perk_intro.replace("\'", "&quot;");
				
				
				
				// ---------------金額驗證----------------//
				Integer perk_fund = null;
				try {
					perk_fund = new Integer(req.getParameter("perk_fund").trim());
				} catch (NumberFormatException e) {
					perk_fund = 0;
					errorMsgs.add("方案金額請填數字.");
				}
				// -------------------------------------//

				// ---------------方案限量份數驗證----------------//
//				String perk_limited_string = req.getParameter("perk_limited").trim();
//				String perk_limited_Reg = "^[0-9]*$s";
//				if (perk_limited_string == null || perk_limited_string.trim().length() == 0) {
//					errorMsgs.add("方案限量份數請勿空白");
//				}else if (!perk_limited_string.matches(perk_limited_Reg)) { // 以下練習正則(規)表示式(regular-expression)
//					errorMsgs.add("方案限量份數: 只能是數字");
//				}
//				int perk_limited = Integer.parseInt(perk_limited_string);
				// -------------------------------------//

				// ---------------方案限量份數驗證----------------//
				Integer perk_limited = null;
				try {
					perk_limited = new Integer(req.getParameter("perk_limited").trim());
				} catch (NumberFormatException e) {
					perk_limited = 0;
					errorMsgs.add("方案限量份數請填數字.");
				}
				// -------------------------------------//

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

				ProjectService projectSvc = new ProjectService();
				ProjectVO projectVO1 = projectSvc.getOneProject(proj_id);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("projPerkVO", projPerkVO); // 含有輸入格式錯誤的projPerkVO物件,也存入req
					req.setAttribute("projectVO", projectVO1);// 含有輸入格式錯誤的projectVO物件,也存入req

					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/projPerk/addPerk.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
				ProjPerkService projSvc = new ProjPerkService();
				// 控制器驗證完拿到的碎片，new領班，交給領班去組合。
				// 領班用自己的方法去組合將碎片放入一個ProjPerkVO物件，物件再交給工人去施工新增的動作，然後領班會再回傳一個projPerkVO物件回來
				projPerkVO = projSvc.addProjPerk(proj_id, perk_pic, perk_intro, perk_fund, perk_limited, perk_ship_date,
						perk_ship_area, perk_abbr_name);

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				req.setAttribute("proPerkVO", projPerkVO);
				req.setAttribute("projectVO", projectVO1);

				String url = "/front-end/projPerk/listAllPerkByFmem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/projPerk/addPerk.jsp");
				failureView.forward(req, res);
			}
		}

		if ("insert_from_listAllPerkByFmem".equals(action)) {

			Integer proj_id = new Integer(req.getParameter("proj_id").trim());
			System.out.println(proj_id);
			ProjectService projectSvc = new ProjectService();
			ProjectVO projectVO = projectSvc.getOneProject(proj_id);
			req.setAttribute("projectVO", projectVO);

			String url = "/front-end/projPerk/addPerk.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
			successView.forward(req, res);
			System.out.println("insert_from_listAllPerkByFmem done");

		}
		/* 0210新增 */
		if ("go_back_to_listOneProjByFmem".equals(action)) {

			Integer proj_id = new Integer(req.getParameter("proj_id").trim());
			System.out.println(proj_id);
			ProjectService projectSvc = new ProjectService();
			ProjectVO projectVO = projectSvc.getOneProject(proj_id);
			req.setAttribute("projectVO", projectVO);

			String url = "/front-end/project/listOneProjByFmem.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
			successView.forward(req, res);
			System.out.println("go_back_to_listOneProjByFmem done");

		}
		
		/* 0212 18:00新增 */
		if ("go_to_addOrderByMem".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
try {
//			Integer mem_id = new Integer(req.getParameter("mem_id").trim());
//			System.out.println(mem_id);
			Integer proj_id = new Integer(req.getParameter("proj_id").trim());
			System.out.println(proj_id);
			Integer perk_id = new Integer(req.getParameter("perk_id").trim());
			System.out.println(perk_id);
			
			ProjectService projectSvc = new ProjectService();
			ProjectVO projectVO1 = projectSvc.getOneProject(proj_id);
//			req.setAttribute("projectVO", projectVO1);
			
			ProjPerkService projPerkSvc = new ProjPerkService();  
			ProjPerkVO projPerkVO = projPerkSvc.getOneProjPerk(perk_id);  
//			req.setAttribute("projPerkVO",projPerkVO);  
			
		 HttpSession session=req.getSession();
	       session.setAttribute("projectVO", projectVO1);
	       session.setAttribute("projPerkVO",projPerkVO);  
		//   Integer f_mem_id = fMemVO.getF_mem_id();
			
//			MemService memSvc3 = new MemService();  
//			MemVO memVO3 = memSvc3.getOneMem(mem_id);  
//			req.setAttribute("memVO",memVO3); 

			String url = "/front-end/projOrder/addOrderByMem.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
			successView.forward(req, res);
			System.out.println("go_to_addOrderByMem.jsp done");
			/*************************** 其他可能的錯誤處理 **********************************/
		} catch (Exception e) {
			errorMsgs.add(e.getMessage());
			RequestDispatcher failureView = req.getRequestDispatcher("/front-end/project/listOneProjByMem.jsp");
			failureView.forward(req, res);
		}
			
			
		}

		if ("delete".equals(action)) { // 來自listAllEmp.jsp
			System.out.println("delete in");
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ***************************************/
				Integer perk_id = new Integer(req.getParameter("perk_id"));
				System.out.println(perk_id);
				Integer proj_id = new Integer(req.getParameter("proj_id").trim());
				System.out.println(proj_id);

				/*************************** 2.開始刪除資料 ***************************************/
				ProjPerkService projPerkSvc = new ProjPerkService();
				projPerkSvc.deleteProjPerk(perk_id);
				ProjectService projectSvc = new ProjectService();
				ProjectVO projectVO = projectSvc.getOneProject(proj_id);
				req.setAttribute("projectVO", projectVO);

				/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
				String url = "/front-end/projPerk/listAllPerkByFmem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
				System.out.println("delete out");
				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				System.out.println("delete error");
				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/projPerk/listAllPerkByFmem.jsp");
				failureView.forward(req, res);
			}
		}
	}

	// 取出上傳的檔案名稱 (因為API未提供method,所以必須自行撰寫)
	public String getFileNameFromPart(Part part) {
		String header = part.getHeader("content-disposition");
		System.out.println("header=" + header); // 測試用
		String filename = new File(header.substring(header.lastIndexOf("=") + 2, header.length() - 1)).getName();
		System.out.println("filename=" + filename); // 測試用
		if (filename.length() == 0) {
			return null;
		}
		return filename;
	}
}