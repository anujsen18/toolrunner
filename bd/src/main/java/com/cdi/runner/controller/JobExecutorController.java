package com.cdi.runner.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cdi.runner.form.ClusterForm;
import com.cdi.runner.form.JobForm;
import com.cdi.runner.form.JobType;
import com.cdi.runner.form.ScheduledJobForm;
import com.cdi.runner.form.SourceForm;
import com.cdi.runner.service.JobExecutorService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;

@Controller
public class JobExecutorController {
 
	@RequestMapping("/getHome")
	public ModelAndView welcomeMessage(
			@RequestParam(value = "name", required = false) String name) {
		JobExecutorService js = new JobExecutorService();
		ModelAndView view = new ModelAndView("home");
		try {
			view.addObject("clusterlist", js.ReadForMeta());
			view.addObject("envrlist", js.getEnv());
			view.addObject("sourcelist", js.getSource());
		} catch (IOException e) {
			System.out.println("Error while reading data");
			e.printStackTrace();
		}
		return view;
	}
	
	
	
	@RequestMapping(value="/getCluster", method = RequestMethod.GET)
	  public @ResponseBody String getVersionsByProjectKey(@RequestParam(value = "cluster") String cluster) {  

		 System.out.println(cluster);
		 JobExecutorService js = new JobExecutorService();
		 ArrayList<ArrayList<String>> str;
		try {
			str = js.getMatchedSourceforCluster(cluster);
		
			 ObjectMapper mapper = new ObjectMapper();
			 System.out.println( mapper.writeValueAsString(str));
			 return 	 mapper.writeValueAsString(str);
		} catch (FileNotFoundException e1) {
			 e1.printStackTrace();
			 return 	"can not read file";
			
		} catch (IOException e1) {
			e1.printStackTrace();
			 return 	"error in IO ";
			
		}
 } 
	
	@RequestMapping("/adminConf")
	public ModelAndView creatAdminConf() {
		// Name of your jsp file as parameter
		ModelAndView view = new ModelAndView("creatAdminConf");
		
		return view;
	}
	
	
	@RequestMapping("/howItWorks")
	public ModelAndView howItWorkPage() {
		// Name of your jsp file as parameter
		ModelAndView view = new ModelAndView("howItWorks");
	
		return view;
	}
	
	
	
	@RequestMapping("/success")
	public ModelAndView testSuccess(HttpServletRequest request) {
		// Name of your jsp file as parameter
		ModelAndView view = new ModelAndView("success");
		view.addObject("msg", "source configuration created successfully!");
		System.out.println("saving resource complete");
		return view;
			
	}
	
	/**
	 * Upload multiple file using Spring Controller
	 */
	@RequestMapping(value = "/submitJob", method = RequestMethod.GET)
	public
	String submitmanualJobHandler(HttpServletRequest request ) {

		System.out.println("Job submiited sorce is cdr --- job ingestion ");
		JobForm jf = new JobForm(request.getParameter("source"),
							    	request.getParameter("env"),
						            request.getParameter("operation"));
		
		JobExecutorService js = new JobExecutorService();
		
		String str =js.executeJob(jf);
		return "file_upload_success";
	}
	
	
	
	@RequestMapping(value ="/savesource", method = RequestMethod.POST)
    public ModelAndView processRegistration(@ModelAttribute("sourceForm") SourceForm sourceForm,/*
    @RequestParam("transcript")  MultipartFile transcript, @RequestParam("stagscript")  MultipartFile stagscript,*/
    Map<String, Object> model) {
		System.out.println("saving resource");
		System.out.println(sourceForm.getStagscript().toString());
		JobExecutorService js = new JobExecutorService();
		try {
			try {
				js.writeFileToServer(sourceForm);
			} catch (IOException e) {
				System.out.println("Error in creating file ");
				e.printStackTrace();
			}
		} catch (IllegalAccessException e) {
			System.out.println("Error in creating file ");
			e.printStackTrace();
		}
		ModelAndView view = new ModelAndView("success");
		view.addObject("msg", "source configuration created successfully!");
		System.out.println("saving resource complete");
		return view;
			
		
	}
	
	
	
	@RequestMapping(value ="/saveclusterdtl", method = RequestMethod.POST)
    public ModelAndView saveclusterdtl(@ModelAttribute("clusterForm") ClusterForm clusterForm,
            Map<String, Object> model , HttpServletRequest request) {
		System.out.println("saving resource");
		System.out.println(request.getServletContext().getRealPath("/"));
		
		System.out.println(request.getServletContext().getRealPath("/"));
		JobExecutorService js = new JobExecutorService();
		try {
			js.writeFileToMetadir(clusterForm);
		} catch (IllegalAccessException e) {
			System.out.println("Error in creating file ");
			e.printStackTrace();
		}
		catch (Exception e) {
			System.out.println("Error in creating file ");
			e.printStackTrace();
		}
		ModelAndView view = new ModelAndView("success");
		view.addObject("msg", "source configuration created successfully!");
		System.out.println("saving resource complete");
		return view;
			
		
	}
	
	
	
	//getAttributePage
	
	@RequestMapping(value ="/getAttributePage", method = RequestMethod.GET)
    public ModelAndView getAttributePage(@ModelAttribute("jobType") JobType jobType,
            Map<String, Object> model) {
		System.out.println(" resource"+jobType.isImportfromDatabase());
		ModelAndView view = new ModelAndView("creatConf");
		view.addObject("jobType", jobType);
		return view;
			
		
	}
	
	//getJob.html
	
	@RequestMapping(value ="/getJob", method = RequestMethod.GET)
    public ModelAndView getJobScheduled( @ModelAttribute("jobs") String jobs,
            Map<String, Object> model) {
		
		String[] str;
		ArrayList<ScheduledJobForm> listscjf ;
		JobExecutorService js = new JobExecutorService();
		listscjf= (ArrayList<ScheduledJobForm>) js.getListOfSchedledJob();	
		System.out.println("at controller ");
	//	System.out.println(str);
		ModelAndView view = new ModelAndView("cronlist");
		view.addObject("jobs", listscjf);
		for(ScheduledJobForm stre:listscjf )
			System.out.println(stre.getSourceName());
		return view;
	
			
		
	}
	
	
	//getJob.html
	
	@RequestMapping(value ="/getJobStatus", method = RequestMethod.GET)
    public ModelAndView getStatusOfSchedledJob( @ModelAttribute("jobs") String jobs,
            Map<String, Object> model) {
		
		String[] str;
		ArrayList<ScheduledJobForm> listscjf ;
		JobExecutorService js = new JobExecutorService();
		listscjf= (ArrayList<ScheduledJobForm>) js.getStatusOfSchedledJob();
		System.out.println("at controller ");
	//	System.out.println(str);
		ModelAndView view = new ModelAndView("listJobStatus");
		view.addObject("jobs", listscjf);
		for(ScheduledJobForm stre:listscjf )
			System.out.println(stre.getSourceName());
		return view;
	
			
		
	}
	
	
	
}