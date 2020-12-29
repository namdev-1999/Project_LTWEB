package vn.nlu.banana.controller;

import vn.nlu.banana.model.ListProduct;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/WishlistUpdate")

public class WishlistUpdate extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        int size = 37;
        if (request.getParameter("size") != null) {
            size = Integer.parseInt(request.getParameter("size"));
        }
        HttpSession session = request.getSession();
        vn.nlu.banana.model.Cart wishlist = (vn.nlu.banana.model.Cart) session.getAttribute("wishlist");
        String command = request.getParameter("command");
        String id = request.getParameter("id");
        if (command.equals("add")) {
            wishlist.addOne(Integer.parseInt(id), size);
            session.setAttribute("wishlist", wishlist);
            request.getRequestDispatcher("withlist.jsp").forward(request, response);
        }
        if (command.equals("sub")) {
            wishlist.subOne(Integer.parseInt(id), size);
            session.setAttribute("withlist", wishlist);
            request.getRequestDispatcher("withlist.jsp").forward(request, response);
        }
        if (command.equals("remove")) {
            try {
                wishlist.removeToCart(ListProduct.getShoe(Integer.parseInt(id)), size);
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            ;
            session.setAttribute("withlist", wishlist);
            request.getRequestDispatcher("withlist.jsp").forward(request, response);
        }
    }
}