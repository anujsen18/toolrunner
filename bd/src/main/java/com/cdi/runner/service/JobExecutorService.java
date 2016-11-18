package com.cdi.runner.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import com.cdi.runner.JobExecutor;
import com.cdi.runner.form.JobForm;
import com.cdi.runner.form.ScheduledJobForm;
import com.cdi.runner.form.SourceForm;
import com.cdi.runner.util.FeildValConverter;

public class JobExecutorService {

	String rootpath="/ingestion/test/apps/bulk_ingestion/conf/";
	
	// business method for saving the fields in to respected file 
public void writeFileToServer(SourceForm sf) throws IllegalAccessException{
   JobExecutor jb=	new JobExecutor(); 
   Map<String,String> strval=	FeildValConverter.getJobSpecKeyValMap(sf, SourceForm.class);
   for (Entry<String,String> str : strval.entrySet()) {
		System.out.println(str.getKey() +": "+str.getValue());
		jb.createDirforsource(rootpath+sf.getSourcename());
		jb.WriteFileServer(str.getValue(), rootpath+sf.getSourcename()+"/", getfileNameformsoruce(str.getKey()));
		
	}
 
	}
	

private String getfileNameformsoruce(String sourceName){
	String sourcefileName="";
	if(sourceName.equals("ingestion"))
		sourcefileName="config.properties";
	if(sourceName.equals("headerfooter"))
		sourcefileName="validate_header_footer_proper.sh";
	if(sourceName.equals("hiveloader"))
		sourcefileName="hiveloader.properties";
	return sourcefileName;
}


public List  getListOfSchedledJob() {
	JobExecutor jb=	new JobExecutor(); 
  ArrayList<ScheduledJobForm> listscjf = new  ArrayList<ScheduledJobForm>();
	String str= jb.commandexecutor("echo Password123 | sudo -S  crontab -l | grep -v '#'");
	//String[] strs=str.split("\n");
	for(String strs : str.split("\n")){
		listscjf.add(new ScheduledJobForm(strs));
	}
	return listscjf;
}


public List  getStatusOfSchedledJob() {
	JobExecutor jb=	new JobExecutor(); 
  ArrayList<ScheduledJobForm> listscjf = new  ArrayList<ScheduledJobForm>();
	String str= jb.commandexecutor("cat /ingestion/*.log | grep -v 'START'");
	//String[] strs=str.split("\n");
	for(String strs : str.split("\n")){
		listscjf.add(parseStatus(strs));
	}
	return listscjf;
}


private ScheduledJobForm parseStatus(String str) {
//2016#11#16#19#47#53#vdr_source#test#ingestion#START
	ScheduledJobForm sjf = new ScheduledJobForm();
	String [] splits= str.split("#");
	sjf.setEnv(splits[7]);
	sjf.setSourceName(splits[6]);
	sjf.setOperation(splits[8]);
	sjf.setStatus(splits[9]);

	sjf.setSchHour(splits[3]);
	sjf.setSchYear(splits[0]);
	sjf.setSchMonth(splits[1]);
	sjf.setSchDay(splits[2]);
	sjf.setSchMin(splits[4]);
	sjf.setSchSec(splits[5]);
	
	return sjf;
}


public String executeJob(JobForm jf) {
	  String command1="bash /ingestion/"+jf.getEnv()+"/apps/bulk_ingestion/ingestion_runner.sh  -e="+jf.getEnv()+" -s="+jf.getSource()+" -t="+jf.getJobtype(); 
	  JobExecutor jb=	new JobExecutor(); 
	  String str= jb.commandexecutor(command1);
	  System.out.println(str);
	return str;
}
}
