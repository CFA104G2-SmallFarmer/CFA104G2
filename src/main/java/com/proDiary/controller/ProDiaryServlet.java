package com.proDiary.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.mem.model.MemService;
import com.mem.model.MemVO;
import com.proDiary.model.ProDiaryService;
import com.proDiary.model.ProDiaryVO;
import com.projPerk.model.ProjPerkService;
import com.projPerk.model.ProjPerkVO;
import com.project.model.ProjectService;
import com.project.model.ProjectVO;



@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class ProDiaryServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action"); // 表單有用hidden name="action" value="getOne_For_Display"

		if ("update".equals(action)) { // 來自update_emp_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			System.out.println("update in");

			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
Integer dir_id = new Integer(req.getParameter("dir_id").trim());
				
				java.sql.Date dir_upload_date = null;
				try {
					dir_upload_date = java.sql.Date.valueOf(req.getParameter("dir_upload_date").trim());
				} catch (IllegalArgumentException e) {

					dir_upload_date = null;
					errorMsgs.add("請輸入日期!");
				}
				
				String dir_procedure = req.getParameter("dir_procedure").trim();
				
				String dir_product = req.getParameter("dir_product").trim();
				if (dir_product == null || dir_product.trim().length() == 0) {
					errorMsgs.add("產品/種苗：請勿空白");
				}
				
				String dir_emoji = req.getParameter("dir_emoji").trim();
				
				
				String dir_notes = req.getParameter("dir_notes").trim();
				Integer dir_upload_state = new Integer(req.getParameter("dir_upload_state").trim());
			
				/* 這邊是為了拿到原本的圖，設給一個變數p */
				ProDiaryService proDiarySvc2 = new ProDiaryService();
				ProDiaryVO proDiaryVO2 = proDiarySvc2.getOneProDiary(dir_id);
				byte[] p = proDiaryVO2.getDir_pic();
				Integer proj_id = proDiaryVO2.getProj_id();

				/* 圖片區 */

				Part part = req.getPart("dir_pic");

				String filename = getFileNameFromPart(part); // 方法寫在此頁最下面

				byte[] dir_pic = null;
				if (filename != null && part.getContentType() != null) { // 如果有傳圖片

					InputStream in = req.getPart("dir_pic").getInputStream();
					
					if (in.available() != 0) {
						dir_pic = new byte[in.available()];
						in.read(dir_pic);
						in.close();
					} 

					
					ProDiaryVO proDiaryVO = new ProDiaryVO();
					proDiaryVO.setDir_id(dir_id);
					proDiaryVO.setProj_id(proj_id);////
					proDiaryVO.setDir_pic(dir_pic);
					proDiaryVO.setDir_upload_date(dir_upload_date);
					proDiaryVO.setDir_procedure(dir_procedure);
					proDiaryVO.setDir_product(dir_product);
					proDiaryVO.setDir_emoji(dir_emoji);
					proDiaryVO.setDir_notes(dir_notes);
					proDiaryVO.setDir_upload_state(dir_upload_state);
					


					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {

						req.setAttribute("proDiaryVO", proDiaryVO); // 含有輸入格式錯誤的projPerkVO物件,也存入req

						System.out.println("有錯");

						RequestDispatcher failureView = req.getRequestDispatcher("/front-end/proDiary/update_proDiary_input_ByFmem.jsp");
						failureView.forward(req, res);
						return;
					}
					System.out.println("沒錯");
					/*************************** 2.開始修改資料 *****************************************/
					ProDiaryService proDiarySvc = new ProDiaryService();
					// 控制起驗證完拿到的碎片，new領班，交給領班去組合。
					// 領班用自己的方法去組合將碎片放入一個ProjPerkVO物件，物件再交給工人去施工更新 的動作，然後領班會再回傳一個projPerkVO物件回來
					proDiaryVO = proDiarySvc.updateProDiary(dir_upload_date, dir_procedure, dir_product, dir_emoji,
							dir_notes, dir_upload_state, dir_pic,dir_id);
					System.out.println("updateProDiary完成");
					/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
					ProjectService projectSvc = new ProjectService();
					ProjectVO projectVO = projectSvc.getOneProject(proj_id);
					req.setAttribute("projectVO", projectVO);
					String url = "/front-end/proDiary/listAllProDiaryByFmem.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
					successView.forward(req, res);

					System.out.println("update out");

				} else {
					// 如果沒更新圖片
					System.out.println("//如果沒更新圖片");
					System.out.println(req.getPart("dir_pic").getInputStream());
					
					ProDiaryVO proDiaryVO = new ProDiaryVO();
					proDiaryVO.setDir_id(dir_id);
					proDiaryVO.setProj_id(proj_id);////
					
					proDiaryVO.setDir_pic(p);// set原本的圖
					
					proDiaryVO.setDir_upload_date(dir_upload_date);
					proDiaryVO.setDir_procedure(dir_procedure);
					proDiaryVO.setDir_product(dir_product);
					proDiaryVO.setDir_emoji(dir_emoji);
					proDiaryVO.setDir_notes(dir_notes);
					proDiaryVO.setDir_upload_state(dir_upload_state);

					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {

						req.setAttribute("proDiaryVO", proDiaryVO); // 含有輸入格式錯誤的projPerkVO物件,也存入req

						System.out.println("有錯");
						RequestDispatcher failureView = req.getRequestDispatcher("/front-end/proDiary/update_proDiary_input_ByFmem.jsp");
						failureView.forward(req, res);
						return;
					}
					System.out.println("沒錯");
					/*************************** 2.開始修改資料 *****************************************/
					ProDiaryService proDiarySvc = new ProDiaryService();
					// 控制起驗證完拿到的碎片，new領班，交給領班去組合。
					// 領班用自己的方法去組合將碎片放入一個ProjPerkVO物件，物件再交給工人去施工更新 的動作，然後領班會再回傳一個projPerkVO物件回來
					proDiaryVO = proDiarySvc.updateProDiary(dir_upload_date, dir_procedure, dir_product, dir_emoji,
							dir_notes, dir_upload_state, p,dir_id);
					System.out.println("updateProDiary_without_pic完成");
					/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
					ProjectService projectSvc = new ProjectService();
					ProjectVO projectVO = projectSvc.getOneProject(proj_id);
					req.setAttribute("projectVO", projectVO);
					String url = "/front-end/proDiary/listAllProDiaryByFmem.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
					successView.forward(req, res);
					System.out.println("updateProDiary_without_pic成功轉交");

				}

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/proDiary/update_proDiary_input_ByFmem.jsp");
				failureView.forward(req, res);
				System.out.println("101112");
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
				
				java.sql.Date dir_upload_date = null;
				try {
					dir_upload_date = java.sql.Date.valueOf(req.getParameter("dir_upload_date").trim());
				} catch (IllegalArgumentException e) {

					dir_upload_date = null;
					errorMsgs.add("請輸入日期!");
				}
				
				String dir_procedure = req.getParameter("dir_procedure").trim();
				
				String dir_product = req.getParameter("dir_product").trim();
				if (dir_product == null || dir_product.trim().length() == 0) {
					errorMsgs.add("產品/種苗：請勿空白");
				}
				
				String dir_emoji = req.getParameter("dir_emoji").trim();
				
				
				String dir_notes = req.getParameter("dir_notes").trim();
				Integer dir_upload_state = new Integer(req.getParameter("dir_upload_state").trim());
			

				InputStream in = req.getPart("dir_pic").getInputStream();
				byte[] dir_pic = null;
				if (in.available() != 0) {
					dir_pic = new byte[in.available()];
					in.read(dir_pic);
					in.close();
				} else {
					errorMsgs.add("請上傳圖片");
				}


				ProDiaryVO proDiaryVO = new ProDiaryVO();
				proDiaryVO.setProj_id(proj_id);
				proDiaryVO.setDir_pic(dir_pic);
				proDiaryVO.setDir_upload_date(dir_upload_date);
				proDiaryVO.setDir_procedure(dir_procedure);
				proDiaryVO.setDir_product(dir_product);
				proDiaryVO.setDir_emoji(dir_emoji);
				proDiaryVO.setDir_notes(dir_notes);
				proDiaryVO.setDir_upload_state(dir_upload_state);


				ProjectService projectSvc = new ProjectService();
				ProjectVO projectVO1 = projectSvc.getOneProject(proj_id);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("proDiaryVO", proDiaryVO); // 含有輸入格式錯誤的projPerkVO物件,也存入req
					req.setAttribute("projectVO", projectVO1);// 含有輸入格式錯誤的projectVO物件,也存入req

					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/proDiary/addProDiaryByFmem.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
				ProDiaryService proDiarySvc = new ProDiaryService();
				// 控制器驗證完拿到的碎片，new領班，交給領班去組合。
				// 領班用自己的方法去組合將碎片放入一個ProjPerkVO物件，物件再交給工人去施工新增的動作，然後領班會再回傳一個projPerkVO物件回來
				ProDiaryVO proDiaryVO2 = proDiarySvc.addProDiary(proj_id, dir_upload_date, dir_procedure, dir_product, dir_emoji, dir_notes,
						dir_upload_state, dir_pic);

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
//				List<ProDiaryVO> proDiaryVO3 = proDiarySvc.getAll(proj_id);
//				
//				req.setAttribute("proDiaryVO", proDiaryVO3);
				req.setAttribute("projectVO", projectVO1);

				String url = "/front-end/proDiary/listAllProDiaryByFmem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/proDiary/addProDiaryByFmem.jsp");
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
				Integer dir_id = new Integer(req.getParameter("dir_id"));
				System.out.println(dir_id);
//				Integer proj_id = new Integer(req.getParameter("proj_id").trim());
//				System.out.println(proj_id);
				ProDiaryService proDiarySvc2 = new ProDiaryService();
				ProDiaryVO proDiaryVO2 = proDiarySvc2.getOneProDiary(dir_id);
				Integer proj_id1=proDiaryVO2.getProj_id();
				System.out.println("proj_id="+proj_id1);
				
				ProjectService projectSvc = new ProjectService();
				ProjectVO projectVO = projectSvc.getOneProject(proj_id1);
				req.setAttribute("projectVO", projectVO);
				
				
				/*************************** 2.開始刪除資料 ***************************************/
				
				proDiarySvc2.deleteProDiary(dir_id);
				
				
				System.out.println("剛刪完"+dir_id);
				

				/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
				String url = "/front-end/proDiary/listAllProDiaryByFmem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
				System.out.println("delete out");
				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				System.out.println("delete error");
				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/proDiary/listAllProDiaryByFmem.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		
		if ("insert_ProDiary_from_listOneProjByFmem".equals(action)) {

			Integer proj_id = new Integer(req.getParameter("proj_id").trim());
			System.out.println(proj_id);
			ProjectService projectSvc = new ProjectService();
			ProjectVO projectVO = projectSvc.getOneProject(proj_id);
			req.setAttribute("projectVO", projectVO);

			String url = "/front-end/proDiary/addProDiaryByFmem.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
			successView.forward(req, res);
			System.out.println("insert_ProDiary_from_listOneProjByFmem done");

		}
		
		if ("go_to_update_ProDiary_from_listOneProjByFmem".equals(action)) {

			Integer dir_id = new Integer(req.getParameter("dir_id").trim());
			System.out.println("dir_id="+dir_id);
			
			ProDiaryService proDiarySvc2 = new ProDiaryService();
			ProDiaryVO proDiaryVO2 = proDiarySvc2.getOneProDiary(dir_id);
			
//			ProjectService projectSvc = new ProjectService();
//			ProjectVO projectVO = projectSvc.getOneProject(dir_id);
			req.setAttribute("proDiaryVO", proDiaryVO2);

			String url = "/front-end/proDiary/update_proDiary_input_ByFmem.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
			successView.forward(req, res);
			System.out.println("go_to_update_ProDiary_from_listOneProjByFmem done");

		}

		
		if ("change_dir_upload_state_to_1_from_listOneProjByFmem".equals(action)) {

			Integer dir_id = new Integer(req.getParameter("dir_id").trim());
			System.out.println("dir_id="+dir_id);
			
			ProDiaryService proDiarySvc2 = new ProDiaryService();
			ProDiaryVO proDiaryVO2 = proDiarySvc2.getOneProDiary(dir_id);

			
			Integer proj_id = proDiaryVO2.getProj_id();
			java.sql.Date dir_upload_date = proDiaryVO2.getDir_upload_date();
			String dir_procedure = proDiaryVO2.getDir_procedure();
			String dir_product = proDiaryVO2.getDir_product() ;

			String dir_emoji = proDiaryVO2.getDir_emoji();
			String dir_notes = proDiaryVO2.getDir_notes();
			Integer dir_upload_state = 1;/////////
			byte[] p = proDiaryVO2.getDir_pic();
			
			
			// 如果沒更新圖片
			System.out.println("//如果沒更新圖片");

			
			ProDiaryVO proDiaryVO = new ProDiaryVO();
			proDiaryVO.setDir_id(dir_id);
			proDiaryVO.setProj_id(proj_id);////
			
			proDiaryVO.setDir_pic(p);// set原本的圖
			
			proDiaryVO.setDir_upload_date(dir_upload_date);
			proDiaryVO.setDir_procedure(dir_procedure);
			proDiaryVO.setDir_product(dir_product);
			proDiaryVO.setDir_emoji(dir_emoji);
			proDiaryVO.setDir_notes(dir_notes);
			proDiaryVO.setDir_upload_state(dir_upload_state);

			// Send the use back to the form, if there were errors
			System.out.println("沒錯");
			/*************************** 2.開始修改資料 *****************************************/
			ProDiaryService proDiarySvc = new ProDiaryService();
			// 控制起驗證完拿到的碎片，new領班，交給領班去組合。
			// 領班用自己的方法去組合將碎片放入一個ProjPerkVO物件，物件再交給工人去施工更新 的動作，然後領班會再回傳一個projPerkVO物件回來
			proDiaryVO = proDiarySvc.updateProDiary(dir_upload_date, dir_procedure, dir_product, dir_emoji,
					dir_notes, dir_upload_state, p,dir_id);
			System.out.println("change_dir_upload_state_to_1完成");
			/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
			ProjectService projectSvc = new ProjectService();
			ProjectVO projectVO = projectSvc.getOneProject(proj_id);
			req.setAttribute("projectVO", projectVO);
			String url = "/front-end/proDiary/listAllProDiaryByFmem.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
			successView.forward(req, res);
			System.out.println("change_dir_upload_state_to_1成功轉交");

		}

		
		if ("go_to_listAll_ProDiary_from_listOneProjByFmem".equals(action)) {

			Integer proj_id = new Integer(req.getParameter("proj_id").trim());
			System.out.println(proj_id);
			ProjectService projectSvc = new ProjectService();
			ProjectVO projectVO = projectSvc.getOneProject(proj_id);
			req.setAttribute("projectVO", projectVO);

			String url = "/front-end/proDiary/listAllProDiaryByFmem.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
			successView.forward(req, res);
			System.out.println("go_to_listAll_ProDiary_from_listOneProjByFmem done");

		}
		
		if ("go_to_listAll_ProDiary_from_listOneProjByMem".equals(action)) {

			Integer proj_id = new Integer(req.getParameter("proj_id").trim());
			System.out.println(proj_id);
			ProjectService projectSvc = new ProjectService();
			ProjectVO projectVO = projectSvc.getOneProject(proj_id);
			req.setAttribute("projectVO", projectVO);

			String url = "/front-end/proDiary/listAllProDiaryByMem.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
			successView.forward(req, res);
			System.out.println("go_to_listAll_ProDiary_from_listOneProjByMem done");

		}
		
		if ("go_to_listAll_ProDiary_ByDate_from_listOneProjByMem".equals(action)) {

			Integer proj_id = new Integer(req.getParameter("proj_id").trim());
			System.out.println(proj_id);
//			Integer dir_upload_date = new Integer(req.getParameter("dir_upload_date").trim());
			java.sql.Date dir_upload_date = null;
			try {
				dir_upload_date = java.sql.Date.valueOf(req.getParameter("dir_upload_date").trim());
			} catch (IllegalArgumentException e) {

				dir_upload_date = null;
//				errorMsgs.add("請輸入日期!");
			}
			req.setAttribute("dir_upload_date", dir_upload_date);
			
			ProjectService projectSvc = new ProjectService();
			ProjectVO projectVO = projectSvc.getOneProject(proj_id);
			req.setAttribute("projectVO", projectVO);

			String url = "/front-end/proDiary/listAllProDiary_Bydate_ByMem.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
			successView.forward(req, res);
			System.out.println("go_to_listAll_ProDiary_ByDate_from_listOneProjByMem done");

		}
		
		if ("go_to_listAll_ProDiary_ByDate_from_listOneProjByFmem".equals(action)) {

			Integer proj_id = new Integer(req.getParameter("proj_id").trim());
			System.out.println(proj_id);
//			Integer dir_upload_date = new Integer(req.getParameter("dir_upload_date").trim());
			java.sql.Date dir_upload_date = null;
			try {
				dir_upload_date = java.sql.Date.valueOf(req.getParameter("dir_upload_date").trim());
			} catch (IllegalArgumentException e) {

				dir_upload_date = null;
//				errorMsgs.add("請輸入日期!");
			}
			req.setAttribute("dir_upload_date", dir_upload_date);
			
			ProjectService projectSvc = new ProjectService();
			ProjectVO projectVO = projectSvc.getOneProject(proj_id);
			req.setAttribute("projectVO", projectVO);

			String url = "/front-end/proDiary/listAllProDiary_Bydate_ByFmem.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
			successView.forward(req, res);
			System.out.println("go_to_listAll_ProDiary_ByDate_from_listOneProjByFmem done");

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
