package com.cdi.runner.service;

import java.util.Map;
import java.util.Map.Entry;

import com.cdi.runner.JobExecutor;
import com.cdi.runner.form.SourceForm;
import com.cdi.runner.util.FeildValConverter;

public class JobExecutorService {

	String rootpath="/ingestion/prod/apps/bulk_ingestion/conf/";
	
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
	return sourcefileName;
}
}
