package com.model;

import java.sql.Date;

public class Appointment {
	
	private int id;
	private String patientName;
	private String email;
	private String contact;
	private int age;
	private String gender;
	private String doctorName;
	private Date appointmentDate;
	private String reason;
	
	//constructor
	public Appointment() {}
	
	public Appointment(int id, String patientName, String email, String contact, int age, String gender, String doctorName, Date appointmentDate, String reason) {
		
		this.id = id;
		this.patientName = patientName;
		this.email = email;
		this.contact = contact;
		this.age = age;
		this.gender = gender;
		this.doctorName = doctorName;
		this.appointmentDate = appointmentDate;
		this.reason = reason;
		
	}
	//getters and setters
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getDoctorName() {
		return doctorName;
	}

	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}

	public Date getAppointmentDate() {
		return appointmentDate;
	}

	public void setAppointmentDate(Date appointmentDate) {
		this.appointmentDate = appointmentDate;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}
	
}
	
	
	
	
	
