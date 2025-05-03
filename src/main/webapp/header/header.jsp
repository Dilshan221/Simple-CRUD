<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<header>
    <nav>
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
            <!-- User Account Icon -->
            <a href="account.jsp" class="flex items-center gap-1 text-gray-700 hover:text-yellow-600">
                <i class="ri-user-3-line text-2xl"></i>
                <span class="hidden md:inline">Account</span>
            </a>
            
            <!-- Cart Icon with Badge -->
            <a href="cart.jsp" class="flex items-center gap-1 text-gray-700 hover:text-yellow-600 relative">
                <i class="ri-shopping-cart-2-line text-2xl"></i>
                <span class="hidden md:inline">Cart</span>
                <span class="absolute -top-2 -right-2 bg-yellow-600 text-white text-xs font-bold rounded-full h-5 w-5 flex items-center justify-center">3</span>
            </a>
            
            <!-- Login/Register Buttons (shown when not logged in) -->
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
    
    <!-- Rest of your header content -->
    <div class="header__container" id="home">
        <h1>PREMIUM CAR RENTAL</h1>
        <form action="/" hidden>
            <p class="text-center text-gray-700 text-lg leading-relaxed max-w-4xl mx-auto px-4 mt-8">
                Experience luxury, performance, and style with our premium car rental service.
            </p>
        </form>
        <img src="assets/header.png" alt="header" />
    </div>
    <a href="#about" class="scroll__down">
        <i class="ri-arrow-down-line"></i>
    </a>
</header>