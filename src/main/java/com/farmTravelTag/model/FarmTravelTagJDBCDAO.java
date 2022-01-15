package com.farmTravelTag.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FarmTravelTagJDBCDAO implements FarmTravelTagDAO{

    public static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    public static final String URL = "jdbc:mysql://localhost:3306/JDBCSample?serverTimezone=Asia/Taipei";
    public static final String USER = "root";
    public static final String PASSWORD = "password";

    public static final String INSERT_STMT = "INSERT INTO FARM_TRAVEL_TAG ( TAG_NAME, TAG_TIMES ) VALUES ( ?, '1' );";
    public static final String UPDATE_STMT = "UPDATE FARM_TRAVEL_TAG SET TAG_NAME = ?, TAG_TIMES = ? WHERE TAG_ID = ?;";
    public static final String DELETE_STMT = "DELETE FROM FARM_TRAVEL_TAG WHERE TAG_ID = ?;";
    public static final String GET_ONE_STMT = "SELECT * FROM FARM_TRAVEL_TAG WHERE TAG_ID = ?;";
    public static final String GET_ALL_STMT = "SELECT * FROM FARM_TRAVEL_TAG;";

    static {
        try {
            Class.forName(DRIVER);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void add(FarmTravelTagVO farm_travel_tag) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            pstmt = con.prepareStatement(INSERT_STMT);

            pstmt.setString(1, farm_travel_tag.getTag_name());

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
    public void update(FarmTravelTagVO farm_travel_tag) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            pstmt = con.prepareStatement(UPDATE_STMT);

            pstmt.setString(1,farm_travel_tag.getTag_name());
            pstmt.setInt(2, farm_travel_tag.getTag_times());
            pstmt.setInt(3, farm_travel_tag.getTag_ID());

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
    public void delete(int tag_ID) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            pstmt = con.prepareStatement(DELETE_STMT);

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
    public FarmTravelTagVO findByPK(int tag_ID) {
        FarmTravelTagVO farm_travel_tag = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            pstmt = con.prepareStatement(GET_ONE_STMT);

            pstmt.setInt(1, tag_ID);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                farm_travel_tag = new FarmTravelTagVO();
                farm_travel_tag.setTag_ID(rs.getInt("TAG_ID"));
                farm_travel_tag.setTag_name(rs.getString("TAG_NAME"));
                farm_travel_tag.setTag_times(rs.getInt("TAG_TIMES"));
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
        return farm_travel_tag;
    }

    @Override
    public List<FarmTravelTagVO> getAll() {
        List<FarmTravelTagVO> farm_travel_tag_list = new ArrayList<>();
        FarmTravelTagVO farm_travel_tag = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            pstmt = con.prepareStatement(GET_ALL_STMT);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                farm_travel_tag = new FarmTravelTagVO();
                farm_travel_tag.setTag_ID(rs.getInt("TAG_ID"));
                farm_travel_tag.setTag_name(rs.getString("TAG_NAME"));
                farm_travel_tag.setTag_times(rs.getInt("TAG_TIMES"));
                farm_travel_tag_list.add(farm_travel_tag);
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
        return farm_travel_tag_list;
    }
}
