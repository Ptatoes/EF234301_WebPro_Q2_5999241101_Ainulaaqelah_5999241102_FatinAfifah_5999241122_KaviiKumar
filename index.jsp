<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />

<!-- Carousel Section -->
<div id="carouselExample" class="carousel slide" data-bs-ride="carousel" style="margin-top: 80px; height: 400px; padding: 0;">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="https://milesopedia.com/wp-content/uploads/2022/12/halong.jpg" class="d-block w-100" alt="Slide 1" style="filter: brightness(60%); height: 400px; object-fit: cover;">
        </div>
        <div class="carousel-item">
            <img src="https://travelsetu.com/apps/uploads/new_destinations_photos/destination/2024/06/27/db21c1ad1685e09d3d5e140c867de0c7_1000x1000.jpg" class="d-block w-100" alt="Slide 2" style="filter: brightness(60%); height: 400px; object-fit: cover;">
        </div>
        <div class="carousel-item">
            <img src="https://travel.usnews.com/images/Main-peerapas_mahamongkolsawas-Getty_HcKYJRX.jpg" class="d-block w-100" alt="Slide 3" style="filter: brightness(60%); height: 400px; object-fit: cover;">
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>

<!-- Floating WhatsApp Icon and Dialog Bubble -->
<div class="whatsapp-container">
    <a href="https://wa.me/your-whatsapp-number" target="_blank" id="whatsapp" class="whatsapp-icon" title="Contact us via WhatsApp">
        <img src="https://upload.wikimedia.org/wikipedia/commons/6/6b/WhatsApp.svg" alt="WhatsApp" style="width: 50px; height: 50px;">
    </a>
    <div class="whatsapp-dialog">
        <p>Need help? Contact Us <a href="https://wa.me/your-whatsapp-number" target="_blank" style="color: #25d366;">Contact us</a></p>
    </div>
</div>

<!-- Floating Introduction Text with View Trip List Button -->
<div class="carousel-intro-text" style="position: absolute; top: 40%; left: 50%; transform: translate(-50%, -50%); text-align: center; color: white; background-color: rgba(0, 0, 0, 0.5); padding: 20px; border-radius: 10px; font-size: 1.8em; font-weight: bold;">
    <p>Welcome to RANI Travel Agency</p>
    <p>Discover amazing destinations, unforgettable experiences, and the perfect trip for you.</p>
    <a href="trip-list.jsp" class="btn" style="background-color: #224c0b; color: white; font-size: 0.7em; padding: 12px 30px; border-radius: 30px; transition: background-color 0.3s ease; margin-top: 20px;">View Trip List</a>
</div>

<!-- Customer Reviews Section with Hover Effects -->
<div class="customer-reviews" style="padding: 60px 20px; background-color: #f4f7f0; text-align: center; margin-top: 80px;">
    <h2 style="font-size: 2.8em; color: #4CAF50; margin-bottom: 20px;">Customer Reviews</h2>
    <div class="row">
        <div class="col-md-4">
            <div class="review-card" style="background-color: white; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); margin-bottom: 30px; padding: 20px; transition: transform 0.3s ease, box-shadow 0.3s ease; cursor: pointer;">
                <p style="font-size: 1.2em; color: #1e3020;">"RANI Travel made my trip unforgettable! The planning was seamless and the destinations were breathtaking."</p>
                <h4 style="color: #4CAF50;">Sarah L.</h4>
            </div>
        </div>
        <div class="col-md-4">
            <div class="review-card" style="background-color: white; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); margin-bottom: 30px; padding: 20px; transition: transform 0.3s ease, box-shadow 0.3s ease; cursor: pointer;">
                <p style="font-size: 1.2em; color: #1e3020;">"The trip was amazing! Highly recommend RANI Travel for anyone looking to explore new places."</p>
                <h4 style="color: #4CAF50;">James T.</h4>
            </div>
        </div>
        <div class="col-md-4">
            <div class="review-card" style="background-color: white; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); margin-bottom: 30px; padding: 20px; transition: transform 0.3s ease, box-shadow 0.3s ease; cursor: pointer;">
                <p style="font-size: 1.2em; color: #1e3020;">"A wonderful experience from start to finish. The attention to detail made all the difference!"</p>
                <h4 style="color: #4CAF50;">Anna W.</h4>
            </div>
        </div>
    </div>
</div>

<!-- Other One Content Section -->
<div class="other-one-content" style="padding: 60px 20px; background-color: #E9F4E7; text-align: center;">
    <h2 style="font-size: 2.8em; color: #4CAF50; margin-bottom: 20px;">Why Choose Us?</h2>
    <p style="font-size: 1.2em; color: #1e3020; max-width: 800px; margin: auto;">
        At RANI Travel Agency, we pride ourselves on providing personalized travel experiences. Our team works closely with you to tailor your trip according to your preferences and interests. From planning to execution, we ensure that every aspect of your vacation is taken care of, so you can enjoy stress-free travel.
    </p>
</div>


<!-- Footer Section with Contact Us -->
<jsp:include page="footer.jsp" />

<!-- Return to Top Button -->
<button onclick="topFunction()" id="returnToTopBtn" class="btn btn-primary" style="position: fixed; bottom: 30px; right: 30px; background-color: #224c0b; color: white; border-radius: 50%; padding: 15px 20px; font-size: 20px; display: none; transition: opacity 0.3s ease;">
    ↑
</button>

<!-- Popup Message HTML -->
<div class="popup-overlay" onclick="closePopup()"></div>
<div class="popup-message">
    <h3></h3>
    <p></p>
    <button class="popup-close-btn" onclick="closePopup()">Close</button>
</div>

<!-- JavaScript for Popup Message and Scroll to Top -->
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
        const successMessage = urlParams.get('success');
        const errorMessage = urlParams.get('error');
        
        if (successMessage) {
            showPopup('Success', successMessage);
        } else if (errorMessage) {
            showPopup('Error', errorMessage);
        }
    }

    // Function to handle the scroll-to-top button visibility
    var mybutton = document.getElementById("returnToTopBtn");

    window.onscroll = function() {
        if (document.body.scrollTop > 100 || document.documentElement.scrollTop > 100) {
            mybutton.style.display = "block";
        } else {
            mybutton.style.display = "none";
        }
    };

    function topFunction() {
        document.body.scrollTop = 0;
        document.documentElement.scrollTop = 0;
    }

    // Check URL for messages when the page loads
    window.onload = checkMessage;
</script>

</body>
</html>


<!-- CSS for Popup -->
<style>
    body{
        background: linear-gradient(135deg, #e0f7da, #328251); /* Same gradient background */

    }

    /* Styles for the popup message */
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
    .whatsapp-container {
        position: fixed;
        bottom: 10%;
        left: 10px;
        z-index: 1000;
        display: flex;
        align-items: center;
    }

    .whatsapp-icon {
        background-color: transparent;
        padding: 10px;
        border-radius: 50%;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        transition: transform 0.3s ease;
    }

    .whatsapp-icon:hover {
        transform: scale(1.1);
    }

    .whatsapp-dialog {
        display: none;
        background-color: #25d366;
        color: white;
        border-radius: 12px;
        padding: 8px 12px; /* Adjusted padding */
        margin-left: 10px;
        font-size: 0.9em;
        max-width: 200px; /* Control the width */
        text-align: center;
        position: absolute;
        bottom: 50px;
        left: 70px;
        z-index: 1001;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3);
        opacity: 0;
        transition: opacity 0.3s ease;
    }

    .whatsapp-container:hover .whatsapp-dialog {
        display: block;
        opacity: 1;
    }

    .whatsapp-dialog::before {
        content: '';
        position: absolute;
        bottom: -10px;
        left: 20px;
        border-width: 10px;
        border-style: solid;
        border-color: #25d366 transparent transparent transparent;
    }
</style>