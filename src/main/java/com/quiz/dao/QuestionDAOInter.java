package com.quiz.dao;

import java.util.List;

import com.quiz.model.Question;

public interface QuestionDAOInter {
	public boolean addQuestion(Question q);
//	public List<Question> getAllQuestions();
	public int getTotalQuestions();
}
