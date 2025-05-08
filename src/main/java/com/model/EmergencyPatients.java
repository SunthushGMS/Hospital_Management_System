package com.model;

public class EmergencyPatients {

	
	private int id;
	private String severity;
	private String problem;
	private String description;
	private int doctor_id;
	private int patient_id;
	
	
	
	public EmergencyPatients() {}
	
	public EmergencyPatients(int id, String severity, String problem, String description, int doctor_id,int patient_id) {
		this.id = id;
		this.severity = severity;
		this.problem = problem;
		this.description = description;
		this.doctor_id = doctor_id;
		this.patient_id=patient_id;
	}
	public EmergencyPatients(String severity2, String problem2, String description2, Integer currentUserId,
			int patientId) {
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSeverity() {
		return severity;
	}
	public void setSeverity(String severity) {
		this.severity = severity;
	}
	public String getProblem() {
		return problem;
	}
	public void setProblem(String problem) {
		this.problem = problem;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
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
	}

	
	
	
	
	
}
