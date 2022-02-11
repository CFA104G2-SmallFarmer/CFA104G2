package com.adminType.model;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adminFunction.model.AdminFunctionVO;

@WebServlet("/AdminTypeTest")
public class AdminTypeTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		doPost(req, res);

	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		Date date = Date.valueOf("2022-02-02");
		
		AdminTypeService adminTypeService = new AdminTypeService();
		AdminTypeVO adminTypeVO = adminTypeService.getOneAdminType(1);
//		AdminTypeVO adminTypeVO3 = adminTypeService.updateAdminType(9, "測試類別三");
		adminTypeService.deleteAdminType(9);
		List<AdminTypeVO> list = adminTypeService.getAll();
		
		out.println("<HTML>");
		out.println("<HEAD><TITLE></TITLE></HEAD>");
		out.println("<BODY>");
		out.println("Hello "+date+"<br>");
		out.println(adminTypeVO+"<br>");
//		out.println(adminTypeVO3+"<br>");
		for(AdminTypeVO adminTypeVO2 : list) {
			out.println(adminTypeVO2+"<br>");
		}
		out.println("</BODY></HTML>");
		
		
		
		
	}

}
