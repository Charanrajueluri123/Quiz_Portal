package com.quiz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.quiz.util.DBConnection;

public class ResultDAO implements ResultDAOInter{
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	public boolean saveResult(int userId, int score) {
		try {
			System.out.println("Score Stored Successfulyy");
			con = DBConnection.getConnection();
			String query = "insert into results(user_id,score) values(?,?)";
			ps = con.prepareStatement(query);
			ps.setInt(1, userId);
			ps.setInt(2, score);
			int rows = ps.executeUpdate();
			if (rows > 0)
				return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public int getTotalQuizAttempts() {
		int count = 0;
		try {
			con = DBConnection.getConnection();
			String query = "select count(*) from results";
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	public double getAverageScore() {
		double avg = 0;
		try {
			con = DBConnection.getConnection();
			String query = "select avg(score) from results";
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			if (rs.next()) {
				avg = rs.getDouble(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return avg;
	}

	public int getUserTotalAttempts(int userId) {
		int count = 0;
		try {
			con = DBConnection.getConnection();
			String query = "select count(*) from results where user_id=?";
			ps = con.prepareStatement(query);
			ps.setInt(1, userId);
			rs = ps.executeQuery();
			if (rs.next())
				count = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	public int getBestScore(int userId) {
		int best_score = 0;
		try {
			con = DBConnection.getConnection();
			String query = "select max(score) from results where user_id=?";
			ps = con.prepareStatement(query);
			ps.setInt(1, userId);
			rs = ps.executeQuery();
			if (rs.next())
				best_score = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return best_score;
	}

	public double getUserAverageScore(int userId) {
		double avg = 0;
		try {
			con = DBConnection.getConnection();
			String query = "select avg(score) from results where user_id=?";
			ps = con.prepareStatement(query);
			ps.setInt(1, userId);
			rs = ps.executeQuery();
			if (rs.next()) {
				avg = rs.getDouble(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return avg;
	}
}
