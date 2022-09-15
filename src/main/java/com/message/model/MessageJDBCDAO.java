package com.message.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class MessageJDBCDAO implements MessageDAO_Interface {

	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/cfa104g2?serverTimezone=Asia/Taipei";
	String userid = "root";
	String passwd = "53434976";

	private static final String INSERT_STMT = "INSERT INTO message (mem_id, mem_id_send, msg_time, msg, read_state) VALUES (?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT msg_no, mem_id, mem_id_send, msg_time, msg, read_state FROM message";
	private static final String GET_ONE_STMT = "SELECT msg_no, mem_id, mem_id_send, msg_time, msg, read_state FROM message WHERE msg_no=?";
	private static final String DELETE_MESSAGE = "DELETE FROM message where msg_no = ?";
	private static final String UPDATE = "UPDATE message set mem_id=?, mem_id_send=?, msg_time=?, msg=?, read_state=? WHERE msg_no=?";

	@Override
	public void insert(MessageVO messageVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, messageVO.getMem_id());
			pstmt.setInt(2, messageVO.getMem_id_send());
			pstmt.setDate(3, messageVO.getMsg_time());
			pstmt.setString(4, messageVO.getMsg());
			pstmt.setInt(5, messageVO.getRead_state());

			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public void update(MessageVO messageVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, messageVO.getMem_id());
			pstmt.setInt(2, messageVO.getMem_id_send());
			pstmt.setDate(3, messageVO.getMsg_time());
			pstmt.setString(4, messageVO.getMsg());
			pstmt.setInt(5, messageVO.getRead_state());
			pstmt.setInt(6, messageVO.getMsg_no());
			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public void delete(Integer msg_no) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);

			con.setAutoCommit(false);
			pstmt = con.prepareStatement(DELETE_MESSAGE);
			pstmt.setInt(1, msg_no);
			pstmt.executeUpdate();
			con.commit();
			con.setAutoCommit(true);

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
		} catch (SQLException se) {
			if (con != null) {
				try {
					con.rollback();
				} catch (SQLException excep) {
					throw new RuntimeException("rollback error occured. " + excep.getMessage());
				}
			}
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public MessageVO findByPrimaryKey(Integer msg_no) {

		MessageVO messageVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, msg_no);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				messageVO = new MessageVO();
				messageVO.setMsg_no(rs.getInt("msg_no"));
				messageVO.setMem_id(rs.getInt("mem_id"));
				messageVO.setMem_id_send(rs.getInt("mem_id_send"));
				messageVO.setMsg_time(rs.getDate("msg_time"));
				messageVO.setMsg(rs.getString("msg"));
				messageVO.setRead_state(rs.getInt("read_state"));

			}

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return messageVO;
	}

	@Override
	public List<MessageVO> getAll() {
		List<MessageVO> list = new ArrayList<MessageVO>();
		MessageVO messageVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				messageVO = new MessageVO();
				messageVO.setMsg_no(rs.getInt("msg_no"));
				messageVO.setMem_id(rs.getInt("mem_id"));
				messageVO.setMem_id_send(rs.getInt("mem_id_send"));
				messageVO.setMsg_time(rs.getDate("msg_time"));
				messageVO.setMsg(rs.getString("msg"));
				messageVO.setRead_state(rs.getInt("read_state"));
				list.add(messageVO);

			}

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}

	public static void main(String[] args) {
		MessageJDBCDAO dao = new MessageJDBCDAO();

//測試 insert(MessageVO messageVO);

		MessageVO messageVO = new MessageVO();

		Date date = java.sql.Date.valueOf("2022-01-05");
		messageVO.setMem_id(77001);
		messageVO.setMem_id_send(77002);
		messageVO.setMsg_time(date);
		messageVO.setMsg("測試");
		messageVO.setRead_state(1);
		dao.insert(messageVO);
		System.out.println("ok");

//測試 update(MessageVO messageVO);

		MessageVO messageVO2 = new MessageVO();

		Date date2 = java.sql.Date.valueOf("2022-02-05");
		messageVO2.setMem_id(77001);
		messageVO2.setMem_id_send(0);
		messageVO2.setMsg_time(date2);
		messageVO2.setMsg("測試2");
		messageVO2.setRead_state(1);
		messageVO2.setMsg_no(3);
		dao.update(messageVO2);
		System.out.println("ok");

//測試 delete(Integer msg_no);

		dao.delete(6);
		System.out.println("ok");

//測試 findByPrimaryKey(Integer msg_no);

		MessageVO messageVO3 = dao.findByPrimaryKey(2);
		System.out.println(messageVO3);

//測試 getAll();
		List<MessageVO> list = dao.getAll();
		for (MessageVO vo : list) {
			System.out.println(vo);
		}

	}

}
