package com.model;

public class Drug {
	private int drugId;
    private String drugName;
    private String dosage;
    private String frequency;
    private String duration;
    private String instruction;
    
    
	public Drug() {}


	public Drug(int drugId, String drugName, String dosage, String frequency, String duration, String instruction) {
		super();
		this.drugId = drugId;
		this.drugName = drugName;
		this.dosage = dosage;
		this.frequency = frequency;
		this.duration = duration;
		this.instruction = instruction;
	}


	public int getDrugId() {
		return drugId;
	}


	public void setDrugId(int drugId) {
		this.drugId = drugId;
	}


	public String getDrugName() {
		return drugName;
	}


	public void setDrugName(String drugName) {
		this.drugName = drugName;
	}


	public String getDosage() {
		return dosage;
	}


	public void setDosage(String dosage) {
		this.dosage = dosage;
	}


	public String getFrequency() {
		return frequency;
	}


	public void setFrequency(String frequency) {
		this.frequency = frequency;
	}


	public String getDuration() {
		return duration;
	}


	public void setDuration(String duration) {
		this.duration = duration;
	}


	public String getInstruction() {
		return instruction;
	}


	public void setInstruction(String instruction) {
		this.instruction = instruction;
	};
	
	
    
    
    
	
}
