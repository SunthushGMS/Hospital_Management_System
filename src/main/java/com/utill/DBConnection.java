package com.utill;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	
	private static boolean useLocalDatabase = CommonUtill.properties.getProperty("useLocalDatabase").equals("true") ? true : false;
	
	private static Connection connection = null;
	
	public static Connection getConnection() {
		
		if(useLocalDatabase) {
			try {
				Class.forName("com.mysql.jdbc.Driver");
				connection = DriverManager.getConnection(CommonUtill.properties.getProperty("url"),CommonUtill.properties.getProperty("username"),CommonUtill.properties.getProperty("password"));
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
				connection = DriverManager.getConnection(CommonUtill.properties.getProperty("remoteurl"),CommonUtill.properties.getProperty("remoteusername"),CommonUtill.properties.getProperty("remotepassword"));
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
