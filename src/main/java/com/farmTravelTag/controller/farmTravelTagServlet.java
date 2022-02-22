package com.farmTravelTag.controller;

import com.farmTravel.model.FarmTravelService;
import com.farmTravel.model.FarmTravelVO;
import com.farmTravelTag.model.FarmTravelTagService;
import com.farmTravelTag.model.FarmTravelTagVO;
import com.farmTravelTagDetails.model.FarmTravelTagDetailsService;
import com.farmTravelTagDetails.model.FarmTravelTagDetailsVO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/farmTravelTag.do")
public class farmTravelTagServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer tag_ID = Integer.valueOf(request.getParameter("tag_ID"));
        FarmTravelTagDetailsService farmTravelTagDetailsService = new FarmTravelTagDetailsService();
        List<FarmTravelTagDetailsVO> farmTravelTagDetailsList = farmTravelTagDetailsService.getFarmTravelByTagID(tag_ID);
        FarmTravelService farmTravelService = new FarmTravelService();
        List<FarmTravelVO> farmTravelList = new ArrayList<>();
        for (FarmTravelTagDetailsVO farmTravelTagDetails : farmTravelTagDetailsList){
            FarmTravelVO farmTravel = farmTravelService.getOneFarmTravel(farmTravelTagDetails.getFarm_travel_ID());
            farmTravelList.add(farmTravel);
        }
        request.setAttribute("farmTravelList", farmTravelList);
        request.getRequestDispatcher("/front-end/farmTravel/listAllFarmTravelByTag.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String tag_name = request.getParameter("tag_name");

        if ("insert".equals(action)){
            FarmTravelTagService farmTravelTagService = new FarmTravelTagService();
            FarmTravelTagVO farmTravelTag = farmTravelTagService.getOneFarmTravelTag(tag_name);
            if (farmTravelTag == null){
                farmTravelTagService.addFarmTravelTag(tag_name);
            }else {
                farmTravelTagService.updateFarmTravelTag(farmTravelTag);
            }
        }
    }
}
