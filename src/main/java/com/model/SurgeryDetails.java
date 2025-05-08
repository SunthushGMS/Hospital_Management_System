package com.model;
import java.sql.Date;
import java.sql.Time;


public class SurgeryDetails {

	private int patientId;
    private String patientName;
    private String phone;
    private int surgeryId;
    private String surgeryName;
    private String description;
    private Date date;
    private Time time;
    private String completionStatus;
    private String acceptanceStatus;
    
	public SurgeryDetails() {
		
	}

	public SurgeryDetails(int patientId, String patientName, String phone, int surgeryId, String surgeryName,
			String description, Date date, Time time, String completionStatus, String acceptanceStatus) {
		super();
		this.patientId = patientId;
		this.patientName = patientName;
		this.phone = phone;
		this.surgeryId = surgeryId;
		this.surgeryName = surgeryName;
		this.description = description;
		this.date = date;
		this.time = time;
		this.completionStatus = completionStatus;
		this.acceptanceStatus = acceptanceStatus;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getSurgeryId() {
		return surgeryId;
	}

	public void setSurgeryId(int surgeryId) {
		this.surgeryId = surgeryId;
	}

	public String getSurgeryName() {
		return surgeryName;
	}

	public void setSurgeryName(String surgeryName) {
		this.surgeryName = surgeryName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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

	public String getCompletionStatus() {
		return completionStatus;
	}

	public void setCompletionStatus(String completionStatus) {
		this.completionStatus = completionStatus;
	}

	public String getAcceptanceStatus() {
		return acceptanceStatus;
	}

	public void setAcceptanceStatus(String acceptanceStatus) {
		this.acceptanceStatus = acceptanceStatus;
	}
    
	
	
    
}
