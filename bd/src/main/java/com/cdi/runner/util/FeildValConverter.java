package com.cdi.runner.util;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class FeildValConverter {


private static List<Field> getAllFields(List<Field> fields, Class<?> type) {
    fields.addAll(Arrays.asList(type.getDeclaredFields()));
    if (type.getSuperclass() != null) {
        fields = getAllFields(fields, type.getSuperclass());
    }
    return fields;
}
public static String getJobSpecKeyVal(Object mcls ,Class<?> type) throws IllegalAccessException {
	List<Field> fieldsList = new ArrayList<Field>();
	fieldsList = getAllFields(new ArrayList<Field>() ,type  );
	Map<String ,String>  returnmap= new HashMap<String, String>();
	
	 StringBuffer sb = new StringBuffer("");
	 for(Field field:fieldsList){
		 String val="";
		 field.setAccessible(true);  
		 Object value =  field.get(mcls); 
		 if (value != null && field.isAnnotationPresent(ParsableKeyVal.class)) {
			String sourcename = field.getAnnotation(ParsableKeyVal.class).srcName();
			val= returnmap.get(sourcename);
			if(!val.equals(""))
				val=val+"\n";
				val=val+field.getName()+"="+value;
				returnmap.put(sourcename, val);	
			
		 }
	 }
	 
	 
		  /*for(int i =0 ;i<fieldsList.size();i++){
			  fieldsList.get(i).setAccessible(true); 
		    Object value =  fieldsList.get(i).get(mcls); 
		    if (value != null && fieldsList.get(i).isAnnotationPresent(ParsableKeyVal.class)) {
		    	System.out.println(fieldsList.get(i).getAnnotation(ParsableKeyVal.class).srcName());
		       sb.append( fieldsList.get(i).getName() + "=" + value);
		       if(i+1!=fieldsList.size()){
		    	   sb.append("\n");
		       }
		    }
		}*/
		  fieldsList =null; 
		  return sb.toString();
}


public static Map<String ,String> getJobSpecKeyValMap(Object mcls ,Class<?> type) throws IllegalAccessException {
	List<Field> fieldsList = new ArrayList<Field>();
	fieldsList = getAllFields(new ArrayList<Field>() ,type  );
	Map<String ,String>  returnmap= new HashMap<String, String>();
	
	 StringBuffer sb = new StringBuffer("");
	 for(Field field:fieldsList){
		 String val="";
		 field.setAccessible(true);  
		 Object value =  field.get(mcls); 
		 if (value != null && field.isAnnotationPresent(ParsableKeyVal.class)) {
			String sourcename = field.getAnnotation(ParsableKeyVal.class).srcName();
			val= returnmap.getOrDefault(sourcename, "");
			if(val!=null&&!val.equals(""))
				val=val+"\n";
				val=val+field.getName()+"="+value;
				returnmap.put(sourcename, val);	
			
		 }
	 }
	 
	 
	
		  fieldsList =null; 
		  return returnmap;
}
}
