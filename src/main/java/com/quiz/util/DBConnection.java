package com.quiz.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

//    private static final String URL = "jdbc:mysql://localhost:3306/quiz_db";
//    private static final String USER = "root";
//    private static final String PASSWORD = "2004ecru";
//
//    public static Connection getConnection() {
//        Connection con = null;
//
//        try {
//            Class.forName("com.mysql.cj.jdbc.Driver");
//            con = DriverManager.getConnection(URL, USER, PASSWORD);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        return con;
//    }

	private static Connection con;
	public static Connection getConnection() {
		try {
			Class.forName("org.postgresql.Driver");
			String url = "jdbc:postgresql://dpg-d89tfnfavr4c73cv1evg-a.ohio-postgres.render.com:5432/quizdb_tm3u";
			String username = "quizuser";
			String password = "OGmLiFn16kuhE7WGTBUtbxo2NfCiCuv2";
			con = DriverManager.getConnection(url, username, password);
			System.out.println("Database Connected Successfully!");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	
	
}