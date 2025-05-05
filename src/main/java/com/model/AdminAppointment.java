package com.model;

public class AdminAppointment extends Appointment{
	
	String patientName;
	String doctorName;
	
	public AdminAppointment(int id, String patientName, String doctorName, String appointmentDate) {
		super(id, appointmentDate);
		this.patientName = patientName;
		this.doctorName = doctorName;
	}

	public String getPatientName() {
		return patientName;
	}

	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}

	public String getDoctorName() {
		return doctorName;
	}

	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}
	
	
	
	
	

}
