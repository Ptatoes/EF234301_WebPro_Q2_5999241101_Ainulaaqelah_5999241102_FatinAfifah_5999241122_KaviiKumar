<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Trip</title>
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
        }

        label {
            display: block;
            margin-bottom: 10px;
            font-weight: 600;
            font-size: 14px;
            color: #ffffff;
        }

        input[type="text"],
        input[type="number"],
        textarea {
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
        input[type="number"]:focus,
        textarea:focus {
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
        <h1>Add New Trip</h1>
    </div>

    <div class="container">
        <form action="${pageContext.request.contextPath}/CreateTripServlet" method="post">
            <label for="destination">Destination:</label>
            <input type="text" id="destination" name="destination" required>

            <label for="description">Description:</label>
            <textarea id="description" name="description" rows="4" required></textarea>

            <label for="price">Price:</label>
            <input type="number" step="0.01" id="price" name="price" required>

            <label for="duration">Duration (in days):</label>
            <input type="number" id="duration" name="duration" required>

            <label for="category">Category:</label>
            <input type="text" id="category" name="category">

            <label for="image_url">Image URL:</label>
            <input type="text" id="image_url" name="image_url" placeholder="Paste the image URL here">

            <button type="submit" class="btn">Add Trip</button>
        </form>

        <!-- Back to Dashboard button -->
        <form action="admin-dashboard.jsp" method="get">
            <button type="submit" class="back-btn">Back to Dashboard</button>
        </form>
    </div>
</body>
</html>
