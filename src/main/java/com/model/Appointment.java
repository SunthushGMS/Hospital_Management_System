package com.model;

public class Appointment {
    private int id;
    private int doctorId;
    private int patientId;
    private String appointmentDate;
    private String time;
    private String status;

    public Appointment() {}

    public Appointment(int id, int doctorId, int patientId, String appointmentDate, String time, String status) {
        this.id = id;
        this.doctorId = doctorId;
        this.patientId = patientId;
        this.appointmentDate = appointmentDate;
        this.time = time;
        this.status = status;
    }
    public Appointment(int doctorId, int patientId, String appointmentDate, String time, String status) {
        this.doctorId = doctorId;
        this.patientId = patientId;
        this.appointmentDate = appointmentDate;
        this.time = time;
        this.status = status;
    }

	public Appointment(int id, String appointmentDate) {
		this.id = id;
		this.appointmentDate = appointmentDate;
	}


	public int getId() {
		return id;
	}

	public int getDoctorId() {
		return doctorId;
	}

	public int getPatientId() {
		return patientId;
	}

	public String getAppointmentDate() {
		return appointmentDate;
	}

	public String getTime() {
		return time;
	}

	public String getStatus() {
		return status;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
	}

	public void setPatientId(int patientId) {
		this.patientId = patientId;
	}

	public void setAppointmentDate(String appointmentDate) {
		this.appointmentDate = appointmentDate;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
