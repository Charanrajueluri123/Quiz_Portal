package com.quiz.dao;

public interface ResultDAOInter {
	public boolean saveResult(int userId, int score);
	public int getTotalQuizAttempts();
	public double getAverageScore();
	public int getUserTotalAttempts(int userId);
	public int getBestScore(int userId);
	public double getUserAverageScore(int userId);
}
