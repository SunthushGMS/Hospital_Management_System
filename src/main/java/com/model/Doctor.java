package com.model;

public class Doctor extends User {
	
	private String specialization;
	private String license;
	private String experience;
	private String publicbio;
	
	public Doctor(int uid, String username, String password, String fullname, String bio, String dob, String email,
			String phone, String address, String language, String profilepic, String role, String specialization,
			String license, String experience, String publicbio) {
		super(uid, username, password, fullname, bio, dob, email, phone, address, language, profilepic, role);
		this.specialization = specialization;
		this.license = license;
		this.experience = experience;
		this.publicbio = publicbio;
	}
	
	

	public Doctor(int uid, String username, String password, String fullname, String dob, String email,
			String phone, String address, String specialization, String role) {
		super(uid, username, password, fullname, dob, email, phone, address, role);
		this.specialization = specialization;
	}



	public String getSpecialization() {
		return specialization;
	}

	public String getLicense() {
		return license;
	}

	public String getExperience() {
		return experience;
	}

	public String getPublicbio() {
		return publicbio;
	}

	public void setSpecialization(String specialization) {
		this.specialization = specialization;
	}

	public void setLicense(String license) {
		this.license = license;
	}

	public void setExperience(String experience) {
		this.experience = experience;
	}

	public void setPublicbio(String publicbio) {
		this.publicbio = publicbio;
	}

}
