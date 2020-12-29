package vn.nlu.banana.controller;

import vn.nlu.banana.Util.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/UpdateStatus")

public class UpdateStatus extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        int status = Integer.parseInt(request.getParameter("status"));
        String id = request.getParameter("id");


        try {
            String sql = "Update `order` set status=? where id = ?";
            PreparedStatement ps = DBConnection.getPreparedStatement(sql);
            ps.setInt(1, status);
            ps.setInt(2, Integer.parseInt(id));
            ps.executeUpdate();
            response.sendRedirect("admin/order-manage.jsp");

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}