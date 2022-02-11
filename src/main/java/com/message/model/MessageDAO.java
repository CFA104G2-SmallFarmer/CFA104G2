package com.message.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MessageDAO implements MessageDAO_Interface {

	private static DataSource ds;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/CFA104G2");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

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

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, messageVO.getMem_id());
			pstmt.setInt(2, messageVO.getMem_id_send());
			pstmt.setDate(3, messageVO.getMsg_time());
			pstmt.setString(4, messageVO.getMsg());
			pstmt.setInt(5, messageVO.getRead_state());

			pstmt.executeUpdate();

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

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, messageVO.getMem_id());
			pstmt.setInt(2, messageVO.getMem_id_send());
			pstmt.setDate(3, messageVO.getMsg_time());
			pstmt.setString(4, messageVO.getMsg());
			pstmt.setInt(5, messageVO.getRead_state());
			pstmt.setInt(6, messageVO.getMsg_no());
			pstmt.executeUpdate();

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

			con = ds.getConnection();

			con.setAutoCommit(false);
			pstmt = con.prepareStatement(DELETE_MESSAGE);
			pstmt.setInt(1, msg_no);
			pstmt.executeUpdate();
			con.commit();
			con.setAutoCommit(true);

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

			con = ds.getConnection();
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

			con = ds.getConnection();
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

}
