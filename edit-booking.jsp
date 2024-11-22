<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Booking - Admin</title>
    <style>
        /* Embedded CSS for modern forest nature theme with image background */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            height: 100%;
            background-image: url('https://plus.unsplash.com/premium_photo-1688655246851-1d2dadffd92f?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8dHJhdmVsJTIwbGFuZHNjYXBlfGVufDB8fDB8fHwwhttps://plus.unsplash.com/premium_photo-1676139292859-26b94000daf4?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fGJlYXV0aWZ1bCUyMGxhbmRzY2FwZXxlbnwwfHwwfHx8MA%3D%3D');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            color: #fff;
        }

        .overlay {
            position: fixed; /* Changed to fixed to cover the entire viewport */
             top: 0;
            left: 0;
            width: 100%;
             height: 100%;
            background: rgba(165, 200, 165, 0.4);
            z-index: 1;
             pointer-events: none; /* Ensures it doesn’t block interaction with other content */
        }

        .navbar {
            background-color: rgb(16, 49, 16);
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #ffffff;
            z-index: 2;
        }

        .navbar h1 {
            font-size: 28px;
            margin: 0;
            font-weight: 600;
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
            background-color: rgba(0, 0, 0, 0.6);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.3);
            z-index: 2;
            position: relative;
        }

        label {
            display: block;
            margin-bottom: 10px;
            font-weight: 600;
            font-size: 14px;
        }

        input[type="text"],
        input[type="email"],
        input[type="number"],
        input[type="date"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: none;
            border-radius: 5px;
            font-size: 14px;
            color: #333;
            background-color: #f1f1f1;
        }

        input[type="text"]:focus,
        input[type="email"]:focus,
        input[type="number"]:focus,
        input[type="date"]:focus {
            outline: none;
            border: 2px solid #4CAF50;
        }

        select {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: none;
            border-radius: 5px;
            font-size: 14px;
            color: #333;
            background-color: #f1f1f1;
        }

        select:focus {
            outline: none;
            border: 2px solid #4CAF50;
        }

        .btn {
            background-color: #2e8b57;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
            font-weight: 600;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #238b45;
        }

        /* Back button styles */
        .back-btn {
            background-color: #8B4513;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            width: auto;
            font-weight: 600;
            transition: background-color 0.3s ease;
            margin-top: 20px;
        }

        .back-btn:hover {
            background-color: #6f3628;
        }

        .back-btn-container {
            text-align: left;
        }

        @media (max-width: 600px) {
            .container {
                padding: 20px;
                margin: 20px;
            }

            .navbar h1 {
                font-size: 24px;
            }
        }
    </style>
</head>
<body>
    <div class="overlay"></div>

    <div class="navbar">
        <h1>Edit Booking</h1>
    </div>

    <div class="container">
        <!-- Form to edit booking -->
        <form action="EditBookingServlet" method="post">
            <% 
                String dbURL = "jdbc:mysql://localhost:3306/holiday_trip";
                String dbUser = "root";
                String dbPass = "";
                int bookingId = Integer.parseInt(request.getParameter("id"));
                
                Connection conn = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
                    
                    // Query to retrieve booking details based on the bookingId
                    String query = "SELECT * FROM bookings WHERE id=?";
                    stmt = conn.prepareStatement(query);
                    stmt.setInt(1, bookingId);
                    
                    rs = stmt.executeQuery();
                    
                    if (rs.next()) {
            %>
            <input type="hidden" name="id" value="<%= bookingId %>">
            
            <label for="customer_name">Customer Name:</label>
            <input type="text" id="customer_name" name="customer_name" value="<%= rs.getString("customer_name") %>" required><br>
            
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="<%= rs.getString("email") %>" required><br>
            
            <label for="phone">Phone:</label>
            <input type="text" id="phone" name="phone" value="<%= rs.getString("phone") %>" required><br>
            
            <label for="trip_id">Trip ID:</label>
            <select id="trip_id" name="trip_id" required>
                <%
                    // Reuse existing database connection to fetch trip IDs
                    query = "SELECT id FROM trips";
                    stmt = conn.prepareStatement(query);
                    ResultSet tripRs = stmt.executeQuery();

                    while (tripRs.next()) {
                        int tripId = tripRs.getInt("id");
                %>
                        <option value="<%= tripId %>">Trip ID: <%= tripId %></option>
                <%
                    }
                    tripRs.close();
                %>
            </select><br>
            
            <label for="number_of_people">Number of People:</label>
            <input type="number" id="number_of_people" name="number_of_people" value="<%= rs.getInt("number_of_people") %>" required><br>

            <label for="booking_date">Booking Date:</label>
            <input type="date" id="booking_date" name="booking_date" value="<%= rs.getDate("booking_date") != null ? rs.getDate("booking_date").toLocalDate() : "" %>" required><br>

            <button type="submit" class="btn">Update Booking</button>
            
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("<h2>Error: " + e.getMessage() + "</h2>");
                } finally {
                    // Cleanup resources
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                }
            %>
        </form>
        
        <!-- Back to Admin Dashboard button below the form -->
        <div class="back-btn-container">
            <button class="back-btn" onclick="window.location.href='admin-dashboard.jsp'">Back to Dashboard</button>
        </div>
    </div>
</body>
</html>
