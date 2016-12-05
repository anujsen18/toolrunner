package com.cdi.runner;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;

import com.cdi.runner.form.ScheduledJobForm;
import com.cdi.runner.form.SourceForm;
import com.cdi.runner.util.FeildValConverter;
import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelExec;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;
import com.jcraft.jsch.SftpATTRS;
import com.jcraft.jsch.SftpException;

public class RuntimeExec {
	public  static Session createConnection(){
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
	
	public static   String commandexecutor(String command){
		  Session session = createConnection();
		  
		  StringBuilder sb = new StringBuilder();
		   
			if (session != null) {
				Channel channel;
				try {
					channel = session.openChannel("exec");
				
					((ChannelExec) channel).setCommand(command);
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
	
	
	public static void main(String[] args) throws JSchException, SftpException {
		
	//	WriteFileServer("","","");
		
		String str = "12345678";
		int strt=0;
		int end = str.length()-1;
		char[] strchr=str.toCharArray();
		while(strt<end){
			char st =strchr[strt];
			strchr[strt]=strchr[end];
			strchr[end]=st;
			strt++;
			end--;
			
		}
		
		System.out.println(strchr);
	}
	
	 public static void WriteFileServer(String str_Content, String str_FileDirectory, String str_FileName) throws JSchException, SftpException
	  {	  Session session = createConnection();
	 // Channel  channel;
	  Channel channel = session.openChannel("sftp");
	//	 String currentDirectory=channelSftp.pwd();
	//	 String dir="anuj";
	 ChannelSftp channelSftp = (ChannelSftp)channel;
		// SftpATTRS attrs=null;
		 try {
		  //   attrs = channelSftp.stat("/ingestion/test/apps/bulk_ingestion/conf/vdr_source");
		     SftpATTRS attrs = channelSftp.lstat("/anuj");
		 } catch (Exception e) {
		     System.out.println(" not found");
		 }

		
	  }	
	
}