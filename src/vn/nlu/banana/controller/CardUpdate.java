package vn.nlu.banana.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/CartUpdate")

public class CardUpdate extends HttpServlet {
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
        vn.nlu.banana.model.Cart cart = (vn.nlu.banana.model.Cart) session.getAttribute("cart");
        String command = request.getParameter("command");
        String id = request.getParameter("id");
        if (command.equals("add")) {
            cart.addOne(Integer.parseInt(id),size);
            session.setAttribute("cart", cart);
            request.getRequestDispatcher("cart.jsp").forward(request, response);
        }
        if (command.equals("sub")) {
            cart.subOne(Integer.parseInt(id),size);
            session.setAttribute("cart", cart);
            request.getRequestDispatcher("cart.jsp").forward(request, response);
        }

    }
}