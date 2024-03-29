package com.farmTravelOrder.model;

import com.core.connectionFactory.ConnectionFactory;
import com.farmTravel.model.FarmTravelJDBCDAO;
import com.farmTravel.model.FarmTravelService;
import com.farmTravel.model.FarmTravelVO;
import com.farmTravelPartner.model.FarmTravelPartnerDAO;
import com.farmTravelPartner.model.FarmTravelPartnerJDBCDAO;
import com.farmTravelPartner.model.FarmTravelPartnerVO;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class FarmTravelOrderService {
    private FarmTravelOrderDAO dao;

    public FarmTravelOrderService() {
        dao = new FarmTravelOrderJDBCDAO();
    }

    ConnectionFactory connectionFactory = new ConnectionFactory();
    Connection con = connectionFactory.getConnection();

    public FarmTravelOrderVO addFarmTravelOrder(Integer mem_ID, Integer farm_travel_ID, Integer f_mem_ID, Integer people_num, Integer order_fee, java.sql.Timestamp farm_travel_start, java.sql.Timestamp farm_travel_end,
                                                String order_memo, String[] partner_name_list, String[] partner_phone_list, String[] guardian_name_list, String[] guardian_phone_list) {

        FarmTravelOrderVO farm_travel_order = new FarmTravelOrderVO();
        farm_travel_order.setMem_ID(mem_ID);
        farm_travel_order.setFarm_travel_ID(farm_travel_ID);
        farm_travel_order.setF_mem_ID(f_mem_ID);
        farm_travel_order.setPeople_num(people_num);
        farm_travel_order.setOrder_fee(order_fee);
        farm_travel_order.setFarm_travel_start(farm_travel_start);
        farm_travel_order.setFarm_travel_end(farm_travel_end);
        farm_travel_order.setOrder_memo(order_memo);

        try {
            con.setAutoCommit(false);
            Integer next_farm_travel_order_ID = dao.add(con, farm_travel_order);
            FarmTravelPartnerDAO farmTravelPartnerDAO;
            for (int i = 0; i < farm_travel_order.getPeople_num(); i++) {
                farmTravelPartnerDAO = new FarmTravelPartnerJDBCDAO();
                FarmTravelPartnerVO farmTravelPartner = new FarmTravelPartnerVO();
                farmTravelPartner.setOrder_ID(next_farm_travel_order_ID);
                farmTravelPartner.setPartner_name(partner_name_list[i]);
                farmTravelPartner.setPartner_phone(partner_phone_list[i]);
                farmTravelPartner.setGuardian_name(guardian_name_list[i]);
                farmTravelPartner.setGuardian_phone(guardian_phone_list[i]);
                farmTravelPartner.setApply_mem_ID(farm_travel_order.getMem_ID());
                farmTravelPartnerDAO.add(con, farmTravelPartner);
            }
            con.commit();
            con.setAutoCommit(true);
        } catch (SQLException e) {
            if (con != null) {
                try {
                    con.rollback();
                } catch (SQLException se) {
                    se.printStackTrace(System.err);
                }
            }
        }
        return farm_travel_order;
    }

    public FarmTravelOrderVO updateFarmTravelOrder(Integer order_state, java.sql.Timestamp refund_time, Integer farm_travel_stars, Integer mem_ID_stars, String order_memo, Integer order_ID) {

        FarmTravelOrderVO farm_travel_order = new FarmTravelOrderVO();
        farm_travel_order.setOrder_state(order_state);
        farm_travel_order.setRefund_time(refund_time);
        farm_travel_order.setFarm_travel_stars(farm_travel_stars);
        farm_travel_order.setMem_ID_stars(mem_ID_stars);
        farm_travel_order.setOrder_memo(order_memo);
        farm_travel_order.setOrder_ID(order_ID);
        dao.update(con, farm_travel_order);

        return farm_travel_order;
    }

    public FarmTravelOrderVO getOneFarmTravelOrder(Integer order_ID) {
        return dao.findByPK(con, order_ID);
    }

    public List<FarmTravelOrderVO> getAllFarmTravelOrderByMem(Integer mem_ID) {
        return dao.getAllByMem(con, mem_ID);
    }

    public List<FarmTravelOrderVO> getAllFarmTravelOrderByFMem(Integer f_mem_ID) {
        return dao.getAllByFMem(con, f_mem_ID);
    }

    public void travelCompleted() {
        System.out.println(dao.travelCompleted(con) + "筆行程已結束");
    }

    public void cancelApply(FarmTravelOrderVO farmTravelOrder) {

        try {
            con.setAutoCommit(false);

            dao.cancelApply(con, farmTravelOrder.getOrder_ID());

            FarmTravelJDBCDAO farmTravelDAO = new FarmTravelJDBCDAO();
            FarmTravelVO farmTravel = farmTravelDAO.findByPK(con, farmTravelOrder.getFarm_travel_ID());
            farmTravelDAO.orderCancel(con, farmTravel.getFarm_travel_now() - farmTravelOrder.getPeople_num(), farmTravelOrder.getFarm_travel_ID());

            con.commit();
            con.setAutoCommit(true);
        } catch (Exception e) {
            if (con != null) {
                try {
                    con.rollback();
                } catch (SQLException se) {
                    se.printStackTrace(System.err);
                }
            }

        }
    }
}
