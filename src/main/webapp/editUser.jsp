<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit User</title>
</head>
<body>
    <h1>Edit User</h1>
    <form action="user" method="POST">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="id" value="${user.id}">
        <label for="username">Username:</label>
        <input type="text" id="username" name="fname" value="${user.fname}" required>
        <br>
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" value="${user.email}" required>
        <br><br>
        <input type="submit" value="Update User">
    </form>
    <br>
    <a href="user">Back to User List</a>
</body>
</html>
