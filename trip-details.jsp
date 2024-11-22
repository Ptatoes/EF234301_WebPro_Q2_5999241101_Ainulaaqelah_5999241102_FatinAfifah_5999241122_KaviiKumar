<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />

<!-- Trip Detail Section with Black and Orange Theme -->
<div class="container" style="margin-top: 150px; background: white; padding: 40px; border-radius: 15px; box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);">
    <div class="row">
        <div class="col-md-12">
            <%
                String dbURL = "jdbc:mysql://localhost:3306/holiday_trip";
                String dbUser = "root";
                String dbPass = "";
                int tripId = Integer.parseInt(request.getParameter("id"));
                
                Class.forName("com.mysql.cj.jdbc.Driver");
                java.sql.Connection conn = java.sql.DriverManager.getConnection(dbURL, dbUser, dbPass);
                java.sql.PreparedStatement stmt = conn.prepareStatement("SELECT * FROM trips WHERE id = ?");
                stmt.setInt(1, tripId);
                java.sql.ResultSet rs = stmt.executeQuery();
                
                if (rs.next()) {
            %>
            <h2 style="font-size: 2.5em; color: #2e7d32; margin-bottom: 20px; font-weight: bold; text-transform: uppercase;"><%= rs.getString("destination") %></h2>
            <img src="<%= rs.getString("image_url") %>" alt="<%= rs.getString("destination") %>" class="img-fluid" style="width: 100%; height: auto; object-fit: cover; border-radius: 10px;">

            <p style="font-size: 1.2em; color: #333; margin-top: 20px; font-weight: 400; line-height: 1.8;">
                <%= rs.getString("description") %>
            </p>

            <!-- Price and Duration Section -->
            <div style="margin-top: 30px; font-size: 1.5em; font-weight: 600;">
                <p style="color: #e07b00; margin-bottom: 15px; font-size: 1.0em;">Price: <span style="font-size: 2.2em; color: #2e7d32; font-weight: bold;">$<%= rs.getDouble("price") %></span></p>
                <p style="color: #e07b00; margin-bottom: 15px; font-size: 1.0em;">Duration: <span style="color: #2e7d32; font-weight: bold; font-size: 2em;"><%= rs.getInt("duration") %> days</span></p>
            </div>

            <a href="booking-form.jsp?tripId=<%= rs.getInt("id") %>" class="btn" style="background-color: #2e7d32; color: white; font-size: 1.3em; padding: 12px 30px; border-radius: 30px; transition: background-color 0.3s ease; margin-top: 20px;">
                Book Now
            </a>
        <%
            }
            conn.close();
        %>
        </div>
    </div>
</div>

<!-- Customer Reviews Section with Hover Effects and Black Background -->
<div class="customer-reviews" style="padding: 60px 20px; background: linear-gradient(135deg, #e0f7da, #b3e5fc); text-align: center; margin-top: 80px; border-radius: 15px;">
    <h2 style="font-size: 2.8em; color: #2e7d32; margin-bottom: 40px;">Customer Reviews</h2>
    <div class="row">
        <div class="col-md-4">
            <div class="review-card" style="background-color: #ffffff; border-radius: 15px; box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1); margin-bottom: 30px; padding: 20px; transition: transform 0.3s ease, box-shadow 0.3s ease; cursor: pointer;">
                <p style="font-size: 1.2em; color: #333;">"RANI Travel made my trip unforgettable! The planning was seamless and the destinations were breathtaking."</p>
                <h4 style="color: #2e7d32;">Sarah L.</h4>
            </div>
        </div>
        <div class="col-md-4">
            <div class="review-card" style="background-color: #ffffff; border-radius: 15px; box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1); margin-bottom: 30px; padding: 20px; transition: transform 0.3s ease, box-shadow 0.3s ease; cursor: pointer;">
                <p style="font-size: 1.2em; color: #333;">"The trip was amazing! Highly recommend RANI Travel for anyone looking to explore new places."</p>
                <h4 style="color: #2e7d32;">James T.</h4>
            </div>
        </div>
        <div class="col-md-4">
            <div class="review-card" style="background-color: #ffffff; border-radius: 15px; box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1); margin-bottom: 30px; padding: 20px; transition: transform 0.3s ease, box-shadow 0.3s ease; cursor: pointer;">
                <p style="font-size: 1.2em; color: #333;">"A wonderful experience from start to finish. The attention to detail made all the difference!"</p>
                <h4 style="color: #2e7d32;">Anna W.</h4>
            </div>
        </div>
    </div>
</div>

<!-- Footer Section -->
<jsp:include page="footer.jsp" />

<style>
    /* General Styles */
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background: linear-gradient(to bottom, #e0f7da, #4f806a); /* Light gradient for background */
        background-size: cover;
        position: relative;
        min-height: 100vh;
    }

    /* Blurred Background Layer */
    body::before {
        content: "";
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: inherit;
        filter: blur(8px);
        z-index: -1;
    }

    /* Main content style */
    .container, .customer-reviews {
        position: relative;
        z-index: 1;
    }

    /* Review Card Hover Effect */
    .review-card:hover {
        transform: translateY(-10px);
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
    }

    .btn {
        transition: background-color 0.3s ease;
    }

    .btn:hover {
        background-color: #e07b00;
    }
</style>
