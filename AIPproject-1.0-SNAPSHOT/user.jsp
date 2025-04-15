<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%
    HttpSession userSession = request.getSession(false);
    String role = (userSession != null) ? (String) userSession.getAttribute("role") : null;

    if (role == null || !"user".equals(role)) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Fetch Employee Data
    Connection con = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/aipproject", "root", "o*RaewDHnKHS2tO!");
        stmt = con.prepareStatement("SELECT * FROM employee");
        rs = stmt.executeQuery();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Management - User</title>
</head>
<body>
    <h1>Employee List (User View)</h1>
    <a href="LogoutServlet">Logout</a>
    
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Department</th>
            <th>Salary</th>
        </tr>
        <% while (rs.next()) { %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("name") %></td>
                <td><%= rs.getString("department") %></td>
                <td><%= rs.getInt("salary") %></td>
            </tr>
        <% } %>
    </table>
</body>
</html>
