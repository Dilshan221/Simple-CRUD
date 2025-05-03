<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Details</title>
</head>
<body>
    <h1>User Details</h1>
    <table>
        <tr>
            <td><strong>ID:</strong></td>
            <td>${user.id}</td>
        </tr>
        <tr>
            <td><strong>Username:</strong></td>
            <td>${user.username}</td>
        </tr>
        <tr>
            <td><strong>Email:</strong></td>
            <td>${user.email}</td>
        </tr>
    </table>
    <br>
    <a href="user">Back to User List</a>
</body>
</html>
