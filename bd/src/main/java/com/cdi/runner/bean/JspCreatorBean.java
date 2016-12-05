package com.cdi.runner.bean;

public class JspCreatorBean {

	String displayName;
	String javaName;
	String jspInputType;
	String Place_holder_Name;
	String subvalue;

	public JspCreatorBean(String str) {

		// inputDataType,DataType ,select,text # sequence
		String[] data = str.split(",");
		this.setDisplayName(data[1]);
		this.setJavaName(data[0]);
		this.setJspInputType(data[2]);
		this.setPlace_holder_Name(data[1]);
		if (data.length == 4) {
			this.setSubvalue(data[3]);

		}

	}

	public JspCreatorBean() {

	}

	public String getSubvalue() {
		return subvalue;
	}

	public void setSubvalue(String subvalue) {
		this.subvalue = subvalue;
	}

	public String getDisplayName() {
		return displayName;
	}

	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}

	public String getJavaName() {
		return javaName;
	}

	public void setJavaName(String javaName) {
		this.javaName = javaName;
	}

	public String getJspInputType() {
		return jspInputType;
	}

	public void setJspInputType(String jspInputType) {
		this.jspInputType = jspInputType;
	}

	public String getPlace_holder_Name() {
		return Place_holder_Name;
	}

	public void setPlace_holder_Name(String place_holder_Name) {
		Place_holder_Name = place_holder_Name;
	}

}
