<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String user = (String) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home - MentorHub</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <nav class="navbar">
        <div class="logo">MentorHub</div>
        <ul class="nav-links">
            <li><a href="home.jsp">Home</a></li>
            <li><a href="mentorprofiles.jsp">Mentors</a></li>
            <li><a href="services.jsp">Services</a></li>
            <li><a href="contact.jsp">Contact</a></li>
            <li><a href="logout.jsp">Logout</a></li>
        </ul>
    </nav>
    <header class="hero">
        <div class="hero-content">
            <h1>Welcome, <%= user %>!</h1>
            <p>Your trusted platform for mentorship and career growth.</p>
            <a href="programs.jsp" class="btn">Explore Programs</a>
        </div>
    </header>
</body>
</html>
