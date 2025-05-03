<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Notification Settings</title>
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
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      display: flex;
      min-height: 100vh;
      background-color: #f5f5f5;
    }

    .sidebar {
      width: var(--sidebar-width);
      background-color: var(--dark-color);
      color: var(--light-color);
      padding: 20px;
      transition: var(--transition);
    }

    .profile-info {
      text-align: center;
      margin-bottom: 30px;
    }

    .profile-pic {
      width: 80px;
      height: 80px;
      border-radius: 50%;
      margin-bottom: 10px;
    }

    .profile-name {
      font-size: 1.1rem;
      margin-bottom: 5px;
    }

    .profile-role {
      font-size: 0.9rem;
      color: #aaa;
    }

    .nav-menu {
      margin-top: 20px;
    }

    .nav-item {
      margin-bottom: 15px;
    }

    .nav-link {
      color: #ddd;
      text-decoration: none;
      display: flex;
      align-items: center;
      gap: 10px;
      padding: 10px;
      border-radius: 5px;
    }

    .nav-link.active,
    .nav-link:hover {
      background-color: var(--primary-color);
      color: #000;
    }

    .main-content {
      flex-grow: 1;
      padding: 30px;
    }

    .header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 20px;
    }

    .menu-toggle {
      display: none;
    }

    .form-title {
      font-size: 1.5rem;
      margin-bottom: 15px;
      color: #333;
    }

    .notification-category {
      margin-bottom: 30px;
    }

    .notification-option {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 15px 0;
      border-bottom: 1px solid #eee;
    }

    .option-details {
      flex: 1;
    }

    .option-details h3 {
      font-size: 1rem;
      margin-bottom: 5px;
    }

    .option-details p {
      font-size: 0.85rem;
      color: #777;
    }

    .notification-channels {
      display: flex;
      gap: 20px;
    }

    .channel-toggle {
      display: flex;
      align-items: center;
      gap: 8px;
    }

    .channel-label {
      font-size: 0.85rem;
      color: #555;
    }

    .toggle-switch {
      position: relative;
      display: inline-block;
      width: 40px;
      height: 20px;
    }

    .toggle-switch input {
      opacity: 0;
      width: 0;
      height: 0;
    }

    .slider {
      position: absolute;
      cursor: pointer;
      background-color: #ccc;
      transition: .4s;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      border-radius: 34px;
    }

    .slider:before {
      content: "";
      position: absolute;
      height: 16px;
      width: 16px;
      left: 2px;
      bottom: 2px;
      background-color: white;
      transition: .4s;
      border-radius: 50%;
    }

    .toggle-switch input:checked + .slider {
      background-color: var(--primary-color);
    }

    .toggle-switch input:checked + .slider:before {
      transform: translateX(20px);
    }

    .notification-item {
      display: flex;
      align-items: flex-start;
      padding: 15px;
      border-radius: 8px;
      margin-bottom: 10px;
      background-color: #f9f9f9;
    }

    .notification-item.unread {
      background-color: #f0f7ff;
      border-left: 3px solid var(--primary-color);
    }

    .notification-icon {
      font-size: 1.2rem;
      margin-right: 15px;
      color: var(--primary-color);
    }

    .notification-content {
      flex: 1;
    }

    .notification-time {
      font-size: 0.75rem;
      color: #777;
      margin-top: 5px;
    }

    .mark-all-read {
      text-align: right;
      margin-bottom: 15px;
    }

    .btn {
      padding: 8px 14px;
      font-size: 0.85rem;
      cursor: pointer;
      border: none;
      border-radius: 5px;
      background-color: var(--primary-color);
      color: #000;
    }

    .btn-outline {
      background-color: transparent;
      border: 1px solid var(--primary-color);
      color: var(--primary-color);
    }

    .btn-outline:hover {
      background-color: var(--primary-color);
      color: #000;
    }

    .btn-sm {
      font-size: 0.75rem;
      padding: 6px 10px;
    }

    @media screen and (max-width: 768px) {
      .sidebar {
        position: fixed;
        left: -100%;
        top: 0;
        height: 100%;
        z-index: 1000;
      }

      .sidebar.active {
        left: 0;
      }

      .menu-toggle {
        display: block;
        background: none;
        border: none;
        font-size: 1.5rem;
        color: var(--dark-color);
      }

      .main-content {
        padding: 20px;
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
      <div class="nav-item"><a href="" class="nav-link"><i class="fas fa-user"></i> <span>Profile</span></a></div>
      <div class="nav-item"><a href="settings.jsp" class="nav-link"><i class="fas fa-cog"></i> <span>Settings</span></a></div>
      <div class="nav-item"><a href="security.jsp" class="nav-link"><i class="fas fa-lock"></i> <span>Security</span></a></div>
      <div class="nav-item"><a href="notifications.jsp" class="nav-link active"><i class="fas fa-bell"></i> <span>Notifications</span></a></div>
      <div class="nav-item"><a href="../rideHistory" class="nav-link"><i class="fas fa-credit-card"></i> <span>Billing</span></a></div>
      <div class="nav-item"><a href="../LoginPage.jsp" class="nav-link"><i class="fas fa-sign-out-alt"></i> <span>Logout</span></a></div>
    </div>
  </div>

  <div class="main-content">
    <div class="header">
      <button class="menu-toggle" id="menuToggle"><i class="fas fa-bars"></i></button>
      <h1>Notifications</h1>
      <div class="user-actions">
        <a href="user" class="btn btn-outline"><i class="fas fa-arrow-left"></i> Back to Profile</a>
      </div>
    </div>

    <div class="form-container">
      <h2 class="form-title">Notification Preferences</h2>

      <div class="notification-category">
        <h3>Account Notifications</h3>
        <div class="notification-option">
          <div class="option-details">
            <h3>Security Alerts</h3>
            <p>Get notified about important security events</p>
          </div>
          <div class="notification-channels">
            <div class="channel-toggle">
              <span class="channel-label">Email</span>
              <label class="toggle-switch">
                <input type="checkbox" checked>
                <span class="slider"></span>
              </label>
            </div>
            <div class="channel-toggle">
              <span class="channel-label">Push</span>
              <label class="toggle-switch">
                <input type="checkbox" checked>
                <span class="slider"></span>
              </label>
            </div>
          </div>
        </div>

        <div class="notification-option">
          <div class="option-details">
            <h3>Account Activity</h3>
            <p>Notifications about your account changes</p>
          </div>
          <div class="notification-channels">
            <div class="channel-toggle">
              <span class="channel-label">Email</span>
              <label class="toggle-switch">
                <input type="checkbox" checked>
                <span class="slider"></span>
              </label>
            </div>
            <div class="channel-toggle">
              <span class="channel-label">Push</span>
              <label class="toggle-switch">
                <input type="checkbox">
                <span class="slider"></span>
              </label>
            </div>
          </div>
        </div>
      </div>

      <div class="notification-category">
        <h3>Ride Notifications</h3>
        <div class="notification-option">
          <div class="option-details">
            <h3>Ride Updates</h3>
            <p>Notifications about your current ride status</p>
          </div>
          <div class="notification-channels">
            <div class="channel-toggle">
              <span class="channel-label">Email</span>
              <label class="toggle-switch">
                <input type="checkbox">
                <span class="slider"></span>
              </label>
            </div>
            <div class="channel-toggle">
              <span class="channel-label">Push</span>
              <label class="toggle-switch">
                <input type="checkbox" checked>
                <span class="slider"></span>
              </label>
            </div>
            <div class="channel-toggle">
              <span class="channel-label">SMS</span>
              <label class="toggle-switch">
                <input type="checkbox">
                <span class="slider"></span>
              </label>
            </div>
          </div>
        </div>

        <div class="notification-option">
          <div class="option-details">
            <h3>Promotions & Offers</h3>
            <p>Get notified about special promotions</p>
          </div>
          <div class="notification-channels">
            <div class="channel-toggle">
              <span class="channel-label">Email</span>
              <label class="toggle-switch">
                <input type="checkbox" checked>
                <span class="slider"></span>
              </label>
            </div>
            <div class="channel-toggle">
              <span class="channel-label">Push</span>
              <label class="toggle-switch">
                <input type="checkbox">
                <span class="slider"></span>
              </label>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="form-container">
      <div class="mark-all-read">
        <button class="btn btn-outline btn-sm">Mark All as Read</button>
      </div>

      <h2 class="form-title">Recent Notifications</h2>

      <div class="notification-item unread">
        <i class="fas fa-bell notification-icon"></i>
        <div class="notification-content">
          <strong>Your ride has been confirmed</strong>
          <p>Driver John D. will arrive in 5 minutes</p>
          <p class="notification-time">10 minutes ago</p>
        </div>
      </div>

      <div class="notification-item unread">
        <i class="fas fa-percent notification-icon"></i>
        <div class="notification-content">
          <strong>Special promotion available</strong>
          <p>Get 20% off your next 3 rides with code SAVE20</p>
          <p class="notification-time">2 hours ago</p>
        </div>
      </div>

      <div class="notification-item">
        <i class="fas fa-shield-alt notification-icon"></i>
        <div class="notification-content">
          <strong>Security alert: New login detected</strong>
          <p>New login from Chrome on Windows in New York</p>
          <p class="notification-time">Yesterday</p>
        </div>
      </div>

      <div class="notification-item">
        <i class="fas fa-credit-card notification-icon"></i>
        <div class="notification-content">
          <strong>Payment receipt for your ride</strong>
          <p>Your payment of $24.50 has been processed</p>
          <p class="notification-time">2 days ago</p>
        </div>
      </div>
    </div>
  </div>

  <script>
    document.getElementById('menuToggle').addEventListener('click', function() {
      document.getElementById('sidebar').classList.toggle('active');
    });

    document.querySelector('.mark-all-read button').addEventListener('click', function() {
      document.querySelectorAll('.notification-item.unread').forEach(item => {
        item.classList.remove('unread');
      });
      alert("All notifications marked as read");
    });
  </script>
</body>
</html>
