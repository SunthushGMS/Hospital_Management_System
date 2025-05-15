package com.service;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.model.Payment;
import com.utill.DBConnection;

public class PaymentService {
	
	private static DBConnection database = DBConnection.getInstance();

    public static boolean makePayment(Payment payment) {
        boolean result = false;

        try {
            Connection con = database.getConnection();

            String query = "INSERT INTO paymentMake (fullname, patientID, phone, email, service, amount) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, payment.getFullName());
            ps.setString(2, payment.getPatientId());
            ps.setString(3, payment.getPhone());
            ps.setString(4, payment.getEmail());
            ps.setString(5, payment.getService());
            ps.setDouble(6, payment.getAmount());

            int success = ps.executeUpdate();

            if (success > 0) {
                result = true;
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }
}
