package com.projPic.controller;

import java.io.*;
import java.sql.Date;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import org.apache.tomcat.util.http.fileupload.IOUtils;

import com.projPic.model.ProjPicService;
import com.projPic.model.ProjPicVO;
import com.project.model.ProjectService;
import com.project.model.ProjectVO;

public class ProjPicServletInsert extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		System.out.println("pic enter");

		req.setCharacterEncoding("UTF-8");
//		String action = req.getParameter("action"); // 表單有用hidden name="action" value="getOne_For_Display"

		System.out.println("pic enter action get");

		System.out.println(req);
//		System.out.println(action);

		
//		if ("insert".equals(action)) { // 來自addEmp.jsp的請求
			System.out.println("pic insert enter");
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			System.out.println("pic1");
			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
				
				System.out.println(req.getParameter("proj_id"));
				
				Integer proj_id = new Integer(req.getParameter("proj_id").trim());
				
				System.out.println(proj_id);
				
				String[] picList = { "proj_pic1", "proj_pic2", "proj_pic3", "proj_pic4", "proj_pic5", "proj_pic6",
						"proj_pic7", "proj_pic8" };

				System.out.println("pic2");
				for (int i = 0; i < picList.length; i++) {
//				------------------處理圖片--------------------
					InputStream inputStream = null; // input stream of the upload file
					byte[] proj_pic = null;
					// obtains the upload file part in this multipart request
					Part filePart = req.getPart(picList[i]);
					if (filePart != null) {
						// prints out some information for debugging
//					System.out.println(filePart.getName());
//					System.out.println(filePart.getSize());
//					System.out.println(filePart.getContentType());
						// obtains input stream of the upload file
						inputStream = filePart.getInputStream();
						proj_pic = new byte[inputStream.available()];// 長度，資料流多少bytes
						inputStream.read(proj_pic);
						inputStream.close();
					}
//				------------------處理圖片--------------------			

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
					ProjPicService projSvc = new ProjPicService();
					// 控制器驗證完拿到的碎片，new領班，交給領班去組合。
					// 領班用自己的方法去組合將碎片放入一個ProjPicVO物件，物件再交給工人去施工新增的動作，然後領班會再回傳一個projPicVO物件回來
					projPicVO = projSvc.addProjPic(proj_id, proj_pic);

				}

				System.out.println("pic3");
				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				ProjectService projectSvc = new ProjectService();
				ProjectVO projectVO = projectSvc.getOneProject(proj_id);
				req.setAttribute("projectVO", projectVO);
				String url = "/project/listOneProj.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);
				System.out.println("good in pic");
				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				System.out.println("error4 in pic");
				e.printStackTrace();
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/project/listAllProj.jsp");
				failureView.forward(req, res);
			}
//		}

	}

}
