package com.farmTravelTagDetails.model;

import java.util.List;

public interface FarmTravelTagDetailsDAO {
    void add(FarmTravelTagDetailsVO farm_travel_tag_details);
    void update(FarmTravelTagDetailsVO farm_travel_tag_details);
    void delete(Integer farm_travel_ID, Integer tag_ID);
    List<FarmTravelTagDetailsVO> getTagByFarmTravelID(Integer farm_travel_ID);
    List<FarmTravelTagDetailsVO> getFarmTravelByTagID(Integer tag_ID);
}
