<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>
<link rel="stylesheet" href="style.css?v=5">
</head>
<body>

<div class="auth-container">
    <div class="auth-box">

        <h2>Admin Login</h2>

        <form action="LoginServlet" method="post">

            <div class="form-group">
                <label>Username</label>
                <input type="text" name="username" required>
            </div>

            <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" required>
            </div>

            <button class="btn">Login</button>
        </form>

        <% if (request.getParameter("success") != null) { %>
            <p class="success">Registration successful! Please login.</p>
        <% } %>

        <% if (request.getParameter("error") != null) { %>
            <p class="error">Invalid username or password</p>
        <% } %>

        <div class="auth-links">
            <p>New Admin?
                <a href="register.jsp">Register Here</a>
            </p>
        </div>

    </div>
</div>

</body>
</html>
