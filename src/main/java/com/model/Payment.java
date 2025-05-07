package com.model;

public class Payment {

    private int id;
    private String fullName;
    private String patientId;
    private String phone;
    private String email;
    private String service;
    private double amount;

    public Payment() {}

    public Payment(int id, String fullName, String patientId, String phone, String email, String service, double amount) {
        this.id = id;
        this.fullName = fullName;
        this.patientId = patientId;
        this.phone = phone;
        this.email = email;
        this.service = service;
        this.amount = amount;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }

    public String getPatientId() { return patientId; }
    public void setPatientId(String patientId) { this.patientId = patientId; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getService() { return service; }
    public void setService(String service) { this.service = service; }

    public double getAmount() { return amount; }
    public void setAmount(double amount) { this.amount = amount; }

    @Override
    public String toString() {
        return "Payment{" +
                "id=" + id +
                ", fullName='" + fullName + '\'' +
                ", patientId='" + patientId + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", service='" + service + '\'' +
                ", amount=" + amount +
                '}';
    }
}
