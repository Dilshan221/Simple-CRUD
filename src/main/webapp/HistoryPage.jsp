<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Ride History | Premium Rentals</title>
    
    <!-- Tailwind CSS with custom configuration -->
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        primary: '#facc15', // Yellow
                        secondary: '#000000', // Black
                        dark: '#000000',
                        light: '#fffbe6'
                    },
                    fontFamily: {
                        sans: ['Inter', 'sans-serif'],
                    },
                }
            }
        }
    </script>
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Remix Icon -->
    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css" rel="stylesheet">
    
    <!-- Animate.css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    
    <style>
        .card-hover {
            transition: all 0.3s ease;
            transform: translateY(0);
        }
        .card-hover:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
        }
        .gradient-text {
            background-clip: text;
            -webkit-background-clip: text;
            color: transparent;
            background-image: linear-gradient(to right, #facc15, #000000);
        }
        /* Consistent card height */
        .card-container {
            min-height: 300px;
            height: 100%;
        }
        /* Image container with fixed aspect ratio */
        .image-container {
            height: 100%;
            min-height: 300px;
            position: relative;
            overflow: hidden;
        }
        .car-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.3s ease;
        }
        .card-hover:hover .car-image {
            transform: scale(1.03);
        }
    </style>
</head>
<body class="bg-gray-150 font-sans ">
    <!-- Header Include -->
    <%@ include file="header/header4.jsp" %>

    <!-- Main Content -->
    <main class="container mx-auto px-4 py-12">
        <!-- Page Header -->
        <div class="text-center mb-16 animate__animated animate__fadeIn">
            <h1 class="text-5xl font-bold mb-4 gradient-text">Your Ride History</h1>
            <p class="text-dark max-w-2xl mx-auto">Review all your past rentals and upcoming reservations</p>
        </div>

        <!-- Ride History Cards -->
        <c:choose>
            <c:when test="${not empty rideHistory}">
                <div class="grid grid-cols-1 gap-8 max-w-4xl mx-auto">
                    <c:forEach var="ride" items="${rideHistory}" varStatus="loop">
                        <div class="card-hover bg-white rounded-xl overflow-hidden shadow-lg animate__animated animate__fadeInUp card-container" style="animation-delay: ${loop.index * 0.1}s">
                            <div class="flex flex-col md:flex-row h-full">
                                <!-- Car Image - Fixed Size Container -->
                             <div class="md:w-1/3">
                            <img src="assets/${ride.fileName}" alt="${ride.car}" 
                            class="w-full h-auto rounded-lg shadow-md">
                              </div>

                                
                                <!-- Ride Details -->
                                <div class="md:w-3/5 p-6 md:p-8 flex flex-col justify-between">
                                    <div>
                                        <div class="flex justify-between items-start">
                                            <div>
                                                <h3 class="text-2xl font-bold text-dark mb-2">${ride.car}</h3>
                                                <div class="flex items-center text-gray-500 mb-1">
                                                    <i class="ri-calendar-line mr-2"></i>
                                                    <span>${ride.days} day${ride.days > 1 ? 's' : ''} rental</span>
                                                </div>
                                            </div>
                                            <span class="bg-green-100 text-green-800 text-sm font-medium px-2.5 py-0.5 rounded-full">
                                                Completed
                                            </span>
                                        </div>
                                        
                                        <div class="my-6 border-t border-gray-200"></div>
                                        
                                        <!-- Pricing -->
                                        <div class="mb-6">
                                            <div class="flex justify-between items-center mb-2">
                                                <span class="text-gray-600">Daily Rate</span>
                                                <span class="font-medium text-black">$${ride.amount / ride.days}</span>
                                            </div>
                                            <div class="flex justify-between items-center">
                                                <span class="text-gray-600">Total Amount</span>
                                                <span class="text-xl font-bold text-primary">$${ride.amount}</span>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <!-- Action Buttons -->
                                    <div class="flex space-x-3">
                                        <button class="flex-1 bg-primary hover:bg-yellow-300 text-black py-2 px-4 rounded-lg transition flex items-center justify-center">
                                            <i class="ri-repeat-line mr-2"></i> Rent Again
                                        </button>
                                        <button class="flex-1 border border-gray-300 hover:bg-gray-50 text-black py-2 px-4 rounded-lg transition flex items-center justify-center">
                                            <i class="ri-file-text-line mr-2"></i> Invoice
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:when>
            <c:otherwise>
                <!-- Empty State -->
                <div class="text-center py-20 animate__animated animate__fadeIn">
                    <div class="mx-auto w-48 h-48 bg-gray-200 rounded-full flex items-center justify-center mb-6">
                        <i class="ri-car-line text-6xl text-gray-400"></i>
                    </div>
                    <h3 class="text-2xl font-medium text-gray-700 mb-2">No Ride History Yet</h3>
                    <p class="text-gray-500 mb-6">You haven't made any rentals with us yet</p>
                    <a href="rent.jsp" class="inline-block bg-primary hover:bg-yellow-300 text-black font-medium py-3 px-6 rounded-lg transition">
                        Browse Available Vehicles
                    </a>
                </div>
            </c:otherwise>
        </c:choose>
    </main>

    <!-- Promo Banner -->
    <section class="bg-dark text-white py-12">
        <div class="container mx-auto px-4 text-center">
            <h3 class="text-2xl font-bold mb-4">Ready for your next adventure?</h3>
            <p class="text-gray-300 max-w-2xl mx-auto mb-6">Explore our premium collection of vehicles for your next journey</p>
            <a href="rent.jsp" class="inline-block bg-primary hover:bg-yellow-300 text-black font-medium py-3 px-8 rounded-full transition">
                Book Your Next Ride
            </a>
        </div>
    </section>

    <!-- Footer Include -->
    <%@ include file="footer.jsp" %>

    <!-- Scripts -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            document.querySelectorAll('a[href^="#"]').forEach(anchor => {
                anchor.addEventListener('click', function (e) {
                    e.preventDefault();
                    document.querySelector(this.getAttribute('href')).scrollIntoView({
                        behavior: 'smooth'
                    });
                });
            });
        });
    </script>
</body>
</html>