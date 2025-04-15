<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Employee Management</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            font-family: sans-serif;
        }
        .main {
            display: flex;
            flex-direction: column;
            gap: 20px;
            color: white;
            width: 100%;
        }
        .main img {
            width: 300px;
            height: 200px;
            border-radius: 50px;
        }
        .nav {
            display: flex;
            justify-content: center;
            background: radial-gradient(circle, rgba(8,232,226,1) 0%, rgba(45,167,139,1) 26%, rgba(220,219,101,1) 59%, rgba(45,253,240,1) 100%);
            color: white;
            font-size: 30px;
            padding: 20px 10px;
        }
        marquee {
            background: linear-gradient(90deg, rgba(238,174,202,1) 0%, rgba(228,233,148,1) 100%);
            color: white;
            padding: 20px 10px;
        }
        .add, .update, .delete {
            border: 2px solid white;
            display: flex;
            justify-content: space-around;
            align-items: center;
            font-size: 30px;
            padding: 20px 10px;
            background: linear-gradient(90deg, rgba(180,113,58,1) 0%, rgba(29,195,253,1) 50%, rgba(252,69,69,1) 100%);
        }
        input[type="submit"] {
            margin: 10px 120px;
            background-color: aqua;
            font-size: 20px;
            color: white;
            text-shadow: 2px 2px 2px black;
            padding: 10px 20px;
            border-radius: 10px;
            border: none;
        }
        input[type="text"], input[type="number"] {
            width: 320px;
            height: 32px;
            border-radius: 20px;
            padding-left: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background: white;
            color: black;
        }
        table, th, td {
            border: 1px solid black;
            text-align: center;
            padding: 10px;
        }
    </style>
</head>
<body>
    <div class="nav"><h1>Employee Management - Admin Panel</h1></div>
    <marquee><h1>Add, Manage, Delete, and Repeat</h1></marquee>

    <div class="main">
        <!-- Add Employee -->
        <div class="add">
            <form action="Employee" method="POST">
                <input type="hidden" name="action" value="add">
                <table cellspacing="10">
                    <tr><th colspan="2"><h3>Add Employee</h3></th></tr>
                    <tr><td><label for="name">Name: </label></td><td><input type="text" name="name" required></td></tr>
                    <tr><td><label for="department">Department: </label></td><td><input type="text" name="department" required></td></tr>
                    <tr><td><label for="salary">Salary: </label></td><td><input type="number" name="salary" required></td></tr>
                    <tr><td colspan="2"><input type="submit" value="Add Employee"></td></tr>
                </table>
            </form>
            <img src="https://images.pexels.com/photos/3184292/pexels-photo-3184292.jpeg?auto=compress&cs=tinysrgb&w=1200" alt="">
        </div>

        <!-- Update Employee -->
        <div class="update">
            <img src="https://images.pexels.com/photos/1181355/pexels-photo-1181355.jpeg?auto=compress&cs=tinysrgb&w=1200" alt="">
            <form action="Employee" method="POST">
                <input type="hidden" name="action" value="update">
                <table cellspacing="10">
                    <tr><th colspan="2"><h3>Update Employee</h3></th></tr>
                    <tr><td><label for="id">ID: </label></td><td><input type="number" name="id" required></td></tr>
                    <tr><td><label for="department">Department: </label></td><td><input type="text" name="department" required></td></tr>
                    <tr><td><label for="salary">Salary: </label></td><td><input type="number" name="salary" required></td></tr>
                    <tr><td colspan="2"><input type="submit" value="Update Employee"></td></tr>
                </table>
            </form>
        </div>

        <!-- Delete Employee -->
        <div class="delete">
            <form action="Employee" method="POST">
                <input type="hidden" name="action" value="delete">
                <table cellspacing="10">
                    <tr><th colspan="2"><h3>Delete Employee</h3></th></tr>
                    <tr><td><label for="id">ID: </label></td><td><input type="number" name="id" required></td></tr>
                    <tr><td colspan="2"><input type="submit" value="Delete Employee"></td></tr>
                </table>
            </form>
            <img src="https://images.pexels.com/photos/845451/pexels-photo-845451.jpeg?auto=compress&cs=tinysrgb&w=1200" alt="">
        </div>

        <!-- Employee Table -->
        <h2>Employee List</h2>
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Department</th>
                <th>Salary</th>
            </tr>
            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/aipproject", "root", "o*RaewDHnKHS2tO!");
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM employee");

                    while (rs.next()) {
                        out.println("<tr>");
                        out.println("<td>" + rs.getInt("id") + "</td>");
                        out.println("<td>" + rs.getString("name") + "</td>");
                        out.println("<td>" + rs.getString("department") + "</td>");
                        out.println("<td>" + rs.getInt("salary") + "</td>");
                        out.println("</tr>");
                    }
                    con.close();
                } catch (Exception e) {
                    out.println("<tr><td colspan='4'>Error: " + e.getMessage() + "</td></tr>");
                }
            %>
        </table>

    </div>
</body>
</html>
