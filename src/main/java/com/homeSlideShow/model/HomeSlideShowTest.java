package com.homeSlideShow.model;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/HomeSlideShowTest")
public class HomeSlideShowTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}
	
	

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		
		Date date = Date.valueOf("2022-02-02");
	
		HomeSlideShowService homeSlideShowService = new HomeSlideShowService();
		HomeSlideShowVO homeSlideShowVO1 = homeSlideShowService.updateHSS(3,3, null,"OO", date, 1, date, date);
		HomeSlideShowVO homeSlideShowVO = homeSlideShowService.getOneHSS(2);
		List<HomeSlideShowVO> list = homeSlideShowService.getAll();
		
		out.println("<HTML>");
		out.println("<HEAD><TITLE></TITLE></HEAD>");
		out.println("<BODY>");
		out.println("Hello "+date);
		out.println(homeSlideShowVO+"<br>");
		for(HomeSlideShowVO homeSlideShowVO2 : list) {
			out.println(homeSlideShowVO2+"<br>");
		}
		
		
		

		
		out.println("</BODY></HTML>");
		
		
		
	}
	
	public byte[] getPictureByteArray(String path) throws IOException {
		FileInputStream fis = new FileInputStream(path);
		byte[] buffer = new byte[fis.available()];
		fis.read(buffer);
		fis.close();
		return buffer;
	}

	public void readPicture(byte[] bytes) throws IOException {
		FileOutputStream fos = new FileOutputStream("images/tomcat2.gif");
		fos.write(bytes);
		fos.flush();
		fos.close();
	}

}
