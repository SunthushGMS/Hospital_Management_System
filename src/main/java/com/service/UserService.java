package com.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.model.User;
import com.utill.DBConnection;

public class UserService {
	
	public static User getUserByUsername(String username) {
		
		User user = null;
		
		try {
			Connection con = DBConnection.getConnection();
			Statement stmt = con.createStatement();
			String query = "SELECT * FROM User WHERE username = '" + username + "' LIMIT 1";
			ResultSet rs = stmt.executeQuery(query);
			
			if(rs.next()) {
				int uid = rs.getInt("uid");
				String uname = rs.getString("username");
				String password = rs.getString("password");
				String fullname = rs.getString("fullname");
				String bio = rs.getString("bio");
				String dob = rs.getString("dateofbirth");
				String email = rs.getString("email");
				String phone = rs.getString("phone_no");
				String address = rs.getString("address");
				String language = rs.getString("language");
				String profilepic = rs.getString("profilepiclink");
				String role = rs.getString("role");
				
				user = new User(uid, uname, password, fullname, bio, dob, email, phone, address, language, profilepic, role);
				
				con.close();
				return user;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		
		return null;
	}

}
