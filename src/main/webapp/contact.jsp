<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="css/style.css">
    <title>Contact Us | Premium Car Rental</title>
</head>

<body class="bg-gray-150 font-sans">
    <div id="header-container"></div>

     <%@ include file="header/header4.jsp"%>

    <main class="max-w-7xl mx-auto px-4 py-12">
        <!-- Contact Header -->
        <div class="text-center mb-16">
            <h1 class="text-4xl md:text-5xl font-bold mb-4">Contact Premium Car Rental</h1>
            <p class="text-xl text-gray-600 max-w-2xl mx-auto">
                Have questions or need assistance? Our team is ready to help you with your luxury car rental needs.
            </p>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-2 gap-12">
            <!-- Contact Form -->
            <div class="bg-white p-8 rounded-xl shadow-lg">
                <h2 class="text-2xl font-bold mb-6">Send Us a Message</h2>
                <form class="space-y-6">
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <div>
                            <label for="name" class="block text-gray-700 mb-2">Full Name</label>
                            <input type="text" id="name"
                                class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                                required>
                        </div>
                        <div>
                            <label for="email" class="block text-gray-700 mb-2">Email Address</label>
                            <input type="email" id="email"
                                class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                                required>
                        </div>
                    </div>
                    <div>
                        <label for="phone" class="block text-gray-700 mb-2">Phone Number</label>
                        <input type="tel" id="phone"
                            class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
                    </div>
                    <div>
                        <label for="subject" class="block text-gray-700 mb-2">Subject</label>
                        <select id="subject"
                            class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
                            <option value="">Select a subject</option>
                            <option value="reservation">Reservation Inquiry</option>
                            <option value="fleet">Fleet Information</option>
                            <option value="corporate">Corporate Rental</option>
                            <option value="feedback">Feedback</option>
                            <option value="other">Other</option>
                        </select>
                    </div>
                    <div>
                        <label for="message" class="block text-gray-700 mb-2">Your Message</label>
                        <textarea id="message" rows="5"
                            class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                            required></textarea>
                    </div>
                    <button type="submit"
                        class="w-full bg-yellow-600 hover:bg-yellow-700 text-white font-bold py-3 px-6 rounded-lg transition duration-300">
                        Send Message <i class="ri-send-plane-line ml-2"></i>
                    </button>
                </form>
            </div>

            <!-- Contact Info -->
            <div class="space-y-8">
                <div class="bg-gray-50 p-8 rounded-xl">
                    <h2 class="text-2xl font-bold mb-6">Contact Information</h2>
                    <div class="space-y-6">
                        <div class="flex items-start">
                            <div class="bg-yellow-100 p-3 rounded-full mr-4">
                                <i class="ri-phone-fill text-yellow-600 text-xl"></i>
                            </div>
                            <div>
                                <h3 class="font-semibold text-lg">Phone Support</h3>
                                <p class="text-gray-600">+1 (555) 123-4567</p>
                                <p class="text-gray-500 text-sm">Mon-Fri: 8:00 AM - 8:00 PM</p>
                            </div>
                        </div>
                        <div class="flex items-start">
                            <div class="bg-yellow-100 p-3 rounded-full mr-4">
                                <i class="ri-mail-fill text-yellow-600 text-xl"></i>
                            </div>
                            <div>
                                <h3 class="font-semibold text-lg">Email Us</h3>
                                <p class="text-gray-600">info@premiumcarrental.com</p>
                                <p class="text-gray-500 text-sm">Response within 24 hours</p>
                            </div>
                        </div>
                        <div class="flex items-start">
                            <div class="bg-yellow-100 p-3 rounded-full mr-4">
                                <i class="ri-map-pin-fill text-yellow-600 text-xl"></i>
                            </div>
                            <div>
                                <h3 class="font-semibold text-lg">Visit Us</h3>
                                <p class="text-gray-600">123 Luxury Avenue</p>
                                <p class="text-gray-600">Beverly Hills, CA 90210</p>
                                <p class="text-gray-500 text-sm">By appointment only</p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- FAQ Section -->
                <div class="bg-white p-8 rounded-xl shadow-lg">
                    <h2 class="text-2xl font-bold mb-6">Frequently Asked Questions</h2>
                    <div class="space-y-4">
                        <div class="border-b border-gray-200 pb-4">
                            <button class="flex justify-between items-center w-full text-left font-medium">
                                <span>What documents do I need to rent a car?</span>
                                <i class="ri-arrow-down-s-line text-gray-500"></i>
                            </button>
                            <div class="mt-2 text-gray-600 hidden">
                                You'll need a valid driver's license, credit card, and proof of insurance. International
                                renters may need additional documentation.
                            </div>
                        </div>
                        <div class="border-b border-gray-200 pb-4">
                            <button class="flex justify-between items-center w-full text-left font-medium">
                                <span>What is your cancellation policy?</span>
                                <i class="ri-arrow-down-s-line text-gray-500"></i>
                            </button>
                            <div class="mt-2 text-gray-600 hidden">
                                Cancellations made 48 hours or more before pickup receive a full refund. Late
                                cancellations may incur a fee.
                            </div>
                        </div>
                        <div class="border-b border-gray-200 pb-4">
                            <button class="flex justify-between items-center w-full text-left font-medium">
                                <span>Do you offer airport delivery?</span>
                                <i class="ri-arrow-down-s-line text-gray-500"></i>
                            </button>
                            <div class="mt-2 text-gray-600 hidden">
                                Yes, we offer airport delivery at most major airports for an additional fee. Please
                                inquire when making your reservation.
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Map Section -->
        <div class="mt-16 bg-gray-100 rounded-xl overflow-hidden">
            <iframe
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3957.527193426455!2d80.35633137499927!3d7.486606892534374!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ae3025025a7baf7%3A0x1a3e0c00ed379889!2sKurunegala!5e0!3m2!1sen!2slk!4v1718210133570!5m2!1sen!2slk"
                width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy"
                referrerpolicy="no-referrer-when-downgrade"></iframe>
        </div>


    </main>

    <section class="banner__container mt-16">
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

    <script>
        $(function () {
           

            // FAQ Accordion functionality
            $('.border-b button').click(function () {
                const answer = $(this).next('.hidden');
                const icon = $(this).find('i');

                answer.slideToggle();
                icon.toggleClass('ri-arrow-down-s-line ri-arrow-up-s-line');

                // Close other open FAQs
                $('.border-b button').not(this).next('.hidden').slideUp();
                $('.border-b button').not(this).find('i').removeClass('ri-arrow-up-s-line').addClass('ri-arrow-down-s-line');
            });
        });
    </script>
</body>

</html>