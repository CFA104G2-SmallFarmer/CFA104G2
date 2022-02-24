package com.article.controller;

import com.article.model.ArticleService;
import com.article.model.ArticleVO;
import com.comments.model.CommentsService;
import com.comments.model.CommentsVO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

@WebServlet("/article.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class ArticleServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("image/gif");
        ServletOutputStream out = response.getOutputStream();

        Integer article_ID = Integer.valueOf(request.getParameter("article_ID"));
        try {
            ArticleService articleService = new ArticleService();
            ArticleVO article = articleService.getOneArticle(article_ID);
            byte[] article_img = article.getArticle_img();
            out.write(article_img);
        } catch (NullPointerException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String action = request.getParameter("action");

        if ("insert".equals(action)) {
            List<String> errorMsgs = new LinkedList<String>();
            request.setAttribute("errorMsgs", errorMsgs);
            try {  // 接收參數並嘗試做錯誤判斷
                Integer mem_id = (Integer) session.getAttribute("mem_id");
                //Integer F_mem_id = (Integer) session.getAttribute("F_mem_id");

                String article_title = request.getParameter("article_title");
                if (article_title == null || article_title.trim().length() == 0) {
                    errorMsgs.add("請輸入文章標題");
                }

                Integer article_type_ID = Integer.valueOf(request.getParameter("article_type_ID"));
                //if(article_type_ID==null || article_type_ID.trim().length()==0) { errorMsgs.add("請輸入文章類別"); }

                String article_content = request.getParameter("article_content");
                if (article_content == null || article_content.trim().length() == 0) {
                    errorMsgs.add("請輸入文章內容");
                }

                // 使用Part讀取圖片
                InputStream in = request.getPart("article_img").getInputStream();
                byte[] article_img = null;
                if (in.available() != 0) {
                    article_img = new byte[in.available()];
                    in.read(article_img);
                    in.close();
                }


                // 存入VO，避免新增失敗時需再次輸入重複資料 (PK未存入)
                ArticleVO article = new ArticleVO();
                article.setArticle_title(article_title);
                article.setMem_id(mem_id);
                article.setArticle_type_ID(article_type_ID);
                article.setArticle_content(article_content);
                article.setArticle_img(article_img);

                if (!errorMsgs.isEmpty()) {  // 若以上格式有錯返回add頁面
                    request.setAttribute("article", article);
                    RequestDispatcher errView = request.getRequestDispatcher("/front-end/article/addArticle.jsp");
                    errView.forward(request, response);
                    return;
                }
                try {  // 嘗試新增資料，若發生錯誤返回add頁面
                    ArticleService articleService = new ArticleService();
                    article = articleService.addArticle(article_title, mem_id, article_type_ID, article_content, article_img);
                } catch (Exception e) {
                    e.printStackTrace();
                    errorMsgs.add("新增失敗");
                    request.setAttribute("article", article);
                    RequestDispatcher errView = request.getRequestDispatcher("/front-end/article/addArticle.jsp");
                    errView.forward(request, response);
                    return;
                }
                // 新增成功時跳轉至listALl頁面
                RequestDispatcher successView = request.getRequestDispatcher("/front-end/article/listAllArticle.jsp");
                successView.forward(request, response);

            } catch (Exception e) {  // 發生其他Error時
                e.printStackTrace();
                errorMsgs.add(e.getMessage());
                RequestDispatcher errView = request.getRequestDispatcher("/front-end/article/addArticle.jsp");
                errView.forward(request, response);
            }



        }
        if ("getOne".equals(action)) {
//
            try{
                // 接收請求參數，並做錯誤判斷
                Integer article_ID = Integer.valueOf(request.getParameter("article_ID"));

                // 開始查詢資料
                ArticleService articleService = new ArticleService();
                ArticleVO article = articleService.getOneArticle(article_ID);

                // 查詢完成，準備轉交
                request.setAttribute("article", article);
                RequestDispatcher successView = request.getRequestDispatcher("/front-end/article/listOneArticle.jsp");
                successView.forward(request, response);

            }catch(Exception e){  // 發生其他Error時
                e.printStackTrace(System.err);
                RequestDispatcher errView = request.getRequestDispatcher("/front-end/article/listAllArticle.jsp");
                errView.forward(request, response);
            }
        }

        if ("getOneForUpdate".equals(action)) {


            try{
                // 接收請求參數，並做錯誤判斷
                Integer article_ID = Integer.valueOf(request.getParameter("article_ID"));

                // 開始查詢資料
                ArticleService articleService = new ArticleService();
                ArticleVO article = articleService.getOneArticle(article_ID);

                // 查詢完成，準備轉交
                request.setAttribute("article", article);
                RequestDispatcher successView = request.getRequestDispatcher("/front-end/article/updateArticle.jsp");
                successView.forward(request, response);

            }catch(Exception e){  // 發生其他Error時
                e.printStackTrace(System.err);
                RequestDispatcher errView = request.getRequestDispatcher("/front-end/article/listAllArticle.jsp");
                errView.forward(request, response);
            }
        }
        if ("addOneLike".equals(action)) {
            try{
                // 接收請求參數，並做錯誤判斷
                Integer article_ID = Integer.valueOf(request.getParameter("article_ID"));

                // 開始查詢資料
                ArticleService articleService = new ArticleService();
                ArticleVO article = articleService.getOneArticle(article_ID);

                article = articleService.updateArticle(article.getArticle_title(), article.getArticle_content(), article.getArticle_img(), article.getArticle_like()+1, article.getComments_num(), article.getArticle_state(), article.getArticle_ID());

                // 查詢完成，準備轉交
                request.setAttribute("article", article);
                RequestDispatcher successView = request.getRequestDispatcher("/front-end/article/listOneArticle.jsp");
                successView.forward(request, response);

            }catch(Exception e){  // 發生其他Error時
                e.printStackTrace(System.err);
                RequestDispatcher errView = request.getRequestDispatcher("/front-end/article/listAllArticle.jsp");
                errView.forward(request, response);
            }

        }
        if ("search".equals(action)) {


            try{
                // 接收請求參數，並做錯誤判斷
                String searchArticle = "%"+request.getParameter("searchArticle")+"%";

                // 開始
                ArticleService articleService = new ArticleService();
                List<ArticleVO> articleList = articleService.articleBySearch(searchArticle);

                // 查詢完成，準備轉交
                request.setAttribute("articleList", articleList);
                System.out.println(articleList);
                RequestDispatcher successView = request.getRequestDispatcher("/front-end/article/listArticleBySearch.jsp");
                successView.forward(request, response);

            }catch(Exception e){  // 發生其他Error時
                e.printStackTrace(System.err);
                RequestDispatcher errView = request.getRequestDispatcher("/front-end/article/listAllArticle.jsp");
                errView.forward(request, response);
            }
        }







        if ("update".equals(action)) {
            List<String> errorMsgs = new LinkedList<String>();
            request.setAttribute("errorMsgs", errorMsgs);
            try {  // 接收參數並嘗試做錯誤判斷
                Integer article_ID = Integer.valueOf(request.getParameter("article_ID"));
                ArticleService articleService = new ArticleService();
                ArticleVO article = articleService.getOneArticle(article_ID);

                String article_title = request.getParameter("article_title");
                if (article_title == null || article_title.trim().length() == 0) {
                    errorMsgs.add("請輸入文章標題");
                } else {
                    article.setArticle_title(article_title);
                }

                String article_content = request.getParameter("article_content");
                if (article_content == null || article_content.trim().length() == 0) {
                    errorMsgs.add("請輸入文章內容");
                } else {
                    article.setArticle_content(article_content);
                }

                // 使用Part讀取圖片
                byte[] article_img = article.getArticle_img();
                InputStream in = request.getPart("article_img").getInputStream();
                if (in.available() != 0) {
                    article_img = new byte[in.available()];
                    in.read(article_img);
                    in.close();
                }
                if (!errorMsgs.isEmpty()) {  // 若以上格式有錯返回update頁面
                    request.setAttribute("article", article);
                    RequestDispatcher errView = request.getRequestDispatcher("/front-end/article/updateArticle.jsp");
                    errView.forward(request, response);
                    return;
                }
                try {  // 嘗試更新資料，若發生錯誤返回update頁面
                    articleService = new ArticleService();
                    article = articleService.updateArticle(
                            article_title, article_content, article_img,
                            article.getArticle_like(), article.getComments_num(), article.getArticle_state(), article.getArticle_ID());
                } catch (Exception e) {
                    e.printStackTrace();
                    errorMsgs.add("更新失敗");
                    request.setAttribute("article", article);
                    RequestDispatcher errView = request.getRequestDispatcher("/front-end/article/updateArticle.jsp");
                    errView.forward(request, response);
                    return;
                }
                // 更新成功時跳轉至listALl頁面
                RequestDispatcher successView = request.getRequestDispatcher("/front-end/article/listAllArticle.jsp");
                successView.forward(request, response);

            } catch (Exception e) {  // 發生其他Error時
                e.printStackTrace();
                errorMsgs.add(e.getMessage());
                RequestDispatcher errView = request.getRequestDispatcher("/front-end/article/updateArticle.jsp");
                errView.forward(request, response);
            }
        }
        if ("delete".equals(action)) {
            List<String> errorMsgs = new LinkedList<String>();
            request.setAttribute("errorMsgs", errorMsgs);

            try {
                // 接收參數
                Integer article_ID = Integer.valueOf(request.getParameter("article_ID"));

                // 準備刪除
                CommentsService commentsService = new CommentsService();
                List<CommentsVO> commentsVOList = commentsService.getAllComments(article_ID);


                for(int i =0;i<commentsVOList.size();i++){
                    //System.out.println(commentsVOList.get(i).getComments_ID());
                    commentsService.deleteComments(commentsVOList.get(i).getComments_ID());
                }

                ArticleService articleService = new ArticleService();
                articleService.deleteArticle(article_ID);

            } catch (Exception e) {  // 發生其他Error時
                errorMsgs.add("刪除資料失敗:" + e.getMessage());
                RequestDispatcher errView = request.getRequestDispatcher("/front-end/article/listAllArticle.jsp");
                errView.forward(request, response);
            }
        }
    }
}

            
            