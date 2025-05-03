package com.crud.servlet;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.crud.model.Payment;
import com.crud.service.PaymentService;
import com.crud.service.RideService;
@WebServlet("/payment")
public class UserPaymentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private PaymentService paymentService;

    @Override
    public void init() throws ServletException {
        paymentService = new PaymentService();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("email") == null) {
            response.sendRedirect("login.jsp?message=Please login to complete payment");
            return;
        }

        try {
            String email = (String) session.getAttribute("email");
            int days = Integer.parseInt(request.getParameter("day"));
            double amount = Double.parseDouble(request.getParameter("amount"));
            String fileName = request.getParameter("carImage");
            String carName = request.getParameter("carName");
            double basePrice = Double.parseDouble(request.getParameter("amount")); // Fixed typo
            Date startDate = Date.valueOf(request.getParameter("startDate"));
            Date endDate = Date.valueOf(request.getParameter("endDate"));
            Time pickupTime = Time.valueOf(request.getParameter("pickupTime"));
            LocalDateTime bookingTime = LocalDateTime.parse(request.getParameter("bookingTime").replace(" ", "T"));

            Payment payment = new Payment();
            payment.setEmail(email);
            payment.setDays(days);
            payment.setAmount(amount);
            payment.setFileName(fileName);
            payment.setCar(carName);
            payment.setStartDate(startDate.toLocalDate());
            payment.setEndDate(endDate.toLocalDate());
            payment.setPickupTime(pickupTime.toLocalTime());
            payment.setBookingTime(bookingTime);
            payment.setStatus("UPCOMING"); // Default status

            boolean success = paymentService.createPayment(payment);
            
            if (success) {
                // Store all payment details in session
                session.setAttribute("payment", payment);
                session.setAttribute("basePrice", basePrice);
                session.setAttribute("rentalDays", days);
                session.setAttribute("carImage", fileName);
                session.setAttribute("carName", carName);
                
                // Redirect to Ride.jsp
                response.sendRedirect("Ride.jsp");
            } else {
                request.setAttribute("error", "Payment processing failed. Please try again.");
                request.getRequestDispatcher("payment.jsp").forward(request, response);
            }
        } catch (IllegalArgumentException e) {
            request.setAttribute("error", "Invalid date/time format. Please check your input.");
            request.getRequestDispatcher("payment.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "System error during payment processing: " + e.getMessage());
            request.getRequestDispatcher("payment.jsp").forward(request, response);
        }
    }
}