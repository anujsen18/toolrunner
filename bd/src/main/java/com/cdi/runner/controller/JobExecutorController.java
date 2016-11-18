package com.cdi.runner.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cdi.runner.JobExecutor;
import com.cdi.runner.form.HiveSourceForm;
import com.cdi.runner.form.JobForm;
import com.cdi.runner.form.JobType;
import com.cdi.runner.form.ScheduledJobForm;
import com.cdi.runner.form.SourceForm;
import com.cdi.runner.service.JobExecutorService;

@Controller
public class JobExecutorController {

	@RequestMapping("/getHome")
	public ModelAndView welcomeMessage(
			@RequestParam(value = "name", required = false) String name) {
		// Name of your jsp file as parameter
		ModelAndView view = new ModelAndView("home");
		view.addObject("name", name);
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
    public ModelAndView processRegistration(@ModelAttribute("sourceForm") SourceForm sourceForm,
            Map<String, Object> model) {
		System.out.println("saving resource");
		
		JobExecutorService js = new JobExecutorService();
		try {
			js.writeFileToServer(sourceForm);
		} catch (IllegalAccessException e) {
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