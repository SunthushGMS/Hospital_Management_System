package com.model;


public class SurgeryRecommendations {

	private int surgery_id;
	private int doctor_id;
	
	public SurgeryRecommendations() {}

	public SurgeryRecommendations(int surgery_id, int doctor_id) {
		super();
		this.surgery_id = surgery_id;
		this.doctor_id = doctor_id;
	}

	public int getSurgery_id() {
		return surgery_id;
	}

	public void setSurgery_id(int surgery_id) {
		this.surgery_id = surgery_id;
	}

	public int getDoctor_id() {
		return doctor_id;
	}

	public void setDoctor_id(int doctor_id) {
		this.doctor_id = doctor_id;
	}

	
	
	
}
