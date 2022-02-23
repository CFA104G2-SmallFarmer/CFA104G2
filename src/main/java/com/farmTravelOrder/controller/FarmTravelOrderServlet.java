package com.farmTravelOrder.controller;

import com.farmTravel.model.FarmTravelService;
import com.farmTravel.model.FarmTravelVO;
import com.farmTravelCollection.model.FarmTravelCollectionService;
import com.farmTravelOrder.model.FarmTravelOrderService;
import com.farmTravelOrder.model.FarmTravelOrderVO;
import com.farmTravelPartner.model.FarmTravelPartnerService;
import com.mem.model.MemVO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;

@WebServlet("/farmTravelOrder.do")
public class FarmTravelOrderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
        String action = request.getParameter("action");
        FarmTravelOrderVO farmTravelOrder;
        if ("insert".equals(action)){
            List<String> errorMsgs = new LinkedList<String>();
            request.setAttribute("errorMsgs", errorMsgs);
            try{
                Integer mem_ID = ((MemVO)(session.getAttribute("mem"))).getMem_id();
                Integer farm_travel_ID = Integer.valueOf(request.getParameter("farm_travel_ID"));

                FarmTravelService farmTravelService = new FarmTravelService();
                FarmTravelVO farmTravel = farmTravelService.getOneFarmTravel(farm_travel_ID);

                Integer f_mem_ID = Integer.valueOf(farmTravel.getF_mem_ID());
                Integer people_num = Integer.valueOf(request.getParameter("people_num"));
                Integer order_fee = farmTravel.getFarm_travel_fee()*people_num;

                java.sql.Timestamp farm_travel_start = farmTravel.getFarm_travel_start();

                java.sql.Timestamp farm_travel_end = farmTravel.getFarm_travel_end();

                String order_memo = request.getParameter("order_memo");

                // 以下為農遊小夥伴資料
                String[] partner_name_list = request.getParameterValues("partner_name");
                String[] partner_phone_list = request.getParameterValues("partner_phone");
                String[] guardian_name_list = request.getParameterValues("guardian_name");
                String[] guardian_phone_list = request.getParameterValues("guardian_phone");

                farmTravelOrder = new FarmTravelOrderVO();
                farmTravelOrder.setMem_ID(mem_ID);
                farmTravelOrder.setFarm_travel_ID(farm_travel_ID);
                farmTravelOrder.setF_mem_ID(f_mem_ID);
                farmTravelOrder.setPeople_num(people_num);
                farmTravelOrder.setOrder_fee(order_fee);
                farmTravelOrder.setFarm_travel_start(farm_travel_start);
                farmTravelOrder.setFarm_travel_end(farm_travel_end);
                farmTravelOrder.setOrder_memo(order_memo);

                request.setAttribute("partmer_name_list", partner_name_list);
                request.setAttribute("partner_phone_list", partner_phone_list);
                request.setAttribute("guardian_name_list", guardian_name_list);
                request.setAttribute("guardian_phone_list", guardian_phone_list);
                request.setAttribute("errorMsgs", errorMsgs);

                request.setAttribute("farmTravel",farmTravel);

                if (!errorMsgs.isEmpty()) {  // 若以上格式有錯返回add頁面
                    request.setAttribute("farmTravelOrder", farmTravelOrder);
                    RequestDispatcher errView = request.getRequestDispatcher("/front-end/farmTravel/applyFarmTravel.jsp");
                    errView.forward(request, response);
                    return;
                }
                try{  // 嘗試新增資料，若發生錯誤返回add頁面
                    FarmTravelOrderService farmTravelOrderService = new FarmTravelOrderService();
                    farmTravelOrder =  farmTravelOrderService.addFarmTravelOrder(mem_ID, farm_travel_ID, f_mem_ID, people_num, order_fee, farm_travel_start, farm_travel_end, order_memo, partner_name_list, partner_phone_list, guardian_name_list, guardian_phone_list);
                    if (farmTravel.getFarm_travel_max() == farmTravel.getFarm_travel_now()+people_num){
                        farmTravelService.updateFarmTravel(farmTravel.getFarm_travel_title(),farmTravel.getFarm_travel_img(),farmTravel.getFarm_travel_info(),farmTravel.getFarm_travel_start(),farmTravel.getFarm_travel_end(),farmTravel.getFarm_travel_fee(),farmTravel.getTravel_apply_start(),farmTravel.getTravel_apply_end(),farmTravel.getFarm_travel_min(),farmTravel.getFarm_travel_max(),farmTravel.getFarm_travel_now()+people_num,3,farmTravel.getFarm_travel_ID());
                    }else{
                        farmTravelService.updateFarmTravel(farmTravel.getFarm_travel_title(),farmTravel.getFarm_travel_img(),farmTravel.getFarm_travel_info(),farmTravel.getFarm_travel_start(),farmTravel.getFarm_travel_end(),farmTravel.getFarm_travel_fee(),farmTravel.getTravel_apply_start(),farmTravel.getTravel_apply_end(),farmTravel.getFarm_travel_min(),farmTravel.getFarm_travel_max(),farmTravel.getFarm_travel_now()+people_num,farmTravel.getFarm_travel_state(),farmTravel.getFarm_travel_ID());
                    }
                }catch(Exception e){
                    e.printStackTrace(System.err);
                    errorMsgs.add("新增失敗");
                    request.setAttribute("farmTravelOrder", farmTravelOrder);
                    RequestDispatcher errView = request.getRequestDispatcher("/front-end/farmTravel/applyFarmTravel.jsp");
                    errView.forward(request, response);
                    return;
                }

                RequestDispatcher successView = request.getRequestDispatcher("/front-end/farmTravelOrder/listAllFarmTravelOrderByMem.jsp");
                successView.forward(request, response);
            }catch (Exception e){  // 發生其他Error時
                e.printStackTrace(System.err);
                RequestDispatcher errView = request.getRequestDispatcher("/front-end/farmTravel/applyFarmTravel.jsp");
                errView.forward(request, response);
            }
        }
        if ("pay".equals(action)){
            try{
                Integer order_ID = Integer.valueOf(request.getParameter("order_ID"));

                try{
                    FarmTravelOrderService farmTravelOrderService = new FarmTravelOrderService();
                    farmTravelOrder =  farmTravelOrderService.getOneFarmTravelOrder(order_ID);
                    farmTravelOrderService.updateFarmTravelOrder(1, farmTravelOrder.getRefund_time(), farmTravelOrder.getFarm_travel_stars(), farmTravelOrder.getMem_ID_stars(), farmTravelOrder.getOrder_memo(), order_ID);
                    out.print("付款成功");
                }catch(Exception e){
                    e.printStackTrace(System.err);
                    out.print("付款失敗");
                    return;
                }
            }catch (Exception e){
                e.printStackTrace();
                out.print("付款失敗");
            }
        }
        if ("completed".equals(action)){
            try{
                Integer order_ID = Integer.valueOf(request.getParameter("order_ID"));

                try{
                    FarmTravelOrderService farmTravelOrderService = new FarmTravelOrderService();
                    farmTravelOrder = farmTravelOrderService.getOneFarmTravelOrder(order_ID);
                    farmTravelOrderService.updateFarmTravelOrder(2, farmTravelOrder.getRefund_time(), farmTravelOrder.getFarm_travel_stars(), farmTravelOrder.getMem_ID_stars(), farmTravelOrder.getOrder_memo(), order_ID);
                    out.print("行程已結束");
                }catch(Exception e){
                    e.printStackTrace(System.err);
                    out.print("發生意外的錯誤");
                    return;
                }
            }catch (Exception e){
                e.printStackTrace();
                out.print("發生意外的錯誤");
            }
        }if ("mem_rating".equals(action)){
            try{
                Integer order_ID = Integer.valueOf(request.getParameter("order_ID"));
                Integer farm_travel_stars = Integer.valueOf(request.getParameter("farm_travel_stars"));

                try{
                    FarmTravelOrderService farmTravelOrderService = new FarmTravelOrderService();
                    farmTravelOrder = farmTravelOrderService.getOneFarmTravelOrder(order_ID);
                    farmTravelOrderService.updateFarmTravelOrder(3, farmTravelOrder.getRefund_time(), farm_travel_stars, farmTravelOrder.getMem_ID_stars(), farmTravelOrder.getOrder_memo(), order_ID);
                    out.print("評價完成");
                }catch(Exception e){
                    e.printStackTrace(System.err);
                    out.print("評價失敗");
                    return;
                }
            }catch (Exception e){
                e.printStackTrace();
                out.print("評價失敗");
            }
        }
    }
}
