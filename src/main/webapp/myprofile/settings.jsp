<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Account Security</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    :root {
      --primary-color: #d4af37;
      --secondary-color: #e6c75f;
      --dark-color: #1a1a1a;
      --light-color: #ffffff;
      --sidebar-width: 280px;
      --transition: all 0.3s ease;
    }

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: var(--light-color);
      color: var(--dark-color);
      display: flex;
      min-height: 100vh;
    }

    .sidebar {
      width: var(--sidebar-width);
      background-color: var(--dark-color);
      color: var(--light-color);
      padding: 20px;
      transition: var(--transition);
      flex-shrink: 0;
    }

    .sidebar.active {
      margin-left: -280px;
    }

    .profile-info {
      text-align: center;
      margin-bottom: 20px;
    }

    .profile-pic {
      width: 80px;
      height: 80px;
      border-radius: 50%;
      margin-bottom: 10px;
    }

    .profile-name {
      font-size: 1.2rem;
    }

    .profile-role {
      font-size: 0.9rem;
      color: #aaa;
    }

    .nav-menu {
      margin-top: 30px;
    }

    .nav-item {
      margin-bottom: 15px;
    }

    .nav-link {
      color: var(--light-color);
      text-decoration: none;
      display: flex;
      align-items: center;
      font-size: 1rem;
    }

    .nav-link i {
      margin-right: 10px;
    }

    .nav-link.active {
      color: var(--primary-color);
    }

    .main-content {
      flex: 1;
      padding: 30px;
    }

    .header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 30px;
    }

    .menu-toggle {
      display: none;
      background: none;
      border: none;
      font-size: 1.5rem;
      cursor: pointer;
    }

    .form-container {
      max-width: 800px;
      margin: auto;
    }

    .form-title {
      font-size: 1.5rem;
      margin-bottom: 20px;
    }

    .form-group {
      margin-bottom: 25px;
    }

    .security-status {
      display: flex;
      align-items: center;
      padding: 15px;
      background-color: #f8f9fa;
      border-radius: 8px;
      margin-bottom: 20px;
    }

    .security-icon {
      font-size: 1.5rem;
      margin-right: 15px;
      color: var(--primary-color);
    }

    .security-device {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 15px 0;
      border-bottom: 1px solid #eee;
    }

    .device-info {
      display: flex;
      align-items: center;
    }

    .device-icon {
      font-size: 1.2rem;
      margin-right: 15px;
      color: #555;
    }

    .btn {
      padding: 8px 15px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      text-decoration: none;
      color: var(--dark-color);
      background-color: var(--primary-color);
    }

    .btn-outline {
      background: transparent;
      border: 1px solid var(--primary-color);
      color: var(--primary-color);
    }

    .btn-sm {
      padding: 5px 10px;
      font-size: 0.85rem;
    }

    .toggle-switch {
      position: relative;
      display: inline-block;
      width: 46px;
      height: 24px;
    }

    .toggle-switch input {
      opacity: 0;
      width: 0;
      height: 0;
    }

    .slider {
      position: absolute;
      cursor: pointer;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      background-color: #ccc;
      transition: .4s;
      border-radius: 24px;
    }

    .slider:before {
      position: absolute;
      content: "";
      height: 18px;
      width: 18px;
      left: 3px;
      bottom: 3px;
      background-color: white;
      transition: .4s;
      border-radius: 50%;
    }

    input:checked + .slider {
      background-color: var(--primary-color);
    }

    input:checked + .slider:before {
      transform: translateX(22px);
    }

    .activity-log {
      margin-top: 20px;
    }

    .activity-item {
      padding: 10px 0;
      border-bottom: 1px solid #eee;
    }

    .activity-time {
      font-size: 0.85rem;
      color: #777;
    }

    @media (max-width: 768px) {
      .sidebar {
        position: absolute;
        z-index: 100;
        height: 100%;
        left: -280px;
      }

      .sidebar.active {
        left: 0;
      }

      .menu-toggle {
        display: block;
      }
    }
  </style>
</head>
<body>
  <div class="sidebar" id="sidebar">
    <div class="profile-info">
      <img src="https://randomuser.me/api/portraits/men/32.jpg" alt="Profile Picture" class="profile-pic">
      <h3 class="profile-name">${user.fname} ${user.lname}</h3>
      <p class="profile-role">${user.userRole}</p>
    </div>
    <div class="nav-menu">
      <div class="nav-item"><a href="index.jsp" class="nav-link"><i class="fas fa-user"></i> <span>Profile</span></a></div>
      <div class="nav-item"><a href="settings.jsp" class="nav-link"><i class="fas fa-cog"></i> <span>Settings</span></a></div>
      <div class="nav-item"><a href="#" class="nav-link active"><i class="fas fa-lock"></i> <span>Security</span></a></div>
      <div class="nav-item"><a href="notifications.jsp" class="nav-link"><i class="fas fa-bell"></i> <span>Notifications</span></a></div>
      <div class="nav-item"><a href="../rideHistory" class="nav-link"><i class="fas fa-credit-card"></i> <span>Billing</span></a></div>
      <div class="nav-item"><a href="../LoginPage.jsp" class="nav-link"><i class="fas fa-sign-out-alt"></i> <span>Logout</span></a></div>
    </div>
  </div>

  <div class="main-content">
    <div class="header">
      <button class="menu-toggle" id="menuToggle"><i class="fas fa-bars"></i></button>
      <h1>Account Security</h1>
      <div class="user-actions">
        <a href="user" class="btn btn-outline"><i class="fas fa-arrow-left"></i> Back to Profile</a>
      </div>
    </div>

    <div class="form-container">
      <h2 class="form-title">Security Status</h2>

      <div class="security-status">
        <i class="fas fa-shield-alt security-icon"></i>
        <div>
          <h3>Your account is secure</h3>
          <p>All recommended security measures are active</p>
        </div>
      </div>

      <div class="form-group">
        <label>Password</label>
        <div class="security-device">
          <div class="device-info">
            <i class="fas fa-key device-icon"></i>
            <div>
              <strong>Password</strong>
              <p>Last changed 3 months ago</p>
            </div>
          </div>
          <a href="changePassword.jsp" class="btn btn-outline btn-sm">Change</a>
        </div>
      </div>

      <div class="form-group">
        <label>Two-Factor Authentication</label>
        <div class="security-device">
          <div class="device-info">
            <i class="fas fa-mobile-alt device-icon"></i>
            <div>
              <strong>Authenticator App</strong>
              <p>Add an extra layer of security</p>
            </div>
          </div>
          <label class="toggle-switch">
            <input type="checkbox" id="twoFactorToggle">
            <span class="slider"></span>
          </label>
        </div>
      </div>

      <div class="form-group">
        <label>Trusted Devices</label>
        <div class="security-device">
          <div class="device-info">
            <i class="fas fa-laptop device-icon"></i>
            <div>
              <strong>MacBook Pro</strong>
              <p>Last active: Today, 10:30 AM</p>
            </div>
          </div>
          <button class="btn btn-outline btn-sm">Revoke</button>
        </div>

        <div class="security-device">
          <div class="device-info">
            <i class="fas fa-mobile device-icon"></i>
            <div>
              <strong>iPhone 13</strong>
              <p>Last active: Yesterday, 5:45 PM</p>
            </div>
          </div>
          <button class="btn btn-outline btn-sm">Revoke</button>
        </div>
      </div>

      <div class="form-group">
        <label>Login History</label>
        <div class="activity-log">
          <div class="activity-item">
            <strong>Successful login from Chrome on Windows</strong>
            <p class="activity-time">Today, 10:30 AM - New York, NY</p>
          </div>
          <div class="activity-item">
            <strong>Successful login from Safari on iPhone</strong>
            <p class="activity-time">Yesterday, 5:45 PM - Boston, MA</p>
          </div>
          <div class="activity-item">
            <strong>Login attempt blocked</strong>
            <p class="activity-time">2 days ago - Unknown location</p>
          </div>
        </div>
      </div>
    </div>
  </div>

  <script>
    document.getElementById('menuToggle').addEventListener('click', function () {
      document.getElementById('sidebar').classList.toggle('active');
    });

    document.getElementById('twoFactorToggle').addEventListener('change', function () {
      if (this.checked) {
        alert("Redirecting to two-factor authentication setup...");
        // window.location.href = 'setup2FA.jsp';
      }
    });
  </script>
</body>
</html>
