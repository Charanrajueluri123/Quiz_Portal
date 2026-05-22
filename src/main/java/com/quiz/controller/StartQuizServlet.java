package com.quiz.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.quiz.dao.QuestionDAO;
import com.quiz.model.Question;

@WebServlet("/startQuiz")
public class StartQuizServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Entered into the statring quiz");
		QuestionDAO dao=new QuestionDAO();
		List<Question> questions=dao.getQuestions();
		request.setAttribute("questions", questions);
		request.getRequestDispatcher("user/quiz.jsp").forward(request, response);
	} 

}
