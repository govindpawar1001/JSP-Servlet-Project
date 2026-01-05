package com.emplyee.servlet;


import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/RegisterEmployeeServlet")
public class RegisterEmployeServlet extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws IOException {

		String user = req.getParameter("username");
		String email = req.getParameter("email");
		String pass = req.getParameter("password");

		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("insert into admin(username,email,password) values(?,?,?)");

			ps.setString(1, user);
			ps.setString(2, email);
			ps.setString(3, pass);

			int result = ps.executeUpdate();

			if (result > 0) {
				res.sendRedirect("login.jsp?success=1");
			} else {
				res.sendRedirect("register.jsp?error=1");
			}
		} catch (Exception e) {
			e.printStackTrace();
			res.sendRedirect("register.jsp?error=1");
		}
	}
}
