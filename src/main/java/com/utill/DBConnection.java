package com.utill;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	
	private static boolean useLocalDatabase = true; // toggle between local db and main db
	
	//Local Database Config Details
	private static String url = "jdbc:mysql://localhost:3306/health-lanka";
	private static String username = "root";
	private static String password = "Moditha2003";
	
	//Main Database Config Details ( Don't Change !! )
	private static String urlMain = "";
	private static String usernameMain = "";
	private static String passwordMain = "";
	
	private static Connection connection = null;
	
	public static Connection getConnection() {
		
		if(useLocalDatabase) {
			try {
				Class.forName("com.mysql.jdbc.Driver");
				connection = DriverManager.getConnection(url,username,password);
				System.out.println("Connected to database successfully.");
			}
			catch(Exception e) {
				System.out.println("Local Database Connection Failed!");
				e.printStackTrace();
			}
			return connection;
		}
		else {
			try {
				Class.forName("com.mysql.jdbc.Driver");
				connection = DriverManager.getConnection(urlMain,usernameMain,passwordMain);
				System.out.println("Connected to database successfully.");
			}
			catch(Exception e) {
				System.out.println("Main Database Connection Failed!");
				e.printStackTrace();
			}
			return connection;
		}
	}
}
