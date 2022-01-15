package com.farmTravelCollection.model;

import java.util.List;

public interface FarmTravelCollectionDAO {
    void add(FarmTravelCollectionVO farm_travel_collection);
//    void update(FarmTravelCollectionVO farm_travel_collection);
    void delete(int mem_ID, int farm_travel_ID);
//    FarmTravelCollectionVO findByPK(int mem_ID, int farm_travel_ID);
    List<FarmTravelCollectionVO> getAll(int mem_ID);
}
