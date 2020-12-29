package vn.nlu.banana.controller;

import vn.nlu.banana.Util.DBConnection;
import vn.nlu.banana.model.User;

import javax.servlet.ServletContext;
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

@WebServlet("/ChangePass")

public class ChangePass extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");


        String curPass = request.getParameter("curPass");
        String pass = request.getParameter("pass");
        String repeat_pass = request.getParameter("repeat-pass");
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("user");
        int id = u.getId();

        try {
            String sql = "select * from user where `user`.id = ?";
            PreparedStatement ps = DBConnection.getPreparedStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            rs.first();
            if (curPass.equals(rs.getString(3)) && pass.equals(repeat_pass)) {
                String sql1 = "Update `user` set user.password = ? where `user`.id = ?";
                PreparedStatement ps1 = DBConnection.getPreparedStatement(sql1);
                ps1.setString(1, pass);
                ps1.setInt(2, id);
                ps1.executeUpdate();
                response.sendRedirect("index.jsp");
            } else {
                request.setAttribute("err", "Mật khẩu hiện tại không đúng");
                response.sendRedirect("changepass.jsp");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }


    }
}