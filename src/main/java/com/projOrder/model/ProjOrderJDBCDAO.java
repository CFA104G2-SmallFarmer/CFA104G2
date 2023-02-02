package com.projOrder.model;

import java.util.*;

import java.sql.*;

public class ProjOrderJDBCDAO implements ProjOrderDAO_interface {

	String driver = com.sysconfig.SysConfig.getDriver();
	String url = com.sysconfig.SysConfig.getUrl();
	String userid = com.sysconfig.SysConfig.getUserid();
	String passwd = com.sysconfig.SysConfig.getPasswd();
	
//	TODO 新增欄位
//	ORDER_ZIPCODE 
//	ORDER_RECEIVER
//	ORDER_TEL
//	ORDER_PAY
//	ORDER_SHIP_TIME
//	ORDER_COMPLETION_TIME
//ORDER_CANCEL_REASON
	
	
//	ORDER_ID流水號，ORDER_TIME使用NOW()，新建單時不會有ORDER_CANCEL_TIME，ORDER_STATE預設為0
	private static final String INSERT_STMT = 
//			"INSERT INTO proj_order (MEM_ID,PERK_ID,ORDER_TIME,ORDER_ADDR,ORDER_STATE)"
//			+ "VALUES ( ?, ?, NOW(), ?, 0)";
	
	"INSERT INTO `proj_order`"
	+ "(`MEM_ID`,"
	+ "`PERK_ID`,"
	+ "`ORDER_TIME`,"
	+ "`ORDER_ZIPCODE`,"
	+ "`ORDER_ADDR`,"
	+ "`ORDER_RECEIVER`,"
	+ "`ORDER_TEL`,"
	+ "`ORDER_PAY`,"
	+ "`ORDER_STATE`,"
	+ "`ORDER_NUMBER`)"
	+ "VALUES"
	+ "(?,?,NOW(),?,?,?,?,?,0,?)";
	
	private static final String GET_ALL_STMT = 
//			"SELECT ORDER_ID,MEM_ID,PERK_ID,ORDER_TIME,ORDER_ADDR,ORDER_STATE,ORDER_CANCEL_TIME FROM proj_order ORDER BY ORDER_ID";
	
	"SELECT `ORDER_ID`,"
	+ "`MEM_ID`,"
	+ "`PERK_ID`,"
	+ "`ORDER_TIME`,"
	+ "`ORDER_ZIPCODE`,"
	+ "`ORDER_ADDR`,"
	+ "`ORDER_RECEIVER`,"
	+ "`ORDER_TEL`,"
	+ "`ORDER_PAY`,"
	+ "`ORDER_STATE`,"
	+ "`ORDER_SHIP_TIME`,"
	+ "`ORDER_COMPLETION_TIME`,"
	+ "`ORDER_CANCEL_TIME`,"
	+ "`ORDER_CANCEL_REASON`"
	+ "FROM `proj_order`";
	
	private static final String GET_ONE_STMT = 
//			"SELECT ORDER_ID,MEM_ID,PERK_ID,ORDER_TIME,ORDER_ADDR,ORDER_STATE,ORDER_CANCEL_TIME FROM proj_order WHERE ORDER_ID = ?";
	"SELECT `ORDER_ID`,"
	+ "`MEM_ID`,"
	+ "`PERK_ID`,"
	+ "`ORDER_TIME`,"
	+ "`ORDER_ZIPCODE`,"
	+ "`ORDER_ADDR`,"
	+ "`ORDER_RECEIVER`,"
	+ "`ORDER_TEL`,"
	+ "`ORDER_PAY`,"
	+ "`ORDER_STATE`,"
	+ "`ORDER_SHIP_TIME`,"
	+ "`ORDER_COMPLETION_TIME`,"
	+ "`ORDER_CANCEL_TIME`,"
	+ "`ORDER_CANCEL_REASON`,"
	+ "`ORDER_NUMBER`"
	+ "FROM `proj_order` WHERE `ORDER_ID` = ?";



	private static final String GET_ONE_BY_ORDER_NUMBER_STMT =
			"SELECT `ORDER_ID`,"
					+ "`MEM_ID`,"
					+ "`PERK_ID`,"
					+ "`ORDER_TIME`,"
					+ "`ORDER_ZIPCODE`,"
					+ "`ORDER_ADDR`,"
					+ "`ORDER_RECEIVER`,"
					+ "`ORDER_TEL`,"
					+ "`ORDER_PAY`,"
					+ "`ORDER_STATE`,"
					+ "`ORDER_SHIP_TIME`,"
					+ "`ORDER_COMPLETION_TIME`,"
					+ "`ORDER_CANCEL_TIME`,"
					+ "`ORDER_CANCEL_REASON`,"
					+ "`ORDER_NUMBER`"
					+ "FROM `proj_order` WHERE `ORDER_NUMBER` = ?";

	private static final String DELETE = "DELETE FROM proj_order WHERE ORDER_ID = ?";
	

	private static final String UPDATE = 
//			"UPDATE proj_order SET ORDER_STATE=?,ORDER_CANCEL_TIME=? WHERE ORDER_ID = ?";
	"UPDATE `proj_order`"
	+ "SET"
	+ "`ORDER_ZIPCODE` = ?,"
	+ "`ORDER_ADDR` = ?,"
	+ "`ORDER_RECEIVER` = ?,"
	+ "`ORDER_TEL` = ?,"
	+ "`ORDER_STATE` = ?,"
	+ "`ORDER_SHIP_TIME` = ?,"
	+ "`ORDER_COMPLETION_TIME` = ?,"
	+ "`ORDER_CANCEL_TIME` = ?,"
	+ "`ORDER_CANCEL_REASON` = ? "
	+ " WHERE `ORDER_ID` = ?";
	
	private static final String CHANGE_STATE =
			"UPDATE `proj_order`"
					+ "SET"
					+ "`ORDER_STATE` = ?,"
					+ "`ORDER_SHIP_TIME` = ?,"
					+ "`ORDER_COMPLETION_TIME` = ?,"
					+ "`ORDER_CANCEL_TIME` = ?,"
					+ "`ORDER_CANCEL_REASON` = ? "
					+ " WHERE `ORDER_ID` = ?";
	
	// 列出會員的所有訂單
	private static final String GET_All_MEM_ORDER_STMT = 
//			"SELECT ORDER_ID,MEM_ID,PERK_ID,ORDER_TIME,ORDER_ADDR,ORDER_STATE,ORDER_CANCEL_TIME FROM proj_order WHERE MEM_ID = ?";
			
			"SELECT `ORDER_ID`,"
			+ "`MEM_ID`,"
			+ "`PERK_ID`,"
			+ "`ORDER_TIME`,"
			+ "`ORDER_ZIPCODE`,"
			+ "`ORDER_ADDR`,"
			+ "`ORDER_RECEIVER`,"
			+ "`ORDER_TEL`,"
			+ "`ORDER_PAY`,"
			+ "`ORDER_STATE`,"
			+ "`ORDER_SHIP_TIME`,"
			+ "`ORDER_COMPLETION_TIME`,"
			+ "`ORDER_CANCEL_TIME`,"
			+ "`ORDER_CANCEL_REASON`"
			+ "FROM `proj_order` WHERE `MEM_ID` = ? ORDER BY ORDER_ID DESC";
	
	
	// 列出小農的所有訂單(因為訂單裡沒有小農編號，所以要JOIN兩次才抓得到)
	private static final String GET_All_FMEM_ORDER_STMT = "SELECT A.* , B.PROJ_ID, C.F_MEM_ID "
			+"FROM (proj_order AS A LEFT JOIN proj_perk AS B ON A.PERK_ID = B.PERK_ID) "
			+"LEFT JOIN project AS C ON B.PROJ_ID=C.PROJ_ID "
			+"WHERE F_MEM_ID = ? ORDER BY ORDER_ID DESC";

//	0 : 待付款
//	1 : 待出貨
//	2 : 運送中
//	3 : 已完成
//	4 : 不成立(未處理)
//  5 : 不成立(已解決)	
	@Override
	public void insert(ProjOrderVO projOrderVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
			
//			"INSERT INTO `proj_order`"
//			1+ "(`MEM_ID`,"
//			2+ "`PERK_ID`,"
//			+ "`ORDER_TIME`,"
//			3+ "`ORDER_ZIPCODE`,"
//			4+ "`ORDER_ADDR`,"
//			5+ "`ORDER_RECEIVER`,"
//			6+ "`ORDER_TEL`,"
//			7+ "`ORDER_PAY`,"
//			+ "`ORDER_STATE`)"
//			+ "VALUES"
//			+ "(?,?,NOW(),?,?,?,?,?,0)";
			pstmt.setInt(1, projOrderVO.getMem_id());
			pstmt.setInt(2, projOrderVO.getPerk_id());
			pstmt.setInt(3, projOrderVO.getOrder_zipcode());
			pstmt.setString(4, projOrderVO.getOrder_addr());
			pstmt.setString(5, projOrderVO.getOrder_receiver());
			pstmt.setString(6, projOrderVO.getOrder_tel());
			pstmt.setInt(7, projOrderVO.getOrder_pay());
			pstmt.setString(8, projOrderVO.getOrder_number());

			pstmt.executeUpdate();
			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
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
	public void update(ProjOrderVO projOrderVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);
//			"UPDATE `proj_order`"
//			+ "SET"
//			1+ "`ORDER_ZIPCODE` = ?,"
//			2+ "`ORDER_ADDR` = ?,"
//			3+ "`ORDER_RECEIVER` = ?,"
//			4+ "`ORDER_TEL` = ?,"
//			5+ "`ORDER_STATE` = ?,"
//			6+ "`ORDER_SHIP_TIME` = ?,"
//			7+ "`ORDER_COMPLETION_TIME` = ?,"
//			8+ "`ORDER_CANCEL_TIME` = ?,"
//			9+ "`ORDER_CANCEL_REASON` = ?"
//			10+ "WHERE `ORDER_ID` = ?";
			pstmt.setInt(1, projOrderVO.getOrder_zipcode());
			pstmt.setString(2, projOrderVO.getOrder_addr());
			pstmt.setString(3, projOrderVO.getOrder_receiver());
			pstmt.setString(4, projOrderVO.getOrder_tel());
			pstmt.setInt(5, projOrderVO.getOrder_state());
			pstmt.setDate(6, projOrderVO.getOrder_ship_time());
			pstmt.setDate(7, projOrderVO.getOrder_completion_time());
			pstmt.setDate(8, projOrderVO.getOrder_cancel_time());
			pstmt.setInt(9, projOrderVO.getOrder_cancel_reason());
			pstmt.setInt(10, projOrderVO.getOrder_id());

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
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
	public void delete(Integer order_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, order_id);

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
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
	public ProjOrderVO findByPrimaryKey(Integer order_id) {

		ProjOrderVO ProjOrderVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, order_id);

			rs = pstmt.executeQuery();
//			"SELECT `ORDER_ID`,"
//			+ "`MEM_ID`,"
//			+ "`PERK_ID`,"
//			+ "`ORDER_TIME`,"
//			+ "`ORDER_ZIPCODE`,"
//			+ "`ORDER_ADDR`,"
//			+ "`ORDER_RECEIVER`,"
//			+ "`ORDER_TEL`,"
//			+ "`ORDER_PAY`,"
//			+ "`ORDER_STATE`,"
//			+ "`ORDER_SHIP_TIME`,"
//			+ "`ORDER_COMPLETION_TIME`,"
//			+ "`ORDER_CANCEL_TIME`,"
//			+ "`ORDER_CANCEL_REASON`"
//			+ "FROM `proj_order` WHERE `ORDER_ID` = ?";
			while (rs.next()) {

				ProjOrderVO = new ProjOrderVO();
				ProjOrderVO.setOrder_id(rs.getInt("order_id"));
				ProjOrderVO.setMem_id(rs.getInt("mem_id"));
				ProjOrderVO.setPerk_id(rs.getInt("perk_id"));
				ProjOrderVO.setOrder_time(rs.getDate("order_time"));
				ProjOrderVO.setOrder_zipcode(rs.getInt("order_zipcode"));
				ProjOrderVO.setOrder_addr(rs.getString("order_addr"));
				ProjOrderVO.setOrder_receiver(rs.getString("order_receiver"));
				ProjOrderVO.setOrder_tel(rs.getString("order_tel"));
				ProjOrderVO.setOrder_pay(rs.getInt("order_pay"));
				ProjOrderVO.setOrder_state(rs.getInt("order_state"));
				ProjOrderVO.setOrder_ship_time(rs.getDate("order_ship_time"));
				ProjOrderVO.setOrder_completion_time(rs.getDate("order_completion_time"));
				ProjOrderVO.setOrder_cancel_time(rs.getDate("order_cancel_time"));
				ProjOrderVO.setOrder_cancel_reason(rs.getInt("order_cancel_reason"));
				ProjOrderVO.setOrder_number(rs.getString("order_number"));
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
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
		return ProjOrderVO;
	}


	public ProjOrderVO findByOrderNumber(String order_number) {

		ProjOrderVO ProjOrderVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_BY_ORDER_NUMBER_STMT);

			pstmt.setString(1, order_number);

			rs = pstmt.executeQuery();
//			"SELECT `ORDER_ID`,"
//					+ "`MEM_ID`,"
//					+ "`PERK_ID`,"
//					+ "`ORDER_TIME`,"
//					+ "`ORDER_ZIPCODE`,"
//					+ "`ORDER_ADDR`,"
//					+ "`ORDER_RECEIVER`,"
//					+ "`ORDER_TEL`,"
//					+ "`ORDER_PAY`,"
//					+ "`ORDER_STATE`,"
//					+ "`ORDER_SHIP_TIME`,"
//					+ "`ORDER_COMPLETION_TIME`,"
//					+ "`ORDER_CANCEL_TIME`,"
//					+ "`ORDER_CANCEL_REASON`"
//					+ "FROM `proj_order` WHERE `ORDER_NUMBER` = ?";

			while (rs.next()) {

				ProjOrderVO = new ProjOrderVO();
				ProjOrderVO.setOrder_id(rs.getInt("order_id"));
				ProjOrderVO.setMem_id(rs.getInt("mem_id"));
				ProjOrderVO.setPerk_id(rs.getInt("perk_id"));
				ProjOrderVO.setOrder_time(rs.getDate("order_time"));
				ProjOrderVO.setOrder_zipcode(rs.getInt("order_zipcode"));
				ProjOrderVO.setOrder_addr(rs.getString("order_addr"));
				ProjOrderVO.setOrder_receiver(rs.getString("order_receiver"));
				ProjOrderVO.setOrder_tel(rs.getString("order_tel"));
				ProjOrderVO.setOrder_pay(rs.getInt("order_pay"));
				ProjOrderVO.setOrder_state(rs.getInt("order_state"));
				ProjOrderVO.setOrder_ship_time(rs.getDate("order_ship_time"));
				ProjOrderVO.setOrder_completion_time(rs.getDate("order_completion_time"));
				ProjOrderVO.setOrder_cancel_time(rs.getDate("order_cancel_time"));
				ProjOrderVO.setOrder_cancel_reason(rs.getInt("order_cancel_reason"));
				ProjOrderVO.setOrder_number(rs.getString("order_number"));
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
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
		return ProjOrderVO;
	}

	@Override
	public List<ProjOrderVO> getAll() {
		List<ProjOrderVO> list = new ArrayList<ProjOrderVO>();
		ProjOrderVO ProjOrderVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				ProjOrderVO = new ProjOrderVO();
				ProjOrderVO.setOrder_id(rs.getInt("order_id"));
				ProjOrderVO.setMem_id(rs.getInt("mem_id"));
				ProjOrderVO.setPerk_id(rs.getInt("perk_id"));
				ProjOrderVO.setOrder_time(rs.getDate("order_time"));
				ProjOrderVO.setOrder_zipcode(rs.getInt("order_zipcode"));
				ProjOrderVO.setOrder_addr(rs.getString("order_addr"));
				ProjOrderVO.setOrder_receiver(rs.getString("order_receiver"));
				ProjOrderVO.setOrder_tel(rs.getString("order_tel"));
				ProjOrderVO.setOrder_pay(rs.getInt("order_pay"));
				ProjOrderVO.setOrder_state(rs.getInt("order_state"));
				ProjOrderVO.setOrder_ship_time(rs.getDate("order_ship_time"));
				ProjOrderVO.setOrder_completion_time(rs.getDate("order_completion_time"));
				ProjOrderVO.setOrder_cancel_time(rs.getDate("order_cancel_time"));
				ProjOrderVO.setOrder_cancel_reason(rs.getInt("order_cancel_reason"));
				list.add(ProjOrderVO);
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
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
	
	@Override
	public List<ProjOrderVO> getAllMemOrder(Integer mem_id) {
		List<ProjOrderVO> list = new ArrayList<ProjOrderVO>();
		ProjOrderVO ProjOrderVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_All_MEM_ORDER_STMT);

			pstmt.setInt(1, mem_id);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {

				ProjOrderVO = new ProjOrderVO();
				ProjOrderVO.setOrder_id(rs.getInt("order_id"));
				ProjOrderVO.setMem_id(rs.getInt("mem_id"));
				ProjOrderVO.setPerk_id(rs.getInt("perk_id"));
				ProjOrderVO.setOrder_time(rs.getDate("order_time"));
				ProjOrderVO.setOrder_zipcode(rs.getInt("order_zipcode"));
				ProjOrderVO.setOrder_addr(rs.getString("order_addr"));
				ProjOrderVO.setOrder_receiver(rs.getString("order_receiver"));
				ProjOrderVO.setOrder_tel(rs.getString("order_tel"));
				ProjOrderVO.setOrder_pay(rs.getInt("order_pay"));
				ProjOrderVO.setOrder_state(rs.getInt("order_state"));
				ProjOrderVO.setOrder_ship_time(rs.getDate("order_ship_time"));
				ProjOrderVO.setOrder_completion_time(rs.getDate("order_completion_time"));
				ProjOrderVO.setOrder_cancel_time(rs.getDate("order_cancel_time"));
				ProjOrderVO.setOrder_cancel_reason(rs.getInt("order_cancel_reason"));
				list.add(ProjOrderVO);
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
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
	
	
	@Override
	public List<ProjOrderVO> getAllFmemOrder(Integer f_mem_id) {
		List<ProjOrderVO> list = new ArrayList<ProjOrderVO>();
		ProjOrderVO ProjOrderVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_All_FMEM_ORDER_STMT);
			
			pstmt.setInt(1, f_mem_id);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {

				ProjOrderVO = new ProjOrderVO();
				ProjOrderVO.setOrder_id(rs.getInt("order_id"));
				ProjOrderVO.setMem_id(rs.getInt("mem_id"));
				ProjOrderVO.setPerk_id(rs.getInt("perk_id"));
				ProjOrderVO.setOrder_time(rs.getDate("order_time"));
				ProjOrderVO.setOrder_zipcode(rs.getInt("order_zipcode"));
				ProjOrderVO.setOrder_addr(rs.getString("order_addr"));
				ProjOrderVO.setOrder_receiver(rs.getString("order_receiver"));
				ProjOrderVO.setOrder_tel(rs.getString("order_tel"));
				ProjOrderVO.setOrder_pay(rs.getInt("order_pay"));
				ProjOrderVO.setOrder_state(rs.getInt("order_state"));
				ProjOrderVO.setOrder_ship_time(rs.getDate("order_ship_time"));
				ProjOrderVO.setOrder_completion_time(rs.getDate("order_completion_time"));
				ProjOrderVO.setOrder_cancel_time(rs.getDate("order_cancel_time"));
				ProjOrderVO.setOrder_cancel_reason(rs.getInt("order_cancel_reason"));
				list.add(ProjOrderVO);
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
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
		ProjOrderJDBCDAO dao = new ProjOrderJDBCDAO();

//		/*=====================================================*/
////		// 新增
//
//		ProjOrderVO projOrderVO2 = new ProjOrderVO();
//		
//		projOrderVO2.setMem_id(77000);
//		projOrderVO2.setPerk_id(3);
//		projOrderVO2.setOrder_zipcode(322);
//		projOrderVO2.setOrder_addr("寶寶路2號");
//		projOrderVO2.setOrder_receiver("唐老大");
//		projOrderVO2.setOrder_tel("0912341111");
//		projOrderVO2.setOrder_pay(1);
//		dao.insert(projOrderVO2);
//		System.out.println("成功新增");
		
//		/*=====================================================*/
		// 更新

		
//		ProjOrderVO projOrderVO2 = new ProjOrderVO();
//		projOrderVO2.setOrder_zipcode(123);
//		projOrderVO2.setOrder_addr("國王路3號");
//		projOrderVO2.setOrder_receiver("King");
//		projOrderVO2.setOrder_tel("0000000");
//		projOrderVO2.setOrder_state(1);
//		
//		projOrderVO2.setOrder_ship_time(java.sql.Date.valueOf("2022-11-10"));
//		projOrderVO2.setOrder_completion_time(java.sql.Date.valueOf("2022-10-10"));
//		projOrderVO2.setOrder_cancel_time(java.sql.Date.valueOf("2022-11-22"));
//		projOrderVO2.setOrder_cancel_reason(1);
//		
//		projOrderVO2.setOrder_id(220000001);
//		dao.update(projOrderVO2);
//		System.out.println("更新成功");

//		/*=====================================================*/

//		 //刪除
//		int x =220000002;
//		dao.delete(220000002);
//		System.out.println("刪除dir_id="+x+"成功");

//		/*=====================================================*/
//		// 查詢getAllSTMT
		/* =====列出所有訂單====== */
		/* ============================= */// 
//		List<ProjOrderVO> list = dao.getAll();
//		for (ProjOrderVO projOrder : list) {
//			System.out.print(projOrder.getOrder_id() + ",");//
//			System.out.print(projOrder.getMem_id() + ",");//
//			System.out.print(projOrder.getPerk_id() + ",");//
//			System.out.print(projOrder.getOrder_time() + ",");//
//			System.out.print(projOrder.getOrder_zipcode() + ",");
//			System.out.print(projOrder.getOrder_addr() + ",");
//			System.out.print(projOrder.getOrder_receiver() + ",");//
//			System.out.print(projOrder.getOrder_tel() + ",");
//			System.out.print(projOrder.getOrder_pay() + ",");
//			System.out.print(projOrder.getOrder_state() + ",");//
//			System.out.print(projOrder.getOrder_ship_time() + ",");
//			System.out.print(projOrder.getOrder_completion_time() + ",");
//			System.out.print(projOrder.getOrder_cancel_time() + ",");//
//			System.out.print(projOrder.getOrder_cancel_reason() + ",");
//			System.out.println();
//			System.out.println("------------");
//		}

		
//		// 查詢getOneOrder
		/* =====列出一筆訂單====== */
		/* ============================= *///
		ProjOrderVO projOrderVO2= dao.findByPrimaryKey(220001205);

		System.out.print(projOrderVO2.getOrder_id() + ",");//
		System.out.print(projOrderVO2.getMem_id() + ",");//
		System.out.print(projOrderVO2.getPerk_id() + ",");//
		System.out.print(projOrderVO2.getOrder_time() + ",");//
		System.out.print(projOrderVO2.getOrder_zipcode() + ",");
		System.out.print(projOrderVO2.getOrder_addr() + ",");
		System.out.print(projOrderVO2.getOrder_receiver() + ",");//
		System.out.print(projOrderVO2.getOrder_tel() + ",");
		System.out.print(projOrderVO2.getOrder_pay() + ",");
		System.out.print(projOrderVO2.getOrder_state() + ",");//
		System.out.print(projOrderVO2.getOrder_ship_time() + ",");
		System.out.print(projOrderVO2.getOrder_completion_time() + ",");
		System.out.print(projOrderVO2.getOrder_cancel_time() + ",");//
		System.out.print(projOrderVO2.getOrder_cancel_reason() + ",");
		System.out.print(projOrderVO2.getOrder_number() + ",");
		System.out.println();
		System.out.println("------------");


		//		// 查詢getOneOrder
		/* =====列出一筆訂單====== */
		/* ============================= *///
//		ProjOrderVO projOrderVO2= dao.findByOrderNumber("PO1675348975208F77005");
//
//		System.out.print(projOrderVO2.getOrder_id() + ",");//
//		System.out.print(projOrderVO2.getMem_id() + ",");//
//		System.out.print(projOrderVO2.getPerk_id() + ",");//
//		System.out.print(projOrderVO2.getOrder_time() + ",");//
//		System.out.print(projOrderVO2.getOrder_zipcode() + ",");
//		System.out.print(projOrderVO2.getOrder_addr() + ",");
//		System.out.print(projOrderVO2.getOrder_receiver() + ",");//
//		System.out.print(projOrderVO2.getOrder_tel() + ",");
//		System.out.print(projOrderVO2.getOrder_pay() + ",");
//		System.out.print(projOrderVO2.getOrder_state() + ",");//
//		System.out.print(projOrderVO2.getOrder_ship_time() + ",");
//		System.out.print(projOrderVO2.getOrder_completion_time() + ",");
//		System.out.print(projOrderVO2.getOrder_cancel_time() + ",");//
//		System.out.print(projOrderVO2.getOrder_cancel_reason() + ",");
//		System.out.print(projOrderVO2.getOrder_number() + ",");
//		System.out.println();
//		System.out.println("------------");
		
////		// 查詢getAllMemOrder
//		/* =====列出某會員所有的訂單====== */
//		/* ============================= */// 
//		List<ProjOrderVO> list = dao.getAllMemOrder(77000);
//		for (ProjOrderVO projOrderVO2 : list) {
//			System.out.print(projOrderVO2.getOrder_id() + ",");//
//			System.out.print(projOrderVO2.getMem_id() + ",");//
//			System.out.print(projOrderVO2.getPerk_id() + ",");//
//			System.out.print(projOrderVO2.getOrder_time() + ",");//
//			System.out.print(projOrderVO2.getOrder_zipcode() + ",");
//			System.out.print(projOrderVO2.getOrder_addr() + ",");
//			System.out.print(projOrderVO2.getOrder_receiver() + ",");//
//			System.out.print(projOrderVO2.getOrder_tel() + ",");
//			System.out.print(projOrderVO2.getOrder_pay() + ",");
//			System.out.print(projOrderVO2.getOrder_state() + ",");//
//			System.out.print(projOrderVO2.getOrder_ship_time() + ",");
//			System.out.print(projOrderVO2.getOrder_completion_time() + ",");
//			System.out.print(projOrderVO2.getOrder_cancel_time() + ",");//
//			System.out.print(projOrderVO2.getOrder_cancel_reason() + ",");
//			System.out.println();
//			System.out.println("------------");
//		}
		
//		// 查詢getAllFMemOrder
		/* =====列出某小農所有的訂單====== */
		/* ============================= */// 
//		List<ProjOrderVO> list = dao.getAllFmemOrder(70003);
//		for (ProjOrderVO projOrderVO2 : list) {
//		System.out.print(projOrderVO2.getOrder_id() + ",");//
//		System.out.print(projOrderVO2.getMem_id() + ",");//
//		System.out.print(projOrderVO2.getPerk_id() + ",");//
//		System.out.print(projOrderVO2.getOrder_time() + ",");//
//		System.out.print(projOrderVO2.getOrder_zipcode() + ",");
//		System.out.print(projOrderVO2.getOrder_addr() + ",");
//		System.out.print(projOrderVO2.getOrder_receiver() + ",");//
//		System.out.print(projOrderVO2.getOrder_tel() + ",");
//		System.out.print(projOrderVO2.getOrder_pay() + ",");
//		System.out.print(projOrderVO2.getOrder_state() + ",");//
//		System.out.print(projOrderVO2.getOrder_ship_time() + ",");
//		System.out.print(projOrderVO2.getOrder_completion_time() + ",");
//		System.out.print(projOrderVO2.getOrder_cancel_time() + ",");//
//		System.out.print(projOrderVO2.getOrder_cancel_reason() + ",");
//		System.out.println();
//		System.out.println("------------");
//		}
	
	}
	
}
