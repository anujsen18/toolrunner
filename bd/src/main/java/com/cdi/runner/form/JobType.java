package com.cdi.runner.form;

import com.cdi.runner.util.ParsableKeyVal;

public class JobType {

	
	private boolean fileIngestion;
	private boolean importfromDatabase;
	private boolean rawAreaArchival;
	private boolean bulkfileProcessing;
	private boolean hDFSRetention;
	private boolean hIVECompaction;
	private boolean exportToFtpServer;
	private boolean exportToDatabase;
	private boolean bulkFileprocessing;
	private boolean dataDeDuplication;
	private boolean automatedDeployment;
	 @ParsableKeyVal(srcName="ingestion")
		private String  sourcename;
	 
	 public void setSourcename(String sourcename) {
		this.sourcename = sourcename;
	}
	 
	 public String getSourcename() {
		return sourcename;
	}
	
	public boolean isFileIngestion() {
		return fileIngestion;
	}
	public void setFileIngestion(boolean fileIngestion) {
		this.fileIngestion = fileIngestion;
	}
	public boolean isImportfromDatabase() {
		return importfromDatabase;
	}
	public void setImportfromDatabase(boolean importfromDatabase) {
		this.importfromDatabase = importfromDatabase;
	}
	public boolean isRawAreaArchival() {
		return rawAreaArchival;
	}
	public void setRawAreaArchival(boolean rawAreaArchival) {
		this.rawAreaArchival = rawAreaArchival;
	}
	public boolean isBulkfileProcessing() {
		return bulkfileProcessing;
	}
	public void setBulkfileProcessing(boolean bulkfileProcessing) {
		this.bulkfileProcessing = bulkfileProcessing;
	}
	public boolean ishDFSRetention() {
		return hDFSRetention;
	}
	public void sethDFSRetention(boolean hDFSRetention) {
		this.hDFSRetention = hDFSRetention;
	}
	public boolean ishIVECompaction() {
		return hIVECompaction;
	}
	public void sethIVECompaction(boolean hIVECompaction) {
		this.hIVECompaction = hIVECompaction;
	}
	public boolean isExportToFtpServer() {
		return exportToFtpServer;
	}
	public void setExportToFtpServer(boolean exportToFtpServer) {
		this.exportToFtpServer = exportToFtpServer;
	}
	public boolean isExportToDatabase() {
		return exportToDatabase;
	}
	public void setExportToDatabase(boolean exportToDatabase) {
		this.exportToDatabase = exportToDatabase;
	}
	public boolean isBulkFileprocessing() {
		return bulkFileprocessing;
	}
	public void setBulkFileprocessing(boolean bulkFileprocessing) {
		this.bulkFileprocessing = bulkFileprocessing;
	}
	public boolean isDataDeDuplication() {
		return dataDeDuplication;
	}
	public void setDataDeDuplication(boolean dataDeDuplication) {
		this.dataDeDuplication = dataDeDuplication;
	}
	public boolean isAutomatedDeployment() {
		return automatedDeployment;
	}
	public void setAutomatedDeployment(boolean automatedDeployment) {
		this.automatedDeployment = automatedDeployment;
	}
	
	
	
	
	
}
