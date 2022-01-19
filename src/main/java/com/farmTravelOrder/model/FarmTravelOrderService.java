package com.farmTravelOrder.model;

import java.util.List;

public class FarmTravelOrderService {
    private FarmTravelOrderDAO dao;

    public FarmTravelOrderService(){
        dao = new FarmTravelOrderJDBCDAO();
    }

    public FarmTravelOrderVO addFarmTravelOrder(Integer mem_ID, Integer farm_travel_ID, Integer f_mem_ID, Integer people_num, Integer order_fee,
                                                java.sql.Timestamp farm_travel_start, java.sql.Timestamp farm_travel_end, Integer order_payment, String order_memo) {

        FarmTravelOrderVO farm_travel_order = new FarmTravelOrderVO();
        farm_travel_order.setMem_ID(mem_ID);
        farm_travel_order.setFarm_travel_ID(farm_travel_ID);
        farm_travel_order.setF_mem_ID(f_mem_ID);
        farm_travel_order.setPeople_num(people_num);
        farm_travel_order.setOrder_fee(order_fee);
        farm_travel_order.setFarm_travel_start(farm_travel_start);
        farm_travel_order.setFarm_travel_end(farm_travel_end);
        farm_travel_order.setOrder_payment(order_payment);
        farm_travel_order.setOrder_memo(order_memo);
        dao.add(farm_travel_order);

        return farm_travel_order;
    }

    public FarmTravelOrderVO updateFarmTravelOrder(Integer order_state, Integer order_payment, java.sql.Timestamp refund_time, Integer farm_travel_stars, Integer mem_ID_stars,
                                                   String order_memo, Integer farm_travel_ID) {

        FarmTravelOrderVO farm_travel_order = new FarmTravelOrderVO();
        farm_travel_order.setOrder_state(order_state);
        farm_travel_order.setOrder_payment(order_payment);
        farm_travel_order.setRefund_time(refund_time);
        farm_travel_order.setFarm_travel_stars(farm_travel_stars);
        farm_travel_order.setMem_ID_stars(mem_ID_stars);
        farm_travel_order.setOrder_memo(order_memo);
        farm_travel_order.setFarm_travel_ID(farm_travel_ID);
        dao.update(farm_travel_order);

        return farm_travel_order;
    }

    public FarmTravelOrderVO getOneFarmTravelOrder(Integer order_ID) {
        return dao.findByPK(order_ID);
    }

    public List<FarmTravelOrderVO> getAllFarmTravelOrder(Integer mem_ID) {
        return dao.getAll(mem_ID);
    }
}
