package com.quiz.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.quiz.dao.UserDAO;
import com.quiz.util.EmailUtil;

@WebServlet("/sendOtp")
public class SendOtpServlet extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		UserDAO dao = new UserDAO();
		boolean exists = dao.emailExists(email);
		if (!exists) {
			req.setAttribute("msg", "Email not registered");
			req.getRequestDispatcher("forgotPassword.jsp").forward(req, resp);
			return;
		}
		System.out.println("user checking done");
		int otp = (int) (Math.random() * 900000) + 100000;
		System.out.println("otp generation done"+otp);
		HttpSession session = req.getSession();
		session.setAttribute("otp", otp);
		session.setAttribute("email", email);
		try {
			EmailUtil.sendEmail(email, "Password Reset OTP", "Your OTP is : " + otp);
			resp.sendRedirect("verifyOtp.jsp");

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("msg", "Unable to send OTP");
			req.getRequestDispatcher("forgotPassword.jsp").forward(req, resp);
		}
	}
}