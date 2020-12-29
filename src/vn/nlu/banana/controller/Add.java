package vn.nlu.banana.controller;

import vn.nlu.banana.model.ListProduct;
import vn.nlu.banana.model.ListSizeDetail;
import vn.nlu.banana.model.Type;
import vn.nlu.banana.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/Add")

public class Add extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String command = request.getParameter("command");
            if (command.equals("producer")) {
                String name = request.getParameter("producer");
                Type.addProducer(name);
                response.sendRedirect("admin/producer-manage.jsp");
            } else if (command.equals("hot") || command.equals("new") || command.equals("related") || command.equals("upsell")) {
                int idproduct = Integer.parseInt(request.getParameter("idProduct"));
                switch (command) {
                    case "hot":
                        ListProduct.addHotProduct(idproduct);
                        break;
                    case "new":
                        ListProduct.addNewProduct(idproduct);
                        break;
                    case "related":
                        ListProduct.addRelatedProduct(idproduct);
                        break;
                    case "upsell":
                        ListProduct.addUpsellProduct(idproduct);
                        break;
                }
                HttpSession session = request.getSession();
                HttpSession currentPage = request.getSession();
                response.sendRedirect("admin/product-manage.jsp?sorter=" + session.getAttribute("sort") + "&page=" + currentPage.getAttribute("currentPage"));
            } else if (command.equals("size")) {
                int idproduct = Integer.parseInt(request.getParameter("idproduct"));
                int size = Integer.parseInt(request.getParameter("size"));
                int remain = Integer.parseInt(request.getParameter("remain"));
                ListSizeDetail.addSizeDetail(idproduct, size, remain);
                HttpSession session = request.getSession();
                HttpSession currentPage = request.getSession();
                response.sendRedirect("admin/product-manage.jsp?sorter=" + session.getAttribute("sort") + "&page=" + currentPage.getAttribute("currentPage"));
            } else {
                byte admin;
                byte active;
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String username = request.getParameter("username");
                String address = request.getParameter("address");
                String phone = request.getParameter("phone");
                if (request.getParameter("admin") == null) {
                    admin = 0;
                } else {
                    admin = Byte.parseByte(request.getParameter("admin"));
                }
                if (request.getParameter("active") == null) {
                    active = 0;
                } else {
                    active = Byte.parseByte(request.getParameter("active"));
                }
                User.addUser(email, password, username, address, phone, admin, active);
                response.sendRedirect("admin/user-manage.jsp");
            }
        } catch (SQLException |
                ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}