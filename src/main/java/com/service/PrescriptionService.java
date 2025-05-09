package com.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.model.Drug;

public class PrescriptionService {
    private ArrayList<Drug> drugList = new ArrayList<>();

    // Store prescription notes per patient ID
    private Map<Integer, String> dietaryAdvices = new HashMap<>();
    private Map<Integer, String> doctorNotes = new HashMap<>();

    public ArrayList<Drug> getAllDrugs() {
        return drugList;
    }

    public void addDrug(Drug drug) {
        drugList.add(drug);
    }

    public void savePrescriptionDetails(int patientId, String dietaryAdvice, String doctorNote) {
        dietaryAdvices.put(patientId, dietaryAdvice);
        doctorNotes.put(patientId, doctorNote);
    }

    public String getDietaryAdvice(int patientId) {
        return dietaryAdvices.getOrDefault(patientId, "");
    }

    public String getDoctorNote(int patientId) {
        return doctorNotes.getOrDefault(patientId, "");
    }
}
