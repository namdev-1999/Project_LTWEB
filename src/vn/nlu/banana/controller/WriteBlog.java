package vn.nlu.banana.controller;

import vn.nlu.banana.Util.DBConnection;
import vn.nlu.banana.Util.Util;
import vn.nlu.banana.model.Blog;
import vn.nlu.banana.model.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/WriteBlog")

public class WriteBlog extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        try {
            String count = "SELECT COUNT(*) from `blog`";
            PreparedStatement ps = DBConnection.getPreparedStatement(count);
            ResultSet rs = ps.executeQuery();
            rs.first();
            int id = rs.getInt(1) ;

            System.out.println(1);
            String title = request.getParameter("title");
            String titleContent = request.getParameter("titleContent");
            String content = request.getParameter("desc");
            long millis = System.currentTimeMillis();
            java.sql.Date date = new java.sql.Date(millis);

            String sql = "INSERT INTO blog VALUES (?,?,?,?,?)";
            PreparedStatement ps1 = DBConnection.getPreparedStatement(sql);
            ps1.setInt(1,id);
            ps1.setString(2,content);
            ps1.setString(3,title);
            ps1.setString(4,titleContent);
            ps1.setDate(5, date);
            ps1.execute();
            response.sendRedirect(Util.fullPath("/admin/blog-manage.jsp"));
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}