import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class EditBookingServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set the response content type
        response.setContentType("text/html;charset=UTF-8");

        // Get the PrintWriter to send data to the client
        PrintWriter out = response.getWriter();

        // Database connection details
        String dbURL = "jdbc:mysql://localhost:3306/holiday_trip";
        String dbUser = "root";
        String dbPass = "";

        // Get data from the form
        try {
            int bookingId = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("customer_name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            int tripId = Integer.parseInt(request.getParameter("trip_id"));
            int numberOfPeople = Integer.parseInt(request.getParameter("number_of_people"));
            String bookingDate = request.getParameter("booking_date"); // Get the new booking date

            // Establish connection to the database
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            // Prepare SQL update statement
            String query = "UPDATE bookings SET customer_name = ?, email = ?, phone = ?, trip_id = ?, number_of_people = ?, booking_date = ? WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(query);

            // Set values in the prepared statement
            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, phone);
            stmt.setInt(4, tripId);
            stmt.setInt(5, numberOfPeople);
            stmt.setString(6, bookingDate); // Set booking_date value
            stmt.setInt(7, bookingId);

            // Execute the update and check if it's successful
            int result = stmt.executeUpdate();

            // Close the database connection
            conn.close();

            // Check the result and redirect to the admin dashboard with a message
            if (result > 0) {
                // Redirect with success message
                response.sendRedirect("admin-dashboard.jsp?message=success&details=Booking%20updated%20successfully!");
            } else {
                // Redirect with failure message
                response.sendRedirect("admin-dashboard.jsp?message=error&details=Update%20failed.%20Please%20try%20again%20later.");
            }

        } catch (Exception e) {
            // Handle exceptions
            e.printStackTrace();
            // Redirect with error message
            response.sendRedirect("admin-dashboard.jsp?message=error&details=Error:%20" + e.getMessage());
        } finally {
            out.close();
        }
    }
}
