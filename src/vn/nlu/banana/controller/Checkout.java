package vn.nlu.banana.controller;

import vn.nlu.banana.Util.DBConnection;
import vn.nlu.banana.model.Item;
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
import java.util.Date;

@WebServlet("/Checkout")

public class Checkout extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (session.getAttribute("user") == null) {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
        long millis = System.currentTimeMillis();
        java.sql.Date date = new java.sql.Date(millis);
        vn.nlu.banana.model.Cart cart = (vn.nlu.banana.model.Cart) session.getAttribute("cart");

        String sql = "INSERT INTO `order` VALUES(?,?,?,?,?,?,?,?,?,?)";
        try {
            String fname = request.getParameter("first_name");
            String lname = request.getParameter("last_name");
            String street_address = request.getParameter("street_address");
            String phone_number = request.getParameter("phone_number");
            PreparedStatement ps = DBConnection.getPreparedStatement(sql);
            ResultSet rs = DBConnection.getPreparedStatement("SELECT COUNT(*) from `order`").executeQuery();
            rs.first();
            int id = rs.getInt(1);
            ps.setInt(1, id);
            ps.setString(2, "1");
            ps.setDate(3, date);
            ps.setDouble(4, cart.total());
            ps.setInt(5, 456);
            ps.setInt(6, 789);
            ps.setString(7, street_address);
            ps.setString(8, fname + lname);
            ps.setString(9,phone_number);
            ps.setInt(10,user.getId());
            ps.executeUpdate();
            for (Item i : cart.getData()) {
                PreparedStatement ps2 = DBConnection.getPreparedStatement("INSERT INTO `orderdetail` VALUES(?,?,?,?,?)");
                ResultSet rs2 = DBConnection.getPreparedStatement("SELECT COUNT(*) from `orderdetail`").executeQuery();
                rs2.first();
                int id2 = rs2.getInt(1);
                ps2.setInt(1, id2);
                ps2.setInt(2, id);
                ps2.setInt(3, i.getShoe().getId());
                ps2.setInt(4, i.getSize());
                ps2.setInt(5, i.getQuantity());
                ps2.executeUpdate();
            }
            session.setAttribute("cart", null);
            request.getRequestDispatcher("index.jsp").forward(request, response);

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}