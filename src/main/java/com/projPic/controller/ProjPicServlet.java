package com.projPic.controller;

import java.io.*;
import java.sql.Date;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;

import org.apache.tomcat.util.http.fileupload.IOUtils;

import com.projPic.model.ProjPicService;
import com.projPic.model.ProjPicVO;
import com.project.model.ProjectService;
import com.project.model.ProjectVO;

@MultipartConfig
public class ProjPicServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

//		System.out.println("pic enter");

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action"); // 表單有用hidden name="action" value="getOne_For_Display"

//		System.out.println("pic enter action get");

//		System.out.println(req);
//		System.out.println(action);

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
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/project/listAllProj.jsp");
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
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/project/listAllProj.jsp");
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
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/project/listAllProj.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				for (int i = 0; i < projPicVO.size(); i++) {
					byte[] buffer = projPicVO.get(i).getProj_pic();
					String base64Image = Base64.getEncoder().encodeToString(buffer);
					projPicVO.get(i).setBase64Image(base64Image);
					System.out.println("圖片轉換成功");
				}
				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("projPicVO", projPicVO); // 資料庫取出的projPicVO物件,存入req
				String url = "/front-end/project/listOneProj.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/project/listAllProj.jsp");
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
				String url = "/front-end/projPic/update_projPic_input.jsp";///
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 /projPic/update_projPic_input.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/project/listAllProj.jsp");///
				failureView.forward(req, res);
			}
		}

		if ("update".equals(action)) { // 來自update_emp_input.jsp的請求
// 只有單一更新的功能 可能還是寫交易控制比較好
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/

				Integer proj_id = new Integer(req.getParameter("proj_id").trim());
				
//				------------------處理圖片--------------------
				InputStream inputStream = null; // input stream of the upload file
				byte[] proj_pic = null;
				// obtains the upload file part in this multipart request
				Part filePart = req.getPart("proj_pic");
				if (filePart != null) {
					// prints out some information for debugging
					System.out.println(filePart.getName());
					System.out.println(filePart.getSize());
					System.out.println(filePart.getContentType());
					// obtains input stream of the upload file
					inputStream = filePart.getInputStream();
					proj_pic = new byte[inputStream.available()];// 長度，資料流多少bytes
				}
//				------------------處理圖片--------------------					

				ProjPicVO projPicVO = new ProjPicVO();
				
				projPicVO.setProj_id(proj_id);
				projPicVO.setProj_pic(proj_pic);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("projPicVO", projPicVO); // 含有輸入格式錯誤的projPicVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/project/listAllProj.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				ProjPicService projSvc = new ProjPicService();
				// 控制起驗證完拿到的碎片，new領班，交給領班去組合。
				// 領班用自己的方法去組合將碎片放入一個ProjPicVO物件，物件再交給工人去施工更新 的動作，然後領班會再回傳一個projPicVO物件回來
				projPicVO = projSvc.updateProjPic(proj_id,proj_pic);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("projPicVO", projPicVO); // 資料庫update成功後,正確的的projPicVO物件,存入req
				String url = "/front-end/projPic/listOneProjPic.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/project/listAllProj.jsp");
				failureView.forward(req, res);
			}
		}


		/* ======================衧霈寫的insert============================= */
		if ("insert".equals(action)) { // 來自addEmp.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/

				Integer proj_id = new Integer(req.getParameter("proj_id").trim());

				Collection<Part> parts = req.getParts();
				for (Part part : parts) {
					String filename = getFileNameFromPart(part); // 方法寫在此頁最下面
					if (filename != null && part.getContentType() != null) {

						// 額外測試 InputStream 與 byte[] (幫將來model的VO預作準備)
						// Java SQL
						// ------- -----------------
						// byte[] BLOB (longblob)
						// String CLOB (longtext)
//						InputStream in = part.getInputStream();
//						byte[] buf = new byte[in.available()];//陣列存著
//						in.read(buf);
//						in.close();
//						out.println("buffer length: " + buf.length);

						InputStream in = part.getInputStream();

						byte[] proj_pic = null;
						if (in.available() != 0) {
							proj_pic = new byte[in.available()];
							in.read(proj_pic);
							in.close();
						} else {
							errorMsgs.add("請上傳圖片");
						}

						ProjPicVO projPicVO = new ProjPicVO();
						projPicVO.setProj_id(proj_id);
						projPicVO.setProj_pic(proj_pic);

						// Send the use back to the form, if there were errors
						if (!errorMsgs.isEmpty()) {
							req.setAttribute("projPicVO", projPicVO); // 含有輸入格式錯誤的projPicVO物件,也存入req
							RequestDispatcher failureView = req.getRequestDispatcher("/project/listAllProj.jsp");
							failureView.forward(req, res);
							return;
						}

						/*************************** 2.開始新增資料 ***************************************/
						ProjPicService projpicSvc = new ProjPicService();
						// 控制器驗證完拿到的碎片，new領班，交給領班去組合。
						// 領班用自己的方法去組合將碎片放入一個ProjPicVO物件，物件再交給工人去施工新增的動作，然後領班會再回傳一個projPicVO物件回來
						projPicVO = projpicSvc.addProjPic(proj_id, proj_pic);

					}

				} // 迭代結束
				
				
				
				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/

				ProjectService projectSvc = new ProjectService();
				ProjectVO projectVO = projectSvc.getOneProject(proj_id);
				req.setAttribute("projectVO", projectVO);
				String url = "/front-end/projPerk/listAllPerkByFmem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);
				System.out.println("good in pic");

				/*************************** 其他可能的錯誤處理 **********************************/

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				e.printStackTrace();
				RequestDispatcher failureView = req.getRequestDispatcher("/project/listAllProj.jsp");
				failureView.forward(req, res);
			}
		}
		/* ======================衧霈寫的insert============================= */

//================0206聖凱寫的insert==========================================/		
//		if ("insert".equals(action)) { // 來自addEmp.jsp的請求
//			System.out.println("pic insert enter");
//			List<String> errorMsgs = new LinkedList<String>();
//			// Store this set in the request scope, in case we need to
//			// send the ErrorPage view.
//			req.setAttribute("errorMsgs", errorMsgs);
//			System.out.println("pic1");
//			try {
//				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
//				Integer proj_id = new Integer(req.getParameter("proj_id").trim());
//
//				String[] picList = { "proj_pic1", "proj_pic2", "proj_pic3", "proj_pic4", "proj_pic5", "proj_pic6",
//						"proj_pic7", "proj_pic8" };
//
//				System.out.println("pic2");
//				for (int i = 0; i < picList.length; i++) {
////				------------------處理圖片--------------------
//					InputStream inputStream = null; // input stream of the upload file
//					byte[] proj_pic = null;
//					// obtains the upload file part in this multipart request
//					Part filePart = req.getPart(picList[i]);
//					if (filePart != null) {
//						// prints out some information for debugging
////					System.out.println(filePart.getName());
////					System.out.println(filePart.getSize());
////					System.out.println(filePart.getContentType());
//						// obtains input stream of the upload file
//						inputStream = filePart.getInputStream();
//						proj_pic = new byte[inputStream.available()];// 長度，資料流多少bytes
//						inputStream.read(proj_pic);
//						inputStream.close();
//					}
////				------------------處理圖片--------------------			
//
//					if (proj_pic.length > 0) {
//
//						ProjPicVO projPicVO = new ProjPicVO();
//						projPicVO.setProj_id(proj_id);
//						projPicVO.setProj_pic(proj_pic);
//
//						// Send the use back to the form, if there were errors
//						if (!errorMsgs.isEmpty()) {
//
//							req.setAttribute("projPicVO", projPicVO); // 含有輸入格式錯誤的projPicVO物件,也存入req
//							RequestDispatcher failureView = req.getRequestDispatcher("/front-end/project/listAllProj.jsp");
//							failureView.forward(req, res);
//							return;
//						}
//
//						/*************************** 2.開始新增資料 ***************************************/
//						ProjPicService projSvc = new ProjPicService();
//						// 控制器驗證完拿到的碎片，new領班，交給領班去組合。
//						// 領班用自己的方法去組合將碎片放入一個ProjPicVO物件，物件再交給工人去施工新增的動作，然後領班會再回傳一個projPicVO物件回來
//						projPicVO = projSvc.addProjPic(proj_id, proj_pic);
//					}
//				}
//
//				System.out.println("pic3");
//				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
//				ProjectService projectSvc = new ProjectService();
//				ProjectVO projectVO = projectSvc.getOneProject(proj_id);
//				req.setAttribute("projectVO", projectVO);
//				String url = "/front-end/project/listOneProj.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
//				successView.forward(req, res);
//				System.out.println("good in pic");
//				/*************************** 其他可能的錯誤處理 **********************************/
//			} catch (Exception e) {
//				System.out.println("error4 in pic");
//				e.printStackTrace();
//				errorMsgs.add(e.getMessage());
//				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/project/listAllProj.jsp");
//				failureView.forward(req, res);
//			}
//		}
//================0206聖凱寫的insert==========================================/		


		if ("delete".equals(action)) { // 來自listAllEmp.jsp
			System.out.println("delete in");
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ***************************************/
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
				};
				System.out.println("proj_id get "+proj_id);
				
				Integer proj_pic_id = new Integer(req.getParameter("proj_pic_id"));

				/*************************** 2.開始刪除資料 ***************************************/
				ProjPicService projSvc = new ProjPicService();
				projSvc.deleteProjPic(proj_pic_id);
				
				ProjectService projectSvc = new ProjectService();
				ProjectVO projectVO = projectSvc.getOneProject(proj_id);
				System.out.println("proj_id get again"+projectVO.getProj_id());
				
				/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
				req.setAttribute("projectVO", projectVO); 
				String url = "/front-end/projPic/update_proj_pic_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
				System.out.println("delete done");

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/projPic/update_proj_pic_input.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("getAllPic_For_Display_ByFmem".equals(action)) {
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

//				String str2 = req.getParameter("f_mem_id");
//				System.out.println(str2);
//				if (str2 == null || (str2.trim()).length() == 0) {
//					System.out.println(str2);
//					errorMsgs.add("請輸入小農編號");
//					System.out.println(str2);
//				}
//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/project/listOneProjByFmem.jsp");
//					failureView.forward(req, res);
//					return;// 程式中斷
//				}

//				Integer f_mem_id = null;
//				try {
//					f_mem_id = new Integer(str2);
//				} catch (Exception e) {
//					errorMsgs.add("小農編號格式不正確");
//				}
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
//				req.setAttribute("f_mem_id", f_mem_id);
				String url = "/front-end/projPic/update_proj_pic_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 perkoverview.jsp
				successView.forward(req, res);
				System.out.println("去小農/front-end/projPic/update_proj_pic_input.jsp成功");
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

				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/project/listOneProjByFmem.jsp");
				failureView.forward(req, res);

				System.out.println("getAllPic_For_Display_ByFmem error in final");
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