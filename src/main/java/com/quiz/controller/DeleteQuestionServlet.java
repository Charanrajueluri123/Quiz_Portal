package com.quiz.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.quiz.dao.QuestionDAO;

@WebServlet("/deleteQuestion")
public class DeleteQuestionServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));
		QuestionDAO dao = new QuestionDAO();
		HttpSession session = request.getSession(false);
		if (dao.deleteQuestion(id)) {
			session.setAttribute("msg", "Question deleted successfully!");
//			response.sendRedirect("viewQuestions");
			response.sendRedirect(request.getContextPath() + "/viewQuestions");
		}
	}
}
