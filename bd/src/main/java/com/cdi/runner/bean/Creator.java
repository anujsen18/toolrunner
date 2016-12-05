package com.cdi.runner.bean;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;

public class Creator {
public static void main(String[] args) throws IOException {
//1. parse the input csv file 
	String metafile= "C:\\Users\\532051\\neoGit\\bd\\src\\main\\webapp\\WEB-INF\\assets\\meta\\subform2.txt"	;
	File inputFile = new File(metafile);
	String div= "<div class=\"col-md-6 form-group\">";
	String divclose= " </div>";
	// <label for="validate_header_footer_flag"> Validate Header Footer</label><br>

	
BufferedReader br = new BufferedReader(new FileReader(inputFile));
ArrayList<JspCreatorBean> jbenlist= new ArrayList<JspCreatorBean>();
String str = br.readLine();
while(str!=null){
	jbenlist.add(new JspCreatorBean(str));	
	str= br.readLine();
}


String jsplocation= "C:\\Users\\532051\\neoGit\\bd\\src\\main\\webapp\\WEB-INF\\jsp\\subform2.jsp"	;
File jspfile = new File(jsplocation);
BufferedWriter bW = new BufferedWriter(new FileWriter(jspfile));
try{
// write logic goes here 
for(JspCreatorBean jc:jbenlist ){
	bW.write(div);
	bW.write(getLavelString(jc));
	bW.write(getTextString(jc));
	bW.write(divclose);
}		


}
finally{
bW.flush();
bW.close();}
	
	
}

private static String getLavelString(JspCreatorBean jc) {
	// <label for="validate_header_footer_flag"> Validate Header Footer</label><br>
	return "<label for=\""+jc.getJavaName()+"\">"+jc.getDisplayName()+"</label><br>";
}


//<input type="text" name="file_footer" class="form-control" id="file_footer" placeholder="Reg Exp for file footer" />

private static String getTextString(JspCreatorBean jc) {
	// <label for="validate_header_footer_flag"> Validate Header Footer</label><br>
	String toreturn="";
	if(jc.getJspInputType().equals("text")){
		toreturn= "<input type=\"text\" name=\""+jc.getJavaName()+"\" class=\"form-control\" id=\""+jc.getJavaName()+"\" placeholder=\""+ jc.getJavaName()+" \" />";
	}else if(jc.getJspInputType().equals("select")){
	
		StringBuffer sb= new StringBuffer("<select  name=\""+jc.getJavaName()+"\" class=\"form-control\" id=\""+jc.getJavaName()+"\" > \n" );
		sb.append("	<option value=\"none\">select a value</option>");
		for(String str: jc.getSubvalue().split("#")){
			sb.append("	<option value=\""+str+"\">"+str+"</option>");	
		}
		sb.append("</select>");
		toreturn= sb.toString();
			
	}else if(jc.getJspInputType().equals("radio")){
	
		StringBuffer sb= new StringBuffer( );
	
		for(String str: jc.getSubvalue().split("#")){
			sb.append(	"<input type=\"radio\"  name=\""+jc.getJavaName()+"\"  id=\""+jc.getJavaName()+"\" value=\""+str+"\" />"+ str+" &nbsp");
			
		}
		
		toreturn= sb.toString();
			
	}return toreturn;
	}

}
