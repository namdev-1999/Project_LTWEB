package vn.nlu.banana.controller;

import vn.nlu.banana.model.ListProduct;
import vn.nlu.banana.model.Shoe;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/Cart")

public class Cart extends HttpServlet {
    private final ListProduct listProduct = new ListProduct();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        HttpSession session = request.getSession();
        String command = request.getParameter("command");
        String productID = request.getParameter("id");
        vn.nlu.banana.model.Cart cart = (vn.nlu.banana.model.Cart) session.getAttribute("cart");
        vn.nlu.banana.model.Cart wish = (vn.nlu.banana.model.Cart) session.getAttribute("wishlist");
        int qty = 1;
        if (request.getParameter("qty") != null) {
            if (Integer.parseInt(request.getParameter("qty")) < 1) {
                qty = 1;
            }else {
                qty=Integer.parseInt(request.getParameter("qty"));
            }
        }
        int size = 37;
        if (request.getParameter("size") != null) {
            size = Integer.parseInt(request.getParameter("size"));
            if (size < 37 || size > 42) {
                size = 37;
            }
        }
        try {
            int idProduct = Integer.parseInt(productID);
            Shoe shoe = ListProduct.getShoe(idProduct);
            switch (command) {
                case "add":
                    cart.addToCart(shoe, qty, size);
                    session.setAttribute("cart", cart);
                    response.sendRedirect("detail.jsp?id=" + productID);

                    break;
                case "addByWishList":
                    cart.addToCart(shoe, qty, size);
                    session.setAttribute("cart", cart);
                    wish.removeToCart(ListProduct.getShoe(Integer.parseInt(productID)), size);
                    response.sendRedirect("withlist.jsp");

                    break;
                case "addtowishlist":
                    wish.addToCart(shoe, qty, size);
                    session.setAttribute("wishlist", wish);
                    response.sendRedirect("detail.jsp?id=" + productID);

                    break;
                case "remove":
                    cart.removeToCart(shoe, size);
                    session.setAttribute("cart", cart);
                    response.sendRedirect("cart.jsp");

                    break;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }


    }
}