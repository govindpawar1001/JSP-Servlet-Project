<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.emplyee.servlet.DBConnection"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Employee - EMS</title>
<link rel="stylesheet" href="style.css?v=5">
</head>
<body>

<div class="wrapper">
    <div class="sidebar">
        <h2>EMS</h2>
        <a href="dashboard.jsp">Dashboard</a>
        <a href="addEmployee.jsp">Add Employee</a>
        <a href="viewEmployee.jsp">View Employees</a>
        <a href="editEmployee.jsp" class="active">Edit Employee</a>
        <a href="deleteEmployee.jsp">Delete Employee</a>
        <a href="login.jsp">Logout</a>
    </div>

    <div class="main">
        <div class="header">
            <h2>Edit Employee</h2>
        </div>

        <div class="table-container">
            <p>Select an employee to edit:</p>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Department</th>
                        <th>Salary</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
<%
try (
    Connection con = DBConnection.getConnection();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM employee");
) {
    while (rs.next()) {
%>
                    <tr>
                        <td><%= rs.getInt("id") %></td>
                        <td><%= rs.getString("name") %></td>
                        <td><%= rs.getString("email") %></td>
                        <td><%= rs.getString("department") %></td>
                        <td><%= rs.getDouble("salary") %></td>
                        <td>
                            <a href="editEmployeeForm.jsp?id=<%= rs.getInt("id") %>" class="action-edit">Edit</a>
                        </td>
                    </tr>
<%
    }
} catch (Exception e) {
%>
                    <tr>
                        <td colspan="6" class="error-message">Error loading employees: <%= e.getMessage() %></td>
                    </tr>
<%
}
%>
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
</html>
