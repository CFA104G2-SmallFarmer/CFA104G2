package com.farmTravel.controller;

import com.farmTravel.model.FarmTravelService;
import com.farmTravel.model.FarmTravelVO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/getImage.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class GetImageServlet extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("image/gif");
        ServletOutputStream out = response.getOutputStream();

        Integer farm_travel_ID = Integer.valueOf(request.getParameter("farm_travel_ID"));
        try {
            FarmTravelService farmTravelService = new FarmTravelService();
            FarmTravelVO dao = farmTravelService.getOneFarmTravel(farm_travel_ID);
            byte[] farm_travel_img = dao.getFarm_travel_img();
            out.write(farm_travel_img);
        } catch (NullPointerException e) {
            e.printStackTrace(System.err);
        }
    }
}
