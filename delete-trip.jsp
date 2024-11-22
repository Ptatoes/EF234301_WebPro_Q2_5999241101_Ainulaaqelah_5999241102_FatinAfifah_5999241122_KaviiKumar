<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Trip - Admin</title>
    <style>
        /* Modern forest nature theme with image background */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            height: 100%;
            background-image: url('https://plus.unsplash.com/premium_photo-1688655246851-1d2dadffd92f?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8dHJhdmVsJTIwbGFuZHNjYXBlfGVufDB8fDB8fHww');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            color: #fff;
        }

        .overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(165, 200, 165, 0.4);
            z-index: 1;
            pointer-events: none;
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
            text-align: center;
        }

        h2 {
            color: #ffffff;
            font-size: 18px;
            margin-bottom: 20px;
        }

        .btn {
            background-color: #2e8b57;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 600;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #238b45;
        }

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

  

    <div class="container">
        <%
            String dbURL = "jdbc:mysql://localhost:3306/holiday_trip";
            String dbUser = "root";
            String dbPass = "";

            try {
                // Get the Trip ID from the URL parameters and validate it
                int tripId = Integer.parseInt(request.getParameter("id"));
                
                // Database operation
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
                
                String sql = "DELETE FROM trips WHERE id=?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setInt(1, tripId);
                
                int result = stmt.executeUpdate();
                
                conn.close();
                
                if (result > 0) {
                    // Redirect to the admin dashboard on successful deletion
                    response.sendRedirect("admin-dashboard.jsp");
                } else {
                    out.println("<h2>Failed to delete trip. Please try again.</h2>");
                }
                
            } catch (NumberFormatException e) {
                // Handle invalid Trip ID format
                out.println("<h2>Error: Invalid Trip ID format.</h2>");
                out.println("<a href='admin-dashboard.jsp' class='back-btn'>Back to Dashboard</a>");
            } catch (Exception e) {
                // Display detailed error message for debugging purposes
                out.println("<h2>Error: Unable to delete trip</h2>");
                out.println("<h2>The trip has booking under it</h2>");

              
            }
        %>

        <form action="admin-dashboard.jsp" method="get">
            <button type="submit" class="back-btn">Back to Dashboard</button>
        </form>
    </div>
</body>
</html>
