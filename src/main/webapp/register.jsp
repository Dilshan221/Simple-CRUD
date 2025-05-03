<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration | Premium Car Rental</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css" rel="stylesheet">
    <style>
        .auth-bg {
            background-image: url('https://images.unsplash.com/photo-1503376780353-7e6692767b70?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1280&q=80');
            background-size: cover;
            background-position: center;
        }
        
        .error-message {
            color: #ef4444;
            font-size: 0.875rem;
            margin-top: 0.25rem;
        }
        
        .password-strength {
            height: 4px;
            margin-top: 4px;
            border-radius: 2px;
        }
        
        .strength-0 { background-color: #ef4444; width: 20%; }
        .strength-1 { background-color: #f97316; width: 40%; }
        .strength-2 { background-color: #f59e0b; width: 60%; }
        .strength-3 { background-color: #84cc16; width: 80%; }
        .strength-4 { background-color: #10b981; width: 100%; }
        
        .role-badge {
            display: inline-flex;
            align-items: center;
            padding: 0.25rem 0.5rem;
            border-radius: 0.375rem;
            font-size: 0.75rem;
            font-weight: 600;
        }
        .badge-customer { background-color: #f59e0b; color: white; }
        .badge-employee { background-color: #3b82f6; color: white; }
        .badge-admin { background-color: #ef4444; color: white; }
    </style>
</head>
<body class="bg-gray-100 font-sans">
    <%@ include file="header/header2.jsp"%>

    <main class="min-h-[calc(100vh-160px)] flex items-center justify-center py-12 px-4 sm:px-6 lg:px-8">
        <div class="max-w-5xl w-full flex bg-white rounded-xl shadow-lg overflow-hidden">
            <!-- Left Side - Form -->
            <div class="w-full md:w-1/2 p-8 sm:p-12">
                <div class="text-center mb-8">
                    <h1 class="text-3xl font-bold text-gray-800">Create New User</h1>
                    <p class="text-gray-600 mt-2">Add a new user to the system</p>
                </div>

                <!-- Success/Error Messages -->
                <c:if test="${not empty successMessage}">
                    <div class="mb-6 p-4 bg-green-100 border border-green-400 text-green-700 rounded-lg">
                        ${successMessage}
                    </div>
                </c:if>
                <c:if test="${not empty errorMessage}">
                    <div class="mb-6 p-4 bg-red-100 border border-red-400 text-red-700 rounded-lg">
                        ${errorMessage}
                    </div>
                </c:if>

                <form id="registerForm" action="user" method="POST">
                    <input type="hidden" name="action" value="create">
                    
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <!-- First Name -->
                        <div>
                            <label for="fname" class="block text-sm font-medium text-gray-700">First Name</label>
                            <input type="text" id="fname" name="fname" required
                                   class="mt-1 block w-full border border-gray-300 rounded-lg py-2 px-3 shadow-sm focus:outline-none focus:ring-orange-500 focus:border-orange-500">
                            <div id="fname-error" class="error-message hidden">Please enter first name</div>
                        </div>
                        
                        <!-- Last Name -->
                        <div>
                            <label for="lname" class="block text-sm font-medium text-gray-700">Last Name</label>
                            <input type="text" id="lname" name="lname" required
                                   class="mt-1 block w-full border border-gray-300 rounded-lg py-2 px-3 shadow-sm focus:outline-none focus:ring-orange-500 focus:border-orange-500">
                            <div id="lname-error" class="error-message hidden">Please enter last name</div>
                        </div>
                    </div>

                    <!-- Email -->
                    <div class="mt-6">
                        <label for="email" class="block text-sm font-medium text-gray-700">Email</label>
                        <div class="mt-1 relative">
                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                <i class="ri-mail-line text-gray-400"></i>
                            </div>
                            <input type="email" id="email" name="email" required
                                   class="pl-10 block w-full border border-gray-300 rounded-lg py-2 px-3 shadow-sm focus:outline-none focus:ring-orange-500 focus:border-orange-500">
                        </div>
                        <div id="email-error" class="error-message hidden">Please enter a valid email address</div>
                    </div>

                    <!-- Phone -->
                    <div class="mt-6">
                        <label for="phone" class="block text-sm font-medium text-gray-700">Phone</label>
                        <div class="mt-1 relative">
                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                <i class="ri-phone-line text-gray-400"></i>
                            </div>
                            <input type="tel" id="phone" name="phone" required
                                   class="pl-10 block w-full border border-gray-300 rounded-lg py-2 px-3 shadow-sm focus:outline-none focus:ring-orange-500 focus:border-orange-500">
                        </div>
                        <div id="phone-error" class="error-message hidden">Please enter phone number</div>
                    </div>

                    <!-- Role -->
                    <div class="mt-6">
                        <label for="userrole" class="block text-sm font-medium text-gray-700">Role</label>
                        <div class="mt-1 relative">
                            <select id="userrole" name="userrole" required
                                    class="block w-full py-3 px-4 border border-gray-300 rounded-lg shadow-sm focus:outline-none focus:ring-orange-500 focus:border-orange-500 bg-white appearance-none">
                                <option value="" disabled selected>Select a role</option>
                                <option value="Customer">Customer</option>
                                <option value="Employee">Employee</option>
                                <option value="Admin">Admin</option>
                            </select>
                            <div class="absolute inset-y-0 right-0 flex items-center pr-3 pointer-events-none">
                                <i class="ri-arrow-down-s-line text-gray-400"></i>
                            </div>
                        </div>
                        <div id="role-error" class="error-message hidden">Please select a role</div>
                        <div id="role-badge" class="mt-3 px-3 py-1 inline-block rounded-full text-white bg-gray-400 text-sm hidden">
                            <span id="role-text"></span>
                        </div>
                    </div>

                    <!-- Password -->
                    <div class="mt-6">
                        <label for="password" class="block text-sm font-medium text-gray-700">Password</label>
                        <div class="mt-1 relative">
                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                <i class="ri-lock-line text-gray-400"></i>
                            </div>
                            <input type="password" id="password" name="password" required
                                   class="pl-10 block w-full border border-gray-300 rounded-lg py-2 px-3 shadow-sm focus:outline-none focus:ring-orange-500 focus:border-orange-500 pr-10"
                                   placeholder="••••••••">
                            <button type="button" id="togglePassword" class="absolute inset-y-0 right-0 pr-3 flex items-center">
                                <i class="ri-eye-line text-gray-400" id="eyeIcon"></i>
                            </button>
                        </div>
                        <div id="password-strength" class="password-strength strength-0 mt-2"></div>
                        <div id="password-error" class="error-message hidden">Password must be at least 8 characters with uppercase, lowercase, number, and special character</div>
                    </div>

                    <!-- Confirm Password -->
                    <div class="mt-6">
                        <label for="confirmPassword" class="block text-sm font-medium text-gray-700">Confirm Password</label>
                        <div class="mt-1 relative">
                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                <i class="ri-lock-line text-gray-400"></i>
                            </div>
                            <input type="password" id="confirmPassword" name="confirmPassword" required
                                   class="pl-10 block w-full border border-gray-300 rounded-lg py-2 px-3 shadow-sm focus:outline-none focus:ring-orange-500 focus:border-orange-500 pr-10"
                                   placeholder="••••••••">
                            <button type="button" id="toggleConfirmPassword" class="absolute inset-y-0 right-0 pr-3 flex items-center">
                                <i class="ri-eye-line text-gray-400" id="eyeConfirmIcon"></i>
                            </button>
                        </div>
                        <div id="confirmPassword-error" class="error-message hidden">Passwords do not match</div>
                    </div>

                    <!-- Submit Button -->
                    <div class="mt-8">
                        <button type="submit" id="submitButton"
                                class="w-full flex justify-center py-3 px-4 border border-transparent rounded-lg shadow-sm text-sm font-medium text-white bg-orange-600 hover:bg-orange-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-orange-500 transition">
                            Create User <i class="ri-arrow-right-line ml-2"></i>
                        </button>
                    </div>
                </form>

                <div class="mt-8 text-center">
                    <p class="text-sm text-gray-600">
                        <a href="user" class="font-medium text-orange-600 hover:text-orange-500">Back to User List</a>
                    </p>
                </div>
            </div>

            <!-- Right Side - Image -->
            <div class="hidden md:block md:w-1/2 auth-bg relative">
                <div class="absolute inset-0 bg-black bg-opacity-40 flex items-center justify-center p-8">
                    <div class="text-white text-center">
                        <i class="ri-steering-2-fill text-5xl mb-4 text-orange-500"></i>
                        <h2 class="text-3xl font-bold mb-4">User Management</h2>
                        <ul class="text-left space-y-3 max-w-md mx-auto">
                            <li class="flex items-center"><i class="ri-checkbox-circle-fill text-orange-400 mr-2"></i>
                                Create and manage system users</li>
                            <li class="flex items-center"><i class="ri-checkbox-circle-fill text-orange-400 mr-2"></i>
                                Set appropriate access levels</li>
                            <li class="flex items-center"><i class="ri-checkbox-circle-fill text-orange-400 mr-2"></i>
                                Track user activity</li>
                            <li class="flex items-center"><i class="ri-checkbox-circle-fill text-orange-400 mr-2"></i>
                                Maintain security standards</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </main>
    
    <%@ include file="footer.jsp"%>

    <script>
        // DOM Elements
        const form = document.getElementById('registerForm');
        const passwordInput = document.getElementById('password');
        const confirmPasswordInput = document.getElementById('confirmPassword');
        const togglePasswordBtn = document.getElementById('togglePassword');
        const toggleConfirmPasswordBtn = document.getElementById('toggleConfirmPassword');
        const eyeIcon = document.getElementById('eyeIcon');
        const eyeConfirmIcon = document.getElementById('eyeConfirmIcon');
        const submitBtn = document.getElementById('submitButton');
        const strengthBar = document.getElementById('password-strength');
        const roleSelect = document.getElementById('userrole');
        const roleBadge = document.getElementById('role-badge');
        const roleText = document.getElementById('role-text');

        // Role Colors
        const roleColors = {
            'Customer': 'bg-orange-500',
            'Employee': 'bg-blue-500',
            'Admin': 'bg-red-500'
        };

        // Toggle Password Visibility
        const togglePasswordVisibility = (input, icon) => {
            const isPassword = input.type === 'password';
            input.type = isPassword ? 'text' : 'password';
            icon.classList.toggle('ri-eye-line', !isPassword);
            icon.classList.toggle('ri-eye-off-line', isPassword);
        };

        // Update Role Badge
        const updateRoleBadge = () => {
            const role = roleSelect.value;
            if (role) {
                roleText.textContent = role;
                roleBadge.className = `mt-3 px-3 py-1 inline-block rounded-full text-white text-sm ${roleColors[role] || 'bg-gray-500'}`;
                roleBadge.classList.remove('hidden');
                document.getElementById('role-error').classList.add('hidden');
            } else {
                roleBadge.classList.add('hidden');
            }
        };

        // Calculate Password Strength
        const calculatePasswordStrength = (password) => {
            let strength = 0;
            if (password.length >= 8) strength++;
            if (/[A-Z]/.test(password)) strength++;
            if (/[a-z]/.test(password)) strength++;
            if (/[0-9]/.test(password)) strength++;
            if (/[^A-Za-z0-9]/.test(password)) strength++;
            return strength;
        };

        // Update Password Strength Indicator
        const updatePasswordStrength = () => {
            const strength = calculatePasswordStrength(passwordInput.value);
            strengthBar.className = `password-strength strength-${strength}`;
        };

        // Validate Form
        const validateForm = () => {
            let isValid = true;
            
            // Reset errors
            document.querySelectorAll('.error-message').forEach(el => {
                el.classList.add('hidden');
            });

            // Validate Role
            if (!roleSelect.value) {
                document.getElementById('role-error').classList.remove('hidden');
                isValid = false;
            }

            // Validate Password
            const password = passwordInput.value;
            if (!/(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^A-Za-z0-9]).{8,}/.test(password)) {
                document.getElementById('password-error').classList.remove('hidden');
                isValid = false;
            }

            // Validate Password Match
            if (password !== confirmPasswordInput.value) {
                document.getElementById('confirmPassword-error').classList.remove('hidden');
                isValid = false;
            }

            return isValid;
        };

        // Form Submission
        form.addEventListener('submit', function(e) {
            e.preventDefault();
            
            if (!validateForm()) return;

            // Set loading state
            submitBtn.disabled = true;
            submitBtn.innerHTML = '<span class="animate-spin">Processing...</span>';

            // Submit form (password will be hashed server-side)
            this.submit();
        });

        // Event Listeners
        togglePasswordBtn.addEventListener('click', () => togglePasswordVisibility(passwordInput, eyeIcon));
        toggleConfirmPasswordBtn.addEventListener('click', () => togglePasswordVisibility(confirmPasswordInput, eyeConfirmIcon));
        passwordInput.addEventListener('input', updatePasswordStrength);
        roleSelect.addEventListener('change', updateRoleBadge);

        // Initialize
        updateRoleBadge();
    </script>
</body>
</html>