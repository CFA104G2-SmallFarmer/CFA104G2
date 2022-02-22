package com.core.demoFilter;

import com.fMem.model.FMemVO;
import com.mem.model.MemVO;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;

@WebFilter("/*")  // 過濾所有的請求資源路徑
public class DemoFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {

        final HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        final HttpSession session = httpServletRequest.getSession();

        // 設定編碼
        request.setCharacterEncoding("UTF-8");

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

        // 放行
        chain.doFilter(request, response);
    }

    public void destroy() {
    }
}
