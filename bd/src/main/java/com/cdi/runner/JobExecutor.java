package com.cdi.runner;

import java.io.BufferedWriter;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Properties;

import com.cdi.runner.form.JobForm;
import com.cdi.runner.service.JobExecutorService;
import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelExec;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;


public class JobExecutor {
 Session session;

	
	
	public JobExecutor(Session createConnection) {
	this.session=createConnection;
}


	public void destroySession() {
	this.session.disconnect();
	this.session=null;
}

	/**
	 * JSch Example Tutorial
	 * Java SSH Connection Program
	 */
	
	/*public Session createConnection(){
		   String host="10.223.3.143";
		    String user="cts1";
		    String password="Password123";	
			java.util.Properties config = new java.util.Properties(); 
	    	config.put("StrictHostKeyChecking", "no");
	    	JSch jsch = new JSch();
	    	Session session=null;
			try {
				
				session = jsch.getSession(user, host, 22);
				session.setPassword(password);
		    	session.setConfig(config);
		    	session.connect();
		    	return session;
			} catch (JSchException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	
	    	System.out.println("Connected");
			return session;
	}*/
	
	
	public  String commandexecutor(String command){
		  /*Session session = this.createConnection();*/
		  String command1=command;
		  StringBuilder sb = new StringBuilder();
		   
			if (session != null) {
				Channel channel;
				try {
					channel = session.openChannel("exec");
				
					((ChannelExec) channel).setCommand(command1);
					channel.setInputStream(null);
					((ChannelExec) channel).setErrStream(System.err);
				
					InputStream in = channel.getInputStream();
					channel.connect();
					byte[] tmp = new byte[1024];
					while (true) {
						while (in.available() > 0) {
							int i = in.read(tmp, 0, 1024);
							if (i < 0)
								break;
							sb.append(new String(tmp, 0, i));
							System.out.print(new String(tmp, 0, i));
						}
						if (channel.isClosed()) {
							System.out.println("exit-status: " + channel.getExitStatus());
							break;
						}
						try {
							Thread.sleep(1000);
						} catch (Exception ee) {
						}
					}
					channel.disconnect();
				//	session.disconnect();
					System.out.println("DONE");
				} catch (Exception e) {
					System.out.println("error in executing");
					e.printStackTrace();
				}

			}
			System.out.println(sb.toString());
			return sb.toString();
	}
	
	
	
	public  String  executeJob(JobForm jf){
	  /* Session session = this.createConnection();*/
	   //System.out.println("cd /ingestion/prod/apps/bulk_ingestion;bash /ingestion/prod/apps/bulk_ingestion/ingestion_runner.sh  -e="+jf.getEnv()+" -s=cdr_source -t=ingestion");
	   String command1="cd /ingestion/prod/apps/bulk_ingestion;bash /ingestion/prod/apps/bulk_ingestion/ingestion_runner.sh  -e="+jf.getEnv()+" -s=cdr_source -t=ingestion"; 
	 return commandexecutor(command1);
	}
	
	
	 public void WriteFileServer(String str_Content, String str_FileDirectory, String str_FileName)
	  {System.out.println("writing file "+ str_FileDirectory+str_FileName);
		 try
		 {
		 /*  Session  obj_Session = this.createConnection();*/
		   Properties obj_Properties = new Properties();
		   obj_Properties.put("StrictHostKeyChecking", "no");
		   session.setConfig(obj_Properties);

		   Channel obj_Channel = session.openChannel("sftp");
		   obj_Channel.connect();
		   ChannelSftp obj_SFTPChannel = (ChannelSftp) obj_Channel;
		   obj_SFTPChannel.cd(str_FileDirectory);
		   InputStream obj_InputStream = new ByteArrayInputStream(str_Content.getBytes());
		   
		   obj_SFTPChannel.put(obj_InputStream, str_FileDirectory + str_FileName );
		   obj_SFTPChannel.exit();
		   obj_InputStream.close();
		   obj_Channel.disconnect();
		  // session.disconnect();
		 }
		 catch (Exception ex)
		 {System.out.println("exception in writing");
		   ex.printStackTrace();
		 } 
	  }	
	
	
	public static void main() {
	    String host="10.223.3.143";
	    String user="cts1";
	    String password="Password123";
	    String command1="cd ./anuj/test; ls -ltr";
	    try{
	    	
	    	java.util.Properties config = new java.util.Properties(); 
	    	config.put("StrictHostKeyChecking", "no");
	    	JSch jsch = new JSch();
	    	Session session=jsch.getSession(user, host, 22);
	    	session.setPassword(password);
	    	session.setConfig(config);
	    	session.connect();
	    	System.out.println("Connected");
	    	
	    	Channel channel=session.openChannel("exec");
	        ((ChannelExec)channel).setCommand(command1);
	        channel.setInputStream(null);
	        ((ChannelExec)channel).setErrStream(System.err);
	        
	        InputStream in=channel.getInputStream();
	        channel.connect();
	        byte[] tmp=new byte[1024];
	        while(true){
	          while(in.available()>0){
	            int i=in.read(tmp, 0, 1024);
	            if(i<0)break;
	            System.out.print(new String(tmp, 0, i));
	          }
	          if(channel.isClosed()){
	            System.out.println("exit-status: "+channel.getExitStatus());
	            break;
	          }
	          try{Thread.sleep(1000);}catch(Exception ee){}
	        }
	        channel.disconnect();
	        session.disconnect();
	        System.out.println("DONE");
	    }catch(Exception e){
	    	e.printStackTrace();
	    }

	}



	public void createDirforsource(String source) {
		commandexecutor(" test -d \""+source+"\" && echo dirExist || mkdir -p"+ source	);
		// test -d "/home/cts1/anuj/pder" && echo Exists || echo Does not exist
		System.out.println("creating dir  "+ "mkdir -p "+ source);
	}


	public void WriteFileForMeta(String value, String dirpath) throws IOException {
		File confFile = new File(dirpath);
		BufferedWriter br = new BufferedWriter(new FileWriter(confFile));
		try{
		br.write(value);}
		finally{
		br.flush();
		br.close();}
	}

	
	public List<String> ReadForMeta() throws IOException {
		File folder = new File(JobExecutorService.metadirpath);
		File[] listOfFiles = folder.listFiles();
		List<String> filename= new ArrayList<String>();
		    for (int i = 0; i < listOfFiles.length; i++) {
		      if (listOfFiles[i].isFile()) {
		    	  filename.add(listOfFiles[i].getName().split(".properties")[0]);
		        //System.out.println("File " + (listOfFiles[i].getName().split(".properties")[0]));
		      }
		    }
	return filename;
	}


	public ArrayList<ArrayList<String>> getMatchedSourceforCluster(String cluster) throws FileNotFoundException, IOException {
		File clusterFile = new File(JobExecutorService.metadirpath+cluster+".properties");
		Properties prop=new Properties();
		prop.load(new FileInputStream(clusterFile));
	
		ArrayList<ArrayList<String>> funalresult= new ArrayList<ArrayList<String>>();
		
		funalresult.add(  new ArrayList<String>(Arrays.asList(prop.getProperty("source", "").split("#")))); 
		funalresult.add(  new ArrayList<String>(Arrays.asList(prop.getProperty("env", "").split(",")))); 
		  return funalresult;
	}


	public boolean isExist(String confpath, String getfileNameformsoruce) {
		 String  str =commandexecutor(" test -f "+confpath+getfileNameformsoruce+ " && echo yes || echo no");
		
		 return (str.equalsIgnoreCase("yes"));
	}


	
}