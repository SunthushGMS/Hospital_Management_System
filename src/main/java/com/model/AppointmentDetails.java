package com.model;
import java.sql.Date;
import java.sql.Time;

public class AppointmentDetails {

	public int appointmentId;
	public int doctorId;
    public int patientId;
    public String patientName;
    public String email;
    public String phone;
    public Date date;
    public Time time;
    public String status;
    
	public AppointmentDetails() {
		
	}

	public AppointmentDetails(int appointmentId,int doctorId, int patientId, String patientName, String email, String phone,
			Date date, Time time, String status) {
		this.appointmentId = appointmentId;
		this.patientId = patientId;
		this.doctorId = doctorId;
		this.patientName = patientName;
		this.email = email;
		this.phone = phone;
		this.date = date;
		this.time = time;
		this.status = status;
	}

	public int getAppointmentId() {
		return appointmentId;
	}

	public void setAppointmentId(int appointmentId) {
		this.appointmentId = appointmentId;
	}

	public int getPatientId() {
		return patientId;
	}

	public void setPatientId(int patientId) {
		this.patientId = patientId;
	}

	public String getPatientName() {
		return patientName;
	}

	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Time getTime() {
		return time;
	}

	public void setTime(Time time) {
		this.time = time;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
	}
	
	
	
	
	
	
	
    
    
    
}
