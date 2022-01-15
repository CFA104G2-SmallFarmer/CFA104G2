package com.farmTravelReport.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FarmTravelReportJDBCDAO implements FarmTravelReportDAO{

    public static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    public static final String URL = "jdbc:mysql://localhost:3306/JDBCSample?serverTimezone=Asia/Taipei";
    public static final String USER = "root";
    public static final String PASSWORD = "password";

    public static final String INSERT_STMT = "INSERT INTO FARM_TRAVEL_REPORT ( MEM_ID, FARM_TRAVEL_ID, REPORT_REASON, REPORT_TIME, REPORT_STATE ) VALUES ( ?, ?, ?, NOW(), '0' );";
    public static final String UPDATE_STMT = "UPDATE FARM_TRAVEL_REPORT SET REPORT_STATE = ?, REPORT_NOTE = ? WHERE REPORT_ID = ?;";
    public static final String DELETE_STMT = "DELETE FROM FARM_TRAVEL_REPORT WHERE REPORT_ID = ?;";
    public static final String GET_ONE_STMT = "SELECT * FROM FARM_TRAVEL_REPORT WHERE REPORT_ID = ?;";
    public static final String GET_ALL_STMT = "SELECT * FROM FARM_TRAVEL_REPORT;";

    static {
        try {
            Class.forName(DRIVER);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void add(FarmTravelReportVO farm_travel_report) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            pstmt = con.prepareStatement(INSERT_STMT);

            pstmt.setInt(1, farm_travel_report.getMem_ID());
            pstmt.setInt(2, farm_travel_report.getFarm_travel_ID());
            pstmt.setString(3, farm_travel_report.getReport_reason());

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
    public void update(FarmTravelReportVO farm_travel_report) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            pstmt = con.prepareStatement(UPDATE_STMT);

            pstmt.setInt(1,farm_travel_report.getReport_state());
            pstmt.setString(2, farm_travel_report.getReport_note());
            pstmt.setInt(3,farm_travel_report.getReport_ID());

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

//    @Override
//    public void delete(int report_ID) {
//        Connection con = null;
//        PreparedStatement pstmt = null;
//
//        try {
//            con = DriverManager.getConnection(URL, USER, PASSWORD);
//            pstmt = con.prepareStatement(DELETE_STMT);
//
//            pstmt.setInt(1, report_ID);
//
//            pstmt.executeUpdate();
//
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }finally {
//            if (pstmt != null) {
//                try {
//                    pstmt.close();
//                } catch (SQLException se) {
//                    se.printStackTrace(System.err);
//                }
//            }
//            if (con != null) {
//                try {
//                    con.close();
//                } catch (Exception e) {
//                    e.printStackTrace(System.err);
//                }
//            }
//        }
//    }

    @Override
    public FarmTravelReportVO findByPK(int report_ID) {
        FarmTravelReportVO farm_travel_report = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            pstmt = con.prepareStatement(GET_ONE_STMT);

            pstmt.setInt(1, report_ID);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                farm_travel_report = new FarmTravelReportVO();
                farm_travel_report.setReport_ID(rs.getInt("REPORT_ID"));
                farm_travel_report.setMem_ID(rs.getInt("MEM_ID"));
                farm_travel_report.setFarm_travel_ID(rs.getInt("FARM_TRAVEL_ID"));
                farm_travel_report.setReport_reason(rs.getString("REPORT_REASON"));
                farm_travel_report.setReport_time(rs.getDate("REPORT_TIME"));
                farm_travel_report.setReport_state(rs.getInt("REPORT_STATE"));
                farm_travel_report.setReport_note(rs.getString("REPORT_NOTE"));
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
        return farm_travel_report;
    }

    @Override
    public List<FarmTravelReportVO> getAll() {
        List<FarmTravelReportVO> farm_travel_report_list = new ArrayList<>();
        FarmTravelReportVO farm_travel_report = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            pstmt = con.prepareStatement(GET_ALL_STMT);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                farm_travel_report = new FarmTravelReportVO();
                farm_travel_report.setReport_ID(rs.getInt("REPORT_ID"));
                farm_travel_report.setMem_ID(rs.getInt("MEM_ID"));
                farm_travel_report.setFarm_travel_ID(rs.getInt("FARM_TRAVEL_ID"));
                farm_travel_report.setReport_reason(rs.getString("REPORT_REASON"));
                farm_travel_report.setReport_time(rs.getDate("REPORT_TIME"));
                farm_travel_report.setReport_state(rs.getInt("REPORT_STATE"));
                farm_travel_report.setReport_note(rs.getString("REPORT_NOTE"));
                farm_travel_report_list.add(farm_travel_report);
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
        return farm_travel_report_list;
    }
}
