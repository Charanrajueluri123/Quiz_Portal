package com.quiz.controller;

import java.io.IOException;
import java.util.ArrayList;
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
import com.quiz.model.ReviewAnswer;
import com.quiz.model.User;

@WebServlet("/submitQuiz")
public class SubmitQuizServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("hi broo");
		QuestionDAO dao = new QuestionDAO();
		String difficulty = request.getParameter("difficulty");
		String category = request.getParameter("category");
		List<Question> questions = dao.getQuestionsByDifficultyAndCategory(difficulty, category);
		int score = 0;
		System.out.println("questions:"+questions);
		List<ReviewAnswer> reviewList = new ArrayList<>();
		for (Question q : questions) {
			String userAnswer = request.getParameter("question_" + q.getId());
			boolean isCorrect = false;
			if (userAnswer != null && userAnswer.equals(q.getCorrectAnswer())) {
				score++;
				isCorrect = true;
			}
			ReviewAnswer review = new ReviewAnswer(q, userAnswer, isCorrect);
			reviewList.add(review);
		}

		System.out.println("hi broo");

		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("user");
		if (u == null) {
			response.sendRedirect(request.getContextPath() + "/login.jsp");
			return;
		}
		ResultDAO rdao = new ResultDAO();

		rdao.saveResult(u.getId(), score);
		QuestionDAO qdao = new QuestionDAO();
		int totalQuestions = qdao.getTotalQuestions();
		int totalAttempts = rdao.getUserTotalAttempts(u.getId());
		int bestScore = rdao.getBestScore(u.getId());
		double avgScore = rdao.getUserAverageScore(u.getId());
		session.setAttribute("reviewList", reviewList);
//		session.setAttribute("avgScore", avgScore);
		session.setAttribute("totalQuestions", totalQuestions);
		session.setAttribute("totalAttempts", totalAttempts);
		session.setAttribute("bestScore", bestScore);
		session.setAttribute("avgScore", avgScore);
		request.setAttribute("score", score);
		request.getRequestDispatcher("user/result.jsp").forward(request, response);
	}

}
