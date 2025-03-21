<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="db.jsp" %>  <%-- Include database connection --%>
<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String message = "";

    if (email != null && password != null) {
        try {
            Connection con = getConnection();
            if (con != null) {
                String query = "SELECT * FROM users WHERE email=? AND password=?";
                PreparedStatement ps = con.prepareStatement(query);
                ps.setString(1, email);
                ps.setString(2, password);

                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    session.setAttribute("user", email);
                    response.sendRedirect("home.jsp");
                } else {
                    message = "Invalid email or password!";
                }

                rs.close();
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