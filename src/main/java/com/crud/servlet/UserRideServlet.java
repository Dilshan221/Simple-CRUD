package com.crud.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.crud.model.Payment;
import com.crud.service.PaymentService;

@WebServlet("/ride-history")
public class UserRideServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private PaymentService paymentService;

    @Override
    public void init() throws ServletException {
        paymentService = new PaymentService();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        
        // Check if user is logged in
        if (session == null || session.getAttribute("email") == null) {
            response.sendRedirect("login.jsp?message=Please login to view your ride history");
            return;
        }

        try {
            String email = (String) session.getAttribute("email");
            
            // Get all rides/payments for the current user
            List<Payment> rideHistory = paymentService.getPaymentsByEmail(email);
            
            // Set attributes for JSP
            request.setAttribute("rideHistory", rideHistory);
            
            // Forward to rideHistory.jsp
            request.getRequestDispatcher("rideHistory.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error retrieving ride history: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
}