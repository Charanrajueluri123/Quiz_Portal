package com.quiz.dao;

import com.quiz.model.User;

public interface UserDAOInter {
	public boolean registerUser(User u);
	public User loginUser(String email,String password);
	public int getTotalUsers();
}
