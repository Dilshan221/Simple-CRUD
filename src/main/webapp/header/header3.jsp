<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/style.css" />

    <style>
        .dropdown-menu {
            min-width: 200px;
            border: 1px solid rgba(0, 0, 0, 0.1);
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
        }

        .dropdown-item {
            transition: all 0.2s ease;
            display: flex;
            align-items: center;
            padding: 0.75rem 1rem;
            width: 100%;
            background: none;
            border: none;
            text-align: left;
            cursor: pointer;
        }

        .dropdown-item:hover {
            background-color: #f8fafc;
        }

        .dropdown-divider {
            border-top: 1px solid #e2e8f0;
            margin: 0.25rem 0;
        }

        .logout-btn {
            color: #ef4444;
            font-weight: 500;
        }

        .logout-btn:hover {
            background-color: #fee2e2;
        }
    </style>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const menuBtn = document.getElementById('menu-btn');
            const dropdownMenu = document.getElementById('dropdown-menu');
            const logoutLink = document.getElementById('logout-link');

            menuBtn.addEventListener('click', function (e) {
                e.stopPropagation();
                dropdownMenu.classList.toggle('hidden');
            });

            document.addEventListener('click', function (e) {
                if (!dropdownMenu.contains(e.target) && !menuBtn.contains(e.target)) {
                    dropdownMenu.classList.add('hidden');
                }
            });

            if (logoutLink) {
                logoutLink.addEventListener('click', function (e) {
                    e.preventDefault();
                    const confirmed = confirm("Are you sure you want to logout?");
                    if (confirmed) {
                        window.location.href = 'LogoutServlet';
                    }
                });
            }
        });
    </script>
</head>

<body>
    <header class="relative">
        <nav class="max-w-7xl mx-auto px-4 py-4 flex justify-between items-center">
            <!-- Logo -->
            <div class="flex-1">
                <a href="#" class="text-xl font-bold">RENTAL</a>
            </div>

            <!-- Navigation links -->
            <div class="flex-1 hidden md:flex justify-center space-x-8">
                <a href="LHomePage.jsp" class="hover:text-orange-600 transition-colors">Home</a>
                <a href="rents" class="hover:text-yellow-600 transition-colors">Rent</a>
                <a href="rideHistory" class="hover:text-yellow-600 transition-colors">Ride</a>
                <a href="contact.jsp" class="hover:text-orange-600 transition-colors">Contact</a>
            </div>

            <!-- Dropdown Menu -->
            <div class="flex-1 flex justify-end relative">
                <button id="menu-btn" class="flex items-center space-x-2 focus:outline-none">
                    <span class="hidden sm:inline">Menu</span>
                    <i class="ri-menu-line text-2xl"></i>
                </button>

                <div id="dropdown-menu" class="hidden absolute right-0 mt-2 bg-white rounded-lg z-50 dropdown-menu">
                    <a href="myprofile/index.jsp" class="dropdown-item">
                        <i class="ri-user-line mr-3 text-gray-500"></i>
                        <span>Profile</span>
                    </a>

                    <button class="dropdown-item" onclick="window.location.href='register.jsp'">
                        <i class="ri-settings-3-line mr-3 text-gray-500"></i>
                        <span>Settings</span>
                    </button>

                    <div class="dropdown-divider"></div>

                    <a href="#" class="dropdown-item logout-btn" id="logout-link">
                        <i class="ri-logout-box-r-line mr-3"></i>
                        <span>Sign Out</span>
                    </a>
                </div>
            </div>
        </nav>

        <!-- Optional Hero Section -->
        <div class="header__container text-center px-4" id="home">
            <h1 class="text-4xl font-bold mb-4">PREMIUM CAR RENTAL</h1>
            <p class="text-gray-700 text-lg leading-relaxed max-w-4xl mx-auto">
                Experience luxury, performance, and style with our premium car rental service. Whether you're planning a weekend trip or a long vacation, we've got you covered.
            </p>
            <img src="assets/header.png" alt="header" class="mx-auto mt-6" />
        </div>

        <a href="#about" class="scroll__down block text-center mt-4 text-gray-500">
            <i class="ri-arrow-down-line text-2xl"></i>
        </a>
    </header>
</body>

</html>
