<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/style.css">
    <title>Vehicle Rental Dashboard</title>
    <style>
        /* Additional styles for image handling */
        .car-image {
            width: 60px;
            height: 40px;
            object-fit: cover;
            border-radius: 4px;
            margin-right: 10px;
        }
        
        .vehicle-info {
            display: flex;
            align-items: center;
        }
        
        .status {
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 500;
        }
        
        .status.completed {
            background: #d1fae5;
            color: #065f46;
        }
        
        .status.pending {
            background: #fef3c7;
            color: #92400e;
        }
        
        .status.cancelled {
            background: #fee2e2;
            color: #b91c1c;
        }
        
        /* Fallback image styling */
        .img-fallback {
            width: 60px;
            height: 40px;
            background: #f3f4f6;
            border-radius: 4px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 10px;
            color: #6b7280;
            font-size: 20px;
        }
    </style>
</head>

<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <a href="#" class="logo">
            <i class='bx bx-code-alt'></i>
            <div class="logo-name"><span>VEHICLE RENTAL</span></div>
        </a>
        <ul class="side-menu">
            <li><a href="${pageContext.request.contextPath}/dashboard"><i class='bx bxs-dashboard'></i>Dashboard</a></li>
            <li><a href="${pageContext.request.contextPath}/LHomePage.jsp"><i class='bx bx-store-alt'></i>Shop</a></li>
            <li class="active"><a href="${pageContext.request.contextPath}/dashboard"><i class='bx bx-analyse'></i>Analytics</a></li>
            <li><a href="#"><i class='bx bx-message-square-dots'></i>Tickets</a></li>
            <li><a href="#"><i class='bx bx-group'></i>Users</a></li>
            <li><a href="#"><i class='bx bx-cog'></i>Settings</a></li>
        </ul>
        <ul class="side-menu">
            <li>
                <a href="${pageContext.request.contextPath}/login?action=logout" class="logout">
                    <i class='bx bx-log-out-circle'></i>
                    Logout
                </a>
            </li>
        </ul>
    </div>
    <!-- End of Sidebar -->

    <!-- Main Content -->
    <div class="content">
        <!-- Navbar -->
        <nav>
            <i class='bx bx-menu'></i>
            <form action="#" method="get">
                <div class="form-input">
                    <input type="search" placeholder="Search...">
                    <button class="search-btn" type="submit"><i class='bx bx-search'></i></button>
                </div>
            </form>
            <input type="checkbox" id="theme-toggle" hidden>
            <label for="theme-toggle" class="theme-toggle"></label>
            <a href="#" class="notif">
                <i class='bx bx-bell'></i>
                <span class="count">12</span>
            </a>
            <a href="#" class="profile">
                <img src="${pageContext.request.contextPath}/images/logo.png" alt="Profile" onerror="this.onerror=null;this.src='https://via.placeholder.com/40?text=U'">
                <span>${sessionScope.fullName}</span>
            </a>
        </nav>
        <!-- End of Navbar -->

        <main>
            <div class="header">
                <div class="left">
                    <h1>Dashboard</h1>
                    <ul class="breadcrumb">
                        <li><a href="#">Analytics</a></li>
                        <li>/</li>
                        <li><a href="#" class="active">Shop</a></li>
                    </ul>
                </div>
                <a href="#" class="report">
                    <i class='bx bx-cloud-download'></i>
                    <span>Download CSV</span>
                </a>
            </div>

            <!-- Insights -->
            <ul class="insights">
                <li>
                    <i class='bx bx-calendar-check'></i>
                    <span class="info">
                        <h3>
                            <c:choose>
                                <c:when test="${sessionScope.isAdmin}">${fn:length(payments)}</c:when>
                                <c:when test="${not empty sessionScope.lastPayment}">#${sessionScope.lastPayment.id}</c:when>
                                <c:otherwise>No payments</c:otherwise>
                            </c:choose>
                        </h3>
                        <p><c:if test="${sessionScope.isAdmin}">Total Orders</c:if><c:if test="${not sessionScope.isAdmin}">Last Payment</c:if></p>
                    </span>
                </li>
                <li>
                    <i class='bx bx-show-alt'></i>
                    <span class="info">
                        <h3>${fn:length(payments)}</h3>
                        <p><c:if test="${sessionScope.isAdmin}">Completed Orders</c:if><c:if test="${not sessionScope.isAdmin}">Your Orders</c:if></p>
                    </span>
                </li>
                <li>
                    <i class='bx bx-line-chart'></i>
                    <span class="info">
                        <h3>
                            <c:choose>
                                <c:when test="${sessionScope.isAdmin}">${userService.getActiveUserCount()}</c:when>
                                <c:when test="${not empty payments}">${payments[0].car}</c:when>
                                <c:otherwise>No vehicle</c:otherwise>
                            </c:choose>
                        </h3>
                        <p><c:if test="${sessionScope.isAdmin}">Active Users</c:if><c:if test="${not sessionScope.isAdmin}">Recent Vehicle</c:if></p>
                    </span>
                </li>
                <li>
                    <i class='bx bx-dollar-circle'></i>
                    <span class="info">
                        <h3>$<fmt:formatNumber value="${sessionScope.totalAmount}" pattern="#,##0.00"/></h3>
                        <p><c:if test="${sessionScope.isAdmin}">Total Revenue</c:if><c:if test="${not sessionScope.isAdmin}">Total Spent</c:if></p>
                    </span>
                </li>
            </ul>
            <!-- End of Insights -->

            <div class="bottom-data">
                <div class="orders">
                    <div class="header">
                        <i class='bx bx-receipt'></i><h3>Recent Orders</h3><i class='bx bx-filter'></i><i class='bx bx-search'></i>
                    </div>
                    <table>
                        <thead>
                            <tr><c:if test="${sessionScope.isAdmin}"><th>User</th></c:if><th>Vehicle</th><th>Order Date</th><th>Amount</th><th>Status</th></tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${not empty payments}">
                                    <c:forEach items="${payments}" var="payment" begin="0" end="3">
                                        <tr>
                                            <c:if test="${sessionScope.isAdmin}"><td>${payment.email}</td></c:if>
                                            <td>
                                                <div class="vehicle-info">
                                                    <c:choose>
                                                        <c:when test="${not empty payment.fileName}">
                                                            <img src="${pageContext.request.contextPath}/images/cars/${payment.fileName}" 
                                                                 alt="${payment.car}" 
                                                                 class="car-image"
                                                                 onerror="this.onerror=null;this.parentElement.innerHTML='<div class=\'img-fallback\'><i class=\'bx bx-car\'></i></div><p>${payment.car}</p>'">
                                                        </c:when>
                                                        <c:otherwise>
                                                            <div class="img-fallback"><i class='bx bx-car'></i></div>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <p>${payment.car}</p>
                                                </div>
                                            </td>
                                            <td>${fn:replace(fn:substring(payment.bookingTime.toString(),0,16),'T',' ')}</td>
                                            <td>$<fmt:formatNumber value="${payment.amount}" pattern="#,##0.00"/></td>
                                            <td><span class="status ${fn:toLowerCase(payment.status)}">${payment.status}</span></td>
                                        </tr>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr><td colspan="${sessionScope.isAdmin ? 5 : 4}" style="text-align:center;">No orders found</td></tr>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                </div>
            </div>
        </main>
    </div>

    <script src="${pageContext.request.contextPath}/admin/js/index.js"></script>
    <script>
        // Enhanced image error handling
        document.addEventListener('DOMContentLoaded', function() {
            document.querySelectorAll('.car-image').forEach(img => {
                img.onerror = function() {
                    this.style.display = 'none';
                    const fallback = document.createElement('div');
                    fallback.className = 'img-fallback';
                    const icon = document.createElement('i');
                    icon.className = 'bx bx-car';
                    fallback.appendChild(icon);
                    this.parentNode.insertBefore(fallback, this.nextSibling);
                };
            });
        });
    </script>
</body>
</html>