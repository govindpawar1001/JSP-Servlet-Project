package com.emplyee.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AddEmployeeServlet extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(
					"insert into employee(name,email,department,salary) values(?,?,?,?)");

			ps.setString(1, req.getParameter("name"));
			ps.setString(2, req.getParameter("email"));
			ps.setString(3, req.getParameter("department"));
			ps.setDouble(4,
					Double.parseDouble(req.getParameter("salary")));

			ps.executeUpdate();
			res.sendRedirect("viewEmployee.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
