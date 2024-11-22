<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Booking - Admin</title>
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
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(165, 200, 165, 0.4);
            z-index: 1;
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
        input[type="number"] {
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
        input[type="number"]:focus {
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

        /* New styles for Back button */
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
        <h1>Create New Booking</h1>
    </div>

    <div class="container">
        <!-- Form submission to CreateBookingServlet -->
        <form action="CreateBookingServlet" method="post">

            <label for="customer_name">Customer Name:</label>
            <input type="text" id="customer_name" name="customer_name" required>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>

            <label for="trip_id">Trip ID:</label>
            <select id="trip_id" name="trip_id" required>
                <%
                    // Database connection details
                    String dbUrl = "jdbc:mysql://localhost:3306/holiday_trip";
                    String dbUser = "root";
                    String dbPass = "";
                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;

                    try {
                        // Establishing the connection to the database
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
                        stmt = conn.createStatement();
                        String query = "SELECT id FROM trips"; // Adjust the query if needed
                        rs = stmt.executeQuery(query);

                        // Iterating over the result set and generating options for the dropdown
                        while (rs.next()) {
                            int tripId = rs.getInt("id");
                %>
                            <option value="<%= tripId %>">Trip ID: <%= tripId %></option>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                        out.println("<p>Error: " + e.getMessage() + "</p>");
                    } finally {
                        try {
                            if (rs != null) rs.close();
                            if (stmt != null) stmt.close();
                            if (conn != null) conn.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                %>
            </select>

            <label for="phone">Phone:</label>
            <input type="text" id="phone" name="phone" required>

            <label for="number_of_people">Number of People:</label>
            <input type="number" id="number_of_people" name="number_of_people" required>

            <button type="submit" class="btn">Create Booking</button>
        </form>

        <!-- Back button to Admin Dashboard -->
        <div class="back-btn-container">
            <a href="admin-dashboard.jsp"><button class="back-btn">Back to Dashboard</button></a>
        </div>
    </div>
</body>
</html>
