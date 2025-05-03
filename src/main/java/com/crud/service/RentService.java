package com.crud.service;

import com.crud.model.Rent;
import com.crud.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RentService {

    public boolean createRent(Rent rent) {
        String query = "INSERT INTO rent (km, speed, seats, kmpl, day, fileName, version) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, rent.getKm());
            stmt.setInt(2, rent.getSpeed());
            stmt.setInt(3, rent.getSeats());
            stmt.setInt(4, rent.getKmpl());
            stmt.setInt(5, rent.getDay());
            stmt.setString(6, rent.getFileName());
            stmt.setString(7, rent.getVersion());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public Rent getRent(int id) {
        String query = "SELECT * FROM rent WHERE id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Rent rent = new Rent();
                rent.setId(rs.getInt("id"));
                rent.setKm(rs.getInt("km"));
                rent.setSpeed(rs.getInt("speed"));
                rent.setSeats(rs.getInt("seats"));
                rent.setKmpl(rs.getInt("kmpl"));
                rent.setDay(rs.getInt("day"));
                rent.setFileName(rs.getString("fileName"));
                rent.setVersion(rs.getString("version"));
                return rent;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Rent> getAllRents() {
        List<Rent> rents = new ArrayList<>();
        String query = "SELECT * FROM rent";
        try (Connection connection = DBConnection.getConnection();
             Statement stmt = connection.createStatement()) {
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                Rent rent = new Rent();
                rent.setId(rs.getInt("id"));
                rent.setKm(rs.getInt("km"));
                rent.setSpeed(rs.getInt("speed"));
                rent.setSeats(rs.getInt("seats"));
                rent.setKmpl(rs.getInt("kmpl"));
                rent.setDay(rs.getInt("day"));
                rent.setFileName(rs.getString("fileName"));
                rent.setVersion(rs.getString("version"));
                rents.add(rent);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rents;
    }

    public boolean updateRent(Rent rent) {
        String query = "UPDATE rent SET km = ?, speed = ?, seats = ?, kmpl = ?, day = ?, fileName = ?, version = ? WHERE id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, rent.getKm());
            stmt.setInt(2, rent.getSpeed());
            stmt.setInt(3, rent.getSeats());
            stmt.setInt(4, rent.getKmpl());
            stmt.setInt(5, rent.getDay());
            stmt.setString(6, rent.getFileName());
            stmt.setString(7, rent.getVersion());
            stmt.setInt(8, rent.getId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteRent(int id) {
        String query = "DELETE FROM rent WHERE id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
