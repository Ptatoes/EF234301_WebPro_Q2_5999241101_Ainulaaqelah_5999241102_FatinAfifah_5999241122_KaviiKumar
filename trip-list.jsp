<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.Statement, java.sql.ResultSet" %>
<jsp:include page="header.jsp" />

<style>
    /* General Reset */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Arial', sans-serif;
        background: linear-gradient(to bottom, #e0f7da, #4f806a); /* Light gradient for background */
        color: #1c1c1c;
        line-height: 1.6;
        display: flex;
        flex-direction: column;
        min-height: 100vh;
    }

    h2, p {
        margin: 0;
    }

    /* Main Container for Trip List */
    .main-container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 50px 20px;
        background: transparent; /* White background for main content area */
        border-radius: 15px;
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1); /* Soft shadow */
        flex: 1;
    }

    /* Section for Trip List */
    .trip-section {
        margin-bottom: 50px;
    }

    /* Title of the Trip Section */
    .trip-section-header {
        margin-top: 80px;
        text-align: center;
        margin-bottom: 30px;
    }

    .trip-section-header h2 {
        font-size: 42px;
        color: #2e7d32; /* Darker green for headers */
        font-weight: bold;
        margin-bottom: 10px;
    }

    .trip-section-header p {
        font-size: 20px;
        color: #1b5e20; /* Slightly darker shade for description */
    }

    /* Grid Layout for Trip Cards */
    .trip-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
        gap: 30px;
    }

    /* Styling for Individual Trip Card */
    .card {
        background: #f9f9f9; /* Light background for cards */
        border-radius: 15px;
        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        overflow: hidden;
    }

    .card:hover {
        transform: translateY(-10px);
        box-shadow: 0 12px 24px rgba(0, 0, 0, 0.2);
    }

    .card-img {
        width: 100%;
        height: 200px;
        object-fit: cover;
        border-bottom: 4px solid #2e7d32; /* Accent border for emphasis */
    }

    .card-body {
        padding: 20px;
    }

    .card-title {
        font-size: 26px;
        color: #2e7d32; /* Darker green for titles */
        margin-bottom: 10px;
        font-weight: bold;
    }

    .card-text {
        font-size: 16px;
        color: #333333; /* Dark gray for regular text */
        margin-bottom: 15px;
    }

    .btn-primary {
        background-color: #1b5e20; /* Dark green button */
        color: #ffffff;
        padding: 10px 20px;
        text-decoration: none;
        border-radius: 10px;
        font-weight: bold;
        transition: background-color 0.3s ease;
        display: inline-block;
        text-align: center;
    }

    .btn-primary:hover {
        background-color: #145a32; /* Slightly darker green on hover */
    }

    /* Scroll to Top Button */
    .fab-button {
        position: fixed;
        bottom: 80px;
        right: 30px;
        background-color: #2e7d32; /* Green floating button */
        color: #ffffff;
        padding: 15px;
        border-radius: 50%;
        font-size: 20px;
        cursor: pointer;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        z-index: 1000;
        transition: background-color 0.3s ease;
    }

    .fab-button:hover {
        background-color: #1b5e20; /* Darker green */
    }

    /* Footer Styling */
    footer {
        background-color: #2e7d32; /* Darker footer background */
        color: #ffffff; /* White text */
        text-align: center;
        padding: 30px 0;
        width: 100%;
        box-shadow: 0 -4px 8px rgba(0, 0, 0, 0.2);
        position: relative;
        margin-top: auto;
    }
</style>

<!-- Main Content Section -->
<div class="main-container">
    <!-- Trip List Section -->
    <section class="trip-section">
        <div class="trip-section-header">
            <h2>Explore Our Exciting Trips</h2>
            <p>Discover the best destinations for your next holiday adventure.</p>
        </div>

        <!-- Trip Cards Grid -->
        <div class="trip-grid">
            <%
            String dbURL = "jdbc:mysql://localhost:3306/holiday_trip";
            String dbUser = "root";
            String dbPass = "";

            Connection tripConn = null;
            Statement tripStmt = null;
            ResultSet tripRs = null;

            try {
                // Initialize the connection
                tripConn = DriverManager.getConnection(dbURL, dbUser, dbPass);
                tripStmt = tripConn.createStatement();
                String tripQuery = "SELECT * FROM trips";
                tripRs = tripStmt.executeQuery(tripQuery);

                // Fetch trip data and generate trip cards
                while (tripRs.next()) {
            %>
            <div class="card">
                <img src="<%= tripRs.getString("image_url") %>" alt="Trip Image" class="card-img">
                <div class="card-body">
                    <h3 class="card-title"><%= tripRs.getString("destination") %></h3>
                    <p class="card-text"><strong>Description:</strong> <%= tripRs.getString("description") %></p>
                    <p class="card-text"><strong>Price:</strong> $<%= tripRs.getDouble("price") %></p>
                    <p class="card-text"><strong>Duration:</strong> <%= tripRs.getInt("duration") %> days</p>
                    <p class="card-text"><strong>Category:</strong> <%= tripRs.getString("category") %></p>
                    <a href="trip-details.jsp?id=<%= tripRs.getInt("id") %>" class="btn-primary">View Details</a>
                </div>
            </div>
            <%
                }
            } catch (Exception ex) {
                out.println("<h2>Error: " + ex.getMessage() + "</h2>");
            } finally {
                try {
                    // Close resources
                    if (tripRs != null) tripRs.close();
                    if (tripStmt != null) tripStmt.close();
                    if (tripConn != null) tripConn.close();
                } catch (Exception ex) {
                    out.println("<h2>Error closing resources: " + ex.getMessage() + "</h2>");
                }
            }
            %>
        </div>
    </section>
</div>

<jsp:include page="footer.jsp" />
