package com.model;
import java.sql.Date;
import java.util.ArrayList;

public class Prescription {
	private int id;
	private Date date_of_issue;
	private String dietary_advice;
	private String doctors_notes;
	private int doctor_id;
	private int patient_id;
	
	
	Prescription(){}


	public Prescription(int id, Date date_of_issue, String dietary_advice, String doctors_notes, int doctor_id,
			int patient_id) {
		this.id = id;
		this.date_of_issue = date_of_issue;
		this.dietary_advice = dietary_advice;
		this.doctors_notes = doctors_notes;
		this.doctor_id = doctor_id;
		this.patient_id = patient_id;
	}
	
	public Prescription( int doctor_id,int patient_id,Date date_of_issue, String dietary_advice, String doctors_notes, int id) {
		super();
		this.id = id;
		this.date_of_issue = date_of_issue;
		this.dietary_advice = dietary_advice;
		this.doctors_notes = doctors_notes;
		this.doctor_id = doctor_id;
		this.patient_id = patient_id;
	}
	


	public Prescription(int patientId, ArrayList<Drug> drugList, String dietaryAdvice, String doctorNotes) {
		// TODO Auto-generated constructor stub
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public Date getDate_of_issue() {
		return date_of_issue;
	}


	public void setDate_of_issue( Date date_of_issue) {
		this.date_of_issue = date_of_issue;
	}


	public String getDietary_advice() {
		return dietary_advice;
	}


	public void setDietary_advice(String dietary_advice) {
		this.dietary_advice = dietary_advice;
	}


	public String getDoctors_notes() {
		return doctors_notes;
	}


	public void setDoctors_notes(String doctors_notes) {
		this.doctors_notes = doctors_notes;
	}


	public int getDoctor_id() {
		return doctor_id;
	}


	public void setDoctor_id(int doctor_id) {
		this.doctor_id = doctor_id;
	}


	public int getPatient_id() {
		return patient_id;
	}


	public void setPatient_id(int patient_id) {
		this.patient_id = patient_id;
	};
	
	

}
