package com.model;

public class EmergencyPatientDetails {
    private int surgeryId;
    private String patientName;
    private String phone;
    private String problem;
    private String severity;
    private String description;
    
	public EmergencyPatientDetails() {}

	public EmergencyPatientDetails(int surgeryId, String patientName, String phone, String problem, String severity,
			String description) {
		super();
		this.surgeryId = surgeryId;
		this.patientName = patientName;
		this.phone = phone;
		this.problem = problem;
		this.severity = severity;
		this.description = description;
	}

	public int getSurgeryId() {
		return surgeryId;
	}

	public void setSurgeryId(int surgeryId) {
		this.surgeryId = surgeryId;
	}

	public String getPatientName() {
		return patientName;
	}

	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getProblem() {
		return problem;
	}

	public void setProblem(String problem) {
		this.problem = problem;
	}

	public String getSeverity() {
		return severity;
	}

	public void setSeverity(String severity) {
		this.severity = severity;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	
    

}
