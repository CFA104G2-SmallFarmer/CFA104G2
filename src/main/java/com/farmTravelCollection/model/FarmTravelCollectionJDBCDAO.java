package com.farmTravelCollection.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FarmTravelCollectionJDBCDAO implements FarmTravelCollectionDAO{

    public static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    public static final String URL = "jdbc:mysql://localhost:3306/CFA104G2?serverTimezone=Asia/Taipei";
    public static final String USER = "root";
    public static final String PASSWORD = "password";

    public static final String INSERT_STMT = "INSERT INTO FARM_TRAVEL_COLLECTION ( MEM_ID, FARM_TRAVEL_ID, COLLECTION_TIME ) VALUES ( ?, ?, NOW() );";
    public static final String DELETE_STMT = "DELETE FROM FARM_TRAVEL_COLLECTION WHERE MEM_ID = ? AND FARM_TRAVEL_ID = ?;";
    public static final String GET_ALL_STMT = "SELECT * FROM FARM_TRAVEL_COLLECTION WHERE MEM_ID = ?;";

    static {
        try {
            Class.forName(DRIVER);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    @Override
    public void add(FarmTravelCollectionVO farm_travel_collection) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            pstmt = con.prepareStatement(INSERT_STMT);

            pstmt.setInt(1, farm_travel_collection.getMem_ID());
            pstmt.setInt(2, farm_travel_collection.getFarm_travel_ID());

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
    public void delete(int mem_ID, int farm_travel_ID) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            pstmt = con.prepareStatement(DELETE_STMT);

            pstmt.setInt(1, mem_ID);
            pstmt.setInt(2, farm_travel_ID);

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
    public List<FarmTravelCollectionVO> getAll(int mem_ID) {
        List<FarmTravelCollectionVO> farm_travel_collection_list = new ArrayList<>();
        FarmTravelCollectionVO farm_travel_collection = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            pstmt = con.prepareStatement(GET_ALL_STMT);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                farm_travel_collection = new FarmTravelCollectionVO();
                farm_travel_collection.setMem_ID(rs.getInt("MEM_ID"));
                farm_travel_collection.setFarm_travel_ID(rs.getInt("FARM_TRAVEL_ID"));
                farm_travel_collection.setCollection_time(rs.getDate("COLLECTION_TIME"));

                farm_travel_collection_list.add(farm_travel_collection);
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
        return farm_travel_collection_list;
    }
}
