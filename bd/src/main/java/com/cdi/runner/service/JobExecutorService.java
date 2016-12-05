package com.cdi.runner.service;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;

import org.springframework.web.multipart.MultipartFile;

import com.cdi.runner.JobExecutor;
import com.cdi.runner.bean.CronJobs;
import com.cdi.runner.form.ClusterForm;
import com.cdi.runner.form.JobForm;
import com.cdi.runner.form.ScheduledJobForm;
import com.cdi.runner.form.SourceForm;
import com.cdi.runner.util.FeildValConverter;
import com.cdi.runner.util.JcraftSessionFactory;

public class JobExecutorService {

public	static String rootpath="/ingestion/test/apps/bulk_ingestion/conf/";
public	static String metadirpath = "C:\\Users\\532051\\neoGit\\bd\\src\\main\\webapp\\WEB-INF\\assets\\meta\\";
public static HashMap<String ,String> refrenceDit= new HashMap<String, String>();



static Properties prop=new Properties();
	static {
		
		refrenceDit.put("ingestion", "0");
		refrenceDit.put("archival", "2");
		refrenceDit.put("headerfooter", "0");
		refrenceDit.put("bulkfileProcessor", "3");
		
		
		
		try {
			prop.load(new FileInputStream(
					"C:\\Users\\532051\\neoGit\\bd\\src\\main\\webapp\\WEB-INF\\assets\\meta\\CommonConf.properties"));
		} catch (FileNotFoundException e) {

			e.printStackTrace();
		} catch (IOException e) {

			e.printStackTrace();
		}
}
	
	
	
	// business method for saving the fields in to respected file 
	public void writeFileToServer(SourceForm sf) throws IllegalAccessException, IOException {
		//declaration of object 
		
		JobExecutor jb = new JobExecutor(JcraftSessionFactory.createConnection());
		Map<String, String> strval = FeildValConverter.getJobSpecKeyValMap(sf, SourceForm.class);
		
		
		//check for bulk file processing 
		
		if(ischecked("bulkfileProcessor",sf.getListattr())){
		
			
			if(sf.getStagscript()!=null){
			sf.setStaging_file(sf.getStagscript().getOriginalFilename());	
			String str= writeMultiPartFile(sf.getStagscript());
			jb.WriteFileServer(str, rootpath + sf.getSourcename() + "/",sf.getStagscript().getOriginalFilename());
					
			}
			
			if(sf.getTranscript()!=null){
				sf.setTransformation_file(sf.getTranscript().getOriginalFilename());	
				String str= writeMultiPartFile(sf.getTranscript());
				jb.WriteFileServer(str, rootpath + sf.getSourcename() + "/",sf.getTranscript().getOriginalFilename());
						
				}
		}
		
		
		for (Entry<String, String> str : strval.entrySet()) {
			System.out.println(str.getKey() + ": " + str.getValue());
			jb.createDirforsource(rootpath + sf.getSourcename());
			
			if (!(jb.isExist(rootpath + sf.getSourcename() + "/", getfileNameformsoruce(str.getKey()))) && ischecked(str.getKey(),sf.getListattr())) {
				
				jb.WriteFileServer(str.getValue(), rootpath + sf.getSourcename() + "/",
						getfileNameformsoruce(str.getKey()));
			}
		}

		jb.destroySession();
	}
	

private String writeMultiPartFile(MultipartFile stagscript) throws IOException {
	
	
	InputStream in = stagscript.getInputStream();
	 StringBuilder sb = new StringBuilder();
	byte[] tmp = new byte[1024];
	
		while (in.available() > 0) {
			int i = in.read(tmp, 0, 1024);
			
			if (i < 0)
				break;
			
			sb.append(new String(tmp, 0, i));
			
		}
	
  return sb.toString();
	}


private boolean ischecked(String key, String listattr) {
		return listattr.contains(refrenceDit.get(key));
	}


private String getfileNameformsoruce(String sourceName){
	String sourcefileName="";
	if(sourceName.equals("ingestion"))
		sourcefileName="config.properties";
	if(sourceName.equals("headerfooter"))
		sourcefileName="validate_header_footer_proper.sh";
	if(sourceName.equals("hiveloader"))
		sourcefileName="hiveloader.properties";
	if(sourceName.equals("archival"))
		sourcefileName="archival.properties";
	if(sourceName.equals("bulkfileProcessor"))
		sourcefileName="hive_loader.properties";
	
	return sourcefileName;
}


public List  getListOfSchedledJob() {
	JobExecutor jb=	new JobExecutor(JcraftSessionFactory.createConnection()); 
  ArrayList<ScheduledJobForm> listscjf = new  ArrayList<ScheduledJobForm>();
	String str= jb.commandexecutor("echo Password123 | sudo -S  crontab -l | grep -v '#'");
	//String[] strs=str.split("\n");
	for(String strs : str.split("\n")){
		//todo exception handling for ArrayIndexOutOfBoundsException incase of server not responding 
		listscjf.add(new ScheduledJobForm(strs));
	}
	jb.destroySession();
	return listscjf;
} 


public List  getStatusOfSchedledJob() {
	JobExecutor jb=	new JobExecutor(JcraftSessionFactory.createConnection()); 
  ArrayList<ScheduledJobForm> listscjf = new  ArrayList<ScheduledJobForm>();
	String str= jb.commandexecutor("cat /ingestion/*.log | grep -v 'START'");
	//String[] strs=str.split("\n");
	for(String strs : str.split("\n")){
		listscjf.add(parseStatus(strs));
	}
	jb.destroySession();
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
	String strDirforJobType=  prop.getProperty("scripthome").replace("*env*", jf.getEnv())+"/"+prop.getProperty(jf.getJobtype()) ;
	  String command1="bash "+strDirforJobType+"  -e="+jf.getEnv()+" -s="+jf.getSource()+" -t="+jf.getJobtype(); 
	  JobExecutor jb=	new JobExecutor(JcraftSessionFactory.createConnection()); 
	  System.out.println(command1);	
	  String str= jb.commandexecutor(command1);
	  System.out.println(str);
	return str;
}


public void writeFileToMetadir(ClusterForm clusterForm) throws IllegalAccessException, IOException {
	  Map<String,String> strval=	FeildValConverter.getJobSpecKeyValMap(clusterForm, ClusterForm.class);
	  for (Entry<String,String> str : strval.entrySet()) {
	  JobExecutor jb=	new JobExecutor(JcraftSessionFactory.createConnection()); 
	String fileName =clusterForm.getCluster_name()+"_conf.properties";
	String dirpath = metadirpath+fileName;		
		jb.WriteFileForMeta(str.getValue(),dirpath );
		jb.destroySession();	
		}
	 
}


public List<String> ReadForMeta() throws IOException {
	 JobExecutor jb=	new JobExecutor(JcraftSessionFactory.createConnection()); 
	List<String> filename= jb.ReadForMeta();
	jb.destroySession();
	return filename;
}


public ArrayList<ArrayList<String>> getMatchedSourceforCluster(String cluster) throws FileNotFoundException, IOException {
	     JobExecutor jb=	new JobExecutor(JcraftSessionFactory.createConnection()); 
	     ArrayList<ArrayList<String>> filename= jb.getMatchedSourceforCluster(cluster);
	     jb.destroySession();
		return filename;
	
}


public String scheduleJoboncluster(CronJobs cronjb) {
	String strJobcommand= createJobCommand(cronjb);
	System.out.println(strJobcommand);
	return strJobcommand;
}


private String createJobCommand(CronJobs cronjb) {
	//echo Password123 | sudo -S  crontab -l | { cat; echo "3 * * * * /ingestion/prod/apps/bulk_ingestion/ingestion_runner.sh  -e=prod -s=cdr_source -t=help"; } |   sudo  crontab -

	String sudopwd = "Password123" ;
	//todo properties file 
    String schduleEntry= getEntry(cronjb);
    prop.getProperty("scripthome").replace("*env*", cronjb.getEnv());
	String strDirforJobType=  prop.getProperty("scripthome").replace("*env*", cronjb.getEnv())+"/"+prop.getProperty(cronjb.getJobtype()) ;
    String runner= "-e="+cronjb.getEnv()+" -s="+cronjb.getSource()+" -t="+cronjb.getJobtype()+"\"";
	StringBuffer sb = new StringBuffer();
	sb.append("echo ").append(sudopwd).append(" | sudo -S crontab -l | {cat; echo ").append(schduleEntry).append(strDirforJobType).append(runner);
	
	return sb.toString();
}


		private String getEntry(CronJobs cronjb) {
			StringBuffer  sb = new StringBuffer("\"");
			sb.append(cronjb.getMinute()+" ") ;
			sb.append(cronjb.getHour()+" ") ;
			sb.append(cronjb.getDay()+" ") ;
			sb.append(cronjb.getMonth()+" ") ;
			sb.append(cronjb.getDow()+" ") ;
			return sb.toString();
		}


		public List<String> getEnv() {
		
			return Arrays.asList(prop.getProperty("env").split(",")) ;	
		}

		public List<String> getSource() {
			
			return Arrays.asList(prop.getProperty("source").split(",")) ;	
		}
}
