package com.model;

public class User {
	
	private int uid;
	private String username;
	private String password;
	private String fullname;
	private String bio;
	private String dob;
	private String email;
	private String phone;
	private String address;
	private String language;
	private String profilepic;
	private String role;
	
	public User(int uid, String username, String password, String fullname, String bio, String dob, String email,
			String phone, String address, String language, String profilepic, String role) {
		super();
		this.uid = uid;
		this.username = username;
		this.password = password;
		this.fullname = fullname;
		this.bio = bio;
		this.dob = dob;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.language = language;
		this.profilepic = profilepic;
		this.role = role;
	}

	public User(String username, String password, String fullname, String bio, String dob, String email, String phone,
			String address, String language, String profilepic, String role) {
		super();
		this.username = username;
		this.password = password;
		this.fullname = fullname;
		this.bio = bio;
		this.dob = dob;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.language = language;
		this.profilepic = profilepic;
		this.role = role;
	}
	

	public User(int uid, String username, String password, String fullname, String dob, String email, String phone,
			String address, String role) {
		super();
		this.uid = uid;
		this.username = username;
		this.password = password;
		this.fullname = fullname;
		this.dob = dob;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.role = role;
	}

	public int getUid() {
		return uid;
	}

	public String getUsername() {
		return username;
	}

	public String getPassword() {
		return password;
	}

	public String getFullname() {
		return fullname;
	}

	public String getBio() {
		return bio;
	}

	public String getDob() {
		return dob;
	}

	public String getEmail() {
		return email;
	}

	public String getPhone() {
		return phone;
	}

	public String getAddress() {
		return address;
	}

	public String getLanguage() {
		return language;
	}

	public String getProfilepic() {
		return profilepic;
	}

	public String getRole() {
		return role;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public void setBio(String bio) {
		this.bio = bio;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public void setProfilepic(String profilepic) {
		this.profilepic = profilepic;
	}

	public void setRole(String role) {
		this.role = role;
	}

}
