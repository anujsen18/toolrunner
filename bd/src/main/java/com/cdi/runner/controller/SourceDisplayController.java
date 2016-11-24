package com.cdi.runner.controller;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cdi.runner.bean.CronJobs;
import com.cdi.runner.service.JobExecutorService;

@Controller
public class SourceDisplayController {	
	
	
	@RequestMapping("/source")
	public ModelAndView showSources(
			@RequestParam(value = "name1", required = false) String name) {
		// Name of your jsp file as parameter
		JobExecutorService js = new JobExecutorService();
		ModelAndView view = new ModelAndView("source");
		try {
			System.out.println(js.ReadForMeta().size());
			view.addObject("clusterlist", js.ReadForMeta());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return view;
	}
	
	
	@RequestMapping(value= "/displayjobs", method = RequestMethod.POST)
	public ModelAndView runCronJob(@ModelAttribute("cronjb") CronJobs cronjb){
		
		JobExecutorService js = new JobExecutorService();
		String str = js.scheduleJoboncluster(cronjb);
		    ModelAndView model = new ModelAndView("success");	    
		    return model; 
		    
	}
	
	
	
	
}
