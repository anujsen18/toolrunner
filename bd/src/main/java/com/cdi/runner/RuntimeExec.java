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
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;

public class RuntimeExec {
public StreamWrapper getStreamWrapper(InputStream is, String type){
            return new StreamWrapper(is, type);
}
private class StreamWrapper extends Thread {
    InputStream is = null;
    String type = null;          
    String message = null;

    public String getMessage() {
            return message;
    }

    StreamWrapper(InputStream is, String type) {
        this.is = is;
        this.type = type;
    }

    public void run() {
        try {
            BufferedReader br = new BufferedReader(new InputStreamReader(is));
            StringBuffer buffer = new StringBuffer();
            String line = null;
            while ( (line = br.readLine()) != null) {
                buffer.append(line);//.append("\n");
            }
            message = buffer.toString();
        } catch (IOException ioe) {
            ioe.printStackTrace();  
        }
    }
}
 

// this is where the action is
public static void main(String []args) {
          /*  Runtime rt = Runtime.getRuntime();
            RuntimeExec rte = new RuntimeExec();
            StreamWrapper error, output;

            try {
                        Process proc = rt.exec("bash /ingestion/prod/apps/bulk_ingestion/ingestion_runner.sh  -e=prod -s=cdr_source -t=ingestion");
                        error = rte.getStreamWrapper(proc.getErrorStream(), "ERROR");
                        output = rte.getStreamWrapper(proc.getInputStream(), "OUTPUT");
                        int exitVal = 0;

                        error.start();
                        output.start();
                        error.join(3000);
                        output.join(3000);
                        exitVal = proc.waitFor();
                        System.out.println("Output: "+output.message+"\nError: "+error.message);
            } catch (IOException e) {
                        e.printStackTrace();
            } catch (InterruptedException e) {
                        e.printStackTrace();
            }
            }*/
	
/*SourceForm sf = new SourceForm();
sf.setSourcename("test1");
sf.setValidate_header_footer_flag("true");
sf.setStage_script("testscrpu");
try {
Map<String,String> strval=	FeildValConverter.getJobSpecKeyValMap(sf, SourceForm.class);


for (Entry<String,String> str : strval.entrySet()) {
	System.out.println(str.getKey() +": "+str.getValue());
}

JobExecutor re= new JobExecutor();
//re.WriteFileServer(strval, "/home/cts1/anuj/test/", "testfinale22");
System.out.println("compltet");
} catch (IllegalAccessException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}*/
String str = "3 * * * * /ingestion/prod/apps/bulk_ingestion/ingestion_runner.sh  -e=prod -s=cdr_source -t=help";
str= str.replaceAll("\\s+", " ");
String [] split= str.split(" ");
ScheduledJobForm sf= new ScheduledJobForm(str);
	for(String stre:split )
		System.out.println(sf);
}
/*
JSch obj_JSch = new JSch();
Session obj_Session = null;
String str_Host = "10.223.3.143";
String str_Username="cts1";
String str_Password= "Password123";
int int_Port =22;
String str_Content ="asd=1213\neee=3433";
String str_FileDirectory="/home/cts1/anuj/test/";
String str_FileName="testabccc";
try
{
  obj_Session = obj_JSch.getSession(str_Username, str_Host);
  obj_Session.setPort(int_Port);
  obj_Session.setPassword(str_Password);
  Properties obj_Properties = new Properties();
  obj_Properties.put("StrictHostKeyChecking", "no");
  obj_Session.setConfig(obj_Properties);
  obj_Session.connect();
  Channel obj_Channel = obj_Session.openChannel("sftp");
  obj_Channel.connect();
  ChannelSftp obj_SFTPChannel = (ChannelSftp) obj_Channel;
  obj_SFTPChannel.cd(str_FileDirectory);
  InputStream obj_InputStream = new ByteArrayInputStream(str_Content.getBytes());
  obj_SFTPChannel.put(obj_InputStream, str_FileDirectory + str_FileName );
  obj_SFTPChannel.exit();
  obj_InputStream.close();
  obj_Channel.disconnect();
  obj_Session.disconnect();
}
catch (Exception ex)
{
  ex.printStackTrace();
}
}*/

}