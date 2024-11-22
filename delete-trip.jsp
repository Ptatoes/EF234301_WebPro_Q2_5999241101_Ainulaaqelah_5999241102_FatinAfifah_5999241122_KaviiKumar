<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Trip - Admin</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
    <div class="container">
        <%
            String dbURL = "jdbc:mysql://localhost:3306/holiday_trip";
            String dbUser = "root";
            String dbPass = "";

            try {
                // Get the Trip ID from the URL parameters and validate it
                int tripId = Integer.parseInt(request.getParameter("id"));
                
                // Database operation
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
                
                String sql = "DELETE FROM trips WHERE id=?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setInt(1, tripId);
                
                int result = stmt.executeUpdate();
                
                conn.close();
                
                if (result > 0) {
                    // Redirect to the admin dashboard on successful deletion
                    response.sendRedirect("admin-dashboard.jsp");
                } else {
                    out.println("<h2>Failed to delete trip. Please try again.</h2>");
                }
                
            } catch (NumberFormatException e) {
                // Handle invalid Trip ID format
                out.println("<h2>Error: Invalid Trip ID format.</h2>");
                out.println("<a href='admin-dashboard.jsp' class='btn'>Back to Dashboard</a>");
            } catch (Exception e) {
                // Display detailed error message for debugging purposes
                out.println("<h2>Error: Unable to delete trip.</h2>");
                out.println("<p>Details: " + e.getMessage() + "</p>");
                out.println("<a href='admin-dashboard.jsp' class='btn'>Back to Dashboard</a>");
            }
        %>
    </div>
</body>
</html>
