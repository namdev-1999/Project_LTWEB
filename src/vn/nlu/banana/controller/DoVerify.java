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

@WebServlet("/DoVerify")

public class DoVerify extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        try {
            String command = request.getParameter("command");
            String key = request.getParameter("verify");
            String sql = "Select * from user where Email=?";
            PreparedStatement ps = DBConnection.getPreparedStatement(sql);
            HttpSession emailSession = request.getSession();
            ps.setString(1, (String) emailSession.getAttribute("email"));
            ResultSet rs = ps.executeQuery();
            rs.first();
            if (key.equals(rs.getString(9))) {
                if (command.equals("verify-mail")) {
                    String sqlActive = "Update user SET user.active = 1 where user.Id = ?";
                    PreparedStatement psActive = DBConnection.getPreparedStatement(sqlActive);
                    psActive.setInt(1, rs.getInt(1));
                    psActive.executeUpdate();
                    response.sendRedirect("login.jsp");
                }else if (command.equals("forgot-pass")){
                    int number = (int) Math.floor(((Math.random() * 899999) + 100000));
                    String host;
                    String port;
                    String user;
                    String password;
                    String sqlforgot = "Update user SET user.Password = ? where user.Id = ?";
                    PreparedStatement psforgot = DBConnection.getPreparedStatement(sqlforgot);
                    psforgot.setInt(1, number);
                    psforgot.setInt(2, rs.getInt(1));
                    psforgot.executeUpdate();
                    //Gửi mật khẩu mới
                    ServletContext context = getServletContext();
                    host = context.getInitParameter("host");
                    port = context.getInitParameter("port");
                    user = context.getInitParameter("user");
                    password = context.getInitParameter("pass");
                    response.getWriter().println("fdsfsfsd");
                    String recipient =  (String) emailSession.getAttribute("email");
                    String name = recipient;
                    String message = "Your new password is " + number;
                    String resultMessage = "";
                    response.sendRedirect("login.jsp");
                    try {
                        SendMail.sendEmail(host, port, user, password, recipient, name, message);
                        resultMessage = "Mail xác thực đã gửi tới email " + recipient;
                    } catch (Exception ex) {
                        ex.printStackTrace();
                        resultMessage = "Đã có lỗi xảy ra: " + ex.getMessage();
                    } finally {
                        request.setAttribute("Message", resultMessage);
                    }
                }
            } else {
                request.setAttribute("verify", "Sai mã xác thực");
                request.getRequestDispatcher("verify-email.jsp").forward(request, response);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            System.out.println("Lỗi kết nối tới CSDL");
            request.getRequestDispatcher("verify-email.jsp").forward(request, response);
        }
    }

    public static void main(String[] args) {

    }
}