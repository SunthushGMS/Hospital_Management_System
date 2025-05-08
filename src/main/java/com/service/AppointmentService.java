package com.service;

import java.sql.*;
import com.model.Appointment;
import com.utill.DBConnection;

public class AppointmentService {

    public static boolean insertAppointment(Appointment appointment) {
        try (Connection con = DBConnection.getConnection()) {
            String sql = "INSERT INTO appointment (doctor_id, patient_id, date, time, status) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, appointment.getDoctorId());
            ps.setInt(2, appointment.getPatientId());
            ps.setString(3, appointment.getAppointmentDate());
            ps.setString(4, appointment.getTime());
            ps.setString(5, appointment.getStatus());

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean updateAppointment(Appointment appointment) {
        try (Connection con = DBConnection.getConnection()) {
            String sql = "UPDATE appointment SET doctor_id=?, date=?, time=?, status=? WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, appointment.getDoctorId());
            ps.setString(2, appointment.getAppointmentDate());
            ps.setString(3, appointment.getTime());
            ps.setString(4, appointment.getStatus());
            ps.setInt(5, appointment.getId());

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean deleteAppointment(int id) {
        try (Connection con = DBConnection.getConnection()) {
            String sql = "DELETE FROM appointment WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
  
    
    
   
    
    
}
