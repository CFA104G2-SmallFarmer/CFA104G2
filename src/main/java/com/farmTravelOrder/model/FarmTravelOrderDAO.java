package com.farmTravelOrder.model;

import java.util.List;

public interface FarmTravelOrderDAO {
    void add(FarmTravelOrderVO farm_travel_order);
    void update(FarmTravelOrderVO farm_travel_order);
//    void delete(Integer order_ID);
    FarmTravelOrderVO findByPK(Integer order_ID);
    List<FarmTravelOrderVO> getAll(Integer mem_ID);
}
