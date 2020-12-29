package vn.nlu.banana.controller;

import vn.nlu.banana.Util.DBConnection;

import javax.servlet.ServletConfig;
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

@WebServlet("/DoRegister")

public class DoRegister extends HttpServlet {
    private String host;
    private String port;
    private String user;
    private String password;


    private static final long serialVersionUID = 1L;

    public DoRegister() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        //Làm chức năng đăng ký với active = 0 admin = 0
        try {
            ResultSet rs = null;
            // Nhập dữ liệu
            String email = request.getParameter("email");
            String pass = request.getParameter("pass");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            //end

            //Số dòng đang có trong csdl
            String count = "SELECT * FROM user";
            PreparedStatement pscount = DBConnection.getPreparedStatement(count);
            rs = pscount.executeQuery();
            rs.afterLast();
            int i = rs.getRow()+1;

            //Check có trùng email trong csdl
            String checkEmail = "SELECT * FROM user where Email= ?";
            PreparedStatement psCheck = DBConnection.getPreparedStatement(checkEmail);
            psCheck.setString(1, email);
            ResultSet rs2 = psCheck.executeQuery();
            rs2.last();
            int c = rs2.getRow();

            // Đưa vào csdl
            if (c == 0) {
                int number = (int) Math.floor(((Math.random() * 899999) + 100000));
                rs2.first();
                String sql = "Insert into `user` values (?,?,?,?,?,?,0,0,?)";
                PreparedStatement ps = DBConnection.getPreparedStatement(sql);
                ps.setInt(1, i);
                ps.setString(2, email);
                ps.setString(3, pass);
                ps.setString(4, null);
                ps.setString(5, address);
                ps.setString(6, phone);
                ps.setInt(7, number);
                ps.executeUpdate();

                //Gửi mail
                ServletContext context = getServletContext();
                host = context.getInitParameter("host");
                port = context.getInitParameter("port");
                user = context.getInitParameter("user");
                password = context.getInitParameter("pass");
                response.getWriter().println("fdsfsfsd");
                String recipient = request.getParameter("email");
                String name = request.getParameter("email");
                String message = "Your key is " + number;
                String resultMessage = "";

                try {
                    SendMail.sendEmail(host, port, user, password, recipient, name, message);
                    resultMessage = "Mail xác thực đã gửi tới email " + recipient;
                } catch (Exception ex) {
                    ex.printStackTrace();
                    resultMessage = "Đã có lỗi xảy ra: " + ex.getMessage();
                } finally {
                    request.setAttribute("Message", resultMessage);
                }
                if (request.getAttribute("email")!=null) request.removeAttribute("email");
                HttpSession emailSession = request.getSession();
                emailSession.setAttribute("email", recipient);
                //end gửi mail

                response.sendRedirect("verify-email.jsp");
            } else {
                request.setAttribute("signup", "Email đã tồn tại xin hãy nhập email khác");
                request.getRequestDispatcher("sign-up.jsp").forward(request, response);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            System.out.println("Lỗi kết nối tới CSDL");
            request.getRequestDispatcher("sign-up.jsp").forward(request, response);
        }
    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
    }
}