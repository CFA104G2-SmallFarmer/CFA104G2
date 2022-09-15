package com.farmTravel.model;

import com.core.connectionFactory.ConnectionFactory;
import com.farmTravelCollection.model.FarmTravelCollectionVO;
import com.farmTravelTag.model.FarmTravelTagJDBCDAO;
import com.farmTravelTag.model.FarmTravelTagVO;
import com.farmTravelTagDetails.model.FarmTravelTagDetailsJDBCDAO;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FarmTravelService {
    private FarmTravelDAO dao;

    public FarmTravelService(){
        dao = new FarmTravelJDBCDAO();
    }

    ConnectionFactory connectionFactory = new ConnectionFactory();
    Connection con = connectionFactory.getConnection();

    public FarmTravelVO addFarmTravel(Integer mem_ID, Integer f_mem_ID, String farm_travel_title, byte[] farm_travel_img, String farm_travel_info, java.sql.Timestamp farm_travel_start, java.sql.Timestamp farm_travel_end, Integer farm_travel_fee,
                                      java.sql.Timestamp travel_apply_start, java.sql.Timestamp travel_apply_end, Integer farm_travel_min, Integer farm_travel_max, String[] tag_names) {
        FarmTravelVO farm_travel = new FarmTravelVO();
        farm_travel.setMem_ID(mem_ID);
        farm_travel.setF_mem_ID(f_mem_ID);
        farm_travel.setFarm_travel_title(farm_travel_title);
        farm_travel.setFarm_travel_img(farm_travel_img);
        farm_travel.setFarm_travel_info(farm_travel_info);
        farm_travel.setFarm_travel_start(farm_travel_start);
        farm_travel.setFarm_travel_end(farm_travel_end);
        farm_travel.setFarm_travel_fee(farm_travel_fee);
        farm_travel.setTravel_apply_start(travel_apply_start);
        farm_travel.setTravel_apply_end(travel_apply_end);
        farm_travel.setFarm_travel_min(farm_travel_min);
        farm_travel.setFarm_travel_max(farm_travel_max);

        try {
            con.setAutoCommit(false);
            Integer next_farm_travel_ID = dao.add(con, farm_travel);
            System.out.println(next_farm_travel_ID);
            if (tag_names != null){
                for (String tag_name : tag_names){
                    System.out.println(tag_name);
                    FarmTravelTagJDBCDAO farmTravelTagDAO = new FarmTravelTagJDBCDAO();
                    FarmTravelTagVO farmTravelTag = farmTravelTagDAO.findByTagName(con, tag_name);
                    FarmTravelTagDetailsJDBCDAO farmTravelTagDetailsDAO = new FarmTravelTagDetailsJDBCDAO();
                    if (farmTravelTag == null){
                        farmTravelTagDAO.add(con, tag_name);
                    }else {
                        farmTravelTagDAO.update(con, farmTravelTag);
                    }
                    farmTravelTag = farmTravelTagDAO.findByTagName(con, tag_name);
                    farmTravelTagDetailsDAO.add(con, next_farm_travel_ID, farmTravelTag.getTag_ID());
                }
            }
            con.commit();
            con.setAutoCommit(true);
        } catch (SQLException e) {
            if (con != null) {
                try {
                    con.rollback();
                } catch (SQLException se) {
                    se.printStackTrace(System.err);
                }
            }
        }
        return farm_travel;
    }

    public FarmTravelVO updateFarmTravel(String farm_travel_title, byte[] farm_travel_img, String farm_travel_info, java.sql.Timestamp farm_travel_start, java.sql.Timestamp farm_travel_end, Integer farm_travel_fee,
                                         java.sql.Timestamp travel_apply_start, java.sql.Timestamp travel_apply_end, Integer farm_travel_min, Integer farm_travel_max, Integer farm_travel_now, Integer farm_travel_state, Integer farm_travel_ID) {

        FarmTravelVO farm_travel = new FarmTravelVO();
        farm_travel.setFarm_travel_title(farm_travel_title);
        farm_travel.setFarm_travel_img(farm_travel_img);
        farm_travel.setFarm_travel_info(farm_travel_info);
        farm_travel.setFarm_travel_start(farm_travel_start);
        farm_travel.setFarm_travel_end(farm_travel_end);
        farm_travel.setFarm_travel_fee(farm_travel_fee);
        farm_travel.setTravel_apply_start(travel_apply_start);
        farm_travel.setTravel_apply_end(travel_apply_end);
        farm_travel.setFarm_travel_min(farm_travel_min);
        farm_travel.setFarm_travel_max(farm_travel_max);
        farm_travel.setFarm_travel_now(farm_travel_now);
        farm_travel.setFarm_travel_state(farm_travel_state);
        farm_travel.setFarm_travel_ID(farm_travel_ID);
        dao.update(con, farm_travel);
        return farm_travel;
    }

    public void deleteFarmTravel(Integer farm_travel_ID) {
        dao.delete(con, farm_travel_ID);
    }

    public FarmTravelVO getOneFarmTravel(Integer farm_travel_ID) {
        return dao.findByPK(con, farm_travel_ID);
    }

    public List<FarmTravelVO> getAllMemCanApply() {
        return dao.getAllMemCanApply(con);
    }

    public List<FarmTravelVO> getAllFarmTravelFromFMem(Integer f_mem_ID) {
        return dao.getAllFromFMem(con, f_mem_ID);
    }

    public List<FarmTravelVO> getAllFromCollection(List<FarmTravelCollectionVO> farmTravelCollectionList) {
        List<FarmTravelVO> farmTravelList = new ArrayList<>();
        FarmTravelVO farmTravel = null;
        for (FarmTravelCollectionVO farmTravelCollection : farmTravelCollectionList){
            farmTravel = dao.findByPK(con, farmTravelCollection.getFarm_travel_ID());
            farmTravelList.add(farmTravel);
        }
        return farmTravelList;
    }
    public void applyChange (){
//        System.out.println(dao.openFarmTravelApply(con)+"筆農遊開放報名");
//        System.out.println(dao.closeFarmTravelApply(con)+"筆農遊關閉報名");
    }
    public void farmTravelSetUp(){
//        System.out.println(dao.farmTravelSetUp(con)+"筆農遊已成團");
    }
    public List<FarmTravelVO> farmTravelBySearch(String searchFarmTravel){
        return dao.farmTravelBySearch(con, searchFarmTravel);
    }
    public List<FarmTravelVO> listAllFarmTravelSetUp(Integer f_mem_ID){
        return dao.listAllFarmTravelSetUp(con, f_mem_ID);
    }
    public void orderCancel(Integer people_num, Integer farm_travel_ID){
        dao.orderCancel(con, people_num, farm_travel_ID);
    }
}
