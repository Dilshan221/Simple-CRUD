package com.crud.servlet;

import com.crud.model.Rent;
import com.crud.service.RentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/rents")
public class UserRentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private RentService rentService;

    @Override
    public void init() throws ServletException {
        rentService = new RentService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Rent> rents = rentService.getAllRents();
        request.setAttribute("rents", rents);
        request.getRequestDispatcher("rent.jsp").forward(request, response);
    }
}
