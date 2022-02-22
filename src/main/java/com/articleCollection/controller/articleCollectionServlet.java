package com.articleCollection.controller;

import com.articleCollection.model.ArticleCollectionService;
import com.mem.model.MemVO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.*;

@WebServlet("/articleCollection.do")
public class articleCollectionServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("image/gif");
        ServletOutputStream out = response.getOutputStream();
        String action = request.getParameter("action");
        boolean collection ;

        if ("collection".equals(action)){
            Integer mem_id = Integer.valueOf(request.getParameter("mem_id"));
            Integer article_ID = Integer.valueOf(request.getParameter("article_ID"));

            ArticleCollectionService articleCollectionService = new ArticleCollectionService();
            collection = articleCollectionService.getOneArticleCollection(mem_id, article_ID);

            InputStream inputStream;

            if (collection){
                inputStream = getServletContext().getResourceAsStream("/front-end/farmTravel/images/Hearted.png");
                byte[] image = new byte[inputStream.available()];
                inputStream.read(image);
                out.write(image);
            }else{
                inputStream = getServletContext().getResourceAsStream("/front-end/farmTravel/images/Heart.png");
                byte[] image = new byte[inputStream.available()];
                inputStream.read(image);
                out.write(image);
            }
            inputStream.close();
        }
        out.close();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        PrintWriter out = response.getWriter();
        boolean collected ;

        if ("collection".equals(action)){

            Integer mem_id = ((MemVO)session.getAttribute("memVO")).getMem_id();
            Integer article_ID = Integer.valueOf(request.getParameter("article_ID"));

            ArticleCollectionService articleCollectionService = new ArticleCollectionService();
            collected = articleCollectionService.getOneArticleCollection(mem_id, article_ID);

            if (collected){
                articleCollectionService.deleteArticleCollection(mem_id, article_ID);
                out.print("0");
            }else{
                articleCollectionService.addArticleCollection(mem_id, article_ID);
                out.print("1");
            }
        }
    }
}