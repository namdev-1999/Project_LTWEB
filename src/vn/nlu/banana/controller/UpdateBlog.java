package vn.nlu.banana.controller;

import vn.nlu.banana.Util.DBConnection;
import vn.nlu.banana.Util.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/UpdateBlog")

public class UpdateBlog extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String id = request.getParameter("id");
        String title = request.getParameter("title");
        String titleContent = request.getParameter("titleContent");
        String content = request.getParameter("desc");

        try {
            String sql = "Update blog set blog.content =?, blog.title=? ,blog.tilteContent=? where blog.id =?";
            PreparedStatement ps = DBConnection.getPreparedStatement(sql);
            ps.setString(1, content);
            ps.setString(2, title);
            ps.setString(3, titleContent);
            ps.setInt(4,Integer.parseInt(id));
            ps.execute();
            response.sendRedirect(Util.fullPath("/admin/blog-manage.jsp"));
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

    }
}