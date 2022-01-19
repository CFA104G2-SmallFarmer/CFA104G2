package com.farmTravelTagDetails.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class FarmTravelTagDetailsJDBCDAO implements FarmTravelTagDetailsDAO {

    public static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    public static final String URL = "jdbc:mysql://localhost:3306/CFA104G2?serverTimezone=Asia/Taipei";
    public static final String USER = "root";
    public static final String PASSWORD = "password";

    public static final String INSERT_STMT = "INSERT INTO FARM_TRAVEL_TAG_DETAILS ( FARM_TRAVEL_ID, TAG_ID ) VALUES ( ?, '1' );";
    public static final String DELETE_STMT = "DELETE FROM FARM_TRAVEL_TAG_DETAILS WHERE FARM_TRAVEL_ID = ? and TAG_ID = ?;";
    public static final String GET_BY_FARM_TRAVEL_STMT = "SELECT * FROM FARM_TRAVEL_TAG_DETAILS WHERE FARM_TRAVEL_ID = ?;";
    public static final String GET_BY_TAG_STMT = "SELECT * FROM FARM_TRAVEL_TAG_DETAILS WHERE TAG_ID = ?;";

    static {
        try {
            Class.forName(DRIVER);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void add(FarmTravelTagDetailsVO farm_travel_tag_details) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            pstmt = con.prepareStatement(INSERT_STMT);

            pstmt.setInt(1, farm_travel_tag_details.getFarm_travel_ID());

            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
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
    public void update(FarmTravelTagDetailsVO farm_travel_tag_details) {

    }

    @Override
    public void delete(int farm_travel_ID, int tag_ID) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            pstmt = con.prepareStatement(DELETE_STMT);

            pstmt.setInt(1, farm_travel_ID);
            pstmt.setInt(1, tag_ID);

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
    public List<FarmTravelTagDetailsVO> getTagByFarmTravelID(int farm_travel_ID) {
        List<FarmTravelTagDetailsVO> farm_travel_tag_details_list = new ArrayList<>();
        FarmTravelTagDetailsVO farm_travel_tag_details = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            pstmt = con.prepareStatement(GET_BY_FARM_TRAVEL_STMT);

            pstmt.setInt(1, farm_travel_ID);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                farm_travel_tag_details = new FarmTravelTagDetailsVO();
                farm_travel_tag_details.setFarm_travel_ID(rs.getInt("FARM_TRAVEL_ID"));
                farm_travel_tag_details.setTag_ID(rs.getInt("TAG_ID"));
                farm_travel_tag_details_list.add(farm_travel_tag_details);
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
        return farm_travel_tag_details_list;
    }

    @Override
    public List<FarmTravelTagDetailsVO> getFarmTravelByTagID(int tag_ID) {
        List<FarmTravelTagDetailsVO> farm_travel_tag_details_list = new ArrayList<>();
        FarmTravelTagDetailsVO farm_travel_tag_details = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            pstmt = con.prepareStatement(GET_BY_TAG_STMT);

            pstmt.setInt(1, tag_ID);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                farm_travel_tag_details = new FarmTravelTagDetailsVO();
                farm_travel_tag_details.setFarm_travel_ID(rs.getInt("FARM_TRAVEL_ID"));
                farm_travel_tag_details.setTag_ID(rs.getInt("TAG_ID"));
                farm_travel_tag_details_list.add(farm_travel_tag_details);
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
        return farm_travel_tag_details_list;
    }
}
