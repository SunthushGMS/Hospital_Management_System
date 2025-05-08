package com.model;
import java.sql.Time ;
import java.sql.Date;

public class Surgery {
	private int id;
    private String name;
    private Date date;
    private Time time;
    private String completionStatus; // values: "completed", "in progress", "scheduled"
    private String acceptanceStatus; // values: "accepted", "pending", "rejected"
    private Integer patientId;
    
	public Surgery() {}

	public Surgery(int id, String name, Date date, Time time, String completionStatus, String acceptanceStatus,
			Integer patientId) {
		this.id = id;
		this.name = name;
		this.date = date;
		this.time = time;
		this.completionStatus = completionStatus;
		this.acceptanceStatus = acceptanceStatus;
		this.patientId = patientId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public Integer getPatientId() {
		return patientId;
	}

	public void setPatientId(Integer patientId) {
		this.patientId = patientId;
	}
	
	
	
	

   
}
