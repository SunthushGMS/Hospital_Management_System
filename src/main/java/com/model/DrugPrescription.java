package com.model;

public class DrugPrescription {

	private int prescription_id;
	private int drug_id;
	public DrugPrescription(int prescription_id, int drug_id) {
		super();
		this.prescription_id = prescription_id;
		this.drug_id = drug_id;
	}
	public int getPrescription_id() {
		return prescription_id;
	}
	public void setPrescription_id(int prescription_id) {
		this.prescription_id = prescription_id;
	}
	public int getDrug_id() {
		return drug_id;
	}
	public void setDrug_id(int drug_id) {
		this.drug_id = drug_id;
	}
	
	
}
