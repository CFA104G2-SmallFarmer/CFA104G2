package com.farmTravel.model;

import java.util.List;

public interface FarmTravelDAO {
    void add(FarmTravelVO farm_travel);
    void update(FarmTravelVO farm_travel);
    void delete(Integer farm_travel_ID);
    FarmTravelVO findByPK(Integer farm_travel_ID);
    List<FarmTravelVO> getAll();
}
