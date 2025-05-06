package com.model;

public class Surgery {
    private int id;
    private String name;
    private String date;
    private String time;

    public Surgery(String name, String date, String time) {
        this.name = name;
        this.date = date;
        this.time = time;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public String getDate() {
        return date;
    }

    public String getTime() {
        return time;
    }
}
