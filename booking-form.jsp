<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />

<!-- Booking Form Section with Consistent Theme -->
<div class="container" style="margin-top: 150px; background: #ffffff; padding: 40px; border-radius: 15px; box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);">
    <div class="row">
        <div class="col-md-12">
            <h2 style="font-size: 2.5em; color: #2e7d32; margin-bottom: 20px; font-weight: bold; text-transform: uppercase;">Book Your Trip</h2>
            <form action="${pageContext.request.contextPath}/BookingProcessServlet" method="post">
                <input type="hidden" name="tripId" value="<%= request.getParameter("tripId") %>">

                <label for="customer_name" style="font-size: 1.2em; font-weight: 600; color: #333;">Name:</label>
                <input type="text" id="customer_name" name="customer_name" required style="width: 100%; padding: 10px; margin-bottom: 20px; border-radius: 5px; border: 1px solid #ccc; font-size: 1.1em;">

                <label for="email" style="font-size: 1.2em; font-weight: 600; color: #333;">Email:</label>
                <input type="email" id="email" name="email" required style="width: 100%; padding: 10px; margin-bottom: 20px; border-radius: 5px; border: 1px solid #ccc; font-size: 1.1em;">

                <label for="phone" style="font-size: 1.2em; font-weight: 600; color: #333;">Phone:</label>
                <input type="text" id="phone" name="phone" required style="width: 100%; padding: 10px; margin-bottom: 20px; border-radius: 5px; border: 1px solid #ccc; font-size: 1.1em;">

                <label for="number_of_people" style="font-size: 1.2em; font-weight: 600; color: #333;">Number of People:</label>
                <input type="number" id="number_of_people" name="number_of_people" required style="width: 100%; padding: 10px; margin-bottom: 20px; border-radius: 5px; border: 1px solid #ccc; font-size: 1.1em;">

                <button type="submit" class="btn" style="background-color: #2e7d32; color: white; font-size: 1.3em; padding: 12px 30px; border-radius: 30px; transition: background-color 0.3s ease; margin-top: 20px;">Submit Booking</button>
            </form>
        </div>
    </div>
</div>

<!-- Footer Section -->
<jsp:include page="footer.jsp" />

<style>
    /* General Styles */
    body {
        font-family: 'Open Sans', sans-serif;
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
    .container {
        position: relative;
        z-index: 1;
    }

    .btn {
        transition: background-color 0.3s ease;
    }

    .btn:hover {
        background-color: #e07b00;
    }

    /* Navbar and Footer Consistency */
    .navbar {
        background-color: #1f2125;
        padding: 15px 20px;
        display: flex;
        justify-content: center;
        align-items: center;
        color: #ffffff;
    }

    .navbar h1 {
        font-size: 28px;
        margin: 0;
        font-weight: 600;
    }

    .footer {
        background-color: #1f2125;
        padding: 20px;
        text-align: center;
        color: white;
        position: relative;
        bottom: 0;
        width: 100%;
    }
</style>
