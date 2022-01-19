package com.farmTravelTagDetails.model;

import java.util.List;

public class FarmTravelTagDetailsService {
    private FarmTravelTagDetailsDAO dao;

    public FarmTravelTagDetailsService(){
        dao = new FarmTravelTagDetailsJDBCDAO();
    }
    public FarmTravelTagDetailsVO addFarmTravelTagDetails(Integer farm_travel_ID, Integer tag_ID) {

        FarmTravelTagDetailsVO farm_travel_tag_details = new FarmTravelTagDetailsVO();
        farm_travel_tag_details.setFarm_travel_ID(farm_travel_ID);
        farm_travel_tag_details.setTag_ID(tag_ID);
        dao.add(farm_travel_tag_details);

        return farm_travel_tag_details;
    }

    public void deleteFarmTravelTagDetails(Integer farm_travel_ID, Integer tag_ID) {
        dao.delete(farm_travel_ID, tag_ID);
    }

    public List<FarmTravelTagDetailsVO> getTagByFarmTravelID(Integer farm_travel_ID) {
        return dao.getTagByFarmTravelID(farm_travel_ID);
    }
    public List<FarmTravelTagDetailsVO> getFarmTravelByTagID(Integer tag_ID) {
        return dao.getFarmTravelByTagID(tag_ID);
    }
}
