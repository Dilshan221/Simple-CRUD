package com.crud.service;

import com.crud.model.Payment;
import com.crud.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class RideService {

    // Create a new payment record
    public boolean createPayment(Payment payment) {
        String query = "INSERT INTO payment (email, day, amount, filename, carname) VALUES (?, ?, ?, ?, ?)";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {

            stmt.setString(1, payment.getEmail());
            stmt.setInt(2, payment.getDays());
            stmt.setDouble(3, payment.getAmount());
            stmt.setString(4, payment.getFileName());
            stmt.setString(5, payment.getCar());

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
            System.err.println("Error creating payment: " + e.getMessage());
            e.printStackTrace();
        }

        return false;
    }

    // Get all payments for a specific user
    public List<Payment> getPaymentsByEmail(String email) {
        List<Payment> payments = new ArrayList<>();
        String query = "SELECT * FROM payment WHERE email = ? ORDER BY id DESC";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {

            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                payments.add(extractPayment(rs));
            }

        } catch (SQLException e) {
            System.err.println("Error fetching payments by email: " + e.getMessage());
            e.printStackTrace();
        }

        return payments;
    }

    // Get a single payment by ID
    public Payment getPaymentById(int id) {
        String query = "SELECT * FROM payment WHERE id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {

            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return extractPayment(rs);
            }

        } catch (SQLException e) {
            System.err.println("Error fetching payment by ID: " + e.getMessage());
            e.printStackTrace();
        }

        return null;
    }

    // Update an existing payment
    public boolean updatePayment(Payment payment) {
        String query = "UPDATE payment SET email = ?, day = ?, amount = ?, filename = ?, carname = ? WHERE id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {

            stmt.setString(1, payment.getEmail());
            stmt.setInt(2, payment.getDays());
            stmt.setDouble(3, payment.getAmount());
            stmt.setString(4, payment.getFileName());
            stmt.setString(5, payment.getCar());
            stmt.setInt(6, payment.getId());

            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            System.err.println("Error updating payment: " + e.getMessage());
            e.printStackTrace();
        }

        return false;
    }

    // Delete a payment by ID
    public boolean deletePayment(int id) {
        String query = "DELETE FROM payment WHERE id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {

            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            System.err.println("Error deleting payment: " + e.getMessage());
            e.printStackTrace();
        }

        return false;
    }

    // Get all payments (for admin use)
    public List<Payment> getAllPayments() {
        List<Payment> payments = new ArrayList<>();
        String query = "SELECT * FROM payment ORDER BY id DESC";

        try (Connection connection = DBConnection.getConnection();
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                payments.add(extractPayment(rs));
            }

        } catch (SQLException e) {
            System.err.println("Error fetching all payments: " + e.getMessage());
            e.printStackTrace();
        }

        return payments;
    }

    // Helper method to extract Payment from ResultSet
    private Payment extractPayment(ResultSet rs) throws SQLException {
        Payment payment = new Payment();
        payment.setId(rs.getInt("id"));
        payment.setEmail(rs.getString("email"));
        payment.setDays(rs.getInt("day"));
        payment.setAmount(rs.getDouble("amount"));
        payment.setFileName(rs.getString("filename"));
        payment.setCar(rs.getString("carname"));
        return payment;
    }
}
