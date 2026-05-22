package com.quiz.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.quiz.dao.QuestionDAO;
import com.quiz.dao.ResultDAO;
import com.quiz.model.Question;
import com.quiz.model.User;

@WebServlet("/submitQuiz")
public class SubmitQuizServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("hi broo");
		QuestionDAO dao = new QuestionDAO();
		List<Question> questions = dao.getAllQuestions();
		int score = 0;
		for (Question q : questions) {
			String userAnswer = request.getParameter("question_" + q.getId());
			if (userAnswer != null && userAnswer.equals(q.getCorrectAnswer())) {
				score++;
			}
		}
		System.out.println("hi broo");
		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("user");
		ResultDAO rdao = new ResultDAO();
		rdao.saveResult(u.getId(), score);
		QuestionDAO qdao = new QuestionDAO();
		int totalQuestions = qdao.getTotalQuestions();
		int totalAttempts = rdao.getUserTotalAttempts(u.getId());
		int bestScore = rdao.getBestScore(u.getId());
		double avgScore = rdao.getUserAverageScore(u.getId());
		session.setAttribute("totalQuestions", totalQuestions);
		session.setAttribute("totalAttempts", totalAttempts);
		session.setAttribute("bestScore", bestScore);
		session.setAttribute("avgScore", avgScore);
		request.setAttribute("score", score);
		request.getRequestDispatcher("user/result.jsp").forward(request, response);
	}

}
