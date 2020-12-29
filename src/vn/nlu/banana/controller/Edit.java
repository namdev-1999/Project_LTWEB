package vn.nlu.banana.controller;

import vn.nlu.banana.model.ListSizeDetail;
import vn.nlu.banana.model.SizeDetail;
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

@WebServlet("/Edit")

public class Edit extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        try {
            String command = request.getParameter("command");
            if (command.equals("producer")) {
                String name = request.getParameter("producer");
                int id = Integer.parseInt(request.getParameter("idType"));
                Type.editProducer(id, name);
                response.sendRedirect("admin/producer-manage.jsp");
            } else if (command.equals("user")) {
                byte admin;
                byte active;
                int id = Integer.parseInt(request.getParameter("id"));
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
                User.editUser(id, email, password, username, address, phone, admin, active);
                response.sendRedirect("admin/user-manage.jsp");
            } else if (command.equals("size")) {
                int idproduct = Integer.parseInt(request.getParameter("idproduct"));
                int k = 0;
                for (SizeDetail sd : ListSizeDetail.listProductSize(idproduct)) {
                    k++;
                    int idsize = Integer.parseInt(request.getParameter("idsize" + k));
                    int size = Integer.parseInt(request.getParameter("size" + k));
                    int remain = Integer.parseInt(request.getParameter("remain" + k));
                    ListSizeDetail.editSizeDetail(idsize,size, remain);
                }
                HttpSession session = request.getSession();
                HttpSession currentPage = request.getSession();
                response.sendRedirect("admin/product-manage.jsp?sorter=" + session.getAttribute("sort") + "&page=" + currentPage.getAttribute("currentPage"));
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }


}