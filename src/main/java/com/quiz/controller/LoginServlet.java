package com.quiz.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.quiz.dao.QuestionDAO;
import com.quiz.dao.ResultDAO;
import com.quiz.dao.UserDAO;
import com.quiz.model.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		UserDAO dao = new UserDAO();
		User user = dao.loginUser(email, password);
		if (user != null) {
			HttpSession session = req.getSession();
			session.setAttribute("user", user);
			session.setAttribute("role", user.getRole());

			if (user.getRole().equals("ADMIN")) {
				QuestionDAO qdao = new QuestionDAO();
				ResultDAO rdao = new ResultDAO();
				int totalQuestions = qdao.getTotalQuestions();
				int totalUsers = dao.getTotalUsers();
				int totalAttempts = rdao.getTotalQuizAttempts();
				double avgScore = rdao.getAverageScore();
				System.out.println("charan :" + totalQuestions);
				session.setAttribute("totalQuestions", totalQuestions);
				session.setAttribute("totalUsers", totalUsers);
				session.setAttribute("totalAttempts", totalAttempts);
				session.setAttribute("avgScore", avgScore);

				resp.sendRedirect("admin/adminDashboard.jsp");
			} else {
				QuestionDAO qdao = new QuestionDAO();
				ResultDAO rdao = new ResultDAO();
				int totalQuestions = qdao.getTotalQuestions();
				int totalAttempts = rdao.getUserTotalAttempts(user.getId());
				int bestScore = rdao.getBestScore(user.getId());
				double avgScore = rdao.getUserAverageScore(user.getId());
				session.setAttribute("totalQuestions", totalQuestions);
				session.setAttribute("totalAttempts", totalAttempts);
				session.setAttribute("bestScore", bestScore);
				session.setAttribute("avgScore", avgScore);
				resp.sendRedirect("user/userDashboard.jsp");
			}
		} else {
			resp.getWriter().println("Invalid Credentials");
		}
	}

}
