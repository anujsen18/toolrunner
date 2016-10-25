package com.cdi.runner.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cdi.runner.JobExecutor;
import com.cdi.runner.form.JobForm;

@Controller
public class ContactController {

	@RequestMapping("/hello")
	public ModelAndView welcomeMessage(
			@RequestParam(value = "name", required = false) String name) {
		// Name of your jsp file as parameter
		ModelAndView view = new ModelAndView("home");
		view.addObject("name", name);
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
		
		JobExecutor jb=	new JobExecutor(); 
		String str =jb.executeJob(jf);
		return "file_upload_success";
	}
}