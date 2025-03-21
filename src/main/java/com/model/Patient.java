package com.model;

public class Patient extends User {
	
	private String bloodGroup;
	private String gender;
	private String allergies;
	private String medicalHistory;
	private String currentMedication;
	private String notes;
	
	public Patient(int uid, String username, String password, String fullname, String bio, String dob, String email,
			String phone, String address, String language, String profilepic, String role, String bloodGroup,
			String gender, String allergies, String medicalHistory, String currentMedication, String notes) {
		super(uid, username, password, fullname, bio, dob, email, phone, address, language, profilepic, role);
		this.bloodGroup = bloodGroup;
		this.gender = gender;
		this.allergies = allergies;
		this.medicalHistory = medicalHistory;
		this.currentMedication = currentMedication;
		this.notes = notes;
	}

	public Patient(int uid, String username, String password, String fullname, String bio, String dob, String email,
			String phone, String address, String language, String profilepic, String role) {
		super(uid, username, password, fullname, bio, dob, email, phone, address, language, profilepic, role);
	}

	
	public String getBloodGroup() {
		return bloodGroup;
	}

	public String getGender() {
		return gender;
	}

	public String getAllergies() {
		return allergies;
	}

	public String getMedicalHistory() {
		return medicalHistory;
	}

	public String getCurrentMedication() {
		return currentMedication;
	}

	public String getNotes() {
		return notes;
	}

	public void setBloodGroup(String bloodGroup) {
		this.bloodGroup = bloodGroup;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public void setAllergies(String allergies) {
		this.allergies = allergies;
	}

	public void setMedicalHistory(String medicalHistory) {
		this.medicalHistory = medicalHistory;
	}

	public void setCurrentMedication(String currentMedication) {
		this.currentMedication = currentMedication;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}
	
}
