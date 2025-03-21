package com.model;

public class Admin extends User {
	
	private String role;
	private String publicbio;
	private String datejoined;
	private String accesslevel;
	
	public Admin(int uid, String username, String password, String fullname, String bio, String dob, String email,
			String phone, String address, String language, String profilepic, String role, String role2,
			String publicbio, String datejoined, String accesslevel) {
		super(uid, username, password, fullname, bio, dob, email, phone, address, language, profilepic, role);
		role = role2;
		this.publicbio = publicbio;
		this.datejoined = datejoined;
		this.accesslevel = accesslevel;
	}

	public String getRole() {
		return role;
	}

	public String getPublicbio() {
		return publicbio;
	}

	public String getDatejoined() {
		return datejoined;
	}

	public String getAccesslevel() {
		return accesslevel;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public void setPublicbio(String publicbio) {
		this.publicbio = publicbio;
	}

	public void setDatejoined(String datejoined) {
		this.datejoined = datejoined;
	}

	public void setAccesslevel(String accesslevel) {
		this.accesslevel = accesslevel;
	}
	
}
