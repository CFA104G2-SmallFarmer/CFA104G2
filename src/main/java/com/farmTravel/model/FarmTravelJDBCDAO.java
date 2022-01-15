package com.farmTravel.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FarmTravelJDBCDAO implements FarmTravelDAO{

    public static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    public static final String URL = "jdbc:mysql://localhost:3306/JDBCSample?serverTimezone=Asia/Taipei";
    public static final String USER = "root";
    public static final String PASSWORD = "password";

    public static final String INSERT_STMT = "INSERT INTO FARM_TRAVEL ( MEM_ID, F_MEM_ID, FARM_TRAVEL_TITLE, FARM_TRAVEL_IMG, FARM_TRAVEL_INFO, FARM_TRAVEL_START, FARM_TRAVEL_END, FARM_TRAVEL_FEE, APPLY_START, APPLY_END, FARM_TRAVEL_MIN, FARM_TRAVEL_MAX, FARM_TRAVEL_NOW, FARM_TRAVEL_STATE ) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, '0', '0' );";
    public static final String UPDATE_STMT = "UPDATE FARM_TRAVEL SET FARM_TRAVEL_TITLE = ?, FARM_TRAVEL_IMG = ?, FARM_TRAVEL_INFO = ?, FARM_TRAVEL_START = ?, FARM_TRAVEL_END = ?, FARM_TRAVEL_FEE = ?, APPLY_START = ?, APPLY_END = ?, FARM_TRAVEL_MIN = ?, FARM_TRAVEL_MAX = ?, FARM_TRAVEL_NOW = ?, FARM_TRAVEL_STATE = ? WHERE FARM_TRAVEL_ID = ?;";
    public static final String DELETE_STMT = "DELETE FROM FARM_TRAVEL WHERE FARM_TRAVEL_ID = ?;";
    public static final String GET_ONE_STMT = "SELECT * FROM FARM_TRAVEL WHERE FARM_TRAVEL_ID = ?;";
    public static final String GET_ALL_STMT = "SELECT * FROM FARM_TRAVEL;";

    static {
        try {
            Class.forName(DRIVER);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void add(FarmTravelVO farm_travel) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            pstmt = con.prepareStatement(INSERT_STMT);

            pstmt.setInt(1, farm_travel.getMem_ID());
            pstmt.setInt(2, farm_travel.getF_mem_ID());
            pstmt.setString(3, farm_travel.getFarm_travel_title());
            pstmt.setBytes(4, farm_travel.getFarm_travel_img());
            pstmt.setString(5, farm_travel.getFarm_travel_info());
            pstmt.setDate(6, farm_travel.getFarm_travel_start());
            pstmt.setDate(7, farm_travel.getFarm_travel_end());
            pstmt.setInt(8, farm_travel.getFarm_travel_fee());
            pstmt.setDate(9, farm_travel.getTravel_apply_start());
            pstmt.setDate(10, farm_travel.getTravel_apply_end());
            pstmt.setInt(11, farm_travel.getFarm_travel_min());
            pstmt.setInt(12, farm_travel.getFarm_travel_max());

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
    public void update(FarmTravelVO farm_travel) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            pstmt = con.prepareStatement(UPDATE_STMT);

            pstmt.setString(1,farm_travel.getFarm_travel_title());
            pstmt.setBytes(2, farm_travel.getFarm_travel_img());
            pstmt.setString(3,farm_travel.getFarm_travel_info());
            pstmt.setDate(4, farm_travel.getFarm_travel_start());
            pstmt.setDate(5, farm_travel.getFarm_travel_end());
            pstmt.setInt(6, farm_travel.getFarm_travel_fee());
            pstmt.setDate(7, farm_travel.getTravel_apply_start());
            pstmt.setDate(8, farm_travel.getTravel_apply_end());
            pstmt.setInt(9, farm_travel.getFarm_travel_min());
            pstmt.setInt(10, farm_travel.getFarm_travel_max());
            pstmt.setInt(11, farm_travel.getFarm_travel_now());
            pstmt.setInt(12, farm_travel.getFarm_travel_state());
            pstmt.setInt(13, farm_travel.getFarm_travel_ID());

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
    public void delete(int farm_travel_ID) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            pstmt = con.prepareStatement(DELETE_STMT);

            pstmt.setInt(1, farm_travel_ID);

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
    public FarmTravelVO findByPK(int farm_travel_ID) {
        FarmTravelVO farm_travel = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            pstmt = con.prepareStatement(GET_ONE_STMT);

            pstmt.setInt(1, farm_travel_ID);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                farm_travel = new FarmTravelVO();
                farm_travel.setFarm_travel_ID(rs.getInt("FARM_TRAVEL_ID"));
                farm_travel.setMem_ID(rs.getInt("MEM_ID"));
                farm_travel.setF_mem_ID(rs.getInt("F_MEM_ID"));
                farm_travel.setFarm_travel_title(rs.getString("FARM_TRAVEL_TITLE"));
                farm_travel.setFarm_travel_img(rs.getBytes("FARM_TRAVEL_IMG"));
                farm_travel.setFarm_travel_info(rs.getString("FARM_TRAVEL_INFO"));
                farm_travel.setFarm_travel_start(rs.getDate("FARM_TRAVEL_START"));
                farm_travel.setFarm_travel_end(rs.getDate("FARM_TRAVEL_END"));
                farm_travel.setFarm_travel_fee(rs.getInt("FARM_TRAVEL_FEE"));
                farm_travel.setTravel_apply_start(rs.getDate("TRAVEL_APPLY_START"));
                farm_travel.setTravel_apply_end(rs.getDate("TRAVEL_APPLY_END"));
                farm_travel.setFarm_travel_min(rs.getInt("FARM_TRAVEL_MIN"));
                farm_travel.setFarm_travel_max(rs.getInt("FARM_TRAVEL_MAX"));
                farm_travel.setFarm_travel_now(rs.getInt("FARM_TRAVEL_NOW"));
                farm_travel.setFarm_travel_state(rs.getInt("FARM_TRAVEL_STATE"));
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
        return farm_travel;
    }

    @Override
    public List<FarmTravelVO> getAll() {
        List<FarmTravelVO> farm_travel_list = new ArrayList<>();
        FarmTravelVO farm_travel = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            pstmt = con.prepareStatement(GET_ALL_STMT);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                farm_travel = new FarmTravelVO();
                farm_travel.setFarm_travel_ID(rs.getInt("FARM_TRAVEL_ID"));
                farm_travel.setMem_ID(rs.getInt("MEM_ID"));
                farm_travel.setF_mem_ID(rs.getInt("F_MEM_ID"));
                farm_travel.setFarm_travel_title(rs.getString("FARM_TRAVEL_TITLE"));
                farm_travel.setFarm_travel_img(rs.getBytes("FARM_TRAVEL_IMG"));
                farm_travel.setFarm_travel_info(rs.getString("FARM_TRAVEL_INFO"));
                farm_travel.setFarm_travel_start(rs.getDate("FARM_TRAVEL_START"));
                farm_travel.setFarm_travel_end(rs.getDate("FARM_TRAVEL_END"));
                farm_travel.setFarm_travel_fee(rs.getInt("FARM_TRAVEL_FEE"));
                farm_travel.setTravel_apply_start(rs.getDate("TRAVEL_APPLY_START"));
                farm_travel.setTravel_apply_end(rs.getDate("TRAVEL_APPLY_END"));
                farm_travel.setFarm_travel_min(rs.getInt("FARM_TRAVEL_MIN"));
                farm_travel.setFarm_travel_max(rs.getInt("FARM_TRAVEL_MAX"));
                farm_travel.setFarm_travel_now(rs.getInt("FARM_TRAVEL_NOW"));
                farm_travel.setFarm_travel_state(rs.getInt("FARM_TRAVEL_STATE"));
                farm_travel_list.add(farm_travel);
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
        return farm_travel_list;
    }
}
