package com.cdi.runner.form;

import com.cdi.runner.util.ParsableKeyVal;

public class ClusterForm {
	
@ParsableKeyVal(srcName="adminconf")	
private String cluster_name;
@ParsableKeyVal(srcName="adminconf")	
private String host_address;
@ParsableKeyVal(srcName="adminconf")	
private String sysuser;
@ParsableKeyVal(srcName="adminconf")	
private String host_pasword;
@ParsableKeyVal(srcName="adminconf")	
private String workspacedir_host;
@ParsableKeyVal(srcName="adminconf")	
private String env;



public String getCluster_name() {
	return cluster_name;
}
public void setCluster_name(String cluster_name) {
	this.cluster_name = cluster_name;
}
public String getHost_address() {
	return host_address;
}
public void setHost_address(String host_address) {
	this.host_address = host_address;
}
public String getSysuser() {
	return sysuser;
}
public void setSysuser(String sysuser) {
	this.sysuser = sysuser;
}

public String getWorkspacedir_host() {
	return workspacedir_host;
}
public void setWorkspacedir_host(String workspacedir_host) {
	this.workspacedir_host = workspacedir_host;
}
public String getEnv() {
	return env;
}
public void setEnv(String env) {
	this.env = env;
}
public String getHost_pasword() {
	return host_pasword;
}
public void setHost_pasword(String host_pasword) {
	this.host_pasword = host_pasword;
}





}
