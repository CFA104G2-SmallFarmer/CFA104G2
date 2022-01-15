package com.farmTravelPartner.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FarmTravelPartnerJDBCDAO implements FarmTravelPartnerDAO{

    public static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    public static final String URL = "jdbc:mysql://localhost:3306/JDBCSample?serverTimezone=Asia/Taipei";
    public static final String USER = "root";
    public static final String PASSWORD = "password";

    public static final String INSERT_STMT = "INSERT INTO FARM_TRAVEL_PARTNER ( ORDER_ID, PARTNER_NAME, PARTNER_PHONE, GUARDIAN_NAME, GUARDIAN_PHONE, APPLY_MEM_ID ) VALUES ( ?, ?, ?, ?, ?, ? );";
    public static final String UPDATE_STMT = "UPDATE FARM_TRAVEL_PARTNER SET PARTNER_NAME = ?, PARTNER_PHONE = ?, GUARDIAN_NAME = ?, GUARDIAN_PHONE = ? WHERE PARTNER_ID = ?;";
    public static final String DELETE_STMT = "DELETE FROM FARM_TRAVEL_PARTNER WHERE PARTNER_ID = ?;";
    public static final String GET_ONE_STMT = "SELECT * FROM FARM_TRAVEL_PARTNER WHERE PARTNER_ID = ?;";
    public static final String GET_ALL_STMT = "SELECT * FROM FARM_TRAVEL_PARTNER WHERE ORDER_ID = ?;";

    static {
        try {
            Class.forName(DRIVER);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void add(FarmTravelPartnerVO farm_travel_partner) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            pstmt = con.prepareStatement(INSERT_STMT);

            pstmt.setInt(1, farm_travel_partner.getOrder_ID());
            pstmt.setString(2, farm_travel_partner.getPartner_name());
            pstmt.setString(3, farm_travel_partner.getPartner_phone());
            pstmt.setString(4, farm_travel_partner.getGuardian_name());
            pstmt.setString(5, farm_travel_partner.getGuardian_phone());
            pstmt.setInt(6, farm_travel_partner.getApply_mem_ID());

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
    public void update(FarmTravelPartnerVO farm_travel_partner) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            pstmt = con.prepareStatement(UPDATE_STMT);

            pstmt.setString(1, farm_travel_partner.getPartner_name());
            pstmt.setString(2, farm_travel_partner.getPartner_phone());
            pstmt.setString(3, farm_travel_partner.getGuardian_name());
            pstmt.setString(4, farm_travel_partner.getGuardian_phone());
            pstmt.setInt(5, farm_travel_partner.getApply_mem_ID());

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
    public void delete(int partner_id) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            pstmt = con.prepareStatement(DELETE_STMT);

            pstmt.setInt(1, partner_id);

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
    public FarmTravelPartnerVO findByPK(int partner_id) {
        FarmTravelPartnerVO farm_travel_partner = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            pstmt = con.prepareStatement(GET_ONE_STMT);

            pstmt.setInt(1, partner_id);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                farm_travel_partner = new FarmTravelPartnerVO();
                farm_travel_partner.setPartner_ID(rs.getInt("PARTNER_ID"));
                farm_travel_partner.setOrder_ID(rs.getInt("ORDER_ID"));
                farm_travel_partner.setPartner_name(rs.getString("PARTNER_NAME"));
                farm_travel_partner.setPartner_phone(rs.getString("PARTNER_PHONE"));
                farm_travel_partner.setGuardian_name(rs.getString("GUARDIAN_NAME"));
                farm_travel_partner.setGuardian_phone(rs.getString("GUARDIAN_PHONE"));
                farm_travel_partner.setApply_mem_ID(rs.getInt("APPLY_MEM_ID"));
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
        return farm_travel_partner;
    }

    @Override
    public List<FarmTravelPartnerVO> getAll(int order_ID) {
        List<FarmTravelPartnerVO> farm_travel_partner_list = new ArrayList<>();
        FarmTravelPartnerVO farm_travel_partner = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            pstmt = con.prepareStatement(GET_ALL_STMT);

            pstmt.setInt(1, order_ID);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                farm_travel_partner = new FarmTravelPartnerVO();
                farm_travel_partner.setPartner_ID(rs.getInt("PARTNER_ID"));
                farm_travel_partner.setOrder_ID(rs.getInt("ORDER_ID"));
                farm_travel_partner.setPartner_name(rs.getString("PARTNER_NAME"));
                farm_travel_partner.setPartner_phone(rs.getString("PARTNER_PHONE"));
                farm_travel_partner.setGuardian_name(rs.getString("GUARDIAN_NAME"));
                farm_travel_partner.setGuardian_phone(rs.getString("GUARDIAN_PHONE"));
                farm_travel_partner.setApply_mem_ID(rs.getInt("APPLY_MEM_ID"));
                farm_travel_partner_list.add(farm_travel_partner);
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
        return farm_travel_partner_list;
    }
}
