package com.quiz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mysql.cj.xdevapi.DbDoc;
import com.quiz.model.Question;
import com.quiz.util.DBConnection;

public class QuestionDAO implements QuestionDAOInter{
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	public boolean addQuestion(Question q) {
		try {
			con = DBConnection.getConnection();
			String query = "insert into questions(question,option1,option2,option3,option4,correct_answer) values(?,?,?,?,?,?)";
			ps = con.prepareStatement(query);
			ps.setString(1, q.getQuestion());
			ps.setString(2, q.getOption1());
			ps.setString(3, q.getOption2());
			ps.setString(4, q.getOption3());
			ps.setString(5, q.getOption4());
			ps.setString(6, q.getCorrectAnswer());
			int rows = ps.executeUpdate();
			if (rows > 0) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public List<Question> getAllQuestions() {
		List<Question> list = new ArrayList<>();
		try {
			con = DBConnection.getConnection();
			String query = "select *from questions";
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				Question q = new Question();
				q.setId(rs.getInt("id"));
				q.setQuestion(rs.getString("question"));
				q.setOption1(rs.getString("option1"));
				q.setOption2(rs.getString("option2"));
				q.setOption3(rs.getString("option3"));
				q.setOption4(rs.getString("option4"));
				q.setCorrectAnswer(rs.getString("correct_answer"));

				list.add(q);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Question> getQuestions() {
		List<Question> list = new ArrayList<>();
		try {
			con = DBConnection.getConnection();
			String query = "select *from questions order by rand() limit 10";
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				Question q = new Question();
				q.setId(rs.getInt("id"));
				q.setQuestion(rs.getString("question"));
				q.setOption1(rs.getString("option1"));
				q.setOption2(rs.getString("option2"));
				q.setOption3(rs.getString("option3"));
				q.setOption4(rs.getString("option4"));
				q.setCorrectAnswer(rs.getString("correct_answer"));

				list.add(q);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int getTotalQuestions() {
		int count = 0;
		System.out.println(count+"count is ");
		try {
			con = DBConnection.getConnection();
			String query = "select count(*) from questions";
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(count+"count is ");
		return count;
	}
}
