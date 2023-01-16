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
			"SELECT PERK_PIC FROM proj_perk WHERE PERK_ID ="+id);
			if (rs.next()) {  //有緩衝區優點是速度快，但沒有也能跑啦
				BufferedInputStream in = new BufferedInputStream(rs.getBinaryStream("PERK_PIC"));
				byte[] buf = new byte[4 * 1024]; // 4K buffer  準備水桶
				int len;
				while ((len = in.read(buf)) != -1) {
					out.write(buf, 0, len);
				}
				in.close();
			} else {
				InputStream in = getServletContext().getResourceAsStream("/front-end/projPerk/farmforUploadPic.png");
				byte[] b = new byte[in.available()];
				in.read(b);
				out.write(b);
				in.close();
			}
			rs.close();
			stmt.close();
		} catch (Exception e) {
//			System.out.println(e);
			InputStream in = getServletContext().getResourceAsStream("/front-end/projPerk/farmforUploadPic.png");
			byte[] b = new byte[in.available()];
			in.read(b);
			out.write(b);
			in.close();
		}
	}

	public void init() throws ServletException {
		try {
			Class.forName(com.sysconfig.SysConfig.getDriver());
			con = DriverManager.getConnection(com.sysconfig.SysConfig.getUrl(), com.sysconfig.SysConfig.getUserid(), com.sysconfig.SysConfig.getPasswd());
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