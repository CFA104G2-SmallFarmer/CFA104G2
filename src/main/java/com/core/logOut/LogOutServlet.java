package com.core.logOut;

import com.fMem.model.FMemVO;
import com.mem.model.MemVO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/logOut.do")
public class LogOutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // 取得session，若session為null，不建立新的session
        HttpSession session = request.getSession(false);

        // 若session不為空，讓此session失效
        if (session != null) {
            session.invalidate();
            session = null;
        }
    }
}