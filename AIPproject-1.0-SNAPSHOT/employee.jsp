<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, emp.DatabaseConnection" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Management</title>
    <script>
        window.onload = function() {
            const urlParams = new URLSearchParams(window.location.search);
            const message = urlParams.get('message');
            if (message) {
                alert(message); // Show a popup
                history.replaceState(null, null, window.location.pathname); // Remove parameter from URL
            }
        };
    </script>
</head>
<body>

    <h2>Employee List</h2>

    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Department</th>
            <th>Salary</th>
            <th>Actions</th>
        </tr>
        <%
            Connection con = DatabaseConnection.getConnection();
            PreparedStatement stmt = con.prepareStatement("SELECT * FROM employee");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("department") %></td>
            <td><%= rs.getInt("salary") %></td>
            <td>
                <a href="edit_employee.jsp?id=<%= rs.getInt("id") %>">Edit</a>
                <a href="Employee?action=delete&id=<%= rs.getInt("id") %>" onclick="return confirm('Are you sure?')">Delete</a>
            </td>
        </tr>
        <%
            }
            rs.close();
            stmt.close();
            con.close();
        %>
    </table>

</body>
</html>
