package com.quiz.controller;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.quiz.dao.UserDAO;
import com.quiz.model.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet{
	protected void doPost(HttpServletRequest req,HttpServletResponse resp) throws IOException {
		String name =req.getParameter("name");
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		String role=req.getParameter("role");
		
		User u=new User();
		u.setName(name);
		u.setEmail(email);
		u.setPassword(password);
		u.setRole("USER");
		
		UserDAO dao=new UserDAO();
		if(dao.registerUser(u)) {
			resp.sendRedirect("login.jsp");
		}
		else {
			resp.getWriter().println("Registration Failed");
		}
	}
}
