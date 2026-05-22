package com.quiz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.quiz.model.User;
import com.quiz.util.DBConnection;

public class UserDAO implements UserDAOInter {
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	public boolean registerUser(User u) {
		
		String query = "insert into users(name,email,password,role) values(?,?,?,?)";
		try {
			con = DBConnection.getConnection();
			if(con==null) {
				System.out.println("con not working");
			}
			ps = con.prepareStatement(query);
			ps.setString(1, u.getName());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPassword());
			ps.setString(4, u.getRole());

			int rows = ps.executeUpdate();
			if (rows > 0) {
				System.out.println("user registered succefully..");
				return true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public User loginUser(String email,String password) {
		User user=null;
		con=DBConnection.getConnection();
		String query="select *from users where email=? and password=?";
		try {
			ps=con.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, password);
			rs=ps.executeQuery();
			if(rs.next()) {
				user=new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setRole(rs.getString("role"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}
	
	
	
	public int getTotalUsers() {
		int count=0;
		try {
			con=DBConnection.getConnection();
			String query="select count(*) from users where role='USER'";
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			if(rs.next()) {
				count=rs.getInt(1);
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
}
