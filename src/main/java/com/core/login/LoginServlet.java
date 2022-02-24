package com.core.login;

import com.fMem.model.FMemVO;
import com.mem.model.MemVO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;

@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        String farmerOrNot = request.getParameter("farmerOrNot");

        Map<String, String> farmTravelStatus = new LinkedHashMap<String, String>();
        farmTravelStatus.put("0", "未開放");
        farmTravelStatus.put("1", "開放報名中");
        farmTravelStatus.put("2", "開放報名中 <br/><span style='border:3px solid #a8dba8;border-radius:10px;'> 已成團 </span>");
        farmTravelStatus.put("3", "已額滿");
        farmTravelStatus.put("4", "已取消");

        Map<String, String> farmTravelOrderStatusByMem = new LinkedHashMap<String, String>();
        farmTravelOrderStatusByMem.put("0", "待付款");
        farmTravelOrderStatusByMem.put("1", "等待行程開始");
        farmTravelOrderStatusByMem.put("2", "行程已結束");  // 活動結束後給小農按結束
        farmTravelOrderStatusByMem.put("3", "評價完成");  // 活動結束後會員可以評價
        farmTravelOrderStatusByMem.put("4", "圓滿結束");
        farmTravelOrderStatusByMem.put("5", "報名已取消");

        Map<String, String> farmTravelOrderStatusByFMem = new LinkedHashMap<String, String>();
        farmTravelOrderStatusByFMem.put("0", "待付款");
        farmTravelOrderStatusByFMem.put("1", "已成立");
        farmTravelOrderStatusByFMem.put("2", "行程已結束 / 待會員評價");  // 活動結束後給小農按結束
        farmTravelOrderStatusByFMem.put("3", "會員已評價");  // 活動結束後會員可以評價
        farmTravelOrderStatusByFMem.put("4", "已完成");
        farmTravelOrderStatusByFMem.put("5", "已取消");

        session.setAttribute("farmTravelStatus", farmTravelStatus);
        session.setAttribute("farmTravelOrderStatusByMem", farmTravelOrderStatusByMem);
        session.setAttribute("farmTravelOrderStatusByFMem", farmTravelOrderStatusByFMem);

        // 假會員
        if (farmerOrNot.equals("not")) {
            MemVO mem = new MemVO();
            mem.setMem_id(77000);
            mem.setMem_id_state(0);
            session.setAttribute("memVO", mem);
            System.out.println("一般會員登入");
            request.getRequestDispatcher("/front-end/demo/memIndex.jsp").forward(request,response);
        }
        // 假小農
        if (farmerOrNot.equals("yes")) {
            FMemVO fMem = new FMemVO();
            fMem.setF_mem_id(70000);
            fMem.setMem_id(77002);
            session.setAttribute("fMemVO", fMem);
            System.out.println("小農會員登入");
            request.getRequestDispatcher("/front-end/farmTravel/listAllFarmTravelByFMem.jsp").forward(request,response);
        }
    }
}
