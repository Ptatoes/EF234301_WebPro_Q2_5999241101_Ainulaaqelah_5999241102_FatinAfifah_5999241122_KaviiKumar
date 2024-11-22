<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%
    // Check if the session exists and invalidate it
    if (session != null) {
        session.invalidate(); // Log out the user
    }

    // Redirect to the login page after logging out
    response.sendRedirect("login.jsp");
%>
