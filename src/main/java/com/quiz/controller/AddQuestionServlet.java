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
import com.quiz.dao.UserDAOInter;
import com.quiz.model.Question;

@WebServlet("/addQuestion")
public class AddQuestionServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String question=request.getParameter("question");
		String option1 =request.getParameter("option1");
		String option2 =request.getParameter("option2");
		String option3 =request.getParameter("option3");
		String option4 =request.getParameter("option4");
		String correctAnswer = request.getParameter("correctAnswer");
		String category=request.getParameter("category");
		String difficulty=request.getParameter("difficulty");
		System.out.println("Category: "+category);
		System.out.println("Difficulty: "+difficulty);
		Question q=new Question();
		q.setQuestion(question);
		q.setOption1(option1);
		q.setOption2(option2);
		q.setOption3(option3);
		q.setOption4(option4);
		q.setCorrectAnswer(correctAnswer);
		q.setDifficulty(difficulty);
		q.setCategory(category);
		
		QuestionDAO qdao=new QuestionDAO();
		if(qdao.addQuestion(q)) {
			HttpSession session = request.getSession();
			UserDAOInter dao=new UserDAO();
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
			response.sendRedirect(request.getContextPath()+"/admin/addQuestion.jsp?msg=success");
		}else {
			response.getWriter().println("Failed to Add question");
		}
	}

}
