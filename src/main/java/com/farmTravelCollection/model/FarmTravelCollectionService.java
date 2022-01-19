package com.farmTravelCollection.model;

import java.util.List;

public class FarmTravelCollectionService {
    private FarmTravelCollectionDAO dao;

    public FarmTravelCollectionService(){
        dao = new FarmTravelCollectionJDBCDAO();
    }

    public FarmTravelCollectionVO addFarmTravelCollection(Integer mem_ID, Integer farm_travel_ID) {

        FarmTravelCollectionVO farm_travel_collection = new FarmTravelCollectionVO();
        farm_travel_collection.setMem_ID(mem_ID);
        farm_travel_collection.setFarm_travel_ID(farm_travel_ID);
        dao.add(farm_travel_collection);

        return farm_travel_collection;
    }

    public void deleteFarmTravelCollection(Integer mem_ID, Integer farm_travel_ID) {
        dao.delete(mem_ID, farm_travel_ID);
    }

    public List<FarmTravelCollectionVO> getAllFarmTravelCollection(Integer mem_ID) {
        return dao.getAll(mem_ID);
    }
}
