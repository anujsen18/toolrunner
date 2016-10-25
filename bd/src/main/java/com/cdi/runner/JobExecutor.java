package com.cdi.runner;

import java.io.InputStream;

import com.cdi.runner.form.JobForm;
import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelExec;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;


public class JobExecutor {

	/**
	 * JSch Example Tutorial
	 * Java SSH Connection Program
	 */
	
	public Session createConnection(){
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
	}
	
	
	
	public  String  executeJob(JobForm jf){
	   Session session = this.createConnection();
	   System.out.println("cd /ingestion/prod/apps/bulk_ingestion;bash /ingestion/prod/apps/bulk_ingestion/ingestion_runner.sh  -e="+jf.getEnv()+" -s=cdr_source -t=ingestion");
	   String command1="cd /ingestion/prod/apps/bulk_ingestion;bash /ingestion/prod/apps/bulk_ingestion/ingestion_runner.sh  -e="+jf.getEnv()+" -s=cdr_source -t=ingestion"; 
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
				session.disconnect();
				System.out.println("DONE");
			} catch (Exception e) {
				System.out.println("error in executing");
				e.printStackTrace();
			}

		}
		System.out.println(sb.toString());
		return sb.toString();
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

}