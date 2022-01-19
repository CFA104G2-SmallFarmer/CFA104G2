package com.farmTravelCollection.model;

import java.util.List;

public interface FarmTravelCollectionDAO {
    void add(FarmTravelCollectionVO farm_travel_collection);
//    void update(FarmTravelCollectionVO farm_travel_collection);
    void delete(Integer mem_ID, Integer farm_travel_ID);
//    FarmTravelCollectionVO findByPK(Integer mem_ID, Integer farm_travel_ID);
    List<FarmTravelCollectionVO> getAll(Integer mem_ID);
}
