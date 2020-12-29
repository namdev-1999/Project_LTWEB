package vn.nlu.banana.controller;

import vn.nlu.banana.model.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/SetDate")

public class SetDate extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        if (request.getParameter("date").equals("")) {

            response.sendRedirect("http://localhost:8080/ltw/admin/index.jsp");
        } else {
            String date[] = request.getParameter("date").split("-");
            Date d = new Date(Integer.parseInt(date[2]), Integer.parseInt(date[1]), Integer.parseInt(date[0]));
            request.getSession().setAttribute("date", d);
            response.sendRedirect("http://localhost:8080/ltw/admin/index.jsp");
        }
    }
}