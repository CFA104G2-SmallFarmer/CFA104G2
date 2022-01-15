package com.farmTravelOrder.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FarmTravelOrderJDBCDAO implements FarmTravelOrderDAO{

    public static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    public static final String URL = "jdbc:mysql://localhost:3306/JDBCSample?serverTimezone=Asia/Taipei";
    public static final String USER = "root";
    public static final String PASSWORD = "password";

    public static final String INSERT_STMT = "INSERT INTO FARM_TRAVEL_ORDER ( MEM_ID, FARM_TRAVEL_ID, F_MEM_ID, ORDER_TIME, PEOPLE_NUM, ORDER_FEE, FARM_TRAVEL_START, FARM_TRAVEL_END, ORDER_STATE, ORDER_PAYMENT, ORDER_MEMO ) VALUES ( ?, ?, ?, NOW(), ?, ?, ?, ?, ?, ?, ? );";
    public static final String UPDATE_STMT = "UPDATE FARM_TRAVEL_ORDER SET ORDER_STATE = ?, ORDER_PAYMENT = ?, REFUND_TIME = ?, FARM_TRAVEL_STARS = ?, MEM_ID_STARS = ?, ORDER_MEMO = ? WHERE FARM_TRAVEL_ID = ?;";
    public static final String GET_ONE_STMT = "SELECT * FROM FARM_TRAVEL_ORDER WHERE ORDER_ID = ?;";
    public static final String GET_ALL_STMT = "SELECT * FROM FARM_TRAVEL_ORDER WHERE MEM_ID = ?;";

    static {
        try {
            Class.forName(DRIVER);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void add(FarmTravelOrderVO farm_travel_order) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            pstmt = con.prepareStatement(INSERT_STMT);

            pstmt.setInt(1, farm_travel_order.getMem_ID());
            pstmt.setInt(2, farm_travel_order.getFarm_travel_ID());
            pstmt.setInt(3, farm_travel_order.getF_mem_ID());
            pstmt.setInt(4, farm_travel_order.getPeople_num());
            pstmt.setInt(5, farm_travel_order.getOrder_fee());
            pstmt.setDate(6, farm_travel_order.getFarm_travel_start());
            pstmt.setDate(7, farm_travel_order.getFarm_travel_end());
            pstmt.setInt(8, farm_travel_order.getOrder_state());
            pstmt.setInt(9, farm_travel_order.getOrder_payment());
            pstmt.setString(10, farm_travel_order.getOrder_memo());

            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
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
    public void update(FarmTravelOrderVO farm_travel_order) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            pstmt = con.prepareStatement(UPDATE_STMT);

            pstmt.setInt(1, farm_travel_order.getOrder_state());
            pstmt.setInt(2, farm_travel_order.getOrder_payment());
            pstmt.setDate(3, farm_travel_order.getRefund_time());
            pstmt.setInt(4, farm_travel_order.getFarm_travel_stars());
            pstmt.setInt(5, farm_travel_order.getMem_ID_stars());
            pstmt.setString(6, farm_travel_order.getOrder_memo());
            pstmt.setInt(7, farm_travel_order.getFarm_travel_ID());

            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
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
    public FarmTravelOrderVO findByPK(int order_ID) {
        FarmTravelOrderVO farm_travel_order = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            pstmt = con.prepareStatement(GET_ONE_STMT);

            pstmt.setInt(1, order_ID);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                farm_travel_order = new FarmTravelOrderVO();
                farm_travel_order.setOrder_ID(rs.getInt("ORDER_ID"));
                farm_travel_order.setMem_ID(rs.getInt("MEM_ID"));
                farm_travel_order.setFarm_travel_ID(rs.getInt("FARM_TRAVEL_ID"));
                farm_travel_order.setF_mem_ID(rs.getInt("F_MEM_ID"));
                farm_travel_order.setOrder_time(rs.getDate("ORDER_TIME"));
                farm_travel_order.setPeople_num(rs.getInt("PEOPLE_NUM"));
                farm_travel_order.setOrder_fee(rs.getInt("ORDER_FEE"));
                farm_travel_order.setFarm_travel_start(rs.getDate("FARM_TRAVEL_START"));
                farm_travel_order.setFarm_travel_end(rs.getDate("FARM_TRAVEL_END"));
                farm_travel_order.setOrder_state(rs.getInt("ORDER_STATE"));
                farm_travel_order.setOrder_payment(rs.getInt("ORDER_PAYMENT"));
                farm_travel_order.setRefund_time(rs.getDate("REFUND_TIME"));
                farm_travel_order.setFarm_travel_stars(rs.getInt("FARM_TRAVEL_STARS"));
                farm_travel_order.setMem_ID_stars(rs.getInt("MEM_ID_STARS"));
                farm_travel_order.setOrder_memo(rs.getString("ORDER_MEMO"));
            }
        } catch (SQLException se) {
            se.printStackTrace();
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
        return farm_travel_order;
    }

    @Override
    public List<FarmTravelOrderVO> getAll(int mem_ID) {
        List<FarmTravelOrderVO> farm_travel_order_list = new ArrayList<>();
        FarmTravelOrderVO farm_travel_order = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            pstmt = con.prepareStatement(GET_ALL_STMT);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                farm_travel_order = new FarmTravelOrderVO();
                farm_travel_order.setOrder_ID(rs.getInt("ORDER_ID"));
                farm_travel_order.setMem_ID(rs.getInt("MEM_ID"));
                farm_travel_order.setFarm_travel_ID(rs.getInt("FARM_TRAVEL_ID"));
                farm_travel_order.setF_mem_ID(rs.getInt("F_MEM_ID"));
                farm_travel_order.setOrder_time(rs.getDate("ORDER_TIME"));
                farm_travel_order.setPeople_num(rs.getInt("PEOPLE_NUM"));
                farm_travel_order.setOrder_fee(rs.getInt("ORDER_FEE"));
                farm_travel_order.setFarm_travel_start(rs.getDate("FARM_TRAVEL_START"));
                farm_travel_order.setFarm_travel_end(rs.getDate("FARM_TRAVEL_END"));
                farm_travel_order.setOrder_state(rs.getInt("ORDER_STATE"));
                farm_travel_order.setOrder_payment(rs.getInt("ORDER_PAYMENT"));
                farm_travel_order.setRefund_time(rs.getDate("REFUND_TIME"));
                farm_travel_order.setFarm_travel_stars(rs.getInt("FARM_TRAVEL_STARS"));
                farm_travel_order.setMem_ID_stars(rs.getInt("MEM_ID_STARS"));
                farm_travel_order.setOrder_memo(rs.getString("ORDER_MEMO"));
                farm_travel_order_list.add(farm_travel_order);
            }
        } catch (SQLException se) {
            se.printStackTrace();
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
        return farm_travel_order_list;
    }
}
