import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set response content type
        response.setContentType("text/html;charset=UTF-8");

        // Get PrintWriter to write response data
        PrintWriter out = response.getWriter();

        // Database connection details
        String dbURL = "jdbc:mysql://localhost:3306/holiday_trip";
        String dbUser = "root";
        String dbPass = "";

        // Retrieve form data
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = "customer";  // Default role for registered users

        // Perform database operation
        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection to the database
            Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            // SQL query to insert user data
            String sql = "INSERT INTO user (username, password, role) VALUES (?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            
            // Set the parameters
            stmt.setString(1, username);
            stmt.setString(2, password);
            stmt.setString(3, role);

            // Execute the insert statement
            int result = stmt.executeUpdate();

            // Display the result
            if (result > 0) {
                out.println("<html><body><h2>Registration successful! You can <a href='login.jsp'>login here</a>.</h2></body></html>");
            } else {
                out.println("<html><body><h2>Registration failed. Please try again.</h2></body></html>");
            }

            // Close the connection
            conn.close();

        } catch (Exception e) {
            // Handle exceptions
            e.printStackTrace();
            out.println("<html><body><h2>Error: " + e.getMessage() + "</h2></body></html>");
        } finally {
            out.close();
        }
    }
}
