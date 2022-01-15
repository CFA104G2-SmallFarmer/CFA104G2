package com.farmTravelTagDetails.model;

import java.util.List;

public interface FarmTravelTagDetailsDAO {
    void add(FarmTravelTagDetailsVO farm_travel_tag_details);
    void update(FarmTravelTagDetailsVO farm_travel_tag_details);
    void delete(int farm_travel_ID, int tag_ID);
    List<FarmTravelTagDetailsVO> getTagByFarmTravelID(int farm_travel_ID);
    List<FarmTravelTagDetailsVO> getFarmTravelByTagID(int tag_ID);
}
