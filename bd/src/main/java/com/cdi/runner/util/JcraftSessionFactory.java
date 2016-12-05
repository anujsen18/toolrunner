package com.cdi.runner.util;

import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;

public class JcraftSessionFactory {
	public static  Session createConnection(){
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
}
