package vn.nlu.banana.controller;

import vn.nlu.banana.Util.DBConnection;
import vn.nlu.banana.model.User;

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

@WebServlet("/DoLoginAdmin")

public class DoLoginAdmin extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        try {
            String email = request.getParameter("email");
            String pass = request.getParameter("pass");
            String sql = "SELECT * FROM user where Email= ? and `Password` = ? and admin = 1 and active = 1";
            PreparedStatement ps = DBConnection.getPreparedStatement(sql);
            ps.setString(1, email);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            rs.last();
            int i = rs.getRow();
            if (rs != null && i == 1) {
                rs.first();
                User u = new User();
                u.setId(rs.getInt(1));
                u.setEmail(rs.getString(2));
                u.setPass("");
                u.setName(rs.getString(4));
                u.setAddress(rs.getString(5));
                u.setPhone(rs.getString(6));
                u.setAdmin(rs.getInt(7));
                u.setActive(rs.getInt(8));
                HttpSession session = request.getSession();
                session.setAttribute("user", u);
                response.sendRedirect("index.jsp");
            } else {
                request.setAttribute("err", "Sai Email hoặc mật khẩu");
                request.getRequestDispatcher("admin/pages-login.jsp").forward(request, response);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            System.out.println("Lỗi kết nối tới CSDL");
            request.setAttribute("err", "Sai Email hoặc mật khẩu");
            request.getRequestDispatcher("admin/pages-login.jsp").forward(request, response);
        }
    }
}