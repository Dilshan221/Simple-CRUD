<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css" rel="stylesheet">
    <script src="javascript/HomePage.js"></script>
    <link rel="stylesheet" href="css/style.css">
</head>

<body class="bg-gray-150 font-sans">

    <div id="header-container"></div>

    <%@ include file="header/header3.jsp"%>



    <div class="flex justify-center items-center min-h-[200px]">
        <button class="bg-black text-white px-6 py-4 rounded hover:bg-yellow-600 transition duration-300">
            Choose Your Rent Vehicle
        </button>
    </div>
    </div>

    <section class="section__container range__container" id="about">
        <h2 class="section__header">WIDE RANGE OF VEHICLES</h2>
        <div class="range__grid">
            <div class="range__card">
                <img src="assets/range-1.jpg" alt="range" />
                <div class="range__details">
                    <h4>CARS</h4>
                    <a href="rent.html"><i class="ri-arrow-right-line"></i></a>
                </div>
            </div>
            <div class="range__card">
                <img src="assets/range-2.jpg" alt="range" />
                <div class="range__details">
                    <h4>SUVS</h4>
                    <a href="#"><i class="ri-arrow-right-line"></i></a>
                </div>
            </div>
            <div class="range__card">
                <img src="assets/range-3.jpg" alt="range" />
                <div class="range__details">
                    <h4>VANS</h4>
                    <a href="#"><i class="ri-arrow-right-line"></i></a>
                </div>
            </div>
            <div class="range__card">
                <img src="assets/range-4.jpg" alt="range" />
                <div class="range__details">
                    <h4>ELECTRIC</h4>
                    <a href="#"><i class="ri-arrow-right-line"></i></a>
                </div>
            </div>
        </div>
    </section>


    <section class="section__container location__container" id="rent">
        <div class="location__image">
            <img src="assets/location.png" alt="location" />
        </div>
        <div class="location__content">
            <h2 class="section__header">FIND CAR IN YOUR RENTAL VEHICAL</h2>
            <p>
                Discover the perfect vehicle tailored to your needs, wherever you are.
                Our 'Find Car in Your Locations' feature allows you to effortlessly
                search and select from our premium fleet available near you. Whether
                you're looking for a luxury sedan, a spacious SUV, or a sporty
                convertible, our easy-to-use tool ensures you find the ideal car for
                your journey. Simply enter your location, and let us connect you with
                top-tier vehicles ready for rental.
            </p>
           <!-- In your location section -->
<div class="location__btn">
    <a href="user?action=rent">
        <button class="btn">Rent Now</button>
    </a>
</div>
        </div>
    </section>
    <section class="section__container story__container">
        <h2 class="section__header">STORIES BEHIND THE WHEEL</h2>
        <div class="story__grid">
            <div class="story__card">
                <div class="story__date">
                    <span>12</span>
                    <div>
                        <p>January</p>
                        <p>2024</p>
                    </div>
                </div>
                <h4>Adventures on the Open Road</h4>
                <p>
                    Join us as we dive into the exhilarating stories of travelers who
                    embarked on unforgettable journeys with PREMIUM CAR RENTAL.
                </p>
                <img src="assets/story-1.jpg" alt="story" />
            </div>
            <div class="story__card">
                <div class="story__date">
                    <span>04</span>
                    <div>
                        <p>March</p>
                        <p>2024</p>
                    </div>
                </div>
                <h4>Luxury and Comfort: Experiences</h4>
                <p>
                    In this series, we highlight the luxurious touches, unparalleled
                    comfort, and exceptional service that make every ride.
                </p>
                <img src="assets/story-2.jpg" alt="story" />
            </div>
            <div class="story__card">
                <div class="story__date">
                    <span>18</span>
                    <div>
                        <p>June</p>
                        <p>2024</p>
                    </div>
                </div>
                <h4>Cars that Adapt to Your Lifestyle</h4>
                <p>
                    Read about how our versatile vehicles have seamlessly integrated
                    into the lives of professionals and families alike.
                </p>
                <img src="assets/story-3.jpg" alt="story" />
            </div>
        </div>
    </section>

    <section class="banner__container">
        <div class="banner__wrapper">
            <img src="assets/banner-1.png" alt="banner" />
            <img src="assets/banner-2.png" alt="banner" />
            <img src="assets/banner-3.png" alt="banner" />
            <img src="assets/banner-4.png" alt="banner" />
            <img src="assets/banner-5.png" alt="banner" />
            <img src="assets/banner-6.png" alt="banner" />
            <img src="assets/banner-7.png" alt="banner" />
            <img src="assets/banner-8.png" alt="banner" />
            <img src="assets/banner-9.png" alt="banner" />
            <img src="assets/banner-10.png" alt="banner" />
        </div>
    </section>


    <div id="footer-container"></div>

     <%@ include file="footer.jsp"%>
</body>

</html>