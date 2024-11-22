import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CreateTripServlet")
public class CreateTripServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/holiday_trip";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String tripIdParam = request.getParameter("id");

        // Check if the `id` is not null or empty for updating the trip
        if (tripIdParam != null && !tripIdParam.isEmpty()) {
            // Update trip if ID is provided
            updateTrip(request, response, tripIdParam);
        } else {
            // Otherwise, create a new trip
            createTrip(request, response);
        }
    }

    private void createTrip(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String destination = request.getParameter("destination");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        int duration = Integer.parseInt(request.getParameter("duration"));
        String category = request.getParameter("category");
        String imageUrl = request.getParameter("image_url");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);

            String sql = "INSERT INTO trips (destination, description, price, duration, category, image_url) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, destination);
            stmt.setString(2, description);
            stmt.setDouble(3, price);
            stmt.setInt(4, duration);
            stmt.setString(5, category);
            stmt.setString(6, imageUrl);

            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                // Redirect with success message
                response.sendRedirect("admin-dashboard.jsp?message=success&details=Trip successfully created!");
            } else {
                // Redirect with failure message
                response.sendRedirect("admin-dashboard.jsp?message=error&details=Failed to create trip.");
            }

            conn.close();
        } catch (Exception e) {
            // Redirect with error message
            response.sendRedirect("admin-dashboard.jsp?message=error&details=" + e.getMessage());
        }
    }

    private void updateTrip(HttpServletRequest request, HttpServletResponse response, String tripId) throws IOException {
        String destination = request.getParameter("destination");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        int duration = Integer.parseInt(request.getParameter("duration"));
        String category = request.getParameter("category");
        String imageUrl = request.getParameter("image_url");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);

            String sql = "UPDATE trips SET destination=?, description=?, price=?, duration=?, category=?, image_url=? WHERE id=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, destination);
            stmt.setString(2, description);
            stmt.setDouble(3, price);
            stmt.setInt(4, duration);
            stmt.setString(5, category);
            stmt.setString(6, imageUrl);
            stmt.setInt(7, Integer.parseInt(tripId));

            int rowsUpdated = stmt.executeUpdate();
            if (rowsUpdated > 0) {
                // Redirect with success message
                response.sendRedirect("admin-dashboard.jsp?message=success&details=Trip successfully updated!");
            } else {
                // Redirect with failure message
                response.sendRedirect("admin-dashboard.jsp?message=error&details=Trip not found or update failed.");
            }

            conn.close();
        } catch (Exception e) {
            // Redirect with error message
            response.sendRedirect("admin-dashboard.jsp?message=error&details=" + e.getMessage());
        }
    }
}
