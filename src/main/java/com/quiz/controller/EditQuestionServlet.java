package com.quiz.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.quiz.dao.QuestionDAO;
import com.quiz.model.Question;

@WebServlet("/editQuestion")
public class EditQuestionServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("enterd into edit question");
		int id = Integer.parseInt(
				request.getParameter("id"));
		QuestionDAO dao = new QuestionDAO();
		Question q = dao.getQuestionById(id);
		request.setAttribute("question", q);
		request.getRequestDispatcher(
				"admin/editQuestion.jsp")
				.forward(request, response);
	}
}