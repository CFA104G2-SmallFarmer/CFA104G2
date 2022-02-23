package com.core.schedule;

import com.farmTravel.model.FarmTravelService;
import com.farmTravelOrder.model.FarmTravelOrderService;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import java.util.*;

public class ScheduleServlet extends HttpServlet {
    Timer timer;

    public void init() throws ServletException {
        timer = new Timer();
        Calendar cal = new GregorianCalendar(2022, Calendar.FEBRUARY, 23, 21, 0, 0);
        TimerTask task = new TimerTask(){

            public void run() {
                FarmTravelService farmTravelService = new FarmTravelService();
                farmTravelService.applyChange();
                FarmTravelOrderService farmTravelOrderService = new FarmTravelOrderService();
                farmTravelOrderService.travelCompleted();
            }
        };
        timer.scheduleAtFixedRate(task, cal.getTime(), 10*60*1000);
    }

    public void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
    }

    public void destroy() {
        timer.cancel();
    }
}