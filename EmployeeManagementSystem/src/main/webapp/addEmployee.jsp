<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Employee - EMS</title>
<link rel="stylesheet" href="style.css?v=5">
</head>
<body>

<div class="wrapper">
    <div class="sidebar">
        <h2>EMS</h2>
        <a href="dashboard.jsp">Dashboard</a>
        <a href="addEmployee.jsp" class="active">Add Employee</a>
        <a href="viewEmployee.jsp">View Employees</a>
        <a href="editEmployee.jsp">Edit Employee</a>
        <a href="deleteEmployee.jsp">Delete Employee</a>
        <a href="login.jsp">Logout</a>
    </div>

    <div class="main">
        <div class="header">
            <h2>Add New Employee</h2>
        </div>

        <div class="table-container">
            <form action="AddEmployeeServlet" method="post">
                <div class="form-group">
                    <label>Employee Name</label>
                    <input type="text" name="name" required>
                </div>

                <div class="form-group">
                    <label>Email Address</label>
                    <input type="email" name="email" required>
                </div>

                <div class="form-group">
                    <label>Department</label>
                    <input type="text" name="department" required>
                </div>

                <div class="form-group">
                    <label>Salary</label>
                    <input type="number" name="salary" required>
                </div>

                <button type="submit" class="btn">Add Employee</button>
            </form>
        </div>
    </div>
</div>

</body>
</html>
