package com.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


import com.model.EmergencyPatientDetails;
import com.model.AppointmentDetails;
import com.model.SurgeryDetails;
import com.utill.DBConnection;

public class doctorDashboardService {
	
	public List<AppointmentDetails> getPendingAppointments(int doctorId) throws SQLException {
	    List<AppointmentDetails> pendingAppointments = new ArrayList<>();

	    String sql = "SELECT appointmentId, doctorId, patientId, patientName, email, phone, date, time, status FROM AppointmentDetailsView WHERE status = 'pending' AND doctorId = ?";

	    try (
	        Connection con = DBConnection.getConnection();
	        PreparedStatement pstmt = con.prepareStatement(sql)
	    ) {
	        pstmt.setInt(1, doctorId);
	        ResultSet rs = pstmt.executeQuery();

	        while (rs.next()) {
	            AppointmentDetails ad = new AppointmentDetails(
	                    rs.getInt("appointmentId"),
	                    rs.getInt("doctorId"),
	                    rs.getInt("patientId"),
	                    rs.getString("patientName"),
	                    rs.getString("email"),
	                    rs.getString("phone"),
	                    rs.getDate("date"),
	                    rs.getTime("time"),
	                    rs.getString("status")
	            );
	            pendingAppointments.add(ad);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();  // Log errors
	    }

	    return pendingAppointments;
	}

    
    
    
	public List<AppointmentDetails> getTodayAppointments(int doctorId) throws SQLException {
	    List<AppointmentDetails> todayAppointments = new ArrayList<>();

	    String sql = "SELECT appointmentId, patientId, patientName, email, phone, date, time " +
	             "FROM AppointmentDetailsView " +
	             "WHERE date = CURDATE() AND doctorId = ? AND status = 'accepted' " +
	             "ORDER BY time ASC";


	    try (
	        Connection con = DBConnection.getConnection();
	        PreparedStatement pstmt = con.prepareStatement(sql)
	    ) {
	        pstmt.setInt(1, doctorId);
	        ResultSet rs = pstmt.executeQuery();

	        while (rs.next()) {
	            AppointmentDetails ad = new AppointmentDetails();
	            ad.setAppointmentId(rs.getInt("appointmentId"));
	            ad.setPatientId(rs.getInt("patientId"));
	            ad.setPatientName(rs.getString("patientName"));
	            ad.setEmail(rs.getString("email"));
	            ad.setPhone(rs.getString("phone"));
	            ad.setDate(rs.getDate("date"));
	            ad.setTime(rs.getTime("time"));
	            todayAppointments.add(ad);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return todayAppointments;
	}
	
	
	
	
	
	public List<AppointmentDetails> getCompletedAppointments(int doctorId) throws SQLException {
	    List<AppointmentDetails> completedAppointments = new ArrayList<>();

	    String sql = "SELECT appointmentId, patientId, patientName, email, phone, date, time " +
	                 "FROM AppointmentDetailsView " +
	                 "WHERE doctorId = ? AND status = 'completed' " +
	                 "ORDER BY date ASC, time ASC";

	    try (
	        Connection con = DBConnection.getConnection();
	        PreparedStatement pstmt = con.prepareStatement(sql)
	    ) {
	        pstmt.setInt(1, doctorId);
	        ResultSet rs = pstmt.executeQuery();

	        while (rs.next()) {
	            AppointmentDetails ad = new AppointmentDetails();
	            ad.setAppointmentId(rs.getInt("appointmentId"));
	            ad.setPatientId(rs.getInt("patientId"));
	            ad.setPatientName(rs.getString("patientName"));
	            ad.setEmail(rs.getString("email"));
	            ad.setPhone(rs.getString("phone"));
	            ad.setDate(rs.getDate("date"));
	            ad.setTime(rs.getTime("time"));
	            completedAppointments.add(ad);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return completedAppointments;
	}



    
    
	
	
	
	
	public List<AppointmentDetails> getIncompletedAppointments(int doctorId) throws SQLException {
	    List<AppointmentDetails> incompletedAppointments = new ArrayList<>();

	    String sql = "SELECT appointmentId, patientId, patientName, email, phone, date, time " +
	                 "FROM AppointmentDetailsView " +
	                 "WHERE doctorId = ? AND status = 'accepted' " +
	                 "ORDER BY date ASC, time ASC";

	    try (
	        Connection con = DBConnection.getConnection();
	        PreparedStatement pstmt = con.prepareStatement(sql)
	    ) {
	        pstmt.setInt(1, doctorId);
	        ResultSet rs = pstmt.executeQuery();

	        while (rs.next()) {
	            AppointmentDetails ad = new AppointmentDetails();
	            ad.setAppointmentId(rs.getInt("appointmentId"));
	            ad.setPatientId(rs.getInt("patientId"));
	            ad.setPatientName(rs.getString("patientName"));
	            ad.setEmail(rs.getString("email"));
	            ad.setPhone(rs.getString("phone"));
	            ad.setDate(rs.getDate("date"));
	            ad.setTime(rs.getTime("time"));
	            incompletedAppointments.add(ad);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return incompletedAppointments;
	}

    
    
    
    
    public List<AppointmentDetails> getTodayTopAppointments() throws SQLException {
        List<AppointmentDetails> todayAppointments = new ArrayList<>();
        
        try {
            Connection con = DBConnection.getConnection();
            Statement stmt = con.createStatement();
            String sql = "SELECT appointmentId, patientId, patientName, time " +
                         "FROM AppointmentDetailsView " +
                         "WHERE date = CURDATE() " +
                         "ORDER BY time ASC " +
                         "LIMIT 5";
            ResultSet rs = stmt.executeQuery(sql);
            
            while (rs.next()) {
                AppointmentDetails ad = new AppointmentDetails();
                ad.setAppointmentId(rs.getInt("appointmentId"));
                ad.setPatientId(rs.getInt("patientId"));
                ad.setPatientName(rs.getString("patientName"));
                ad.setTime(rs.getTime("time"));
                todayAppointments.add(ad);
            }
                        
        } catch (Exception e) {
            e.printStackTrace();
        }

        return todayAppointments;
    }
    
    
    
    
    
    public List<AppointmentDetails> getNewPendingAppointments() throws SQLException {
        List<AppointmentDetails> newPendingAppointments = new ArrayList<>();
        
        try {
            Connection con = DBConnection.getConnection();
            Statement stmt = con.createStatement();
            String sql = "SELECT appointmentId, patientId, patientName, time " +
                         "FROM AppointmentDetailsView " +
                         "WHERE status = 'pending' " +
                         "ORDER BY appointmentId DESC " +
                         "LIMIT 5";
            ResultSet rs = stmt.executeQuery(sql);
            
            while (rs.next()) {
                AppointmentDetails ad = new AppointmentDetails();
                ad.setAppointmentId(rs.getInt("appointmentId"));
                ad.setPatientId(rs.getInt("patientId"));
                ad.setPatientName(rs.getString("patientName"));
                ad.setTime(rs.getTime("time"));
                newPendingAppointments.add(ad);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return newPendingAppointments;
    }
    
    
    
    public List<SurgeryDetails> getWeeklyScheduledSurgeriesForDoctor(int doctorId) throws SQLException {
        List<SurgeryDetails> scheduledSurgeries = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();
            Statement stmt = con.createStatement();

            String sql = "SELECT s.id AS surgeryId, u.uid AS patientId, u.fullname AS patientName, u.phone_no AS phone, " +
                         "       s.name AS surgeryName, s.date, s.time, s.completion_status, s.acceptance_status " +
                         "FROM Surgery s, Surgery_Recommendations sr, User u " +
                         "WHERE s.id = sr.surgery_id " +
                         "  AND s.patient_id = u.uid " +
                         "  AND sr.doctor_id = " + doctorId + " " +
                         "  AND s.completion_status = 'scheduled' " +
                         "  AND s.date BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 7 DAY)";

            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                SurgeryDetails sd = new SurgeryDetails();
                sd.setSurgeryId(rs.getInt("surgeryId"));
                sd.setPatientId(rs.getInt("patientId"));
                sd.setPatientName(rs.getString("patientName"));
                sd.setPhone(rs.getString("phone"));
                sd.setSurgeryName(rs.getString("surgeryName"));
                sd.setDate(rs.getDate("date"));
                sd.setTime(rs.getTime("time"));
                sd.setCompletionStatus(rs.getString("completion_status"));
                sd.setAcceptanceStatus(rs.getString("acceptance_status"));

                scheduledSurgeries.add(sd);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return scheduledSurgeries;
    }
    
    
    
    public List<EmergencyPatientDetails> getAllEmergencyPatientDetails() throws SQLException {
    	List<EmergencyPatientDetails> emergencyList = new ArrayList<>();

    	
    	String sql = "SELECT surgeryId, patientName, phone, problem, severity, description FROM EmergencyPatientDetails";

    	try (Connection con = DBConnection.getConnection();
    	     Statement stmt = con.createStatement();
    	     ResultSet rs = stmt.executeQuery(sql)) {

    	    while (rs.next()) {
    	        EmergencyPatientDetails epd = new EmergencyPatientDetails();
    	        epd.setSurgeryId(rs.getInt("surgeryId"));
    	        epd.setPatientName(rs.getString("patientName"));
    	        epd.setPhone(rs.getString("phone"));
    	        epd.setProblem(rs.getString("problem"));
    	        epd.setSeverity(rs.getString("severity"));
    	        epd.setDescription(rs.getString("description"));
    	        emergencyList.add(epd);
    	    }

    	} catch (Exception e) {
    	    e.printStackTrace();
    	}

    	return emergencyList;

    }
    
    
    
    
    
    
    
    public boolean updateAppointmentStatusToAccepted(int id) {
        String sql = "UPDATE appointment SET status = 'accepted' WHERE id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            
            pstmt.setInt(1, id);
            int updated = pstmt.executeUpdate();
            return updated > 0;
            
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    
    
    public boolean updateAppointmentStatusToReschedule(int id) {
        String sql = "UPDATE appointment SET status = 'reschedule' WHERE id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            
            pstmt.setInt(1, id);
            int updated = pstmt.executeUpdate();
            return updated > 0;
            
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    
    
    
    
    public boolean updateAppointmentStatusToCompleted(int id) {
        String sql = "UPDATE appointment SET status = 'completed' WHERE id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            
            pstmt.setInt(1, id);
            int updated = pstmt.executeUpdate();
            return updated > 0;
            
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }


    
    
}
