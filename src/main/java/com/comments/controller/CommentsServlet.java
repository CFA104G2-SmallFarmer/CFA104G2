package com.comments.controller;

//import com.article.model.ArticleService;
//import com.article.model.ArticleVO;

import com.article.model.ArticleService;
import com.article.model.ArticleVO;
import com.comments.model.CommentsService;
import com.comments.model.CommentsVO;
import com.mem.model.MemVO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.InputStream;
import java.util.LinkedList;
import java.util.List;


@WebServlet("/comments.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class CommentsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("image/gif");
        ServletOutputStream out = response.getOutputStream();

        Integer comments_ID = Integer.valueOf(request.getParameter("comments_ID"));
        try {
            CommentsService commentsService = new CommentsService();
            CommentsVO comments = commentsService.getOneComments(comments_ID);
            byte[] comments_img = comments.getComments_img();
            out.write(comments_img);
        } catch (NullPointerException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        if ("insert".equals(action)) {
            List<String> errorMsgs = new LinkedList<String>();
            request.setAttribute("errorMsgs", errorMsgs);
            ArticleVO article = null;

            try {  /***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/

                Integer mem_id = (Integer)((MemVO)(session.getAttribute("memVO"))).getMem_id();

                String comments_content = request.getParameter("comments_content");

                if (comments_content == null || comments_content.trim().length() == 0) { errorMsgs.add("請輸入留言..."); }

                // 使用Part讀取圖片
                InputStream in = request.getPart("comments_img").getInputStream();
                byte[] comments_img = null;
                if (in.available() != 0) {
                    comments_img = new byte[in.available()];
                    in.read(comments_img);
                    in.close();
                }

                CommentsVO comments = new CommentsVO();
                comments.setComments_content(comments_content);
                comments.setComments_img(comments_img);

                // 從jsp取得name=article_ID的value
                Integer article_ID = Integer.valueOf(request.getParameter("article_ID"));
                // new 一個service
                ArticleService articleService = new ArticleService();
                // 用service的getOne(article_ID)去取得這個articleVO
                article = articleService.getOneArticle(article_ID);

                if (!errorMsgs.isEmpty()) {
                    request.setAttribute("article",article);
                    request.setAttribute("comments",comments);
                    request.getRequestDispatcher("/front-end/article/listOneArticle.jsp").forward(request, response);
                    return;
                }

                /***************************2.開始新增資料***************************************/
                try {  // 未做交易控制
                    CommentsService commentsService = new CommentsService();
                    commentsService.addComments(article_ID, mem_id, comments_content, comments_img);
                    article = articleService.updateArticle(article.getArticle_title(),article.getArticle_content(),article.getArticle_img(),article.getArticle_like(),article.getComments_num()+1, article.getArticle_state(), article.getArticle_ID());
                } catch (Exception e) {
                    e.printStackTrace();
                    errorMsgs.add("新增失敗");
                    request.setAttribute("comments", comments);
                    request.setAttribute("article",article);
                    request.getRequestDispatcher("/front-end/article/listOneArticle.jsp").forward(request, response);
                    return;
                }

                /***************************3.新增完成,準備轉交(Send the Success view)***********/
                // 新增成功時跳轉至listALl頁面
                request.setAttribute("article", article);
                RequestDispatcher successView = request.getRequestDispatcher("/front-end/article/listOneArticle.jsp");
                successView.forward(request, response);

                /***************************其他可能的錯誤處理**********************************/
            } catch (Exception e) {
                e.printStackTrace();
                errorMsgs.add(e.getMessage());
                request.setAttribute("article",article);
                RequestDispatcher errView = request.getRequestDispatcher("/front-end/article/listOneArticle.jsp");
                errView.forward(request, response);
            }
        }


        if ("addOneCommentsLike".equals(action)) {
            try{
                // 接收請求參數，並做錯誤判斷
                Integer comments_ID = Integer.valueOf(request.getParameter("comments_ID"));
                // 開始查詢資料
                CommentsService commentsService = new CommentsService();
                CommentsVO comments = commentsService.getOneComments(comments_ID);

                ArticleService articleService = new ArticleService();
                ArticleVO article = articleService.getOneArticle(comments.getArticle_ID());

                comments = commentsService.updateComments(comments.getComments_content(), comments.getComments_like()+1, comments.getComments_img(), comments.getComments_state(), comments_ID);

                request.setAttribute("article", article);

                // 查詢完成，準備轉交
                request.setAttribute("comments", comments);
                RequestDispatcher successView = request.getRequestDispatcher("/front-end/article/listOneArticle.jsp");
                successView.forward(request, response);

            }catch(Exception e){  // 發生其他Error時
                e.printStackTrace(System.err);
                RequestDispatcher errView = request.getRequestDispatcher("/front-end/article/listOneArticle.jsp");
                errView.forward(request, response);
            }

        }
    }
}


