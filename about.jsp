<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />

<style>
    /* General Styles */
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f9f9f9;
    }

    .about-container {
        padding: 80px 30px;
        background: linear-gradient(135deg, #e0f7da, #b3e5fc); /* Light gradient background */
        border-radius: 15px;
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        margin-top: 80px; /* Added margin-top to prevent overlap with navbar */
    }

    /* About Header */
    .about-header {
        text-align: center;
        margin-bottom: 50px;
    }

    .about-header h4 {
        font-size: 2.6em;
        color: #2e7d32; /* Dark green for emphasis */
        font-weight: bold;
        margin-bottom: 15px;
    }

    .about-header p {
        font-size: 1.2em;
        color: #333;
        max-width: 700px;
        margin: 0 auto;
    }

    /* About Content */
    .about-content {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
        gap: 40px;
    }

    .about-info, .about-history {
        flex: 1;
        padding: 25px;
        background-color: #ffffff; /* White background for contrast */
        border-radius: 15px;
        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .about-info:hover, .about-history:hover {
        transform: translateY(-10px);
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
    }

    .about-info h2, .about-history h2 {
        font-size: 2em;
        color: #1b5e20; /* Darker green for section titles */
        margin-bottom: 20px;
    }

    .about-info p, .about-history p {
        font-size: 1.1em;
        line-height: 1.7;
        color: #555;
    }

    /* Why Choose Us Section Enhancements */
    .why-choose-us {
        padding: 60px 30px;
        background: linear-gradient(135deg, #e0f7da, #b3e5fc); /* Same gradient background */
        border-radius: 15px;
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2); /* Consistent shadow */
        margin-top: 50px;
        text-align: center;
    }

    .why-choose-us h2 {
        font-size: 2.6em;
        color: #2e7d32; /* Consistent green tone */
        margin-bottom: 30px;
        font-weight: bold;
    }

    .why-choose-us p {
        font-size: 1.2em;
        color: #333;
        margin-bottom: 40px;
        max-width: 700px;
        margin: 0 auto;
    }

    .values-grid {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        gap: 30px;
    }

    .value-item {
        flex: 1;
        min-width: 250px;
        background-color: #ffffff; /* White background for cards */
        padding: 30px;
        border-radius: 15px; /* Rounded corners */
        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1); /* Light shadow */
        text-align: center;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .value-item:hover {
        transform: translateY(-10px);
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2); /* Enhanced shadow on hover */
    }

    .value-item h3 {
        font-size: 2em;
        color: #1b5e20; /* Darker green for titles */
        margin-bottom: 15px;
    }

    .value-item p {
        font-size: 1.1em;
        color: #555;
        line-height: 1.7;
    }

    /* Footer Style */
    footer {
        color: white;  /* White text color */
        background-color: #333; /* Dark background */
        padding: 20px;
        text-align: center;
    }

    footer a {
        color: white;  /* Links will also be white */
        text-decoration: none;
    }

    footer a:hover {
        color: #ffa500; /* Optional: change color on hover */
    }
</style>

<!-- About Us Section -->
<div class="about-container">
    <div class="about-header">
        <h4>About Rani Travel Agency</h4>
        <p>We are dedicated to making your travel dreams come true. Explore the world with us!</p>
    </div>

    <div class="about-content">
        <div class="about-info">
            <h2>Who We Are</h2>
            <p>At Rani Travel Agency, we are a passionate team of travel enthusiasts committed to providing you with unforgettable experiences. We specialize in curating customized trips to beautiful destinations that fit your interests and budget. Whether you're looking for a relaxing beach vacation or an adventurous hiking trip, we’ve got you covered.</p>
            <p>Our travel experts have years of experience in the industry, and we pride ourselves on offering personalized service that ensures you have the best possible travel experience. With us, you’re not just booking a trip – you’re embarking on an adventure of a lifetime.</p>
        </div>

        <div class="about-history">
            <h2>Our Journey</h2>
            <p>Rani Travel Agency was founded in 2010 with a simple vision: to make travel more accessible and enjoyable for everyone. Over the years, we have built strong relationships with top hotels, airlines, and local guides, allowing us to offer exclusive packages that you won’t find anywhere else.</p>
            <p>As we continue to grow, our mission remains the same – to provide high-quality, customized travel experiences that leave you with lasting memories. We believe in creating a personal connection with our clients, understanding their needs, and providing the best value for their money.</p>
        </div>
    </div>
</div>

<!-- Why Choose Us Section -->
<div class="why-choose-us">
    <h2>Why Choose Rani Travel Agency?</h2>
    <p>We believe in delivering the best travel experiences, grounded in trust, innovation, and exceptional service. Here are the reasons why our customers love us:</p>

    <div class="values-grid">
        <div class="value-item">
            <h3>Customer Focus</h3>
            <p>We put our customers at the heart of everything we do, ensuring every experience is tailored to their needs and preferences.</p>
        </div>

        <div class="value-item">
            <h3>Innovation</h3>
            <p>We constantly innovate our offerings to provide the latest trends in travel and ensure every trip is memorable and unique.</p>
        </div>

        <div class="value-item">
            <h3>Sustainability</h3>
            <p>We are committed to sustainable travel practices, ensuring that our trips benefit not only our customers but also the communities we visit.</p>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp" />
