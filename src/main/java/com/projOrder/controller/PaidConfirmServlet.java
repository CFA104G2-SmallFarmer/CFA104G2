package com.projOrder.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.Vector;
import com.mem.model.MemService;
import com.projOrder.model.ProjOrderService;
import com.projOrder.model.ProjOrderVO;
import com.projPerk.model.ProjPerkService;
import com.projPerk.model.ProjPerkVO;
import com.project.model.ProjectService;
import com.project.model.ProjectVO;
import com.mem.model.MemVO;

public class PaidConfirmServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        //  All：http://localhost:8080/CFA104G2/projOrder/paidConfirm.do/PO1675407274562F77005?paymentTransactionId...
        //  RequestURI：/CFA104G2/projOrder/paidConfirm.do/PO1675407274562F77005?paymentTransactionId...
        //  ContextPath：/CFA104G2
        //  ServletPath：/projOrder
        String pathAfterContext = req.getRequestURI().substring(req.getContextPath().length() + req.getServletPath().length() + 1);// paidConfirm.do/PO1675407274562F77005?paymentTransactionId...
        Vector pathParamsList = new Vector();
        for (String val : pathAfterContext.split("/")) {
            pathParamsList.add(URLDecoder.decode(val, "UTF-8"));
        }
        String paymentNumber = (String) pathParamsList.get(0);

        // 沒有ORM，自己寫，從order找到project，下了3條sql，浪費時間
        ProjOrderService projOrderSvc = new ProjOrderService();
        ProjOrderVO projOrderVO = projOrderSvc.getOneProjOrderByOrderNumber(paymentNumber);
        ProjPerkService projPerkSvc = new ProjPerkService();
        ProjPerkVO projPerkVO = projPerkSvc.getOneProjPerk(projOrderVO.getPerk_id());
        ProjectService projectSvc = new ProjectService();
        ProjectVO projectVO =  projectSvc.getOneProject(projPerkVO.getProj_id());
        req.setAttribute("projectVO", projectVO);

        // 從order找到mem
        HttpSession session = req.getSession(); //TODO 這樣取mem會有安全性問題
        MemService memSvc = new MemService();
        MemVO memVO = memSvc.getOneMem(projOrderVO.getMem_id());
        session.setAttribute("memVO", memVO);

        req.getRequestDispatcher("/front-end/projOrder/success_addOrderByMem.jsp").forward(req,res);
    }
}
