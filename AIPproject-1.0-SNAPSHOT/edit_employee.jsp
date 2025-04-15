<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, emp.DatabaseConnection" %>

<%
    String id = request.getParameter("id");

    if (id == null || id.isEmpty()) {
        out.println("<p style='color:red;'>Error: Employee ID is missing.</p>");
        return;
    }

    Connection con = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Employee</title>
</head>
<body>
    <h2>Edit Employee</h2>

    <%
        try {
            con = DatabaseConnection.getConnection();
            stmt = con.prepareStatement("SELECT * FROM employee WHERE id=?");
            stmt.setInt(1, Integer.parseInt(id));
            rs = stmt.executeQuery();

            if (rs.next()) {
    %>
    <form action="Employee" method="post">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="id" value="<%= rs.getInt("id") %>">

        <label>Name:</label>
        <input type="text" name="name" value="<%= rs.getString("name") %>" required><br>

        <label>Department:</label>
        <input type="text" name="department" value="<%= rs.getString("department") %>" required><br>

        <label>Salary:</label>
        <input type="number" name="salary" value="<%= rs.getInt("salary") %>" required><br>

        <input type="submit" value="Update Employee">
    </form>

    <%
            } else {
                out.println("<p style='color:red;'>Employee not found.</p>");
            }
        } catch (Exception e) {
            out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
            e.printStackTrace();
        } finally {
            // Close resources
            if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (con != null) try { con.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    %>
</body>
</html>
