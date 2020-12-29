package vn.nlu.banana.controller;

import vn.nlu.banana.Util.DBConnection;
import vn.nlu.banana.model.Comment;
import vn.nlu.banana.model.User;
import vn.nlu.banana.model.Date;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/AddComment")

public class AddComment extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        try {

            HttpSession session = request.getSession();
            if (session.getAttribute("user") == null) {
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                User user = (User) session.getAttribute("user");
                String count = "SELECT COUNT(*) from `comment`";
                PreparedStatement ps1 = DBConnection.getPreparedStatement(count);
                ResultSet rs = ps1.executeQuery();
                rs.first();
                int id = rs.getInt(1) + 11;

                String star = request.getParameter("star");
                String review = request.getParameter("review");
                String idProduct = request.getParameter("id");
                long millis = System.currentTimeMillis();
                java.sql.Date d = new java.sql.Date(millis);
                String date[] = d.toString().split("-");

                Comment c = new Comment();
                c.setDate(new Date(Integer.parseInt(date[2]), Integer.parseInt(date[1]), Integer.parseInt(date[0])));
                c.setStar(Integer.parseInt(star));
                c.setContent(review);
                c.setId(id);
                c.setUsername(user.getName());


                String sql = "INSERT INTO `comment` VALUES  (?,?,?,?,?,?)";
                PreparedStatement ps2 = DBConnection.getPreparedStatement(sql);
                ps2.setInt(1, c.getId());
                ps2.setInt(2, Integer.parseInt(idProduct));
                ps2.setString(3, c.getUsername());
                ps2.setString(4, c.getContent());
                ps2.setInt(5, c.getStar());
                ps2.setString(6, c.getDate().toString());
                ps2.executeUpdate();

                response.sendRedirect("detail.jsp?id=" + idProduct);
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public static void main(String[] args) {
        long millis = System.currentTimeMillis();
        java.sql.Date date = new java.sql.Date(millis);

    }
}