<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const menuBtn = document.getElementById('menu-btn');
            const dropdownMenu = document.getElementById('dropdown-menu');
            
            menuBtn.addEventListener('click', function(e) {
                e.stopPropagation(); // Prevent the click from bubbling up
                dropdownMenu.classList.toggle('hidden');
            });
            
            // Close menu when clicking anywhere else
            document.addEventListener('click', function() {
                dropdownMenu.classList.add('hidden');
            });
        });
    </script>
    <style>
        nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1200px;
            margin: 0 auto;
            padding: 1rem;
        }

        .nav-center {
            justify-content: center;
            flex-grow: 1;
        }

        .nav__links {
            display: flex;
            gap: 2rem;
        }

        .nav-actions {
            display: flex;
            gap: 0.75rem;
        }
        
        /* Add this for the dropdown positioning */
        .nav-right {
            position: relative;
        }
    </style>
</head>

<body>
    <header>
        <nav>
            <div class="nav__header">
                <div class="nav__logo">
                    <a href="#" class="text-xl font-bold">RENTAL</a>
                </div>
            </div>

            <div class="nav-center">
                <ul class="nav__links">
                    <li><a href="LHomePage.jsp" class="hover:text-orange-600">Home</a></li>
                    <li><a href="rents" class="hover:text-yellow-600">Rent</a></li>
                    <li><a href="rideHistory" class="hover:text-yellow-600">Ride</a></li>
                    <li><a href="contact.jsp" class="hover:text-orange-600">Contact</a></li>
                </ul>
            </div>
            
            <!-- Right side - Menu button with dropdown -->
            <div class="nav-right">
                <button id="menu-btn" class="flex items-center">
                    <i class="ri-menu-line text-2xl"></i>
                </button>
                
                <!-- Dropdown Menu -->
                <div id="dropdown-menu" class="hidden absolute right-0 mt-2 bg-white rounded-md shadow-lg py-1 z-50" style="min-width: 150px;">
                    <a href="userprofile.jsp" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">
                        <i class="ri-user-line mr-2"></i> User Profile
                    </a>
                    <a href="#" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">
                        <i class="ri-settings-3-line mr-2"></i> Settings
                    </a>
                    <a href="LoginPage.jsp" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">
                        <i class="ri-logout-box-r-line mr-2"></i> Sign Out
                    </a>
                </div>
            </div>
        </nav>
    </header>
</body>
</html>