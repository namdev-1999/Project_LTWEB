package vn.nlu.banana.controller;

import vn.nlu.banana.Util.DBConnection;

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

@WebServlet("/DoForgot")

public class DoForgot extends HttpServlet {
    private String host;
    private String port;
    private String user;
    private String password;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        try {
            String email = request.getParameter("email");
            String sql = "Select * from user where Email =?";
            PreparedStatement ps = DBConnection.getPreparedStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            rs.last();
            int c = rs.getRow();
            if (c == 1 && rs != null) {
                rs.first();
                int number = (int) Math.floor(((Math.random() * 899999) + 100000));
                String sqlKey = "Update user SET user.Key = ? where user.Email = ?";
                PreparedStatement psKey = DBConnection.getPreparedStatement(sqlKey);
                psKey.setInt(1, number);
                psKey.setString(2,email);
                psKey.executeUpdate();
                //Gửi mail
                ServletContext context = getServletContext();
                host = context.getInitParameter("host");
                port = context.getInitParameter("port");
                user = context.getInitParameter("user");
                password = context.getInitParameter("pass");
                response.getWriter().println("fdsfsfsd");
                String name = request.getParameter("email");
                String message = "Your key is " + number;
                String resultMessage = "";

                try {
                    SendMail.sendEmail(host, port, user, password, email, name, message);
                    resultMessage = "Mail xác thực đã gửi tới email ";
                } catch (Exception ex) {
                    ex.printStackTrace();
                    resultMessage = "Đã có lỗi xảy ra: " + ex.getMessage();
                } finally {
                    request.setAttribute("Message", resultMessage);
                }
                if (request.getAttribute("email") != null) request.removeAttribute("email");
                HttpSession emailSession = request.getSession();
                emailSession.setAttribute("email", email);
                response.sendRedirect("forgot-pass2.jsp");
                //end gửi mail
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            System.out.println("Lỗi kết nối tới CSDL");
            request.getRequestDispatcher("forgot-pass1.jsp").forward(request, response);
        }

    }
}