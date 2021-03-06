package com.projPerk.model;

import java.io.*;
import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.sql.DataSource;

public class ProjPerkDBGifReader4 extends HttpServlet {

	Connection con;

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		res.setContentType("image/gif");
		ServletOutputStream out = res.getOutputStream();

		try {
			Statement stmt = con.createStatement();
			String id = req.getParameter("id").trim();
			ResultSet rs = stmt.executeQuery(
//				"SELECT IMAGE FROM PICTURES WHERE PID = " + req.getParameter("PID"));
			"SELECT PERK_PIC FROM PROJ_PERK WHERE PERK_ID ="+id);

			if (rs.next()) {  //有緩衝區優點是速度快，但沒有也能跑啦
				BufferedInputStream in = new BufferedInputStream(rs.getBinaryStream("PERK_PIC"));
//				InputStream in = rs.getBinaryStream("image"); //	沒有緩衝區也ok
//				InputStream in = new BufferedInputStream(rs.getBinaryStream("image")); 用多型接也ok
				byte[] buf = new byte[4 * 1024]; // 4K buffer  準備水桶
				int len;
				while ((len = in.read(buf)) != -1) {
					out.write(buf, 0, len);
					
//					out.write(buf);寫這樣會錯，因為會有上次的殘留物 50 50 30   <30會再加舊的20
				}
				in.close();
			} else {
//				res.sendError(HttpServletResponse.SC_NOT_FOUND);
				InputStream in = getServletContext().getResourceAsStream("/projPerk/farmforUploadPic.png");
				byte[] b = new byte[in.available()];
				in.read(b);
				out.write(b);
				in.close();
			}
			rs.close();
			stmt.close();
		} catch (Exception e) {
//			System.out.println(e);
			InputStream in = getServletContext().getResourceAsStream("/projPerk/farmforUploadPic.png");
			byte[] b = new byte[in.available()];
			in.read(b);
			out.write(b);
			in.close();
		}
	}

	public void init() throws ServletException {
//		try {
//			Context ctx = new javax.naming.InitialContext();
//			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/David");
//			con = ds.getConnection();
//		} catch (NamingException e) {
//		
//			e.printStackTrace();
//		} catch (SQLException e) {
//		
//			e.printStackTrace();
//		}
		
		
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/CFA104G2?serverTimezone=Asia/Taipei", "root", "password");
		} catch (ClassNotFoundException e) {
			throw new UnavailableException("Couldn't load JdbcOdbcDriver");
		} catch (SQLException e) {
			throw new UnavailableException("Couldn't get db connection");
		}
	}

	public void destroy() {
		try {
			if (con != null) con.close();
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

}