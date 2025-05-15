package com.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import com.model.SupportRequests;
import com.utill.DBConnection; // Make sure this exists and returns a valid DB connection

public class SupportService {
	
	private static DBConnection database = DBConnection.getInstance();
    
    public static boolean insertSupportRequest(SupportRequests request) {
        try {
        	Connection con = database.getConnection();
            String query = "INSERT INTO support_requests (name, email, phone, message, reply, status) VALUES (?, ?, ?, ?, ?, ?)";
            
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, request.getName());
            pstmt.setString(2, request.getEmail());
            pstmt.setString(3, request.getPhone());
            pstmt.setString(4, request.getMessage());
            pstmt.setString(5, request.getReply());   // This is usually empty at insert
            pstmt.setString(6, request.getStatus());  // Set to 'pending' by default
            
            int result = pstmt.executeUpdate();
            con.close();
            return result > 0;
            
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
