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

@WebServlet("/Adminview")
public class Adminview extends HttpServlet {
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
            response.sendRedirect(request.getContextPath() + "/login.jsp?message=Please login to view dashboard");
            return;
        }

        try {
            String email = (String) session.getAttribute("email");
            String userRole = (String) session.getAttribute("userRole");
            boolean isAdmin = "admin".equalsIgnoreCase(userRole);
            
            List<Payment> payments;
            double totalAmount;
            
            if (isAdmin) {
                payments = paymentService.getAllPayments();
                totalAmount = paymentService.getTotalAmountAllPayments();
            } else {
                payments = paymentService.getPaymentsByEmail(email);
                totalAmount = paymentService.getTotalAmountByEmail(email);
            }
            
            Payment lastPayment = payments.isEmpty() ? null : payments.get(0);
            
            request.setAttribute("payments", payments);
            session.setAttribute("totalAmount", totalAmount);
            session.setAttribute("lastPayment", lastPayment);
            session.setAttribute("isAdmin", isAdmin);
            
            request.getRequestDispatcher("/admin/index.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error retrieving dashboard information: " + e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
}