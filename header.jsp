<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Holiday Trip</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>

    <!-- Import modern sans-serif font (Roboto or Montserrat) -->
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600&display=swap" rel="stylesheet">

    <!-- Apply custom fonts -->
    <style>
        body, .navbar, .navbar-nav, .nav-link, h1 {
            font-family: 'Montserrat', sans-serif; /* Modern flat font */
        }
        /* Adjust the navbar height by reducing padding */
        .navbar {
            padding: 10px 10px; /* Reduce top and bottom padding */
        }
        /* Adjust the spacing between the navbar links and the logout icon */
        .navbar-nav {
            margin-left: -20px;
            margin-right: 50px; /* Increased space between links and logout button */
        }
        /* Styling for the logout icon */
        .logout-icon {
            color: white;
            font-size: 1.5em;
            background: none;
            border: none;
            padding: 0;
            margin-left: 20px;
        }
        /* Adjust the "RANI" heading font, move it to the right, and change its color to black */
        h1 {
            font-size: 2em;
            font-weight: 600; /* Use bold font */
            letter-spacing: 2px;
            margin: 0; /* Remove margin for a more compact look */
            margin-left: 50px; /* Move the "RANI" text slightly to the right */
            color: rgb(255, 255, 255); /* Set the text color to black */
        }
    </style>
</head>
<body>
    <div class="navbar" style="background-color: #3a5a40 !important; color: white !important; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); position: fixed; top: 0; width: 100%; z-index: 1000;">
        <h1 class="text-center">RANI TRAVEL AGENCY</h1>
        <nav class="navbar navbar-expand-lg" style="background-color: #3a5a40 !important;">
            <div class="container-fluid">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav mx-auto">
                        <li class="nav-item">
                            <a class="nav-link text-white" href="index.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-white" href="about.jsp">About</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-white" href="trip-list.jsp">Trip List</a>
                        </li>
                    </ul>
                    <!-- Right side: Logout icon -->
                    <div class="d-flex ms-auto align-items-center">
                        <form action="logout.jsp" method="post">
                            <button type="submit" class="logout-icon">
                                <i class="fas fa-sign-out-alt"></i>
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </nav>
    </div>
</body>
</html>
