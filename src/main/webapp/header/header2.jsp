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
    </style>
</head>

<body>
    <header>
        <nav >
            <div class="nav__header">
                <div class="nav__logo">
                    <a href="#" class="text-xl font-bold">RENTAL</a>
                </div>
                <div class="nav__menu__btn" id="menu-btn">
                    <i class="ri-menu-line text-2xl"></i>
                </div>
            </div>

           <div class="nav-center flex justify-center w-full mt-4 md:mt-0">
    <ul class="nav__links flex space-x-8">
        <li><a href="HomePage.jsp" class="hover:text-orange-600">Home</a></li>
        <li><a href="rent.jsp" class="hover:text-yellow-600">Rent</a></li>
        <li><a href="#ride" class="hover:text-yellow-600">Ride</a></li>
        <li><a href="contact.jsp" class="hover:text-orange-600">Contact</a></li>
    </ul>
</div>


            <div class="nav-actions">
                <a href="LoginPage.jsp"
                    class="px-4 py-2 border border-yellow-600 text-yellow-600 rounded-lg hover:bg-yellow-600 hover:text-white transition">
                    LOGIN
                </a>
                <a href="register.jsp"
                    class="px-4 py-2 bg-yellow-600 text-white rounded-lg hover:bg-yellow-700 transition">
                    REGISTER
                </a>
            </div>
        </nav>


    </header>

    <script>
        // Mobile menu toggle
        document.getElementById('menu-btn').addEventListener('click', function () {
            const mobileMenu = document.getElementById('mobile-menu');
            mobileMenu.classList.toggle('active');
        });
    </script>
</body>

</html>