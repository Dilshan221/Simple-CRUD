package com.crud.service;

import com.crud.model.Payment;
import com.crud.util.DBConnection;

import java.sql.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class PaymentService {
    
    // Create a new payment record
    public boolean createPayment(Payment payment) {
        String query = "INSERT INTO payment (email, day, amount, filename, carname, " +
                     "start_date, end_date, pickup_time, status, booking_time) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {

            setPaymentParameters(stmt, payment);
            int affectedRows = stmt.executeUpdate();

            if (affectedRows > 0) {
                try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        payment.setId(generatedKeys.getInt(1));
                    }
                }
                return true;
            }
        } catch (SQLException e) {
            handleSQLException("Error creating payment", e);
        }
        return false;
    }

    // Get all payments for a specific user
    public List<Payment> getPaymentsByEmail(String email) {
        List<Payment> payments = new ArrayList<>();
        String query = "SELECT * FROM payment WHERE email = ? ORDER BY booking_time DESC";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                payments.add(extractPaymentFromResultSet(rs));
            }
        } catch (SQLException e) {
            handleSQLException("Error fetching payments by email", e);
        }
        return payments;
    }

    // Get payment by ID
    public Payment getPaymentById(int id) {
        String query = "SELECT * FROM payment WHERE id = ?";
        
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                return extractPaymentFromResultSet(rs);
            }
        } catch (SQLException e) {
            handleSQLException("Error fetching payment by ID", e);
        }
        return null;
    }

    // Update payment
    public boolean updatePayment(Payment payment) {
        String query = "UPDATE payment SET email=?, day=?, amount=?, filename=?, " +
                      "carname=?, start_date=?, end_date=?, pickup_time=?, status=? " +
                      "WHERE id=?";
        
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            
            setPaymentParameters(stmt, payment);
            stmt.setInt(10, payment.getId());
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            handleSQLException("Error updating payment", e);
        }
        return false;
    }

    // Delete payment
    public boolean deletePayment(int id) {
        String query = "DELETE FROM payment WHERE id = ?";
        
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            handleSQLException("Error deleting payment", e);
        }
        return false;
    }

    // Get all payments (admin view)
    public List<Payment> getAllPayments() {
        List<Payment> payments = new ArrayList<>();
        String query = "SELECT * FROM payment ORDER BY booking_time DESC";
        
        try (Connection connection = DBConnection.getConnection();
             Statement stmt = connection.createStatement()) {
            
            ResultSet rs = stmt.executeQuery(query);
            
            while (rs.next()) {
                payments.add(extractPaymentFromResultSet(rs));
            }
        } catch (SQLException e) {
            handleSQLException("Error fetching all payments", e);
        }
        return payments;
    }

    // Get total revenue (admin view)
    public double getTotalAmountAllPayments() {
        String query = "SELECT SUM(amount) AS total FROM payment";
        
        try (Connection connection = DBConnection.getConnection();
             Statement stmt = connection.createStatement()) {
            
            ResultSet rs = stmt.executeQuery(query);
            
            if (rs.next()) {
                return rs.getDouble("total");
            }
        } catch (SQLException e) {
            handleSQLException("Error calculating total revenue", e);
        }
        return 0;
    }

    // Get user's total spending
    public double getTotalAmountByEmail(String email) {
        String query = "SELECT SUM(amount) AS total FROM payment WHERE email = ?";
        
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                return rs.getDouble("total");
            }
        } catch (SQLException e) {
            handleSQLException("Error calculating user's total spending", e);
        }
        return 0;
    }

    // Get last payment by user
    public Payment getLastPaymentByEmail(String email) {
        String query = "SELECT * FROM payment WHERE email = ? ORDER BY booking_time DESC LIMIT 1";
        
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                return extractPaymentFromResultSet(rs);
            }
        } catch (SQLException e) {
            handleSQLException("Error fetching last payment", e);
        }
        return null;
    }

    // Helper method to set payment parameters
    private void setPaymentParameters(PreparedStatement stmt, Payment payment) 
            throws SQLException {
        stmt.setString(1, payment.getEmail());
        stmt.setInt(2, payment.getDays());
        stmt.setDouble(3, payment.getAmount());
        stmt.setString(4, payment.getFileName());
        stmt.setString(5, payment.getCar());
        stmt.setDate(6, Date.valueOf(payment.getStartDate()));
        stmt.setDate(7, Date.valueOf(payment.getEndDate()));
        stmt.setTime(8, Time.valueOf(payment.getPickupTime()));
        stmt.setString(9, payment.getStatus());
        stmt.setTimestamp(10, Timestamp.valueOf(payment.getBookingTime()));
    }

    // Helper method to extract payment from ResultSet
    private Payment extractPaymentFromResultSet(ResultSet rs) throws SQLException {
        Payment payment = new Payment();
        payment.setId(rs.getInt("id"));
        payment.setEmail(rs.getString("email"));
        payment.setDays(rs.getInt("day"));
        payment.setAmount(rs.getDouble("amount"));
        payment.setFileName(rs.getString("filename"));
        payment.setCar(rs.getString("carname"));
        payment.setStatus(rs.getString("status"));
        
        // Handle dates
        Date startDate = rs.getDate("start_date");
        if (startDate != null) {
            payment.setStartDate(startDate.toLocalDate());
        }
        
        Date endDate = rs.getDate("end_date");
        if (endDate != null) {
            payment.setEndDate(endDate.toLocalDate());
        }
        
        Timestamp bookingTime = rs.getTimestamp("booking_time");
        if (bookingTime != null) {
            payment.setBookingTime(bookingTime.toLocalDateTime());
        }
        
        return payment;
    }

    // Error handling method
    private void handleSQLException(String message, SQLException e) {
        System.err.println(message + ": " + e.getMessage());
        e.printStackTrace();
    }
    
   // Add this helper method
    private void updateExpiredPaymentsForUser(String email) {
        String query = "UPDATE payment SET status='Completed' WHERE email = ? AND end_date < CURRENT_DATE AND status != 'Completed'";
        
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            
            stmt.setString(1, email);
            int updatedRows = stmt.executeUpdate();
            if (updatedRows > 0) {
                System.out.println("Updated " + updatedRows + " payments for user " + email + " to Completed status");
            }
        } catch (SQLException e) {
            handleSQLException("Error updating expired payments for user", e);
        }
    }
    
    
}