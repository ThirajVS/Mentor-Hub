<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="db.jsp" %>  <%-- Include database connection --%>
<%
    String fullName = request.getParameter("fullname");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String message = "";

    if (fullName != null && email != null && password != null) {
        try {
            Connection con = getConnection();
            if (con != null) {
                String query = "INSERT INTO users (full_name, email, password) VALUES (?, ?, ?)";
                PreparedStatement ps = con.prepareStatement(query);
                ps.setString(1, fullName);
                ps.setString(2, email);
                ps.setString(3, password);

                int rowsInserted = ps.executeUpdate();
                if (rowsInserted > 0) {
                    message = "Registration successful! <a href='login.jsp'>Login here</a>";
                } else {
                    message = "Registration failed. Please try again.";
                }
                ps.close();
                con.close();
            } else {
                message = "Database connection failed!";
            }
        } catch (Exception e) {
            message = "Error: " + e.getMessage();
        }
    }
%>
