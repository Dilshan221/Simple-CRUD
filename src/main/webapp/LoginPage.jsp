<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | Premium Car Rental</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        .auth-bg {
            background-image: url('https://images.unsplash.com/photo-1503376780353-7e6692767b70?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1280&q=80');
            background-size: cover;
            background-position: center;
        }
        .header-bg {
            background-image: url('assets/header-orange-black.png');
            background-size: cover;
            background-position: center;
            height: 80px;
        }
        .error-message {
            color: #ef4444;
            font-size: 0.875rem;
            margin-top: 0.25rem;
        }
        .security-info {
            font-size: 0.75rem;
            color: #6b7280;
            margin-top: 0.5rem;
        }
    </style>
</head>

<body class="bg-gray-100 font-sans">
    <div id="header-container"></div>
    <%@ include file="header/header2.jsp"%>

    <main class="min-h-[calc(100vh-160px)] flex items-center justify-center py-12 px-4 sm:px-6 lg:px-8">
        <div class="max-w-5xl w-full flex bg-white rounded-xl shadow-lg overflow-hidden">
            <!-- Left Side - Form -->
            <div class="w-full md:w-1/2 p-8 sm:p-12">
                <div class="text-center mb-8">
                    <h1 class="text-3xl font-bold text-gray-800">Welcome Back</h1>
                    <p class="text-gray-600 mt-2">Sign in to access your premium rental account</p>
                </div>

                <%-- Display messages --%>
                <c:if test="${not empty param.message}">
                    <div class="mb-4 p-3 bg-green-100 text-green-700 rounded-md">
                        <c:choose>
                            <c:when test="${param.message == 'logout_success'}">
                                You have been successfully logged out.
                            </c:when>
                            <c:when test="${param.message == 'register_success'}">
                                Registration successful! Please log in.
                            </c:when>
                        </c:choose>
                    </div>
                </c:if>
                
                <%-- Error Message Display --%>
                <c:if test="${not empty error}">
                    <div class="mb-4 p-3 bg-red-100 text-red-700 rounded-md">
                        ${error}
                        <c:if test="${not empty remainingAttempts}">
                            <div class="security-info">
                                Remaining attempts: ${remainingAttempts}
                                <c:if test="${not empty unlockTime}">
                                    <br>Account will be unlocked at: ${unlockTime}
                                </c:if>
                            </div>
                        </c:if>
                    </div>
                </c:if>

                <form id="loginForm" action="login" method="POST" autocomplete="off">
                    <div class="mb-4">
                        <label for="email" class="block text-sm font-medium text-gray-700">Email Address</label>
                        <div class="mt-1 relative">
                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                <i class="ri-mail-line text-gray-400"></i>
                            </div>
                            <input id="email" name="email" type="email" autocomplete="username" required
                                class="pl-10 block w-full py-3 border border-gray-300 rounded-lg shadow-sm focus:ring-orange-500 focus:border-orange-500"
                                placeholder="you@example.com" value="${param.email}">
                        </div>
                    </div>

                    <div class="mb-4">
                        <label for="password" class="block text-sm font-medium text-gray-700">Password</label>
                        <div class="mt-1 relative">
                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                <i class="ri-lock-line text-gray-400"></i>
                            </div>
                            <input id="password" name="password" type="password" autocomplete="current-password"
                                required
                                class="pl-10 block w-full py-3 border border-gray-300 rounded-lg shadow-sm focus:ring-orange-500 focus:border-orange-500"
                                placeholder="••••••••">
                            <div class="absolute inset-y-0 right-0 pr-3 flex items-center">
                                <button type="button" class="text-gray-400 hover:text-gray-500" id="togglePassword">
                                    <i class="ri-eye-line" id="eyeIcon"></i>
                                </button>
                            </div>
                        </div>
                    </div>

                    <div class="flex items-center justify-between mb-6">
                        <div class="flex items-center">
                            <input id="remember-me" name="remember-me" type="checkbox"
                                class="h-4 w-4 text-yellow-600 focus:ring-yellow-500 border-gray-300 rounded">
                            <label for="remember-me" class="ml-2 block text-sm text-gray-700">Remember me</label>
                        </div>

                        <div class="text-sm">
                            <a href="forgotPassword.jsp" class="font-medium text-yellow-600 hover:text-yellow-500">Forgot password?</a>
                        </div>
                    </div>

                    <div class="mb-6">
                        <button type="submit" id="loginButton"
                            class="w-full flex justify-center py-3 px-4 border border-transparent rounded-lg shadow-sm text-sm font-medium text-white bg-yellow-600 hover:bg-yellow-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-yellow-500 transition">
                            Sign In <i class="ri-arrow-right-line ml-2"></i>
                        </button>
                    </div>
                </form>

                <div class="text-center">
                    <p class="text-sm text-gray-600">
                        Don't have an account?
                        <a href="register.jsp" class="font-medium text-yellow-600 hover:text-yellow-500">Sign up</a>
                    </p>
                </div>

                <div class="mt-8">
                    <div class="relative">
                        <div class="absolute inset-0 flex items-center">
                            <div class="w-full border-t border-gray-300"></div>
                        </div>
                        <div class="relative flex justify-center text-sm">
                            <span class="px-2 bg-white text-gray-500">Or continue with</span>
                        </div>
                    </div>

                    <div class="mt-6 grid grid-cols-2 gap-3">
                        <a href="#"
                            class="w-full inline-flex justify-center py-2 px-4 border border-gray-300 rounded-lg shadow-sm bg-white text-sm font-medium text-gray-700 hover:bg-gray-50">
                            <i class="ri-google-fill text-red-500 text-lg"></i>
                            <span class="ml-2">Google</span>
                        </a>
                        <a href="#"
                            class="w-full inline-flex justify-center py-2 px-4 border border-gray-300 rounded-lg shadow-sm bg-white text-sm font-medium text-gray-700 hover:bg-gray-50">
                            <i class="ri-facebook-circle-fill text-blue-600 text-lg"></i>
                            <span class="ml-2">Facebook</span>
                        </a>
                    </div>
                </div>
            </div>

            <!-- Right Side - Image -->
            <div class="hidden md:block md:w-1/2 auth-bg relative">
                <div class="absolute inset-0 bg-black bg-opacity-40 flex items-center justify-center p-8">
                    <div class="text-white text-center">
                        <i class="ri-steering-2-fill text-5xl mb-4 text-yellow-500"></i>
                        <h2 class="text-3xl font-bold mb-4">Premium Car Rental</h2>
                        <p class="text-lg">Experience luxury on wheels with our exclusive collection of premium vehicles
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <%@ include file="footer.jsp"%>

    <script>
        $(document).ready(function() {
            // Toggle password visibility
            $("#togglePassword").click(function() {
                const password = $("#password");
                const icon = $("#eyeIcon");
                
                if (password.attr("type") === "password") {
                    password.attr("type", "text");
                    icon.removeClass("ri-eye-line").addClass("ri-eye-off-line");
                } else {
                    password.attr("type", "password");
                    icon.removeClass("ri-eye-off-line").addClass("ri-eye-line");
                }
            });
            
            // Form submission handler
            $("#loginForm").submit(function(e) {
                // Client-side validation
                const email = $("#email").val().trim();
                const password = $("#password").val();
                
                if (!email || !password) {
                    e.preventDefault();
                    alert("Please fill in all fields");
                    return false;
                }
                
                // Disable button to prevent double submission
                $("#loginButton").prop("disabled", true)
                    .html('<i class="ri-loader-4-line animate-spin mr-2"></i> Signing in...');
                
                return true;
            });
            
            // Security notice for password field
            $("#password").on("focus", function() {
                $(this).after('<div class="security-info">For security, never share your password</div>');
            }).on("blur", function() {
                $(".security-info").remove();
            });
        });
    </script>
</body>
</html>