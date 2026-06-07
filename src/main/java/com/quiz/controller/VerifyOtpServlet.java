package com.quiz.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/verifyOtp")
public class VerifyOtpServlet extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userOtp = req.getParameter("otp");
		HttpSession session = req.getSession();
		Integer actualOtp = (Integer) session.getAttribute("otp");
		if (actualOtp == null) {
			resp.sendRedirect("forgotPassword.jsp");
			return;
		}
		if (userOtp.equals(String.valueOf(actualOtp))) {
			session.setAttribute("verified", true);
			resp.sendRedirect("resetPassword.jsp");

		} else {
			req.setAttribute("msg", "Invalid OTP");
			req.getRequestDispatcher("verifyOtp.jsp").forward(req, resp);
		}
	}
}
