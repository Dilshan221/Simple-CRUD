package com.crud.service;

import com.crud.model.User;
import com.crud.util.DBConnection;
import org.mindrot.jbcrypt.BCrypt;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserService {

    private static final int BCRYPT_WORK_FACTOR = 12;
    private static final int MAX_LOGIN_ATTEMPTS = 5;
    private static final long LOCK_TIME = 15 * 60 * 1000; // 15 minutes

    public boolean createUser(User user) {
        String query = "INSERT INTO user (fname, lname, phone, email, password, userrole) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {

            // Hash password if it's not already hashed (assumes client might hash it)
            String finalPassword = user.getPassword();
            if (!finalPassword.startsWith("$2a$")) {
                finalPassword = BCrypt.hashpw(finalPassword, BCrypt.gensalt(BCRYPT_WORK_FACTOR));
            }

            stmt.setString(1, user.getFname());
            stmt.setString(2, user.getLname());
            stmt.setString(3, user.getPhone());
            stmt.setString(4, user.getEmail());
            stmt.setString(5, finalPassword);
            stmt.setString(6, user.getUserRole());

            int affectedRows = stmt.executeUpdate();
            if (affectedRows == 0) return false;

            try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    user.setId(generatedKeys.getInt(1));
                }
            }

            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public User getUser(int id) {
        String query = "SELECT * FROM user WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) return extractUser(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        String query = "SELECT * FROM user";
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                users.add(extractUser(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    public boolean updateUser(User user) {
        String query = "UPDATE user SET fname=?, lname=?, phone=?, email=?, userrole=? WHERE id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, user.getFname());
            stmt.setString(2, user.getLname());
            stmt.setString(3, user.getPhone());
            stmt.setString(4, user.getEmail());
            stmt.setString(5, user.getUserRole());
            stmt.setInt(6, user.getId());

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateUserPassword(int userId, String newPassword) {
        String query = "UPDATE user SET password=? WHERE id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            String hashedPassword = BCrypt.hashpw(newPassword, BCrypt.gensalt(BCRYPT_WORK_FACTOR));
            stmt.setString(1, hashedPassword);
            stmt.setInt(2, userId);

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteUser(int id) {
        String query = "DELETE FROM user WHERE id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public User validateUser(String email, String password) {
        String query = "SELECT * FROM user WHERE email=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                if (rs.getInt("login_attempts") >= MAX_LOGIN_ATTEMPTS) {
                    Timestamp lockTime = rs.getTimestamp("last_failed_login");
                    if (lockTime != null && System.currentTimeMillis() - lockTime.getTime() < LOCK_TIME) {
                        return null; // Account is still locked
                    } else {
                        resetLoginAttempts(email);
                    }
                }

                String storedHash = rs.getString("password");
                if (BCrypt.checkpw(password, storedHash)) {
                    resetLoginAttempts(email);
                    return extractUser(rs);
                } else {
                    incrementLoginAttempts(email);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    private void incrementLoginAttempts(String email) throws SQLException {
        String query = "UPDATE user SET login_attempts = login_attempts + 1, last_failed_login = ? WHERE email = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setTimestamp(1, new Timestamp(System.currentTimeMillis()));
            stmt.setString(2, email);
            stmt.executeUpdate();
        }
    }

    private void resetLoginAttempts(String email) throws SQLException {
        String query = "UPDATE user SET login_attempts = 0, last_failed_login = NULL WHERE email = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, email);
            stmt.executeUpdate();
        }
    }

    private User extractUser(ResultSet rs) throws SQLException {
        User user = new User();
        user.setId(rs.getInt("id"));
        user.setFname(rs.getString("fname"));
        user.setLname(rs.getString("lname"));
        user.setPhone(rs.getString("phone"));
        user.setEmail(rs.getString("email"));
        user.setPassword(rs.getString("password")); // hashed
        user.setUserRole(rs.getString("userrole"));
        return user;
    }
}
