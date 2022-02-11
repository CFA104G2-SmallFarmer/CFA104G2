package com.farmTravel.model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class FarmTravelTest {
    public static void main(String[] args) {
//        FarmTravelDAO dao = new FarmTravelJDBCDAO();
//        FarmTravelVO farmTravelVO = new FarmTravelVO();
//        farmTravelVO.setMem_ID(10);
//        farmTravelVO.setF_mem_ID(10);
//        farmTravelVO.setFarm_travel_title("Test title2");
//        farmTravelVO.setFarm_travel_info("test info2");
//        farmTravelVO.setFarm_travel_start(java.sql.Timestamp.valueOf("1988-12-25"));
//        farmTravelVO.setFarm_travel_end(java.sql.Timestamp.valueOf("1988-12-25"));
//        farmTravelVO.setFarm_travel_fee(30000);
//        farmTravelVO.setFarm_travel_min(10);
//        farmTravelVO.setFarm_travel_max(300);
//        farmTravelVO.setTravel_apply_start(java.sql.Timestamp.valueOf("1988-12-25"));
//        farmTravelVO.setTravel_apply_end(java.sql.Timestamp.valueOf("1988-12-25"));
//        dao.add(farmTravelVO);

        FarmTravelDAO dao = new FarmTravelJDBCDAO();
        List<FarmTravelVO> list = dao.getAll();
        for(FarmTravelVO farmTravel :list){
            System.out.println(farmTravel.getFarm_travel_ID());
            System.out.println(farmTravel.getMem_ID());
            System.out.println(farmTravel.getF_mem_ID());
            System.out.println(farmTravel.getFarm_travel_title());
            System.out.println(farmTravel.getFarm_travel_info());
            System.out.println(farmTravel.getFarm_travel_start());
            System.out.println(farmTravel.getFarm_travel_end());
            System.out.println(farmTravel.getFarm_travel_min());
            System.out.println(farmTravel.getFarm_travel_max());
            System.out.println(farmTravel.getFarm_travel_now());
            System.out.println(farmTravel.getTravel_apply_start());
            System.out.println(farmTravel.getTravel_apply_end());

        }
    }
}
