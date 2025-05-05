package com.crud.servlet;

import com.crud.model.User;
import com.crud.service.UserService;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/login")
public class UserLoginServlet extends HttpServlet {
    private UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        if ("logout".equals(request.getParameter("action"))) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate();
            }
            // Add security headers
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "0");
            response.sendRedirect("LoginPage.jsp?message=logout_success");
            return;
        }
        
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            redirectBasedOnRole((User) session.getAttribute("user"), response);
            return;
        }
        
        request.getRequestDispatcher("LoginPage.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String email = request.getParameter("email").trim();
        String password = request.getParameter("password");
        
        try {
            if (email.isEmpty() || password.isEmpty()) {
                request.setAttribute("error", "Email and password are required");
                request.getRequestDispatcher("LoginPage.jsp").forward(request, response);
                return;
            }

            User user = userService.validateUser(email, password);
            
            if (user != null) {
                // Session fixation protection for Servlet 3.0 or earlier
                HttpSession oldSession = request.getSession(false);
                if (oldSession != null) {
                    oldSession.invalidate();
                }
                
                // Create new session
                HttpSession session = request.getSession(true);
                session.setAttribute("user", user);
                
                // Set secure session attributes
                session.setAttribute("email", user.getEmail());
                session.setAttribute("userId", user.getId());
                session.setAttribute("userRole", user.getUserRole());
                session.setAttribute("fullName", user.getFname() + " " + user.getLname());
                
                // Set session timeout (30 minutes)
                session.setMaxInactiveInterval(30 * 60);
                
                // Set secure cookies if needed
                if ("true".equals(request.getParameter("remember-me"))) {
                    Cookie rememberMe = new Cookie("rememberToken", generateSecureToken());
                    rememberMe.setHttpOnly(true);
                    rememberMe.setSecure(true);
                    rememberMe.setMaxAge(30 * 24 * 60 * 60); // 30 days
                    response.addCookie(rememberMe);
                }
                
                redirectBasedOnRole(user, response);
            } else {
                request.setAttribute("error", "Invalid email or password");
                request.setAttribute("email", email);
                request.getRequestDispatcher("LoginPage.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("error", "System error. Please try again later.");
            request.getRequestDispatcher("LoginPage.jsp").forward(request, response);
            e.printStackTrace();
        }
    }

    private void redirectBasedOnRole(User user, HttpServletResponse response) throws IOException {
        String role = user.getUserRole().toLowerCase();
        String redirectPage;
        
        switch (role) {
            case "admin":
                redirectPage = "Adminview";
                break;
            case "customer":
                redirectPage = "LHomePage.jsp";
                break;
            case "premium":
                redirectPage = "PremiumHome.jsp";
                break;
            default:
                redirectPage = "LHomePage.jsp";
        }
        
        response.sendRedirect(redirectPage + "?welcome=true");
    }

    private String generateSecureToken() {
        // Implement a secure token generation mechanism
        return java.util.UUID.randomUUID().toString();
    }
}