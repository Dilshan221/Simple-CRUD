<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css" rel="stylesheet">
    <script src="main.js"></script>
    <link rel="stylesheet" href="css/style.css">
</head>
<body class="bg-gray-150 font-sans">
    <div id="header-container"></div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <%@ include file="header/header4.jsp"%>

    <section class="max-w-7xl mx-auto px-4 py-12" id="ride">
        <h2 class="text-4xl font-bold text-center mb-16">PICK YOUR DREAM CAR TODAY</h2>
        
        <c:forEach var="rent" items="${rents}">
            <div class="flex flex-col lg:flex-row gap-8 items-center mb-20 p-6 bg-gray-50 rounded-xl">
                <div class="lg:w-1/2">
                    <img src="assets/${rent.fileName}" alt="${rent.version}" class="w-full h-auto object-contain rounded-lg">
                </div>
                <div class="lg:w-1/2">
                    <h3 class="text-2xl font-bold mb-4">${rent.version}</h3>
                    <div class="grid grid-cols-2 gap-4 mb-6">
                        <div class="flex items-center">
                            <i class="ri-speed-up-line text-yellow-600 text-xl mr-2"></i>
                            <span>${rent.km} <span class="text-gray-500">km/h</span></span>
                        </div>
                        <div class="flex items-center">
                            <i class="ri-settings-5-line text-yellow-600 text-xl mr-2"></i>
                            <span>${rent.speed} <span class="text-gray-500">speed</span></span>
                        </div>
                        <div class="flex items-center">
                            <i class="ri-roadster-line text-yellow-600 text-xl mr-2"></i>
                            <span>${rent.seats} <span class="text-gray-500">seats</span></span>
                        </div>
                        <div class="flex items-center">
                            <i class="ri-signpost-line text-yellow-600 text-xl mr-2"></i>
                            <span>${rent.kmpl} <span class="text-gray-500">kmpl</span></span>
                        </div>
                    </div>
                    <div class="flex items-center mb-6">
                        <i class="ri-price-tag-3-line text-yellow-600 text-xl mr-2"></i>
                        <span class="text-2xl font-bold">$${rent.day}</span> <span class="text-gray-500 ml-1">/day</span>
                    </div>
                    <div class="flex gap-4">
                        <button class="bg-yellow-600 text-white px-6 py-3 rounded-lg hover:bg-yellow-700 transition">
                            View Details
                        </button>
                       <a href="payment.jsp?car=${rent.version}&img=${rent.fileName}&price=${rent.day}"
                          class="bg-black text-white px-6 py-3 rounded-lg hover:bg-yellow-800 transition inline-block">
                          Rent Now
</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </section>

    <section class="banner__container">
        <div class="banner__wrapper">
            <c:forEach var="i" begin="1" end="10">
                <img src="assets/banner-${i}.png" alt="banner ${i}">
            </c:forEach>
        </div>
    </section>

    <div id="footer-container"></div>

     <%@ include file="footer.jsp"%>
</body>
</html>