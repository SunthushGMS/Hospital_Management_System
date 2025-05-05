package com.model;

import java.io.InputStream;

public class LabReport {

    private int id;
    private String name;
    private String department;
    private InputStream document;
    private String summary;
    private String description;
    private int patientId;
    private int doctorId;

    public LabReport(int id, String name, String department, InputStream document,
                     String summary, String description, int patientId, int doctorId) {
        this.id = id;
        this.name = name;
        this.department = department;
        this.document = document;
        this.summary = summary;
        this.description = description;
        this.patientId = patientId;
        this.doctorId = doctorId;
    }

    // Getters and Setters
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

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public InputStream getDocument() {
        return document;
    }

    public void setDocument(InputStream document) {
        this.document = document;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPatientId() {
        return patientId;
    }

    public void setPatientId(int patientId) {
        this.patientId = patientId;
    }

    public int getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(int doctorId) {
        this.doctorId = doctorId;
    }
}
