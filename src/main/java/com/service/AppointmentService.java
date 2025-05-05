//By Sharuka
package com.service;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.model.Appointment;
import com.utill.DBConnection;

public class AppointmentService {

    public static boolean insertAppointment(Appointment appointment) {
        boolean result = false;

        try {
            Connection con = DBConnection.getConnection();
            String sql = "INSERT INTO appointment (doctor_id, patient_id, date, time, status) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, appointment.getDoctorId());
            ps.setInt(2, appointment.getPatientId());
            ps.setDate(3, appointment.getAppointmentDate());
            ps.setString(4, appointment.getTime());
            ps.setString(5, appointment.getStatus());

            int rows = ps.executeUpdate();

            if (rows > 0) result = true;

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }

        return result;
    }
}
