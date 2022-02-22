package com.adminTypeFuncList.model;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adminFunction.model.AdminFunctionVO;


@WebServlet("/ATFLTest")
public class ATFLTest extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		
		AdminTypeFuncListService adminTypeFuncListService = new AdminTypeFuncListService();
		
		adminTypeFuncListService.deleteAdminTypeFuncList(5, 5);
		
//		AdminTypeFuncListVO adminTypeFuncListVO = new AdminTypeFuncListVO();
//		adminTypeFuncListVO.setAdmin_func_id(9);
//		adminTypeFuncListVO.setAdmin_type_id(5);
//		
//		adminTypeFuncListDAO.insert(adminTypeFuncListVO);
//		List<AdminTypeFuncListVO> list = adminTypeFuncListDAO.getAll();
		List<AdminFunctionVO> list = adminTypeFuncListService.getOneTypeFuncList(2);
		List<AdminTypeFuncListVO> list3 = adminTypeFuncListService.getAll();
		
		
		
		
		
		out.println("<HTML>");
		out.println("<HEAD><TITLE></TITLE></HEAD>");
		out.println("<BODY>");
		out.println("Hello");
		for(AdminFunctionVO vo : list) {
			out.println(vo + "<br>" );
		}
		

		
		
		for(AdminTypeFuncListVO vo : list3) {
			out.println(vo + "<br>" );
		}
		
		
		
		
		
		out.println("</BODY></HTML>");
		
		
		
		
	}

}
