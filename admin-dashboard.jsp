<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.Statement, java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Admin Dashboard - Manage Bookings and Trips</title>
        <!-- <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@400;600&family=Open+Sans:wght@300;400;600&display=swap" rel="stylesheet"> -->
        <!-- Link to the Admin Dashboard CSS -->
        <link rel="stylesheet" href="css/styles.css">
        <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
    
    <!-- Include Leaflet JS -->
    <script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
        <style>
            /* Styles for the custom popup message */
            .popup-message {
                display: none;
                position: fixed;
                top: 20%;
                left: 50%;
                transform: translate(-50%, -50%);
                background-color: #fefefe;
                border: 2px solid #ddd;
                border-radius: 10px;
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
                padding: 20px;
                width: 300px;
                text-align: center;
                font-family: 'Quicksand', sans-serif;
                z-index: 1000;
            }

            .popup-message h3 {
                font-size: 20px;
                color: #444;
                margin-bottom: 10px;
            }

            .popup-message p {
                font-size: 16px;
                color: #666;
                margin-bottom: 15px;
            }

            .popup-close-btn {
                background-color: #ff6666;
                border: none;
                border-radius: 8px;
                color: white;
                font-size: 14px;
                padding: 8px 15px;
                cursor: pointer;
            }

            /* Background overlay for the popup */
            .popup-overlay {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                z-index: 999;
            }
          
        </style>
        <script>
            // Function to show a cute popup message
            function showPopup(title, message) {
                const overlay = document.querySelector('.popup-overlay');
                const popup = document.querySelector('.popup-message');
                popup.querySelector('h3').textContent = title;
                popup.querySelector('p').textContent = message;
                
                overlay.style.display = 'block';
                popup.style.display = 'block';
            }

            // Function to close the popup message
            function closePopup() {
                document.querySelector('.popup-overlay').style.display = 'none';
                document.querySelector('.popup-message').style.display = 'none';
            }

            // Function to check URL parameters for success/error messages
            function checkMessage() {
                const urlParams = new URLSearchParams(window.location.search);
                const message = urlParams.get('message');
                const details = urlParams.get('details');

                if (message === 'success') {
                    showPopup('Yay! 🎉', details || 'Operation was successful! 🥳');
                } else if (message === 'error') {
                    showPopup('Oops! 😢', details || 'An error occurred. Please try again.');
                }
            }

             
        


            // Function to smoothly scroll to the targeted section
            function scrollToSection(sectionId) {
                const targetSection = document.getElementById(sectionId);
                if (targetSection) {
                    targetSection.scrollIntoView({ behavior: 'smooth' });
                }
            }
          // Remove one definition of this function
function confirmDelete(bookingId) {
    const userConfirmation = confirm('Are you sure you want to delete this booking? This action cannot be undone.');
    if (userConfirmation) {
        window.location.href = 'delete-booking.jsp?id=' + bookingId;
    }
}



            // Function to scroll to the top (Navbar)
            function scrollToNavbar() {
                window.scrollTo({ top: 0, behavior: 'smooth' });
            }

            // Call the function on page load
            window.onload = checkMessage;
        </script>
    </head>
    
    <body class="admin-dashboard">

        <!-- Navbar Section -->
        <div class="navbar">
            <h1>Admin Dashboard - Manage Bookings and Trips</h1>
            <div class="navbar-buttons">
                <!-- Navbar buttons -->
                <button onclick="scrollToSection('booking-section')">Booking List</button>
                <button onclick="scrollToSection('trip-section')">Trip List</button> <!-- Logout Button -->
                <form action="logout.jsp" method="POST" style="display: inline;">
                    <button type="submit" class="btn-logout">Logout</button>
                </form>
            </div>
        </div>

        <!-- Booking List Section -->
        <div class="container" id="booking-section">
            <div style="display: flex; align-items: center; justify-content: space-between;">
                <h2>Booking List</h2>
                <a href="create-booking.jsp" class="btn" style="background-color: #2f341e; color: white; border-radius: 50px; padding: 10px 20px; text-decoration: none;">Create New Booking</a>
            </div>
            <table class="styled-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Customer Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Trip ID</th>
                        <th>People</th>
                        <th>Date</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        String dbURL = "jdbc:mysql://localhost:3306/holiday_trip";
                        String dbUser = "root";
                        String dbPass = "";

                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
                            Statement stmt = conn.createStatement();

                            String query = "SELECT * FROM bookings";
                            ResultSet rs = stmt.executeQuery(query);

                            while (rs.next()) {
                    %>
                        <tr>
                            <td><%= rs.getInt("id") %></td>
                            <td><%= rs.getString("customer_name") %></td>
                            <td><%= rs.getString("email") %></td>
                            <td><%= rs.getString("phone") %></td>
                            <td><%= rs.getInt("trip_id") %></td>
                            <td><%= rs.getInt("number_of_people") %></td>
                            <td><%= rs.getDate("booking_date") %></td>
                            <td>
                                <a href="edit-booking.jsp?id=<%= rs.getInt("id") %>" class="btn-secondary" style="padding: 8px 15px; background-color: #77a6b6; color: white; border-radius: 8px; text-decoration: none;">Edit</a>
                                <a href="delete-booking.jsp?id=<%= rs.getInt("id") %>" class="btn-danger" style="padding: 8px 15px; background-color: #D9534F; color: white; border-radius: 8px; text-decoration: none;">Delete</a>

                            </td>
                        </tr>
                    <%
                            }
                            conn.close();
                        } catch (Exception e) {
                            out.println("<h2>Error: " + e.getMessage() + "</h2>");
                        }
                    %>
                </tbody>
            </table>
        </div>
     
        
        <!-- Trip List Section -->
        <div class="container" id="trip-section">
            <div style="display: flex; align-items: center; justify-content: space-between;">
                <h2>Trip List</h2>
                <a href="create-trip.jsp" class="btn-primary" style="background-color: #2f341e; color: white; border-radius: 50px; padding: 10px 20px; text-decoration: none;">Create New Trip</a>
            </div>
            <div class="trip-grid">
                <%
                try {
                    Connection tripConn = DriverManager.getConnection(dbURL, dbUser, dbPass);
                    Statement tripStmt = tripConn.createStatement();

                    String tripQuery = "SELECT * FROM trips";
                    ResultSet tripRs = tripStmt.executeQuery(tripQuery);

                    while (tripRs.next()) {
                %>
                <div class="card">
                    <img src="<%= tripRs.getString("image_url") %>" alt="Trip Image" class="card-img">
                    <div class="card-body">
                        <h3 class="card-title"><%= tripRs.getString("destination") %></h3>
                        <p><strong>Description:</strong> <%= tripRs.getString("description") %></p>
                        <p><strong>Price:</strong> $<%= tripRs.getDouble("price") %></p>
                        <p><strong>Duration:</strong> <%= tripRs.getInt("duration") %> days</p>
                        <p><strong>Category:</strong> <%= tripRs.getString("category") %></p>
                        <a href="edit-trip.jsp?id=<%= tripRs.getInt("id") %>" class="btn-primary">Edit</a>
                        <a href="delete-trip.jsp?id=<%= tripRs.getInt("id") %>" class="btn-danger">Delete</a>
                        
                    </div>
                </div>
                <%
                    }
                    tripConn.close();
                } catch (Exception ex) {
                    out.println("<h2>Error: " + ex.getMessage() + "</h2>");
                }
                %>
                
            </div>
        </div>

        <!-- Popup Overlay for background -->
        <div class="popup-overlay" onclick="closePopup()"></div>

          <!-- Scroll to Top Button -->
          <div class="fab-button" onclick="scrollToNavbar()">↑</div>

        <!-- Popup Message -->
        <div class="popup-message">
            <h3></h3>
            <p></p>
            <button class="popup-close-btn" onclick="closePopup()">Close</button>
        </div>
        
    </body>
</html> 