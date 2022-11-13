package com.fMem.controller;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.UnavailableException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
// 測試中，叫出圖片
public class FMemGifReader extends HttpServlet{


	Connection con;

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		res.setContentType("image/gif");
		ServletOutputStream out = res.getOutputStream();
		String actionpic = req.getParameter("actionpic");

		if("f_mem_pic".equals(actionpic)) {
		try {
			Statement stmt = con.createStatement();
			String f_mem_id = req.getParameter("f_mem_id");
			ResultSet rs = stmt.executeQuery(
				"SELECT f_mem_pic FROM cfa104g2.f_mem WHERE f_mem_id="+ f_mem_id);

			if (rs.next()) {
				BufferedInputStream in = new BufferedInputStream(rs.getBinaryStream("f_mem_pic"));
				byte[] buf = new byte[4 * 1024]; // 4K buffer
				int len;
				while ((len = in.read(buf)) != -1) {
					out.write(buf, 0, len);
				}
				in.close();
			} else {
				res.sendError(HttpServletResponse.SC_NOT_FOUND);
				InputStream in = getServletContext().getResourceAsStream("/front-end/assets/images/farmforUploadPic.png");
				byte[] b = new byte[in.available()];
				in.read(b);
				out.write(b);
				in.close();
			}
			rs.close();
			stmt.close();
		} catch (Exception e) {
			InputStream in = getServletContext().getResourceAsStream("/front-end/assets/images/farmforUploadPic.png");
			byte[] b = new byte[in.available()];
			in.read(b);
			out.write(b);
			in.close();
//			System.out.println(e);
		}
		}
		
		if("organic_certi".equals(actionpic)) {
			try {
				Statement stmt = con.createStatement();
				String f_mem_id = req.getParameter("f_mem_id");
				ResultSet rs = stmt.executeQuery(
						"SELECT organic_certi FROM cfa104g2.f_mem WHERE f_mem_id="+ f_mem_id);
				
				if (rs.next()) {
					BufferedInputStream in = new BufferedInputStream(rs.getBinaryStream("organic_certi"));
					byte[] buf = new byte[4 * 1024]; // 4K buffer
					int len;
					while ((len = in.read(buf)) != -1) {
						out.write(buf, 0, len);
					}
					in.close();
				} else {
					res.sendError(HttpServletResponse.SC_NOT_FOUND);
					InputStream in = getServletContext().getResourceAsStream("/front-end/assets/images/farmforUploadPic.png");
					byte[] b = new byte[in.available()];
					in.read(b);
					out.write(b);
					in.close();
				}
				rs.close();
				stmt.close();
			} catch (Exception e) {
				InputStream in = getServletContext().getResourceAsStream("/front-end/assets/images/farmforUploadPic.png");
				byte[] b = new byte[in.available()];
				in.read(b);
				out.write(b);
				in.close();
//			System.out.println(e);
			}
		}

		if("env_friendly_certi".equals(actionpic)) {
			try {
				Statement stmt = con.createStatement();
				String f_mem_id = req.getParameter("f_mem_id");
				ResultSet rs = stmt.executeQuery(
						"SELECT env_friendly_certi FROM cfa104g2.f_mem WHERE f_mem_id="+ f_mem_id);
				
				if (rs.next()) {
					BufferedInputStream in = new BufferedInputStream(rs.getBinaryStream("env_friendly_certi"));
					byte[] buf = new byte[4 * 1024]; // 4K buffer
					int len;
					while ((len = in.read(buf)) != -1) {
						out.write(buf, 0, len);
					}
					in.close();
				} else {
					res.sendError(HttpServletResponse.SC_NOT_FOUND);
					InputStream in = getServletContext().getResourceAsStream("/front-end/assets/images/farmforUploadPic.png");
					byte[] b = new byte[in.available()];
					in.read(b);
					out.write(b);
					in.close();
				}
				rs.close();
				stmt.close();
			} catch (Exception e) {
				InputStream in = getServletContext().getResourceAsStream("/front-end/assets/images/farmforUploadPic.png");
				byte[] b = new byte[in.available()];
				in.read(b);
				out.write(b);
				in.close();
//			System.out.println(e);
			}
		}
	}

	public void init() throws ServletException {
		try {
			Class.forName(com.sysconfig.SysConfig.getDriver());
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/CFA104G2?serverTimezone=Asia/Taipei" , "root", "password");
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
