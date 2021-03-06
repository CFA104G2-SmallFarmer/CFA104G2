package com.shopOrder.model;

import java.util.*;

import com.shopOrderDetails.model.*;

import java.sql.*;

public class ShopOrderJDBCDAO implements ShopOrderDAO_interface {

	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/CFA104G2?serverTimezone=Asia/Taipei";
	String userid = "root";
	String passwd = "password";

	private static final String INSERT_STMT = 
	"INSERT INTO `SHOP_ORDER`"
	+"(`MEM_ID`, "
	+"`F_MEM_ID`,"
	+"`ORDER_ADD`,"
	+"`ORDER_RECEIVER`,"
	+"`ORDER_TEL`,"
	+"`ORDER_AMOUNT`,"
	+"`ORDER_MEMO`,"
	+"`ORDER_PAYMENT`,"
	+"`ORDER_STATE`,"
	+"`ORDER_DATE`)" 
	+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, 0, NOW())";
	
	private static final String GET_ALL_STMT = 
	"SELECT order_id,"
	+ "`MEM_ID`,"
	+ "`F_MEM_ID`,"
	+ "`ORDER_ADD`,"
	+ "`ORDER_RECEIVER`,"
	+ "`ORDER_TEL`,"
	+ "`ORDER_AMOUNT`,"
	+ "`ORDER_MEMO`,"
	+ "`ORDER_PAYMENT`,"
	+ "`ORDER_STATE`,"
	+ "`ORDER_DATE`,"
	+ "`ORDER_SHIP_DATE`,"
	+ "`ORDER_FINISH_DATE`,"
	+ "`ORDER_CANCEL_DATE`"
	+ "FROM `SHOP_ORDER`";
	
	
	private static final String GET_ONE_STMT = 
	"SELECT ORDER_ID,"
	+ "`MEM_ID`,"
	+ "`F_MEM_ID`,"
	+ "`ORDER_ADD`,"
	+ "`ORDER_RECEIVER`,"
	+ "`ORDER_TEL`,"
	+ "`ORDER_AMOUNT`,"
	+ "`ORDER_MEMO`,"
	+ "`ORDER_PAYMENT`,"
	+ "`ORDER_STATE`,"
	+ "`ORDER_DATE`,"
	+ "`ORDER_SHIP_DATE`,"
	+ "`ORDER_FINISH_DATE`,"
	+ "`ORDER_CANCEL_DATE`"
	+ "FROM `SHOP_ORDER` WHERE ORDER_ID = ?";
	
	private static final String DELETE = 
			"DELETE FROM shop_order where order_id = ?";
	
	private static final String UPDATE = 
//	"UPDATE shop_order "
//	+ "set mem_id=?, order_date=?, order_ship_fee=?, order_add=?, order_amount=?, order_memo=?, order_ship_date=?,order_payment=?, order_state=? ,order_finish_date=? where order_id = ?";
//	
	"UPDATE `SHOP_ORDER`"
	+ "SET"
	+"`ORDER_ADD` = ?,"
	+"`ORDER_RECEIVER` = ?,"
	+"`ORDER_TEL` = ?,"
	+"`ORDER_MEMO` = ?,"
	+"`ORDER_STATE` = ?,"
	+"`ORDER_SHIP_DATE` = ?," 
	+"`ORDER_FINISH_DATE` = ?," 
	+"`ORDER_CANCEL_DATE` = ?" 
	+" WHERE `ORDER_ID` = ?";
	
	private static final String CHANGE_STATE = 
//			0 : ?????????
//			1 : ?????????
//			2 : ?????????
//			3 : ?????????
//			4 : ?????????
	"UPDATE `SHOP_ORDER`"
	+ "SET"
	+"`ORDER_STATE` = ?,"
	+"`ORDER_SHIP_DATE` = ?," 
	+"`ORDER_FINISH_DATE` = ?," 
	+"`ORDER_CANCEL_DATE` = ?" 
	+" WHERE `ORDER_ID` = ?";
	


	// ???????????????????????????
		private static final String GET_All_MEM_ORDER_STMT = 
				"SELECT `ORDER_ID`,"
						+ "`MEM_ID`,"
						+ "`F_MEM_id`,"
						+ "`ORDER_ADD`,"
						+ "`ORDER_RECEIVER`,"
						+ "`ORDER_TEL`,"
						+ "`ORDER_AMOUNT`,"
						+ "`ORDER_MEMO`,"
						+ "`ORDER_PAYMENT`,"
						+ "`ORDER_STATE`,"
						+ "`ORDER_DATE`,"
						+ "`ORDER_SHIP_DATE`,"
						+ "`ORDER_FINISH_DATE`,"
						+ "`ORDER_CANCEL_DATE`"
						+ "FROM `SHOP_ORDER` WHERE `MEM_ID` = ? ORDER BY `ORDER_ID` DESC;";
	
		// ???????????????????????????(?????????????????????????????????????????????JOIN??????????????????)
		private static final String GET_All_FMEM_ORDER_STMT = 
				"SELECT `ORDER_ID`,"
						+ "`MEM_ID`,"
						+ "`F_MEM_id`,"
						+ "`ORDER_ADD`,"
						+ "`ORDER_RECEIVER`,"
						+ "`ORDER_TEL`,"
						+ "`ORDER_AMOUNT`,"
						+ "`ORDER_MEMO`,"
						+ "`ORDER_PAYMENT`,"
						+ "`ORDER_STATE`,"
						+ "`ORDER_DATE`,"
						+ "`ORDER_SHIP_DATE`,"
						+ "`ORDER_FINISH_DATE`,"
						+ "`ORDER_CANCEL_DATE`"
						+ "FROM `SHOP_ORDER` WHERE `F_MEM_ID` = ? ORDER BY `ORDER_ID` DESC;";
		
	
	@Override
	public void insert(ShopOrderVO shopOrderVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			
//			"INSERT INTO `SHOP_ORDER`"
//			+"(`MEM_ID`, "
//			+"`F_MEM_ID`,"
//			+"`ORDER_ADD`,"
//			+"`ORDER_RECEIVER`,"
//			+"`ORDER_TEL`,"
//			+"`ORDER_AMOUNT`,"
//			+"`ORDER_MEMO`,"
//			+"`ORDER_PAYMENT`,"
//			+"`ORDER_STATE`,"
//			+"`ORDER_DATE`)" 
//			+ "VALUES (1?, 2?, 3?, 4?, 5?, 6?, 7?, 8?, 9.0, 10.NOW())";
			
			pstmt.setInt(1, shopOrderVO.getMem_id());
			pstmt.setInt(2, shopOrderVO.getF_mem_id());
			pstmt.setString(3, shopOrderVO.getOrder_add());
			pstmt.setString(4, shopOrderVO.getOrder_receiver());
			pstmt.setString(5, shopOrderVO.getOrder_tel());
			pstmt.setInt(6, shopOrderVO.getOrder_amount());
			pstmt.setString(7, shopOrderVO.getOrder_memo());
			pstmt.setInt(8, shopOrderVO.getOrder_payment());
			
			
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
	public void update(ShopOrderVO shopOrderVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

//			"UPDATE `SHOP_ORDER`"
//			+ "SET"
//			1+"`ORDER_ADD` = ?,"
//			2+"`ORDER_RECEIVER` = ?,"
//			3+"`ORDER_TEL` = ?,"
//			4+"`ORDER_MEMO` = ?,"
//			5+"`ORDER_STATE` = ?,"
//			6+"`ORDER_SHIP_DATE` = ?," 
//			7+"`ORDER_FINISH_DATE` = ?," 
//			8+"`ORDER_CANCEL_DATE` = ?" 
//			9+" WHERE `ORDER_ID` = ?";
			
			pstmt.setString(1, shopOrderVO.getOrder_add());
			pstmt.setString(2, shopOrderVO.getOrder_receiver());
			pstmt.setString(3, shopOrderVO.getOrder_tel());
			pstmt.setString(4, shopOrderVO.getOrder_memo());
			pstmt.setInt(5, shopOrderVO.getOrder_state());
			pstmt.setDate(6, shopOrderVO.getOrder_ship_date());
			pstmt.setDate(7, shopOrderVO.getOrder_finish_date());
			pstmt.setDate(8, shopOrderVO.getOrder_cancel_date());

			pstmt.setInt(9, shopOrderVO.getOrder_id());
			
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
	public ShopOrderVO findByPrimaryKey(Integer order_id) {

		ShopOrderVO shoporderVO = null;
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

//				"SELECT order_id,"
//						+ "`MEM_ID`,"
//						+ "`F_MEM_ID`,"
//						+ "`ORDER_ADD`,"
//						+ "`ORDER_RECEIVER`,"
//						+ "`ORDER_TEL`,"
//						+ "`ORDER_AMOUNT`,"
//						+ "`ORDER_MEMO`,"
//						+ "`ORDER_PAYMENT`,"
//						+ "`ORDER_STATE`,"
//						+ "`ORDER_DATE`,"
//						+ "`ORDER_SHIP_DATE`, "
//						+ "`ORDER_FINISH_DATE`, "
//						+ "`ORDER_CANCEL_DATE`, "
//						+ "FROM `SHOP_ORDER` WHERE `ORDER_ID` = ?";
				
				shoporderVO = new ShopOrderVO();
				shoporderVO.setOrder_id(rs.getInt("order_id"));
				shoporderVO.setMem_id(rs.getInt("mem_id"));
				shoporderVO.setF_mem_id(rs.getInt("f_mem_id"));
				shoporderVO.setOrder_add(rs.getString("order_add"));
				shoporderVO.setOrder_receiver(rs.getString("order_receiver"));
				shoporderVO.setOrder_tel(rs.getString("order_tel"));
				shoporderVO.setOrder_amount(rs.getInt("order_amount"));
				shoporderVO.setOrder_memo(rs.getString("order_memo"));
				shoporderVO.setOrder_payment(rs.getInt("order_payment"));
				shoporderVO.setOrder_state(rs.getInt("order_state"));
				shoporderVO.setOrder_date(rs.getDate("order_date"));
				shoporderVO.setOrder_ship_date(rs.getDate("order_ship_date"));
				shoporderVO.setOrder_finish_date(rs.getDate("order_finish_date"));
				shoporderVO.setOrder_cancel_date(rs.getDate("order_cancel_date"));
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
		return shoporderVO;
	}

	@Override
	public List<ShopOrderVO> getAll() {
		List<ShopOrderVO> list = new ArrayList<ShopOrderVO>();
		ShopOrderVO shoporderVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {

//		"SELECT order_id,"
//		+ "`MEM_ID`,"
//		+ "`F_MEM_ID`,"
//		+ "`ORDER_ADD`,"
//		+ "`ORDER_RECEIVER`,"
//		+ "`ORDER_TEL`,"
//		+ "`ORDER_AMOUNT`,"
//		+ "`ORDER_MEMO`,"
//		+ "`ORDER_PAYMENT`,"
//		+ "`ORDER_STATE`,"
//		+ "`ORDER_DATE`,"
//		+ "`ORDER_SHIP_DATE`, "
//		+ "`ORDER_FINISH_DATE`, "
//		+ "`ORDER_CANCEL_DATE`, "
//		+ "FROM `SHOP_ORDER`";
	
				shoporderVO = new ShopOrderVO();
				shoporderVO.setOrder_id(rs.getInt("order_id"));
				shoporderVO.setMem_id(rs.getInt("mem_id"));
				shoporderVO.setF_mem_id(rs.getInt("f_mem_id"));
				shoporderVO.setOrder_add(rs.getString("order_add"));
				shoporderVO.setOrder_receiver(rs.getString("order_receiver"));
				shoporderVO.setOrder_tel(rs.getString("order_tel"));
				shoporderVO.setOrder_amount(rs.getInt("order_amount"));
				shoporderVO.setOrder_memo(rs.getString("order_memo"));
				shoporderVO.setOrder_payment(rs.getInt("order_payment"));
				shoporderVO.setOrder_state(rs.getInt("order_state"));
				shoporderVO.setOrder_date(rs.getDate("order_date"));
				shoporderVO.setOrder_ship_date(rs.getDate("order_ship_date"));
				shoporderVO.setOrder_finish_date(rs.getDate("order_finish_date"));
				shoporderVO.setOrder_cancel_date(rs.getDate("order_cancel_date"));
				list.add(shoporderVO); // Store the row in the list
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
	public List<ShopOrderVO> getAllMemOrder(Integer mem_id) {
		List<ShopOrderVO> list = new ArrayList<ShopOrderVO>();
		ShopOrderVO shoporderVO = null;

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

//				"SELECT `ORDER_ID`,"
//						+ "`MEM_ID`,"
//						+ "`F_MEM_id`,"
//						+ "`ORDER_ADD`,"
//						+ "`ORDER_RECEIVER`,"
//						+ "`ORDER_TEL`,"
//						+ "`ORDER_AMOUNT`,"
//						+ "`ORDER_MEMO`,"
//						+ "`ORDER_PAYMENT`,"
//						+ "`ORDER_STATE`,"
//						+ "`ORDER_ORDER_DATE`,"
//						+ "`ORDER_SHIP_DATE`,"
//						+ "`ORDER_FINISH_DATE`,"
//						+ "`ORDER_CANCEL_DATE`,"
//						+ "FROM `SHOP_ORDER` WHERE `MEM_ID` = ?";
				
				shoporderVO = new ShopOrderVO();
				shoporderVO.setOrder_id(rs.getInt("order_id"));
				shoporderVO.setMem_id(rs.getInt("mem_id"));
				shoporderVO.setF_mem_id(rs.getInt("f_mem_id"));
				shoporderVO.setOrder_add(rs.getString("order_add"));
				shoporderVO.setOrder_receiver(rs.getString("order_receiver"));
				shoporderVO.setOrder_tel(rs.getString("order_tel"));
				shoporderVO.setOrder_amount(rs.getInt("order_amount"));
				shoporderVO.setOrder_memo(rs.getString("order_memo"));
				shoporderVO.setOrder_payment(rs.getInt("order_payment"));
				shoporderVO.setOrder_state(rs.getInt("order_state"));
				shoporderVO.setOrder_date(rs.getDate("order_date"));
				shoporderVO.setOrder_ship_date(rs.getDate("order_ship_date"));
				shoporderVO.setOrder_finish_date(rs.getDate("order_finish_date"));
				shoporderVO.setOrder_cancel_date(rs.getDate("order_cancel_date"));
				list.add(shoporderVO);
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
	public List<ShopOrderVO> getAllFmemOrder(Integer f_mem_id) {
		List<ShopOrderVO> list = new ArrayList<ShopOrderVO>();
		ShopOrderVO shoporderVO = null;

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

//				"SELECT `ORDER_ID`,"
//						+ "`MEM_ID`,"
//						+ "`F_MEM_id`,"
//						+ "`ORDER_ADD`,"
//						+ "`ORDER_RECEIVER`,"
//						+ "`ORDER_TEL`,"
//						+ "`ORDER_AMOUNT`,"
//						+ "`ORDER_MEMO`,"
//						+ "`ORDER_PAYMENT`,"
//						+ "`ORDER_STATE`,"
//						+ "`ORDER_ORDER_DATE`,"
//						+ "`ORDER_SHIP_DATE`,"
//						+ "`ORDER_FINISH_DATE`,"
//						+ "`ORDER_CANCEL_DATE`"
//						+ "FROM `SHOP_ORDER` WHERE `F_MEM_ID` = ?";
				
				shoporderVO = new ShopOrderVO();
				shoporderVO.setOrder_id(rs.getInt("order_id"));
				shoporderVO.setMem_id(rs.getInt("mem_id"));
				shoporderVO.setF_mem_id(rs.getInt("f_mem_id"));
				shoporderVO.setOrder_add(rs.getString("order_add"));
				shoporderVO.setOrder_receiver(rs.getString("order_receiver"));
				shoporderVO.setOrder_tel(rs.getString("order_tel"));
				shoporderVO.setOrder_amount(rs.getInt("order_amount"));
				shoporderVO.setOrder_memo(rs.getString("order_memo"));
				shoporderVO.setOrder_payment(rs.getInt("order_payment"));
				shoporderVO.setOrder_state(rs.getInt("order_state"));
				shoporderVO.setOrder_date(rs.getDate("order_date"));
				shoporderVO.setOrder_ship_date(rs.getDate("order_ship_date"));
				shoporderVO.setOrder_finish_date(rs.getDate("order_finish_date"));
				shoporderVO.setOrder_cancel_date(rs.getDate("order_cancel_date"));
				list.add(shoporderVO);
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
	
	/////////////////////////////////////////////////////////////
//	????????????????????????????????????
	@Override
	public void insertWithOrderDetails(ShopOrderVO shopOrderVO , List<ShopOrderDetailsVO> list) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			
			// 1???????????? pstm.executeUpdate()??????
    		con.setAutoCommit(false);
			
    		// ???????????????
			String cols[] = {"ORDER_ID"};
			pstmt = con.prepareStatement(INSERT_STMT , cols);			
			
			pstmt.setInt(1, shopOrderVO.getMem_id());
			pstmt.setInt(2, shopOrderVO.getF_mem_id());
			pstmt.setString(3, shopOrderVO.getOrder_add());
			pstmt.setString(4, shopOrderVO.getOrder_receiver());
			pstmt.setString(5, shopOrderVO.getOrder_tel());
			pstmt.setInt(6, shopOrderVO.getOrder_amount());
			pstmt.setString(7, shopOrderVO.getOrder_memo());
			pstmt.setInt(8, shopOrderVO.getOrder_payment());
			
Statement stmt=	con.createStatement();
//stmt.executeUpdate("set auto_increment_offset=10;");    //????????????-?????????
//stmt.executeUpdate("set auto_increment_increment=10;"); //????????????-??????
			pstmt.executeUpdate();
			//??????????????????????????????
			String next_order_id = null;
			ResultSet rs = pstmt.getGeneratedKeys();
			if (rs.next()) {
				next_order_id = rs.getString(1);
				System.out.println("???????????????= " + next_order_id +"(??????????????????????????????)");
			} else {
				System.out.println("????????????????????????");
			}
			rs.close();
			// ???????????????????????????
			ShopOrderDetailsJDBCDAO dao = new ShopOrderDetailsJDBCDAO();
			System.out.println("list.size()-A="+list.size());
			for (ShopOrderDetailsVO aShopOrderDetails : list) {
				aShopOrderDetails.setOrder_id(new Integer(next_order_id)) ;
				dao.insert2(aShopOrderDetails,con);
			}

			// 2???????????? pstm.executeUpdate()??????
			con.commit();
			con.setAutoCommit(true);
			System.out.println("list.size()-B="+list.size());
			System.out.println("??????????????????" + next_order_id + "???,??????????????????" + list.size()
					+ "??????????????????");
			
			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			if (con != null) {
				try {
					// 3??????????????????exception????????????catch?????????
					System.err.print("Transaction is being ");
					System.err.println("rolled back-???-order");
					con.rollback();
				} catch (SQLException excep) {
					throw new RuntimeException("rollback error occured. "
							+ excep.getMessage());
				}
			}
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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
	
	public static void main(String[] args) {
	
		ShopOrderJDBCDAO dao = new ShopOrderJDBCDAO();
		
		ShopOrderVO shopOrderVO = new ShopOrderVO();
		shopOrderVO.setMem_id(77006);
		shopOrderVO.setF_mem_id(70003);
		shopOrderVO.setOrder_add("???????????????????????????1???");
		shopOrderVO.setOrder_receiver("??????");
		shopOrderVO.setOrder_tel("09123456789");
		shopOrderVO.setOrder_amount(1000);
		shopOrderVO.setOrder_memo("??????????????????");
		shopOrderVO.setOrder_payment(1);
		
		List<ShopOrderDetailsVO> testList = new ArrayList<ShopOrderDetailsVO>();
		
		//?????????
		ShopOrderDetailsVO shopOrderDetailsxx = new ShopOrderDetailsVO();
		shopOrderDetailsxx.setProd_id(5);
		shopOrderDetailsxx.setProd_unit("??????");
		shopOrderDetailsxx.setOrder_qty(10);
		shopOrderDetailsxx.setOrder_unit_price(20);
		shopOrderDetailsxx.setOrder_unit_amount(200);
		
		//?????????
		ShopOrderDetailsVO shopOrderDetailsyy = new ShopOrderDetailsVO();
		shopOrderDetailsyy.setProd_id(2);
		shopOrderDetailsyy.setProd_unit("??????");
		shopOrderDetailsyy.setOrder_qty(1);
		shopOrderDetailsyy.setOrder_unit_price(20);
		shopOrderDetailsyy.setOrder_unit_amount(20);
		
		testList.add(shopOrderDetailsxx);
		testList.add(shopOrderDetailsyy);
		
		dao.insertWithOrderDetails(shopOrderVO, testList);
		
	}

}
