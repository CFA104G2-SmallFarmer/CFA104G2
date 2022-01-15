package com.farmTravelTag.model;

import java.util.List;

public interface FarmTravelTagDAO {
    void add(FarmTravelTagVO farm_travel_tag);
    void update(FarmTravelTagVO farm_travel_tag);
    void delete(int tag_ID);
    FarmTravelTagVO findByPK(int tag_ID);
    List<FarmTravelTagVO> getAll();
}
