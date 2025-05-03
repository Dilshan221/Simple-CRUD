<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Your Ride Confirmation</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css" rel="stylesheet">
</head>
<body class="bg-gray-150 font-sans font-sans bg-light min-h-screen">
    <div id="header-container"></div>
    <%@ include file="header/header4.jsp"%>

    <section class="max-w-7xl mx-auto px-4 py-12">
        <h2 class="text-4xl font-bold text-center mb-16">YOUR RIDE IS CONFIRMED!</h2>

        <div class="bg-white rounded-lg shadow-lg p-8 max-w-3xl mx-auto">
            <div class="flex flex-col md:flex-row gap-8">
                <!-- Car Image -->
                <div class="md:w-1/3">
                    <img src="assets/${sessionScope.carImage}" alt="${sessionScope.carName}" 
                         class="w-full h-auto rounded-lg shadow-md">
                </div>
                
                <!-- Ride Details -->
                <div class="md:w-2/3">
                    <h3 class="text-2xl font-bold mb-4">${sessionScope.carName}</h3>
                    
                    <div class="space-y-4">
                        <div class="flex justify-between border-b pb-2">
                            <span class="font-medium">Rental Duration:</span>
                            <span>${sessionScope.rentalDays} days</span>
                        </div>
                        
                        <div class="flex justify-between border-b pb-2">
                            <span class="font-medium">Daily Rate:</span>
                            <span>$${sessionScope.basePrice}</span>
                        </div>
                        
                        <div class="flex justify-between border-b pb-2">
                            <span class="font-medium">Total Amount:</span>
                            <span class="font-bold">$${sessionScope.payment.amount}</span>
                        </div>
                        
                        <div class="flex justify-between border-b pb-2">
                            <span class="font-medium">Payment Method:</span>
                            <span>Credit Card</span>
                        </div>
                        
                        <div class="flex justify-between border-b pb-2">
                            <span class="font-medium">Booking Reference:</span>
                            <span>#${sessionScope.payment.id}</span>
                        </div>
                    </div>
                    
                    <div class="mt-8 bg-blue-50 p-4 rounded-lg">
                        <h4 class="font-bold text-lg mb-2">Pickup Instructions</h4>
                        <p>Your car will be ready at our downtown location at 123 Main Street.</p>
                        <p class="mt-2">Please bring your driver's license and the credit card used for payment.</p>
                    </div>
                </div>
            </div>
            
            <div class="mt-8 flex justify-center">
                <button onclick="window.print()" 
                        class="bg-yellow-600 text-white px-6 py-3 rounded-lg hover:bg-yellow-700 transition">
                    Print Receipt
                </button>
              <a href="rideHistory"  
                class="ml-4 bg-black text-white px-6 py-3 rounded-lg hover:bg-gray-800 transition">
                Ride Cart
              </a>
            </div>
        </div>
    </section>

    <div id="footer-container"></div>
    <%@ include file="footer.jsp"%>
</body>
</html>