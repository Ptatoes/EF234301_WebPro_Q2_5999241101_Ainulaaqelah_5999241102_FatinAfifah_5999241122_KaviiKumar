import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;

public class CreateBookingServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set the response content type
        response.setContentType("text/html;charset=UTF-8");

        // Get the PrintWriter to send data to the client
        PrintWriter out = response.getWriter();

        // Database connection details
        String dbURL = "jdbc:mysql://localhost:3306/holiday_trip";
        String dbUser = "root";
        String dbPass = "";

        // Get data from the request
        try {
            String name = request.getParameter("customer_name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            int tripId = Integer.parseInt(request.getParameter("trip_id"));
            int numberOfPeople = Integer.parseInt(request.getParameter("number_of_people"));

            // Get today's date in format yyyy-MM-dd
            Date today = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String bookingDate = sdf.format(today);

            // Establish connection to the database
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            // Prepare SQL insert statement
            String query = "INSERT INTO bookings (customer_name, email, phone, trip_id, number_of_people, booking_date) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(query);

            // Set values in the prepared statement
            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, phone);
            stmt.setInt(4, tripId);
            stmt.setInt(5, numberOfPeople);
            stmt.setString(6, bookingDate);

            // Execute the update and check if it's successful
            int result = stmt.executeUpdate();

            // Redirect to the admin dashboard with success/failure message
            String redirectURL = "admin-dashboard.jsp"; // Change this to your actual admin dashboard URL
            if (result > 0) {
                // Redirect with success message
                response.sendRedirect(redirectURL + "?message=success&details=Your booking has been confirmed!");
            } else {
                // Redirect with failure message
                response.sendRedirect(redirectURL + "?message=error&details=Booking failed. Please try again later.");
            }

            // Close the database connection
            conn.close();

        } catch (Exception e) {
            // Handle exceptions
            e.printStackTrace();
            String redirectURL = "admin-dashboard.jsp"; // Change this to your actual admin dashboard URL
            response.sendRedirect(redirectURL + "?message=error&details=" + e.getMessage());
        } finally {
            out.close();
        }
    }
}
