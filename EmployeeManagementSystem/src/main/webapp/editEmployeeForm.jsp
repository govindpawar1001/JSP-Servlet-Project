<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.emplyee.servlet.DBConnection"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Employee Form - EMS</title>
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
            <h2>Edit Employee Details</h2>
        </div>

        <div class="table-container">
<%
String id = request.getParameter("id");
if (id != null) {
    try (Connection con = DBConnection.getConnection();
         PreparedStatement ps = con.prepareStatement("SELECT * FROM employee WHERE id = ?")) {
        
        ps.setInt(1, Integer.parseInt(id));
        ResultSet rs = ps.executeQuery();
        
        if (rs.next()) {
%>
            <form action="UpdateEmployeeServlet" method="post">
                <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                
                <div class="form-group">
                    <label>Employee Name</label>
                    <input type="text" name="name" value="<%= rs.getString("name") %>" required>
                </div>

                <div class="form-group">
                    <label>Email Address</label>
                    <input type="email" name="email" value="<%= rs.getString("email") %>" required>
                </div>

                <div class="form-group">
                    <label>Department</label>
                    <input type="text" name="department" value="<%= rs.getString("department") %>" required>
                </div>

                <div class="form-group">
                    <label>Salary</label>
                    <input type="number" name="salary" value="<%= rs.getDouble("salary") %>" required>
                </div>

                <button type="submit" class="btn">Update Employee</button>
                <a href="editEmployee.jsp" class="btn" style="background-color: #6c757d; margin-left: 10px;">Back</a>
            </form>
<%
        } else {
%>
            <p class="error-message">Employee not found!</p>
<%
        }
    } catch (Exception e) {
%>
        <p class="error-message">Error: <%= e.getMessage() %></p>
<%
    }
} else {
%>
    <p class="error-message">No employee ID provided!</p>
<%
}
%>
        </div>
    </div>
</div>

</body>
</html>
