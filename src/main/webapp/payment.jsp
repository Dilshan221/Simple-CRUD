<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Complete Your Rental</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        .payment-option:hover {
            background-color: #f8fafc;
            border-color: #facc15;
        }
        .payment-option input:checked + div {
            border-color: #facc15;
            background-color: #fefce8;
        }
        .status-badge {
            font-size: 0.75rem;
            padding: 0.25rem 0.5rem;
            border-radius: 9999px;
            font-weight: 500;
        }
        .status-pending {
            background-color: #fef3c7;
            color: #92400e;
        }
        .status-confirmed {
            background-color: #d1fae5;
            color: #065f46;
        }
        .status-cancelled {
            background-color: #fee2e2;
            color: #b91c1c;
        }
        .status-completed {
            background-color: #dbeafe;
            color: #1e40af;
        }
    </style>
</head>
<body class="bg-gray-150 font-sans">
>
    <div id="header-container"></div>
    <%@ include file="header/header4.jsp"%>

    <section class="max-w-7xl mx-auto px-4 py-12">
        <h2 class="text-4xl font-bold text-center mb-16">COMPLETE YOUR RENTAL</h2>

        <div class="flex flex-col lg:flex-row gap-8 items-start mb-20 p-6 bg-gray-50 rounded-xl">
            <!-- Left: Car Details -->
            <div class="lg:w-1/2">
                <div class="sticky top-4">
                    <h3 class="text-2xl font-bold mb-6">Your Rental Details</h3>
                    <img src="assets/${param.img}" alt="${param.car}" class="w-full h-auto object-contain rounded-lg mb-6">

                    <div class="bg-white p-6 rounded-lg shadow">
                        <h4 class="text-xl font-bold mb-4">${param.car}</h4>
                        
                        <!-- Date Selection -->
                        <div class="grid grid-cols-2 gap-4 mb-6">
                            <div>
                                <label for="pickup-date" class="block text-gray-600 mb-2">Pick-Up Date</label>
                                <input type="date" id="pickup-date" class="w-full px-4 py-2 border rounded-lg" required>
                            </div>
                            <div>
                                <label for="return-date" class="block text-gray-600 mb-2">Return Date</label>
                                <input type="date" id="return-date" class="w-full px-4 py-2 border rounded-lg" required>
                            </div>
                        </div>
                        
                        <!-- Pickup Time -->
                        <div class="mb-6">
                            <label for="pickup-time" class="block text-gray-600 mb-2">Pick-Up Time</label>
                            <select id="pickup-time" class="w-full px-4 py-2 border rounded-lg">
                                <option value="08:00">8:00 AM</option>
                                <option value="10:00" selected>10:00 AM</option>
                                <option value="12:00">12:00 PM</option>
                                <option value="14:00">2:00 PM</option>
                                <option value="16:00">4:00 PM</option>
                            </select>
                        </div>

                        <!-- Rent Options -->
                        <div class="mb-6">
                            <label class="block text-gray-600 mb-2">Rent Option</label>
                            <div class="grid grid-cols-3 gap-4">
                                <label class="payment-option flex flex-col items-center p-4 border rounded-lg cursor-pointer">
                                    <input type="radio" name="rent-option" value="basic" checked class="hidden" 
                                        data-price="${param.price}" data-days="1">
                                    <div class="w-full text-center">
                                        <span class="font-medium">Basic</span>
                                        <span class="text-sm text-gray-500 block">Daily Rate</span>
                                        <span class="font-bold">$${param.price}/day</span>
                                    </div>
                                </label>
                                
                                <label class="payment-option flex flex-col items-center p-4 border rounded-lg cursor-pointer">
                                    <input type="radio" name="rent-option" value="weekly" class="hidden" 
                                        data-price="${param.price * 0.9}" data-days="7">
                                    <div class="w-full text-center">
                                        <span class="font-medium">Weekly</span>
                                        <span class="text-sm text-gray-500 block">10% Discount</span>
                                        <span class="font-bold">$${param.price * 0.9}/day</span>
                                    </div>
                                </label>
                                
                                <label class="payment-option flex flex-col items-center p-4 border rounded-lg cursor-pointer">
                                    <input type="radio" name="rent-option" value="monthly" class="hidden" 
                                        data-price="${param.price * 0.8}" data-days="30">
                                    <div class="w-full text-center">
                                        <span class="font-medium">Monthly</span>
                                        <span class="text-sm text-gray-500 block">20% Discount</span>
                                        <span class="font-bold">$${param.price * 0.8}/day</span>
                                    </div>
                                </label>
                            </div>
                        </div>

                        <!-- Rental Summary -->
                        <div class="border-t pt-4 space-y-3">
                            <div class="flex justify-between">
                                <span class="text-gray-600">Rental Period:</span>
                                <span><span id="display-pickup" class="font-medium"></span> to <span id="display-return" class="font-medium"></span></span>
                            </div>
                            <div class="flex justify-between">
                                <span class="text-gray-600">Total Days:</span>
                                <span class="font-bold"><span id="rental-days">0</span> days</span>
                            </div>
                            <div class="flex justify-between">
                                <span class="text-gray-600">Rent Option:</span>
                                <span class="font-bold" id="rent-option-display">Basic</span>
                            </div>
                            <div class="flex justify-between text-lg font-bold pt-2">
                                <span>Total Amount:</span>
                                <span>$<span id="total-price">0.00</span></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Right: Payment Form -->
            <div class="lg:w-1/2">
                <h3 class="text-2xl font-bold mb-6">Payment Information</h3>
                <form action="payment" method="post" class="space-y-6 bg-white p-6 rounded-lg shadow">
                    <!-- Hidden Fields -->
                    <input type="hidden" id="base-price" name="amont" value="${param.price}">
                    <input type="hidden" id="total-days" name="day">
                    <input type="hidden" id="total-amount" name="amount">
                    <input type="hidden" name="email" value="${sessionScope.email}">
                    <input type="hidden" name="carImage" value="${param.img}">
                    <input type="hidden" name="carName" value="${param.car}">
                    <input type="hidden" id="start-date" name="startDate">
                    <input type="hidden" id="end-date" name="endDate">
                    <input type="hidden" id="pickup-time-value" name="pickupTime">
                    <input type="hidden" id="booking-time" name="bookingTime" value="">

                    <!-- Payment Method -->
                    <div>
                        <label class="block text-gray-700 mb-2 font-medium">Payment Method</label>
                        <div class="space-y-3">
                            <!-- Credit Card -->
                            <label class="payment-option flex items-center space-x-3 p-3 border rounded-lg">
                                <input type="radio" name="payment-method" value="credit-card" checked class="hidden">
                                <div class="flex items-center space-x-3">
                                    <div class="h-5 w-5 rounded-full border-2 border-yellow-500 flex items-center justify-center">
                                        <div class="h-3 w-3 rounded-full bg-yellow-500"></div>
                                    </div>
                                    <div>
                                        <span class="font-medium">Credit/Debit Card</span>
                                        <div class="flex space-x-2 mt-1">
                                            <i class="ri-visa-fill text-2xl text-blue-800"></i>
                                            <i class="ri-mastercard-fill text-2xl text-red-600"></i>
                                            <i class="ri-american-express-fill text-2xl text-blue-500"></i>
                                        </div>
                                    </div>
                                </div>
                            </label>
                            
                            <!-- PayPal -->
                            <label class="payment-option flex items-center space-x-3 p-3 border rounded-lg">
                                <input type="radio" name="payment-method" value="paypal" class="hidden">
                                <div class="flex items-center space-x-3">
                                    <div class="h-5 w-5 rounded-full border-2 border-gray-300 flex items-center justify-center">
                                        <div class="h-3 w-3 rounded-full bg-transparent"></div>
                                    </div>
                                    <div>
                                        <span class="font-medium">PayPal</span>
                                        <i class="ri-paypal-fill text-2xl text-blue-700 mt-1 block"></i>
                                    </div>
                                </div>
                            </label>
                        </div>
                    </div>

                    <!-- Credit Card Fields -->
                    <div id="credit-card-fields" class="space-y-4">
                        <div>
                            <label class="block text-gray-700 mb-2 font-medium">Card Number</label>
                            <input type="text" name="card-number" class="w-full px-4 py-3 border rounded-lg focus:ring-2 focus:ring-yellow-500 focus:border-yellow-500" 
                                   placeholder="1234 5678 9012 3456" required>
                        </div>
                        <div class="grid grid-cols-2 gap-4">
                            <div>
                                <label class="block text-gray-700 mb-2 font-medium">Expiry Date</label>
                                <input type="text" name="expiry-date" class="w-full px-4 py-3 border rounded-lg focus:ring-2 focus:ring-yellow-500 focus:border-yellow-500" 
                                       placeholder="MM/YY" required>
                            </div>
                            <div>
                                <label class="block text-gray-700 mb-2 font-medium">CVV</label>
                                <input type="text" name="cvv" class="w-full px-4 py-3 border rounded-lg focus:ring-2 focus:ring-yellow-500 focus:border-yellow-500" 
                                       placeholder="123" required>
                            </div>
                        </div>
                        <div>
                            <label class="block text-gray-700 mb-2 font-medium">Cardholder Name</label>
                            <input type="text" name="card-name" class="w-full px-4 py-3 border rounded-lg focus:ring-2 focus:ring-yellow-500 focus:border-yellow-500" 
                                   placeholder="As shown on card" required>
                        </div>
                    </div>

                    <!-- PayPal Notice -->
                    <div id="paypal-fields" class="hidden bg-blue-50 p-4 rounded-lg">
                        <p class="text-blue-800">You will be redirected to PayPal to complete your payment</p>
                    </div>

                    <!-- Submit Button -->
                    <c:choose>
                        <c:when test="${empty sessionScope.email}">
                            <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded">
                                You must be logged in to complete your rental.
                                <a href="login.jsp?redirect=payment" class="text-blue-600 hover:underline">Login here</a>
                            </div>
                            <button type="button" disabled class="w-full bg-gray-400 text-white py-3 rounded-lg font-bold text-lg">
                                Please Login to Continue
                            </button>
                        </c:when>
                        <c:otherwise>
                            <button type="submit" class="w-full bg-yellow-600 hover:bg-yellow-700 text-white py-3 rounded-lg font-bold text-lg transition duration-200">
                                Complete Rental ($<span id="button-total">0.00</span>)
                            </button>
                        </c:otherwise>
                    </c:choose>

                    <p class="text-sm text-gray-500 text-center">
                        <i class="ri-shield-check-line"></i> Secure 256-bit SSL encrypted payment
                    </p>
                </form>
            </div>
        </div>
    </section>

    <div id="footer-container"></div>
    <%@ include file="footer.jsp"%>

    <script>
        $(document).ready(function() {
            // Set current timestamp as booking time (format: YYYY-MM-DD HH:MM:SS)
            const now = new Date();
            const formattedDateTime = now.getFullYear() + '-' + 
                String(now.getMonth() + 1).padStart(2, '0') + '-' + 
                String(now.getDate()).padStart(2, '0') + ' ' + 
                String(now.getHours()).padStart(2, '0') + ':' + 
                String(now.getMinutes()).padStart(2, '0') + ':' + 
                String(now.getSeconds()).padStart(2, '0');
            
            $('#booking-time').val(formattedDateTime);
            
            // Initialize with car details
            const basePrice = ${param.price};
            const today = new Date().toISOString().split('T')[0];
            
            // Set minimum date for pickup
            $("#pickup-date").attr('min', today);
            
            // Calculate rental when dates change
            $("#pickup-date, #return-date, #pickup-time").change(calculateRental);
            
            // Handle rent option changes
            $("input[name='rent-option']").change(function() {
                calculateRental();
                $("#rent-option-display").text($(this).val().charAt(0).toUpperCase() + $(this).val().slice(1));
            });
            
            // Toggle payment method fields
            $("input[name='payment-method']").change(function() {
                const isCreditCard = $(this).val() === "credit-card";
                $("#credit-card-fields").toggle(isCreditCard);
                $("#paypal-fields").toggle(!isCreditCard);
                
                // Update radio button styling
                $(this).closest('.payment-option').find('div div:first-child div:first-child')
                    .toggleClass('bg-transparent', !isCreditCard)
                    .toggleClass('bg-yellow-500', isCreditCard)
                    .parent().toggleClass('border-yellow-500', isCreditCard)
                    .toggleClass('border-gray-300', !isCreditCard);
            });

            // Calculate rental details
            function calculateRental() {
                const pickupDate = $("#pickup-date").val();
                const returnDate = $("#return-date").val();
                const pickupTime = $("#pickup-time").val();

                if (pickupDate && returnDate) {
                    const pickup = new Date(pickupDate);
                    const ret = new Date(returnDate);

                    if (ret <= pickup) {
                        alert("Return date must be after pick-up date");
                        return;
                    }

                    const days = Math.ceil((ret - pickup) / (1000 * 60 * 60 * 24));
                    const option = $("input[name='rent-option']:checked");
                    const dailyRate = parseFloat(option.data("price"));
                    const optionDays = parseInt(option.data("days"));

                    let totalDays = days;
                    let totalAmount;

                    if (option.val() === "weekly") {
                        totalDays = Math.ceil(days / 7) * 7;
                        totalAmount = (dailyRate * 7) * Math.ceil(days / 7);
                    } else if (option.val() === "monthly") {
                        totalDays = Math.ceil(days / 30) * 30;
                        totalAmount = (dailyRate * 30) * Math.ceil(days / 30);
                    } else {
                        totalAmount = days * dailyRate;
                    }

                    // Update display
                    $("#display-pickup").text(formatDate(pickupDate));
                    $("#display-return").text(formatDate(returnDate));
                    $("#rental-days").text(totalDays);
                    $("#total-price").text(totalAmount.toFixed(2));
                    $("#button-total").text(totalAmount.toFixed(2));

                    // Update hidden form fields
                    $("#total-days").val(totalDays);
                    $("#total-amount").val(totalAmount.toFixed(2));
                    $("#start-date").val(pickupDate);
                    $("#end-date").val(returnDate);
                    $("#pickup-time-value").val(pickupTime + ":00");
                }
            }

            // Format date as MM/DD/YYYY
            function formatDate(dateString) {
                const date = new Date(dateString);
                return (date.getMonth() + 1) + '/' + date.getDate() + '/' + date.getFullYear();
            }

            // Initial calculation
            calculateRental();
            
            // Form validation
            $("form").submit(function(e) {
                if (!$("#pickup-date").val() || !$("#return-date").val()) {
                    e.preventDefault();
                    alert("Please select both pick-up and return dates");
                    return false;
                }
                return true;
            });
        });
    </script>
</body>
</html>