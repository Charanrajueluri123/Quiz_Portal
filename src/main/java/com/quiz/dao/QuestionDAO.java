package com.quiz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mysql.cj.xdevapi.DbDoc;
import com.quiz.model.Question;
import com.quiz.util.DBConnection;

public class QuestionDAO implements QuestionDAOInter {
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	public boolean addQuestion(Question q) {
		try {
			con = DBConnection.getConnection();
//			get diffucly id
			int difficulty_id = getDifficultyId(q.getDifficulty());
//			get category_id
			int category_id = getCategoryId(q.getCategory());
//insert query
			String query = "insert into questions1(" + "question," + "option1," + "option2," + "option3,"
					+ "option4,correct_answer,difficulty_id,category_id) values(?,?,?,?,?,?,?,?)";
			ps = con.prepareStatement(query);
			ps.setString(1, q.getQuestion());
			ps.setString(2, q.getOption1());
			ps.setString(3, q.getOption2());
			ps.setString(4, q.getOption3());
			ps.setString(5, q.getOption4());
			ps.setString(6, q.getCorrectAnswer());
			ps.setInt(7, difficulty_id);
			ps.setInt(8, category_id);
			int rows = ps.executeUpdate();
			if (rows > 0) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public int getTotalQuestions() {
		int count = 0;
		System.out.println(count + "count is ");
		try {
			con = DBConnection.getConnection();
			String query = "select count(*) from questions1";
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(count + "count is ");
		return count;
	}

	private int getDifficultyId(String difficulty) {
		int difficultyId = 0;
		try {
//			String query = "select id from difficulties where difficulty_level=?";
			String query = "select id from difficulties where LOWER(difficulty_level)=LOWER(?)";
			ps = con.prepareStatement(query);
			ps.setString(1, difficulty);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				difficultyId = rs.getInt("id");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("Diffculty_id: " + difficultyId);
		return difficultyId;
	}

	private int getCategoryId(String category) {
		int categoryId = 0;
		try {
//			String query = "select id from categories where category_name=?";
			String query = "select id from categories where LOWER(category_name)=LOWER(?)";
			ps = con.prepareStatement(query);
			ps.setString(1, category);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				categoryId = rs.getInt("id");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("category_name:" + categoryId);
		return categoryId;
	}
// mysql rand() use
//	public List<Question> getQuestionsByDifficultyAndCategory(String difficulty, String category) {
//		List<Question> list = new ArrayList<>();
//		try {
//			con = DBConnection.getConnection();
//			int difficulty_id = getDifficultyId(difficulty);
//			int category_id = getCategoryId(category);
//			String query = "select * from questions1 " + "where difficulty_id=? and category_id=? "
//					+ "order by rand() limit 10";
//
//			ps = con.prepareStatement(query);
//			ps.setInt(1, difficulty_id);
//			ps.setInt(2, category_id);
//			rs = ps.executeQuery();
//			while (rs.next()) {
//				Question q = new Question();
//				q.setId(rs.getInt("id"));
//				q.setQuestion(rs.getString("question"));
//				q.setOption1(rs.getString("option1"));
//				q.setOption2(rs.getString("option2"));
//				q.setOption3(rs.getString("option3"));
//				q.setOption4(rs.getString("option4"));
//				q.setCorrectAnswer(rs.getString("correct_answer"));
//				list.add(q);
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		return list;
//	}

//	for postrgsql
	public List<Question> getQuestionsByDifficultyAndCategory(String difficulty, String category) {
		List<Question> list = new ArrayList<>();
		try {
			con = DBConnection.getConnection();
			int difficulty_id = getDifficultyId(difficulty);
			int category_id = getCategoryId(category);
			String query = "select * from questions1 " + "where difficulty_id=? and category_id=? "
					+ "order by RANDOM() limit 10";

			ps = con.prepareStatement(query);
			ps.setInt(1, difficulty_id);
			ps.setInt(2, category_id);
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

	public List<Question> getAllQuestions() {
		List<Question> list = new ArrayList<>();
		try {
			con = DBConnection.getConnection();
			String query = "select q.*,d.difficulty_level,c.category_name " + "from questions1 q "
					+ "join difficulties d on q.difficulty_id=d.id "
					+ "join categories c on q.category_id=c.id order by q.category_id";
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
				q.setDifficulty(rs.getString("difficulty_level"));
				q.setCategory(rs.getString("category_name"));
				list.add(q);
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return list;
	}

	public boolean deleteQuestion(int id) {

		try {

			con = DBConnection.getConnection();

			String query = "delete from questions1 where id=?";

			ps = con.prepareStatement(query);

			ps.setInt(1, id);

			return ps.executeUpdate() > 0;

		} catch (Exception e) {

			e.printStackTrace();
		}

		return false;
	}

	public Question getQuestionById(int id) {
		Question q = null;
		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from questions1 where id=?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				q = new Question();
				q.setId(rs.getInt("id"));
				q.setQuestion(rs.getString("question"));
				q.setOption1(rs.getString("option1"));
				q.setOption2(rs.getString("option2"));
				q.setOption3(rs.getString("option3"));
				q.setOption4(rs.getString("option4"));
				q.setCorrectAnswer(rs.getString("correct_answer"));
				q.setCategory(rs.getString("category_id"));
				q.setDifficulty(rs.getString("difficulty_id"));
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return q;
	}

	public boolean updateQuestion(Question q) {
		boolean status = false;
		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(
					"update questions1 set question=?, option1=?, option2=?, option3=?, option4=?, correct_answer=? where id=?");
			ps.setString(1, q.getQuestion());
			ps.setString(2, q.getOption1());
			ps.setString(3, q.getOption2());
			ps.setString(4, q.getOption3());
			ps.setString(5, q.getOption4());
			ps.setString(6, q.getCorrectAnswer());
			ps.setInt(7, q.getId());
			status = ps.executeUpdate() > 0;

		} catch (Exception e) {

			e.printStackTrace();
		}

		return status;
	}
}
