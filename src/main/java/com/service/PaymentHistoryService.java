package com.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.model.Payment;
import com.utill.DBConnection;

public class PaymentHistoryService {

    public static List<Payment> getAllPayments() {
        List<Payment> payments = new ArrayList<>();

        String query = "SELECT * FROM paymentmake";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Payment payment = new Payment();
                payment.setId(rs.getInt("payID"));
                payment.setFullName(rs.getString("fullname"));
                payment.setPatientId(rs.getString("patientID"));
                payment.setPhone(rs.getString("phone"));
                payment.setEmail(rs.getString("email"));
                payment.setService(rs.getString("service"));
                payment.setAmount(rs.getDouble("amount"));

                payments.add(payment);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return payments;
    }

    public static List<Payment> getPaymentsByPatientId(int patientId) {
        List<Payment> payments = new ArrayList<>();
        String query = "SELECT * FROM paymentmake WHERE patientID = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, patientId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Payment payment = new Payment();
                payment.setId(rs.getInt("payID"));
                payment.setFullName(rs.getString("fullname"));
                payment.setPatientId(rs.getString("patientID"));
                payment.setPhone(rs.getString("phone"));
                payment.setEmail(rs.getString("email"));
                payment.setService(rs.getString("service"));
                payment.setAmount(rs.getDouble("amount"));

                payments.add(payment);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return payments;
    }
    
}
