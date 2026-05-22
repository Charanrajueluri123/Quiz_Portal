package com.quiz.util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DBConnection {
	private static final String PROPERTIES_FILE = "/db.properties";

	private static Properties loadProperties() {
		Properties props = new Properties();
		try (InputStream in = DBConnection.class.getResourceAsStream(PROPERTIES_FILE)) {
			if (in != null) {
				props.load(in);
			} else {
				System.err.println("db.properties not found on classpath, falling back to defaults");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return props;
	}

	public static Connection getConnection() {
		Connection con = null;
		Properties props = loadProperties();
		String url = props.getProperty("db.url", "jdbc:mysql://localhost:3306/quiz_db?useSSL=false&serverTimezone=UTC");
		String user = props.getProperty("db.user", "root");
		String pass = props.getProperty("db.password", "");

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, user, pass);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
}
