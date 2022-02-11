package com.administrator.model;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import oracle.security.o5logon.a;

@WebServlet("/AdminServiceTest")
public class AdminServiceTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}
       
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		Date date2 = java.sql.Date.valueOf("2022-02-20");
		
		AdministratorService administratorService = new AdministratorService();
//		AdministratorVO administratorVO1 = administratorService.updateAdmin(6, 3, "dd", "dd", 0, "dd", "dd", "dddd", 123, "dd", "dd", "dd", date2, date2, null);
		administratorService.deleteAdmin(6);
		AdministratorVO administratorVO3 = administratorService.getOneAdmin(2);
		List<AdministratorVO> list = administratorService.getAll();
		
		out.println("<HTML>");
		out.println("<HEAD><TITLE></TITLE></HEAD>");
		out.println("<BODY>");
		out.println("Hello");
//		out.println(announcementVO1+"<br>");
//		out.println(announcementVO2+"<br>");
//		out.println(administratorVO1+"<br>");
		out.println(administratorVO3+"<br>");
		for(AdministratorVO administratorVO : list) {
			out.println(administratorVO+"<br>");
		}
		

		
		out.println("</BODY></HTML>");
		
	}

}
