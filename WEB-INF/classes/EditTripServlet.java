import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class EditTripServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get trip details from the form
        int tripId = Integer.parseInt(request.getParameter("id"));
        String destination = request.getParameter("destination");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        int duration = Integer.parseInt(request.getParameter("duration"));
        String category = request.getParameter("category");
        String imageUrl = request.getParameter("image_url");

        // Database connection variables
        String dbURL = "jdbc:mysql://localhost:3306/holiday_trip";
        String dbUser = "root";
        String dbPass = "";

        // SQL query to update the trip details
        String updateQuery = "UPDATE trips SET destination = ?, description = ?, price = ?, duration = ?, category = ?, image_url = ? WHERE id = ?";

        try {
            // Connect to the database
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            // Prepare the statement
            PreparedStatement stmt = conn.prepareStatement(updateQuery);
            stmt.setString(1, destination);
            stmt.setString(2, description);
            stmt.setDouble(3, price);
            stmt.setInt(4, duration);
            stmt.setString(5, category);
            stmt.setString(6, imageUrl);
            stmt.setInt(7, tripId);

            // Execute the update
            int rowsAffected = stmt.executeUpdate();

            // Redirect to the admin dashboard with a success message in the URL
            if (rowsAffected > 0) {
                response.sendRedirect("admin-dashboard.jsp?message=success&details=Trip%20updated%20successfully!");
            } else {
                response.sendRedirect("admin-dashboard.jsp?message=error&details=Failed to update the trip.");
            }

            // Close the connection
            conn.close();

        } catch (Exception e) {
            // Handle errors and redirect with an error message
            response.sendRedirect("admin-dashboard.jsp?message=error&details=An unexpected error occurred.");
            e.printStackTrace();
        }
    }
}
