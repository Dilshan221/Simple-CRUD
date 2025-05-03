package com.crud.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.crud.model.Payment;  // Changed from Rent to Payment
import com.crud.service.RideService;

@WebServlet("/rideHistory")
public class UserHistoryRideServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private RideService rideService;

    @Override
    public void init() throws ServletException {
        rideService = new RideService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Check login status
        if (session == null || session.getAttribute("email") == null) {
            response.sendRedirect("login.jsp?message=Please login to view your ride history");
            return;
        }

        try {
            String email = (String) session.getAttribute("email");

            // Get ride history - fixed variable name and type
            List<Payment> payments = rideService.getPaymentsByEmail(email);

            // Attach data to request - fixed variable name
            request.setAttribute("rideHistory", payments);

            // Forward to JSP to display history
            request.getRequestDispatcher("HistoryPage.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Unable to load ride history: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
}