package com.college.admission_system;

public class Application {
	
	    private int id;
	    private String fullName;
	    private String email;
	    private String phone;
	    private String course;
	    private String status;
	    private String appliedDate;
	    
	    // Constructors
	    public Application() {}
	    
	    public Application(int id, String fullName, String email, String phone, 
	                      String course, String status, String appliedDate) {
	        this.id = id;
	        this.fullName = fullName;
	        this.email = email;
	        this.phone = phone;
	        this.course = course;
	        this.status = status;
	        this.appliedDate = appliedDate;
	    }
	    
	    // Getters and Setters
	    public int getId() { return id; }
	    public void setId(int id) { this.id = id; }
	    
	    public String getFullName() { return fullName; }
	    public void setFullName(String fullName) { this.fullName = fullName; }
	    
	    public String getEmail() { return email; }
	    public void setEmail(String email) { this.email = email; }
	    
	    public String getPhone() { return phone; }
	    public void setPhone(String phone) { this.phone = phone; }
	    
	    public String getCourse() { return course; }
	    public void setCourse(String course) { this.course = course; }
	    
	    public String getStatus() { return status; }
	    public void setStatus(String status) { this.status = status; }
	    
	    public String getAppliedDate() { return appliedDate; }
	    public void setAppliedDate(String appliedDate) { this.appliedDate = appliedDate; }
	}


