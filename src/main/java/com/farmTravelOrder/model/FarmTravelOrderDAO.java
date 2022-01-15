package com.farmTravelOrder.model;

import java.util.List;

public interface FarmTravelOrderDAO {
    void add(FarmTravelOrderVO farm_travel_order);
    void update(FarmTravelOrderVO farm_travel_order);
//    void delete(int order_ID);
    FarmTravelOrderVO findByPK(int order_ID);
    List<FarmTravelOrderVO> getAll(int mem_ID);
}
