<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Rani Travel Agency</title>

    <!-- Inline CSS for simplicity and exclusive styling -->
    <style>
        /* Basic reset and box-sizing */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        /* Full page container */
        body, html {
            height: 100%;
            margin: 0;
        }

        /* Background color and overlay */
        body {
            background: url('https://www.shutterstock.com/blog/wp-content/uploads/sites/5/2018/04/featured1-6.jpg') no-repeat center center fixed;
            position: relative;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        /* Dark overlay to enhance text visibility */
        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.4); /* Adjust transparency */
            z-index: 1;
        }

        /* Login box styling */
        .login-container {
            position: relative;
            z-index: 2;
            background: rgba(255, 255, 255, 0.9);
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
            width: 300px;
            max-width: 90%;
            text-align: center;
        }

        /* Headings */
        .login-container h2 {
            margin-bottom: 1.5rem;
            color: #2E8B57; /* Darker olive green */
        }

        /* Input fields styling */
        .login-container input[type="text"],
        .login-container input[type="password"] {
            width: 100%;
            padding: 0.8rem;
            margin: 0.5rem 0;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1rem;
        }

        /* Login button */
        .login-container button {
            width: 100%;
            padding: 0.8rem;
            background-color: #2E8B57; /* Dark olive green */
            border: none;
            border-radius: 5px;
            color: white;
            font-size: 1rem;
            cursor: pointer;
            margin-top: 1rem;
        }

        .login-container button:hover {
            background-color: #276747; /* Slightly darker on hover */
        }

        /* Additional links */
        .login-container .additional-links {
            margin-top: 1rem;
            font-size: 0.9rem;
        }

        .login-container .additional-links a {
            color: #14a95c; /* Golden color for links */
            text-decoration: none;
        }

        .login-container .additional-links a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>
    <!-- Dark overlay for background -->
    <div class="overlay"></div>

    <!-- Login container -->
    <div class="login-container">
        <h2>Rani Travel Agency</h2>

        <!-- Display error message if there is one -->
        <%
            String errorMessage = (String) request.getAttribute("errorMessage");
            if (errorMessage != null) {
                out.println("<p style='color: red;'>" + errorMessage + "</p>");
            }
        %>

        <!-- Form action points to the LoginServlet -->
        <form action="LoginServlet" method="post">
            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit">Login</button>
        </form>
        <div class="additional-links">
            <p>Don't have an account? <a href="register.jsp">Register Here</a></p>
        </div>
    </div>
</body>

</html>
