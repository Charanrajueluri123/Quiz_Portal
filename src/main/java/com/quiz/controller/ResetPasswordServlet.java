package com.quiz.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.quiz.dao.UserDAO;

@WebServlet("/resetPassword")
public class ResetPasswordServlet extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();

		Boolean verified = (Boolean) session.getAttribute("verified");

		if (verified == null || !verified) {

			resp.sendRedirect("forgotPassword.jsp");

			return;
		}

		String password = req.getParameter("password");

		String confirm = req.getParameter("confirmPassword");

		if (!password.equals(confirm)) {

			resp.getWriter().println("Passwords do not match");

			return;
		}

		String email = (String) session.getAttribute("email");

		UserDAO dao = new UserDAO();

		dao.updatePassword(email, password);

		session.removeAttribute("otp");

		session.removeAttribute("verified");

		session.removeAttribute("email");

		resp.sendRedirect("login.jsp");
	}
}
