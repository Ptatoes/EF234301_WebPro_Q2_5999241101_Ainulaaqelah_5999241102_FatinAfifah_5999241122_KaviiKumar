<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Booking - Admin</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
    <div class="container">
        <%
            String dbURL = "jdbc:mysql://localhost:3306/holiday_trip";
            String dbUser = "root";
            String dbPass = "";

            // Retrieve booking ID from request parameter
            String bookingIdParam = request.getParameter("id");
            if (bookingIdParam == null || bookingIdParam.isEmpty()) {
                out.println("<h2>Invalid booking ID. Please try again.</h2>");
                return;
            }

            int bookingId = -1;
            try {
                bookingId = Integer.parseInt(bookingIdParam); // Try to parse the booking ID
            } catch (NumberFormatException e) {
                out.println("<h2>Invalid booking ID format. Please try again.</h2>");
                return;
            }

            try {
                // Establish database connection
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

                // Prepare and execute the DELETE SQL statement
                String sql = "DELETE FROM bookings WHERE id=?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setInt(1, bookingId);

                int result = stmt.executeUpdate();

                if (result > 0) {
                    // If deletion was successful, redirect to the admin dashboard or booking list
                    response.sendRedirect("admin-dashboard.jsp");  // Or "booking-list.jsp"
                } else {
                    out.println("<h2>Failed to delete booking. Please try again.</h2>");
                }
                conn.close();
            } catch (Exception e) {
                // Handle any exceptions (e.g., database issues)
                out.println("<h2>Error: " + e.getMessage() + "</h2>");
            }
        %>
    </div>
</body>
</html>
