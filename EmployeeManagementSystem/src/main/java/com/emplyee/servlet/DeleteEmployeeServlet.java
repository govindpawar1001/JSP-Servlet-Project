package com.emplyee.servlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DeleteEmployeeServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		try {
			int id = Integer.parseInt(req.getParameter("id"));
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("delete from employee where id=?");
			ps.setInt(1, id);
			ps.executeUpdate();
			res.sendRedirect("viewEmployee.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

