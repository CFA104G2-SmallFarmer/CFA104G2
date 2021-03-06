package com.farmTravel.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FarmTravelJDBCDAO implements FarmTravelDAO{

    public static final String INSERT_STMT = "INSERT INTO FARM_TRAVEL ( MEM_ID, F_MEM_ID, FARM_TRAVEL_TITLE, FARM_TRAVEL_IMG, FARM_TRAVEL_INFO, FARM_TRAVEL_START, FARM_TRAVEL_END, FARM_TRAVEL_FEE, TRAVEL_APPLY_START, TRAVEL_APPLY_END, FARM_TRAVEL_MIN, FARM_TRAVEL_MAX, FARM_TRAVEL_NOW, FARM_TRAVEL_STATE ) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, '0', '0' );";
    public static final String UPDATE_STMT = "UPDATE FARM_TRAVEL SET FARM_TRAVEL_TITLE = ?, FARM_TRAVEL_IMG = ?, FARM_TRAVEL_INFO = ?, FARM_TRAVEL_START = ?, FARM_TRAVEL_END = ?, FARM_TRAVEL_FEE = ?, TRAVEL_APPLY_START = ?, TRAVEL_APPLY_END = ?, FARM_TRAVEL_MIN = ?, FARM_TRAVEL_MAX = ?, FARM_TRAVEL_NOW = ?, FARM_TRAVEL_STATE = ? WHERE FARM_TRAVEL_ID = ?;";
    public static final String DELETE_STMT = "UPDATE FARM_TRAVEL SET FARM_TRAVEL_STATE = 9 WHERE FARM_TRAVEL_ID = ?;";
    public static final String GET_ONE_STMT = "SELECT * FROM FARM_TRAVEL WHERE FARM_TRAVEL_ID = ?;";
    public static final String GET_ALL_FROM_FARMER_STMT = "SELECT * FROM FARM_TRAVEL WHERE F_MEM_ID = ? ORDER BY FARM_TRAVEL_ID DESC;";
    public static final String GET_ALL_MEM_CAN_APPLY = "SELECT * FROM FARM_TRAVEL WHERE FARM_TRAVEL_STATE IN ('1','2') AND TRAVEL_APPLY_START < NOW() and TRAVEL_APPLY_END > NOW()  AND (FARM_TRAVEL_MAX - FARM_TRAVEL_NOW) > 0;  ";
    public static final String OPEN_APPLY_STMT = "UPDATE FARM_TRAVEL SET FARM_TRAVEL_STATE = 1 WHERE TRAVEL_APPLY_START < NOW() and TRAVEL_APPLY_END > NOW() AND FARM_TRAVEL_STATE = 0;";
    public static final String CLOSE_APPLY_STMT = "UPDATE FARM_TRAVEL SET FARM_TRAVEL_STATE = 0 WHERE TRAVEL_APPLY_END < NOW() AND FARM_TRAVEL_STATE = 1;";
    public static final String FARM_TRAVEL_SET_UP_STMT = "UPDATE FARM_TRAVEL SET FARM_TRAVEL_STATE = 2 WHERE FARM_TRAVEL_NOW >= FARM_TRAVEL_MIN AND FARM_TRAVEL_STATE = 1;";
    public static final String SEARCH_FARM_TRAVEL_STMT = "SELECT * FROM FARM_TRAVEL WHERE FARM_TRAVEL_TITLE LIKE ? OR FARM_TRAVEL_INFO LIKE ?";
    public static final String GET_MY_FARM_TRAVEL_SET_UP_STMT = "SELECT * FROM FARM_TRAVEL WHERE FARM_TRAVEL_STATE = 2 AND F_MEM_ID = ?";
    public static final String ORDER_CANCEL_STMT = "UPDATE FARM_TRAVEL SET FARM_TRAVEL_NOW = ? WHERE FARM_TRAVEL_ID = ?;";

    PreparedStatement pstmt = null;
    ResultSet rs = null;

    @Override
    public Integer add(Connection con, FarmTravelVO farm_travel) {

        Integer next_farm_travel_ID = null;
        try {
            pstmt = con.prepareStatement(INSERT_STMT, Statement.RETURN_GENERATED_KEYS);

            pstmt.setInt(1, farm_travel.getMem_ID());
            pstmt.setInt(2, farm_travel.getF_mem_ID());
            pstmt.setString(3, farm_travel.getFarm_travel_title());
            pstmt.setBytes(4, farm_travel.getFarm_travel_img());
            pstmt.setString(5, farm_travel.getFarm_travel_info());
            pstmt.setTimestamp(6, farm_travel.getFarm_travel_start());
            pstmt.setTimestamp(7, farm_travel.getFarm_travel_end());
            pstmt.setInt(8, farm_travel.getFarm_travel_fee());
            pstmt.setTimestamp(9, farm_travel.getTravel_apply_start());
            pstmt.setTimestamp(10, farm_travel.getTravel_apply_end());
            pstmt.setInt(11, farm_travel.getFarm_travel_min());
            pstmt.setInt(12, farm_travel.getFarm_travel_max());

            pstmt.executeUpdate();

            rs = pstmt.getGeneratedKeys();

            if (rs.next()) {
                next_farm_travel_ID = rs.getInt(1);
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace(System.err);
        }finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace(System.err);
                }
            }
        }
        return next_farm_travel_ID;
    }

    @Override
    public void update(Connection con, FarmTravelVO farm_travel) {
        try {
            pstmt = con.prepareStatement(UPDATE_STMT);
            pstmt.setString(1,farm_travel.getFarm_travel_title());
            pstmt.setBytes(2, farm_travel.getFarm_travel_img());
            pstmt.setString(3,farm_travel.getFarm_travel_info());
            pstmt.setTimestamp(4, farm_travel.getFarm_travel_start());
            pstmt.setTimestamp(5, farm_travel.getFarm_travel_end());
            pstmt.setInt(6, farm_travel.getFarm_travel_fee());
            pstmt.setTimestamp(7, farm_travel.getTravel_apply_start());
            pstmt.setTimestamp(8, farm_travel.getTravel_apply_end());
            pstmt.setInt(9, farm_travel.getFarm_travel_min());
            pstmt.setInt(10, farm_travel.getFarm_travel_max());
            pstmt.setInt(11, farm_travel.getFarm_travel_now());
            pstmt.setInt(12, farm_travel.getFarm_travel_state());
            pstmt.setInt(13, farm_travel.getFarm_travel_ID());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.err);
        }finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace(System.err);
                }
            }
        }
    }

    @Override
    public void delete(Connection con, Integer farm_travel_ID) {
        try {
            pstmt = con.prepareStatement(DELETE_STMT);

            pstmt.setInt(1, farm_travel_ID);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace(System.err);
        }finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace(System.err);
                }
            }
        }
    }

    @Override
    public FarmTravelVO findByPK(Connection con, Integer farm_travel_ID) {
        FarmTravelVO farm_travel = null;
        try {
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
                farm_travel.setFarm_travel_start(rs.getTimestamp("FARM_TRAVEL_START"));
                farm_travel.setFarm_travel_end(rs.getTimestamp("FARM_TRAVEL_END"));
                farm_travel.setFarm_travel_fee(rs.getInt("FARM_TRAVEL_FEE"));
                farm_travel.setTravel_apply_start(rs.getTimestamp("TRAVEL_APPLY_START"));
                farm_travel.setTravel_apply_end(rs.getTimestamp("TRAVEL_APPLY_END"));
                farm_travel.setFarm_travel_min(rs.getInt("FARM_TRAVEL_MIN"));
                farm_travel.setFarm_travel_max(rs.getInt("FARM_TRAVEL_MAX"));
                farm_travel.setFarm_travel_now(rs.getInt("FARM_TRAVEL_NOW"));
                farm_travel.setFarm_travel_state(rs.getInt("FARM_TRAVEL_STATE"));
            }
        } catch (SQLException e) {
            e.printStackTrace(System.err);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace(System.err);
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace(System.err);
                }
            }
        }
        return farm_travel;
    }
    @Override
    public List<FarmTravelVO> getAllFromFMem(Connection con, Integer f_mem_ID) {
        List<FarmTravelVO> farm_travel_list = new ArrayList<>();
        FarmTravelVO farm_travel;
        try {
            pstmt = con.prepareStatement(GET_ALL_FROM_FARMER_STMT);

            pstmt.setInt(1, f_mem_ID);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                farm_travel = new FarmTravelVO();
                farm_travel.setFarm_travel_ID(rs.getInt("FARM_TRAVEL_ID"));
                farm_travel.setMem_ID(rs.getInt("MEM_ID"));
                farm_travel.setF_mem_ID(rs.getInt("F_MEM_ID"));
                farm_travel.setFarm_travel_title(rs.getString("FARM_TRAVEL_TITLE"));
                farm_travel.setFarm_travel_img(rs.getBytes("FARM_TRAVEL_IMG"));
                farm_travel.setFarm_travel_info(rs.getString("FARM_TRAVEL_INFO"));
                farm_travel.setFarm_travel_start(rs.getTimestamp("FARM_TRAVEL_START"));
                farm_travel.setFarm_travel_end(rs.getTimestamp("FARM_TRAVEL_END"));
                farm_travel.setFarm_travel_fee(rs.getInt("FARM_TRAVEL_FEE"));
                farm_travel.setTravel_apply_start(rs.getTimestamp("TRAVEL_APPLY_START"));
                farm_travel.setTravel_apply_end(rs.getTimestamp("TRAVEL_APPLY_END"));
                farm_travel.setFarm_travel_min(rs.getInt("FARM_TRAVEL_MIN"));
                farm_travel.setFarm_travel_max(rs.getInt("FARM_TRAVEL_MAX"));
                farm_travel.setFarm_travel_now(rs.getInt("FARM_TRAVEL_NOW"));
                farm_travel.setFarm_travel_state(rs.getInt("FARM_TRAVEL_STATE"));
                farm_travel_list.add(farm_travel);
            }
        } catch (SQLException e) {
            e.printStackTrace(System.err);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace(System.err);
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace(System.err);
                }
            }
        }
        return farm_travel_list;
    }

    @Override
    public List<FarmTravelVO> getAllMemCanApply(Connection con) {
        List<FarmTravelVO> farm_travel_list = new ArrayList<>();
        FarmTravelVO farm_travel;
        try {
            pstmt = con.prepareStatement(GET_ALL_MEM_CAN_APPLY);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                farm_travel = new FarmTravelVO();
                farm_travel.setFarm_travel_ID(rs.getInt("FARM_TRAVEL_ID"));
                farm_travel.setMem_ID(rs.getInt("MEM_ID"));
                farm_travel.setF_mem_ID(rs.getInt("F_MEM_ID"));
                farm_travel.setFarm_travel_title(rs.getString("FARM_TRAVEL_TITLE"));
                farm_travel.setFarm_travel_img(rs.getBytes("FARM_TRAVEL_IMG"));
                farm_travel.setFarm_travel_info(rs.getString("FARM_TRAVEL_INFO"));
                farm_travel.setFarm_travel_start(rs.getTimestamp("FARM_TRAVEL_START"));
                farm_travel.setFarm_travel_end(rs.getTimestamp("FARM_TRAVEL_END"));
                farm_travel.setFarm_travel_fee(rs.getInt("FARM_TRAVEL_FEE"));
                farm_travel.setTravel_apply_start(rs.getTimestamp("TRAVEL_APPLY_START"));
                farm_travel.setTravel_apply_end(rs.getTimestamp("TRAVEL_APPLY_END"));
                farm_travel.setFarm_travel_min(rs.getInt("FARM_TRAVEL_MIN"));
                farm_travel.setFarm_travel_max(rs.getInt("FARM_TRAVEL_MAX"));
                farm_travel.setFarm_travel_now(rs.getInt("FARM_TRAVEL_NOW"));
                farm_travel.setFarm_travel_state(rs.getInt("FARM_TRAVEL_STATE"));
                farm_travel_list.add(farm_travel);
            }
        } catch (SQLException e) {
            e.printStackTrace(System.err);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace(System.err);
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace(System.err);
                }
            }
        }
        return farm_travel_list;
    }

    @Override
    public Integer openFarmTravelApply(Connection con) {
        try {
            pstmt = con.prepareStatement(OPEN_APPLY_STMT);

            return pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace(System.err);
            return 0;
        }finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace(System.err);
                }
            }
        }
    }

    @Override
    public Integer closeFarmTravelApply(Connection con) {
        try {
            pstmt = con.prepareStatement(CLOSE_APPLY_STMT);

            return pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace(System.err);
            return 0;
        } finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace(System.err);
                }
            }
        }
    }

    @Override
    public Integer farmTravelSetUp(Connection con) {
        try {
            pstmt = con.prepareStatement(FARM_TRAVEL_SET_UP_STMT);

            return pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace(System.err);
            return 0;
        } finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace(System.err);
                }
            }
        }
    }

    @Override
    public List<FarmTravelVO> farmTravelBySearch(Connection con, String searchFarmTravel) {
        List<FarmTravelVO> farm_travel_list = new ArrayList<>();
        FarmTravelVO farm_travel;
        try {
            pstmt = con.prepareStatement(SEARCH_FARM_TRAVEL_STMT);

            pstmt.setString(1,searchFarmTravel);
            pstmt.setString(2,searchFarmTravel);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                farm_travel = new FarmTravelVO();
                farm_travel.setFarm_travel_ID(rs.getInt("FARM_TRAVEL_ID"));
                farm_travel.setMem_ID(rs.getInt("MEM_ID"));
                farm_travel.setF_mem_ID(rs.getInt("F_MEM_ID"));
                farm_travel.setFarm_travel_title(rs.getString("FARM_TRAVEL_TITLE"));
                farm_travel.setFarm_travel_img(rs.getBytes("FARM_TRAVEL_IMG"));
                farm_travel.setFarm_travel_info(rs.getString("FARM_TRAVEL_INFO"));
                farm_travel.setFarm_travel_start(rs.getTimestamp("FARM_TRAVEL_START"));
                farm_travel.setFarm_travel_end(rs.getTimestamp("FARM_TRAVEL_END"));
                farm_travel.setFarm_travel_fee(rs.getInt("FARM_TRAVEL_FEE"));
                farm_travel.setTravel_apply_start(rs.getTimestamp("TRAVEL_APPLY_START"));
                farm_travel.setTravel_apply_end(rs.getTimestamp("TRAVEL_APPLY_END"));
                farm_travel.setFarm_travel_min(rs.getInt("FARM_TRAVEL_MIN"));
                farm_travel.setFarm_travel_max(rs.getInt("FARM_TRAVEL_MAX"));
                farm_travel.setFarm_travel_now(rs.getInt("FARM_TRAVEL_NOW"));
                farm_travel.setFarm_travel_state(rs.getInt("FARM_TRAVEL_STATE"));
                farm_travel_list.add(farm_travel);
            }
        } catch (SQLException e) {
            e.printStackTrace(System.err);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace(System.err);
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace(System.err);
                }
            }
        }
        return farm_travel_list;
    }

    @Override
    public List<FarmTravelVO> listAllFarmTravelSetUp(Connection con, Integer f_mem_ID) {
        List<FarmTravelVO> farm_travel_list = new ArrayList<>();
        FarmTravelVO farm_travel;
        try {
            pstmt = con.prepareStatement(GET_MY_FARM_TRAVEL_SET_UP_STMT);

            pstmt.setInt(1, f_mem_ID);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                farm_travel = new FarmTravelVO();
                farm_travel.setFarm_travel_ID(rs.getInt("FARM_TRAVEL_ID"));
                farm_travel.setMem_ID(rs.getInt("MEM_ID"));
                farm_travel.setF_mem_ID(rs.getInt("F_MEM_ID"));
                farm_travel.setFarm_travel_title(rs.getString("FARM_TRAVEL_TITLE"));
                farm_travel.setFarm_travel_img(rs.getBytes("FARM_TRAVEL_IMG"));
                farm_travel.setFarm_travel_info(rs.getString("FARM_TRAVEL_INFO"));
                farm_travel.setFarm_travel_start(rs.getTimestamp("FARM_TRAVEL_START"));
                farm_travel.setFarm_travel_end(rs.getTimestamp("FARM_TRAVEL_END"));
                farm_travel.setFarm_travel_fee(rs.getInt("FARM_TRAVEL_FEE"));
                farm_travel.setTravel_apply_start(rs.getTimestamp("TRAVEL_APPLY_START"));
                farm_travel.setTravel_apply_end(rs.getTimestamp("TRAVEL_APPLY_END"));
                farm_travel.setFarm_travel_min(rs.getInt("FARM_TRAVEL_MIN"));
                farm_travel.setFarm_travel_max(rs.getInt("FARM_TRAVEL_MAX"));
                farm_travel.setFarm_travel_now(rs.getInt("FARM_TRAVEL_NOW"));
                farm_travel.setFarm_travel_state(rs.getInt("FARM_TRAVEL_STATE"));
                farm_travel_list.add(farm_travel);
            }
        } catch (SQLException e) {
            e.printStackTrace(System.err);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace(System.err);
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace(System.err);
                }
            }
        }
        return farm_travel_list;
    }

    @Override
    public void orderCancel(Connection con, Integer farm_travel_now, Integer farm_travel_ID) {
        try {
            pstmt = con.prepareStatement(ORDER_CANCEL_STMT);

            pstmt.setInt(1, farm_travel_now);
            pstmt.setInt(2, farm_travel_ID);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace(System.err);
        }finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace(System.err);
                }
            }
        }
    }
}
