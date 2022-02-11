package com.message.model;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/MessageTest")
public class MessageTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		
		Date date = java.sql.Date.valueOf("2022-02-02");
		
		MessageService messageService = new MessageService();
		
		MessageVO messageVO1 = messageService.updateMsg(10, 77002, 77003, date,"test", 1);
		MessageVO messageVO2 = messageService.getOneMsg(7);
		messageService.deleteMsg(2);
		List<MessageVO> list = messageService.getAll();
		
		out.println("<HTML>");
		out.println("<HEAD><TITLE></TITLE></HEAD>");
		out.println("<BODY>");
		out.println("Hello "+ date + "<br>");

		out.println(messageVO1+"<br>");
		out.println(messageVO2+"<br>");
		for(MessageVO vo : list) {
			out.println(vo+"<br>");
		}
		

		
		out.println("</BODY></HTML>");
		
	}

}
