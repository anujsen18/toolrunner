package com.cdi.runner.form;

public class ScheduledJobForm {

	private String 	schMin;
	private	String schHour;
	private String  schDay;
	private String schMonth;
	private String schWeekDay;
	
	private String JobName;
	
	private String env;
	private String sourceName;
	private String operation;
	private String  schYear;
	private String schSec;
	public String getSchYear() {
		return schYear;
	}
	public void setSchYear(String schYear) {
		this.schYear = schYear;
	}
	public String getSchSec() {
		return schSec;
	}
	public void setSchSec(String schSec) {
		this.schSec = schSec;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	private String status;
	
	
	public String getSchMin() {
		return schMin;
	}
	public void setSchMin(String schMin) {
		this.schMin = schMin;
	}
	public String getSchHour() {
		return schHour;
	}
	public void setSchHour(String schHour) {
		this.schHour = schHour;
	}
	public String getSchDay() {
		return schDay;
	}
	public void setSchDay(String schDay) {
		this.schDay = schDay;
	}
	public String getSchMonth() {
		return schMonth;
	}
	public void setSchMonth(String schMonth) {
		this.schMonth = schMonth;
	}
	public String getSchWeekDay() {
		return schWeekDay;
	}
	public void setSchWeekDay(String schWeekDay) {
		this.schWeekDay = schWeekDay;
	}
	public String getJobName() {
		return JobName;
	}
	public void setJobName(String jobName) {
		JobName = jobName;
	}
	public String getEnv() {
		return env;
	}
	public void setEnv(String env) {
		this.env = env;
	}
	
	public String getSourceName() {
		return sourceName;
	}
	
	public void setSourceName(String sourceName) {
		this.sourceName = sourceName;
	}
	public String getOperation() {
		return operation;
	}
	public void setOperation(String operation) {
		this.operation = operation;
	}
	
	
	public ScheduledJobForm() {
		// TODO Auto-generated constructor stub
	}
	
	public ScheduledJobForm(String str) {
		//acceept string in form  3 * * * * /ingestion/prod/apps/bulk_ingestion/ingestion_runner.sh  -e=prod -s=cdr_source -t=help
		str= str.replaceAll("\\s+", " ");
		String [] split= str.split(" ");
	
	this.setSchMin(split[0]);
	this.setSchHour(split[1]);
	this.setSchDay(split[2]);
	this.setSchMonth(split[3]);
	this.setSchWeekDay(split[4]);
	
	this.setJobName(split[5].split("/")[split[5].split("/").length-1]);
	
	this.setEnv(split[6].substring(3));
	this.setSourceName(split[7].substring(3));
	this.setOperation(split[8].substring(3));
	}
	
	
}
