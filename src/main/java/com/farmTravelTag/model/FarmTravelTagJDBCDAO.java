package com.farmTravelTag.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FarmTravelTagJDBCDAO implements FarmTravelTagDAO{

    public static final String INSERT_STMT = "INSERT INTO FARM_TRAVEL_TAG ( TAG_NAME, TAG_TIMES ) VALUES ( ?, '1' );";
    public static final String UPDATE_STMT = "UPDATE FARM_TRAVEL_TAG SET TAG_TIMES = ? WHERE TAG_NAME = ?;";
    public static final String DELETE_STMT = "DELETE FROM FARM_TRAVEL_TAG WHERE TAG_ID = ?;";
    public static final String GET_ONE_STMT = "SELECT * FROM FARM_TRAVEL_TAG WHERE TAG_NAME = ?;";
    public static final String GET_ONE_BY_PK_STMT = "SELECT * FROM FARM_TRAVEL_TAG WHERE TAG_ID = ?;";
    public static final String GET_ALL_STMT = "SELECT * FROM FARM_TRAVEL_TAG;";
    public static final String GET_TOP_THREE_STMT = "SELECT FTT.* FROM FARM_TRAVEL_TAG FTT JOIN (SELECT TAG_ID FROM FARM_TRAVEL_TAG_DETAILS FTTD JOIN (SELECT FARM_TRAVEL_ID FROM FARM_TRAVEL WHERE FARM_TRAVEL_STATE IN ('1','2') AND TRAVEL_APPLY_START < NOW() AND TRAVEL_APPLY_END > NOW()) FT ON FTTD.FARM_TRAVEL_ID  = FT.FARM_TRAVEL_ID GROUP BY TAG_ID) FTD ON FTT.TAG_ID = FTD.TAG_ID ORDER BY TAG_TIMES DESC LIMIT 5;";

    PreparedStatement pstmt = null;
    ResultSet rs = null;

    @Override
    public void add(Connection con, String tag_name) {
        try {
            pstmt = con.prepareStatement(INSERT_STMT);

            pstmt.setString(1, tag_name);

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
    public void update(Connection con, FarmTravelTagVO farm_travel_tag) {
        try {
            pstmt = con.prepareStatement(UPDATE_STMT);

            pstmt.setInt(1,farm_travel_tag.getTag_times()+1);
            pstmt.setString(2, farm_travel_tag.getTag_name());

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
    public void delete(Connection con, Integer tag_ID) {
        try {
            pstmt = con.prepareStatement(DELETE_STMT);

            pstmt.setInt(1, tag_ID);

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
    public FarmTravelTagVO findByTagName(Connection con, String tag_name) {
        FarmTravelTagVO farm_travel_tag = null;
        try {
            pstmt = con.prepareStatement(GET_ONE_STMT);

            pstmt.setString(1, tag_name);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                farm_travel_tag = new FarmTravelTagVO();
                farm_travel_tag.setTag_ID(rs.getInt("TAG_ID"));
                farm_travel_tag.setTag_name(rs.getString("TAG_NAME"));
                farm_travel_tag.setTag_times(rs.getInt("TAG_TIMES"));
            }else {
                return null;
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
        return farm_travel_tag;
    }

    @Override
    public FarmTravelTagVO findByPK(Connection con, Integer tag_ID) {
        FarmTravelTagVO farm_travel_tag = null;
        try {
            pstmt = con.prepareStatement(GET_ONE_BY_PK_STMT);

            pstmt.setInt(1, tag_ID);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                farm_travel_tag = new FarmTravelTagVO();
                farm_travel_tag.setTag_ID(rs.getInt("TAG_ID"));
                farm_travel_tag.setTag_name(rs.getString("TAG_NAME"));
                farm_travel_tag.setTag_times(rs.getInt("TAG_TIMES"));
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
        return farm_travel_tag;
    }

    @Override
    public List<FarmTravelTagVO> getAll(Connection con) {
        FarmTravelTagVO farm_travel_tag;
        List<FarmTravelTagVO> farm_travel_tag_list = new ArrayList<>();
        try {
            pstmt = con.prepareStatement(GET_ALL_STMT);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                farm_travel_tag = new FarmTravelTagVO();
                farm_travel_tag.setTag_ID(rs.getInt("TAG_ID"));
                farm_travel_tag.setTag_name(rs.getString("TAG_NAME"));
                farm_travel_tag.setTag_times(rs.getInt("TAG_TIMES"));
                farm_travel_tag_list.add(farm_travel_tag);
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
        return farm_travel_tag_list;
    }

    @Override
    public List<FarmTravelTagVO> getTopThree(Connection con) {
        FarmTravelTagVO farm_travel_tag;
        List<FarmTravelTagVO> farm_travel_tag_list = new ArrayList<>();
        try {
            pstmt = con.prepareStatement(GET_TOP_THREE_STMT);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                farm_travel_tag = new FarmTravelTagVO();
                farm_travel_tag.setTag_ID(rs.getInt("TAG_ID"));
                farm_travel_tag.setTag_name(rs.getString("TAG_NAME"));
                farm_travel_tag.setTag_times(rs.getInt("TAG_TIMES"));
                farm_travel_tag_list.add(farm_travel_tag);
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
        return farm_travel_tag_list;
    }
}
