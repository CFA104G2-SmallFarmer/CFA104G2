package com.projOrder.model;

import java.util.*;

import java.sql.*;

public class ProjOrderJDBCDAO implements ProjOrderDAO_interface {

	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/CFA104G2?serverTimezone=Asia/Taipei";
	String userid = "David";
	String passwd = "password";

//	ORDER_ID流水號，ORDER_TIME使用NOW()，新建單時不會有ORDER_CANCEL_TIME，ORDER_STATE預設為0
	private static final String INSERT_STMT = "INSERT INTO PROJ_ORDER (MEM_ID,PERK_ID,ORDER_TIME,ORDER_ADDR,ORDER_STATE)"
			+ "VALUES ( ?, ?, NOW(), ?, 0)";
	
	private static final String GET_ALL_STMT = "SELECT ORDER_ID,MEM_ID,PERK_ID,ORDER_TIME,ORDER_ADDR,ORDER_STATE,ORDER_CANCEL_TIME FROM PROJ_ORDER ORDER BY ORDER_ID";
	
	private static final String GET_ONE_STMT = "SELECT ORDER_ID,MEM_ID,PERK_ID,ORDER_TIME,ORDER_ADDR,ORDER_STATE,ORDER_CANCEL_TIME FROM PROJ_ORDER WHERE ORDER_ID = ?";
	
	private static final String DELETE = "DELETE FROM PROJ_ORDER WHERE ORDER_ID = ?";
	
//  只有訂單狀態改變或取消時，ORDER_STATE、ORDER_CANCEL_TIME可接受更改
	private static final String UPDATE = "UPDATE PROJ_ORDER SET ORDER_STATE=?,ORDER_CANCEL_TIME=? WHERE ORDER_ID = ?";
// 列出會員的所有訂單
	private static final String GET_All_MEM_ORDER_STMT = "SELECT ORDER_ID,MEM_ID,PERK_ID,ORDER_TIME,ORDER_ADDR,ORDER_STATE,ORDER_CANCEL_TIME FROM PROJ_ORDER WHERE MEM_ID = ?";
// 列出小農的所有訂單(因為訂單裡沒有小農編號，所以要JOIN兩次才抓得到)
	private static final String GET_All_FMEM_ORDER_STMT = "SELECT A.* , B.PROJ_ID, C.F_MEM_ID "
			+"FROM (PROJ_ORDER AS A LEFT JOIN PROJ_PERK AS B ON A.PERK_ID = B.PERK_ID) " 
			+"LEFT JOIN PROJECT AS C ON B.PROJ_ID=C.PROJ_ID "
			+"WHERE F_MEM_ID = ?";

//	0 : 待付款
//	1 : 待出貨
//	2 : 待收貨
//	3 : 訂單已完成
//	4 : 訂單不成立
	
	@Override
	public void insert(ProjOrderVO ProjOrderVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, ProjOrderVO.getMem_id());
			pstmt.setInt(2, ProjOrderVO.getPerk_id());
			pstmt.setString(3, ProjOrderVO.getOrder_addr());
			
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
	public void update(ProjOrderVO ProjOrderVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, ProjOrderVO.getOrder_state());
			pstmt.setDate(2, ProjOrderVO.getOrder_cancel_time());
			pstmt.setInt(3, ProjOrderVO.getOrder_id());
			
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

			while (rs.next()) {

				ProjOrderVO = new ProjOrderVO();
				ProjOrderVO.setOrder_id(rs.getInt("order_id"));
				ProjOrderVO.setMem_id(rs.getInt("mem_id"));
				ProjOrderVO.setPerk_id(rs.getInt("perk_id"));
				ProjOrderVO.setOrder_time(rs.getDate("order_time"));
				ProjOrderVO.setOrder_addr(rs.getString("order_addr"));
				ProjOrderVO.setOrder_state(rs.getInt("order_state"));
				ProjOrderVO.setOrder_cancel_time(rs.getDate("order_cancel_time"));
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
				ProjOrderVO.setOrder_addr(rs.getString("order_addr"));
				ProjOrderVO.setOrder_state(rs.getInt("order_state"));
				ProjOrderVO.setOrder_cancel_time(rs.getDate("order_cancel_time"));
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
				ProjOrderVO.setOrder_addr(rs.getString("order_addr"));
				ProjOrderVO.setOrder_state(rs.getInt("order_state"));
				ProjOrderVO.setOrder_cancel_time(rs.getDate("order_cancel_time"));
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
				ProjOrderVO.setOrder_addr(rs.getString("order_addr"));
				ProjOrderVO.setOrder_state(rs.getInt("order_state"));
				ProjOrderVO.setOrder_cancel_time(rs.getDate("order_cancel_time"));
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
//////		// 新增
//
//		ProjOrderVO projOrderVO2 = new ProjOrderVO();
//		projOrderVO2.setMem_id(77000);
//		projOrderVO2.setPerk_id(3);
//		projOrderVO2.setOrder_addr("寶寶路2號");
//		dao.insert(projOrderVO2);
//		System.out.println("成功新增");
//		
//		/*=====================================================*/
		// 修改(取消訂單)
//
//		ProjOrderVO projOrderVO2 = new ProjOrderVO();
//		projOrderVO2.setOrder_state(4);
//		projOrderVO2.setOrder_cancel_time(java.sql.Date.valueOf("2022-11-10"));
//		projOrderVO2.setOrder_id(2);
//		dao.update(projOrderVO2);
//		System.out.println("更新成功");
//
//		/*=====================================================*/
		// 修改(更改狀態)
		
//		ProjOrderVO projOrderVO3 = new ProjOrderVO();
//		projOrderVO3.setOrder_state(2);
//		projOrderVO3.setOrder_cancel_time(null);
//		projOrderVO3.setOrder_id(2);
//		dao.update(projOrderVO3);
//		System.out.println("更新成功");
		
//		/*=====================================================*/
//		 //刪除
//		int x =1;
//		dao.delete(x);
//		System.out.println("刪除dir_id="+x+"成功");

//		/*=====================================================*/

		
		
//		// 查詢getAllSTMT
		/* =====列出所有訂單====== */
		/* ============================= */// 
//		List<ProjOrderVO> list = dao.getAll();
//		for (ProjOrderVO projOrder : list) {
//			System.out.print(projOrder.getOrder_id() + ",");
//			System.out.print(projOrder.getMem_id() + ",");
//			System.out.print(projOrder.getPerk_id() + ",");
//			System.out.print(projOrder.getOrder_time() + ",");
//			System.out.print(projOrder.getOrder_addr() + ",");
//			System.out.print(projOrder.getOrder_state() + ",");
//			System.out.print(projOrder.getOrder_cancel_time() + ",");
//			System.out.println();
//			System.out.println("------------");
//		}

		
//		// 查詢getOneOrder
		/* =====列出一筆訂單====== */
		/* ============================= */// 
//		ProjOrderVO projOrderVO2= dao.findByPrimaryKey(2);
//		
//		System.out.print(projOrderVO2.getOrder_id() + ",");
//		System.out.print(projOrderVO2.getMem_id() + ",");
//		System.out.print(projOrderVO2.getPerk_id() + ",");
//		System.out.print(projOrderVO2.getOrder_time() + ",");
//		System.out.print(projOrderVO2.getOrder_addr() + ",");
//		System.out.print(projOrderVO2.getOrder_state() + ",");
//		System.out.print(projOrderVO2.getOrder_cancel_time() + ",");
//		System.out.println();
//		System.out.println("------------");
		
		
////		// 查詢getAllMemOrder
//		/* =====列出某會員所有的訂單====== */
//		/* ============================= */// 
//		List<ProjOrderVO> list = dao.getAllMemOrder(77000);
//		for (ProjOrderVO projOrder : list) {
//			System.out.print(projOrder.getOrder_id() + ",");
//			System.out.print(projOrder.getMem_id() + ",");
//			System.out.print(projOrder.getPerk_id() + ",");
//			System.out.print(projOrder.getOrder_time() + ",");
//			System.out.print(projOrder.getOrder_addr() + ",");
//			System.out.print(projOrder.getOrder_state() + ",");
//			System.out.print(projOrder.getOrder_cancel_time() + ",");
//			System.out.println();
//			System.out.println("------------");
//		}
		
//		// 查詢getAllFMemOrder
		/* =====列出某小農所有的訂單====== */
		/* ============================= */// 
//		List<ProjOrderVO> list = dao.getAllFmemOrder(70003);
//		for (ProjOrderVO projOrder : list) {
//			System.out.print(projOrder.getOrder_id() + ",");
//			System.out.print(projOrder.getMem_id() + ",");
//			System.out.print(projOrder.getPerk_id() + ",");
//			System.out.print(projOrder.getOrder_time() + ",");
//			System.out.print(projOrder.getOrder_addr() + ",");
//			System.out.print(projOrder.getOrder_state() + ",");
//			System.out.print(projOrder.getOrder_cancel_time() + ",");
//			System.out.println();
//			System.out.println("------------");
//		}
	
	}
	
}
