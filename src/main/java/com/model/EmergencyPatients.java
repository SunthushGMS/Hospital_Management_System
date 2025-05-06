package com.model;

public class EmergencyPatients {

	
	private int id;
	private String severity;
	private String problem;
	private String descrition;
	private int doctor_id;
	
	public EmergencyPatients(int id, String severity, String problem, String descrition, int doctor_id) {
		super();
		this.id = id;
		this.severity = severity;
		this.problem = problem;
		this.descrition = descrition;
		this.doctor_id = doctor_id;
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
	public String getDescrition() {
		return descrition;
	}
	public void setDescrition(String descrition) {
		this.descrition = descrition;
	}
	public int getDoctor_id() {
		return doctor_id;
	}
	public void setDoctor_id(int doctor_id) {
		this.doctor_id = doctor_id;
	}
	
	
	
}
