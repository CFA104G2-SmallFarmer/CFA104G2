package com.farmTravelTag.model;

import java.util.List;

public class FarmTravelTagService {
    private FarmTravelTagDAO dao;

    public FarmTravelTagService(){
        dao = new FarmTravelTagJDBCDAO();
    }
    public FarmTravelTagVO addFarmTravelTag(String tag_name) {

        FarmTravelTagVO farm_travel_tag = new FarmTravelTagVO();
        farm_travel_tag.setTag_name(tag_name);
        dao.add(farm_travel_tag);

        return farm_travel_tag;
    }

    public FarmTravelTagVO updateFarmTravelTag(String tag_name, Integer tag_times, Integer tag_ID) {

        FarmTravelTagVO farm_travel_tag = new FarmTravelTagVO();
        farm_travel_tag.setTag_name(tag_name);
        farm_travel_tag.setTag_times(tag_times);
        farm_travel_tag.setTag_ID(tag_ID);
        dao.update(farm_travel_tag);

        return farm_travel_tag;
    }

    public void deleteFarmTravelTag(Integer tag_ID) {
        dao.delete(tag_ID);
    }

    public FarmTravelTagVO getOneFarmTravelTag(Integer tag_ID) {
        return dao.findByPK(tag_ID);
    }
    public List<FarmTravelTagVO> getAllFarmTravelTag() {
        return dao.getAll();
    }
}
