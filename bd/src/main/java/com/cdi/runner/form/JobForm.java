package com.cdi.runner.form;

public class JobForm {
private String source;
private String env;
private String jobtype;


public String getSource() {
	return source;
}
public void setSource(String source) {
	this.source = source;
}
public String getEnv() {
	return env;
}
public void setEnv(String env) {
	this.env = env;
}
public String getJobtype() {
	return jobtype;
}
public void setJobtype(String jobtype) {
	this.jobtype = jobtype;
}
public JobForm(String source, String env, String jobtype) {
	super();
	this.source = source;
	this.env = env;
	this.jobtype = jobtype;
}
	 public JobForm() {
		// TODO Auto-generated constructor stub
	}


	
}
