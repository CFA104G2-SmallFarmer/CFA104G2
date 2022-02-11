package com.farmTravel.model;


import java.util.List;

public class FarmTravelService {
    private FarmTravelDAO dao;

    public FarmTravelService(){
        dao = new FarmTravelJDBCDAO();
    }

    public FarmTravelVO addFarmTravel(Integer mem_ID, Integer f_mem_ID, String farm_travel_title, byte[] farm_travel_img, String farm_travel_info, java.sql.Timestamp farm_travel_start, java.sql.Timestamp farm_travel_end, Integer farm_travel_fee,
                                      java.sql.Timestamp travel_apply_start, java.sql.Timestamp travel_apply_end, Integer farm_travel_min, Integer farm_travel_max) {

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
        dao.add(farm_travel);

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
        dao.update(farm_travel);

        return farm_travel;
    }

    public void deleteFarmTravel(Integer farm_travel_ID) {
        dao.delete(farm_travel_ID);
    }

    public FarmTravelVO getOneFarmTravel(Integer farm_travel_ID) {
        return dao.findByPK(farm_travel_ID);
    }

    public List<FarmTravelVO> getAllFarmTravel() {
        return dao.getAll();
    }
}
