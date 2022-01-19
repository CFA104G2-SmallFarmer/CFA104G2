package com.farmTravelTag.model;

import java.util.List;

public interface FarmTravelTagDAO {
    void add(FarmTravelTagVO farm_travel_tag);
    void update(FarmTravelTagVO farm_travel_tag);
    void delete(Integer tag_ID);
    FarmTravelTagVO findByPK(Integer tag_ID);
    List<FarmTravelTagVO> getAll();
}
