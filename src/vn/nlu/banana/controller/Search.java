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
import java.util.ArrayList;

@WebServlet("/result")

public class Search extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        String key[] = request.getParameter("search").toUpperCase().trim().split("\\+");
        try {
            ArrayList<Shoe> list = ListProduct.getListProduct();
            ArrayList<Shoe> result = new ArrayList<>();

            for (Shoe s : list) {
                String[] name = s.getName().toUpperCase().trim().split(" ");
                for (String p1 : key
                ) {
                    for (String p2 : name
                    ) {
                        if (p1.equals(p2)) {
                                result.add(s);
                            break;
                        }
                    }
                }
            }
            session.setAttribute("result", result);
            request.getRequestDispatcher("search.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }


    }
}