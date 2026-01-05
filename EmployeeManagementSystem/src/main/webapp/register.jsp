<link rel="stylesheet" href="style.css?v=5">

<div class="auth-container">
	<div class="auth-box">
		<h2>Admin Register</h2>

		<form action="RegisterEmployeeServlet" method="post">
			<div class="form-group">
				<label>Username</label> <input type="text" name="username" required>
			</div>

			<div class="form-group">
				<label>Email</label> <input type="email" name="email" required>
			</div>

			<div class="form-group">
				<label>Password</label> <input type="password" name="password"
					required>
			</div>

			<button class="btn">Register</button>
		</form>

		<div class="auth-links">
			<a href="login.jsp">Already have account? Login</a>
		</div>
	</div>
</div>
