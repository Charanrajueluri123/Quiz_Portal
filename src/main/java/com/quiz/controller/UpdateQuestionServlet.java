package com.quiz.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.quiz.dao.QuestionDAO;
import com.quiz.model.Question;

@WebServlet("/updateQuestion")
public class UpdateQuestionServlet
extends HttpServlet {

	protected void doPost(
			HttpServletRequest request,
			HttpServletResponse response)
			throws ServletException, IOException {

		Question q = new Question();

		q.setId(Integer.parseInt(
				request.getParameter("id")));

		q.setQuestion(
				request.getParameter("question"));

		q.setOption1(
				request.getParameter("option1"));
		q.setOption2(
				request.getParameter("option2"));
		q.setOption3(
				request.getParameter("option3"));
		q.setOption4(
				request.getParameter("option4"));
		q.setCorrectAnswer(
				request.getParameter("correctAnswer"));
		QuestionDAO dao =
				new QuestionDAO();
		
		HttpSession session=request.getSession(false);
		if(dao.updateQuestion(q)) {
			session.setAttribute("msg", "Question updated successfully!");
//		response.sendRedirect("viewQuestions");
		response.sendRedirect(
				request.getContextPath()
				+ "/viewQuestions");
		}
	}
}
