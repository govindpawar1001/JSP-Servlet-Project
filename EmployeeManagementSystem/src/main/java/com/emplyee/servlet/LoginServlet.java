package com.emplyee.servlet;

import com.emplyee.servlet.DBConnection;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws IOException {

		String user = req.getParameter("username");
		String pass = req.getParameter("password");

		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps =con.prepareStatement("select * from admin where username=? and password=?");
			ps.setString(1, user);
			ps.setString(2, pass);

			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				res.sendRedirect("dashboard.jsp");
			} else {
				res.sendRedirect("login.jsp?error=1");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

