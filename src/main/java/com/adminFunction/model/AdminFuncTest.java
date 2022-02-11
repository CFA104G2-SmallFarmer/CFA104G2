package com.adminFunction.model;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AdminFuncTest")
public class AdminFuncTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		Date date = Date.valueOf("2022-02-20");
		
		AdminFunctionService adminFunctionService = new AdminFunctionService();
		AdminFunctionVO adminFunctionVO = adminFunctionService.getOneAdminFunction(4);
//		AdminFunctionVO adminFunctionVO2 = adminFunctionService.addAdminFunction(11, "kkk", "kkk");
		adminFunctionService.deleteAdminFunction(11);
		List<AdminFunctionVO> list = adminFunctionService.getAll();
		
		out.println("<HTML>");
		out.println("<HEAD><TITLE></TITLE></HEAD>");
		out.println("<BODY>");
		out.println("Hello "+date+"<br>");
		out.println(adminFunctionVO+"<br>");
//		out.println(adminFunctionVO2+"<br>");
		for(AdminFunctionVO adminFunctionVO3 : list) {
			out.println(adminFunctionVO3+"<br>");
		}
		out.println("</BODY></HTML>");
		
	}

}
