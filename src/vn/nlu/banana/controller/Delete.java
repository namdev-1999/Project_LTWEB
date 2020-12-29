package vn.nlu.banana.controller;

import vn.nlu.banana.Util.DBConnection;
import vn.nlu.banana.Util.Util;
import vn.nlu.banana.model.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/Delete")

public class Delete extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        try {
            String command = request.getParameter("command");
            if (command.equals("producer")) {
                Type.delProducer(Integer.parseInt(request.getParameter("del")));
                response.sendRedirect("admin/producer-manage.jsp");
            } else if (command.equals("order")) {
                Order.delOrder(Integer.parseInt(request.getParameter("del")));
                response.sendRedirect("admin/order-manage.jsp");
            } else if (command.equals("user")) {
                User.delUser(Integer.parseInt(request.getParameter("del")));
                response.sendRedirect("admin/user-manage.jsp");
            } else if (command.equals("hot") || command.equals("new") || command.equals("upsell") || command.equals("related")) {
                ListProduct.delProductSp(Integer.parseInt(request.getParameter("del")), command);
                HttpSession session = request.getSession();
                HttpSession currentPage = request.getSession();
                response.sendRedirect("admin/product-manage.jsp?sorter=" + session.getAttribute("sort") + "&page=" + currentPage.getAttribute("currentPage"));
            } else if (command.equals("blog")) {
                String sql = "delete from blog where id=?";
                PreparedStatement ps = DBConnection.getPreparedStatement(sql);
                ps.setInt(1, Integer.parseInt(request.getParameter("del")));
                ps.executeUpdate();
                response.sendRedirect("admin/blog-manage.jsp");
            } else if (command.equals("comment")) {
                String sql = "delete from comment where id=?";
                PreparedStatement ps = DBConnection.getPreparedStatement(sql);
                ps.setInt(1, Integer.parseInt(request.getParameter("del")));
                ps.executeUpdate();
                response.sendRedirect("admin/comment-manage.jsp");
            } else if (command.equals("sale")){
                Ads.delAds(Integer.parseInt(request.getParameter("del")));
                response.sendRedirect("admin/sale-manage.jsp");
            }else{
                ListProduct.delProduct(Integer.parseInt(request.getParameter("del")));
                HttpSession session = request.getSession();
                HttpSession currentPage = request.getSession();
                response.sendRedirect("admin/product-manage.jsp?sorter=" + session.getAttribute("sort") + "&page=" + currentPage.getAttribute("currentPage"));
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}