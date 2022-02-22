package com.announcement.model;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/AnnounceTest")
public class AnnounceTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		
		Date date2 = java.sql.Date.valueOf("2022-02-20");
		AnnouncementService announcementService = new AnnouncementService();
//		AnnouncementVO announcementVO1 = announcementService.addAnnounce(2, 3, date2, "JNDI測試", "JNDI測試");
//		AnnouncementVO announcementVO2 = announcementService.updateAnnounce(4, 2, 3, date2, "JNDI測試", "JNDI測試");
		announcementService.deleteAnnounce(5);
		AnnouncementVO announcementVO3 = announcementService.getOneAnnounce(2);
		List<AnnouncementVO> list = announcementService.getAll();
		
	
		out.println("<HTML>");
		out.println("<HEAD><TITLE></TITLE></HEAD>");
		out.println("<BODY>");
		out.println("Hello");
//		out.println(announcementVO1+"<br>");
//		out.println(announcementVO2+"<br>");
		out.println(announcementVO3+"<br>");
		out.println(list);
		

		
		out.println("</BODY></HTML>");
	}

}
