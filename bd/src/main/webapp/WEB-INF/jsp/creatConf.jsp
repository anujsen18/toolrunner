<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<html class="no-js">
<!--<![endif]-->
      <!-- HEAD SECTION-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Spring 4 MVC</title>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <meta charset="utf-8">
    <title>Common Ingestion Runner</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">   
     <!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
    <!-- MAIN STYLE SECTION-->
    <link href="assets/plugins/isotope/isotope.css" rel="stylesheet" media="screen" />
    <link href="assets/plugins/fancybox/jquery.fancybox.css" rel="stylesheet" />
    <link href="assets/plugins/IconHoverEffects-master/css/component.css" rel="stylesheet" />
    <link href="assets/plugins/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="assets/css/about-achivements.css" rel="stylesheet" />
    <link id="mainStyle" href="assets/css/style.css" rel="stylesheet" />
    <link href='http://fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'>
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <!-- END MAIN STYLE SECTION-->
        <c:set var="fileIngestion" value="${jobType.fileIngestion}" />
    	<c:set var="importfromDatabase" value="${jobType.importfromDatabase}" />
    	<c:set var="rawAreaArchival" value="${jobType.rawAreaArchival}" />
    	<c:set var="bulkfileProcessing" value="${jobType.bulkfileProcessing}" />
    	<c:set var="hDFSRetention" value="${jobType.hDFSRetention}" />
    	<c:set var="hIVECompaction" value="${jobType.hIVECompaction}" />
    	<c:set var="exportToFtpServer" value="${jobType.exportToFtpServer}" />
    	<c:set var="exportToDatabase" value="${jobType.exportToDatabase}" />
    	<c:set var="bulkFileprocessing" value="${jobType.bulkFileprocessing}" />
    	<c:set var="dataDeDuplication" value="${jobType.dataDeDuplication}" />
    	<c:set var="automatedDeployment" value="${jobType.automatedDeployment}"/>
    	
       <c:set var="sourcename" value="${jobType.sourcename}"/>
    <script type="text/javascript">
    
    var listvar = [ ${fileIngestion},${importfromDatabase},${rawAreaArchival},${bulkfileProcessing},${hDFSRetention},${hIVECompaction},${exportToFtpServer},${exportToDatabase},${bulkFileprocessing}, ${dataDeDuplication},${automatedDeployment}];
    
       $(document).ready(function(){
    	   
    	 
    	   
    	   $.each(listvar, function( index, value ) {
    		 
    		   if(value==true){
    			  
    			   $('#form'+index).show(); 
    		   }else{
    			   $('#form'+index).hide(); 
    		   }
    	   });
    		  
    		 });
    	   
    	   
    	 
     

    </script>
</head>

<body>

   <!-- HEADER SECTION-->
    <div class="navbar navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="fa fa-bars mobile-bars" style=""></span>
                </button>
                <a class="navbar-brand" href="index.html" >
                    <img src="assets/img/logo.png" alt="" /> <!-- logo here-->
                </a>
            </div>
            <div class="navbar-collapse collapse" data-scrollreveal="enter from the right 50px">
                <ul class="nav navbar-nav">
                    <li class=""><a href="#Homepage">Home</a></li><!-- menu links-->
                    <li><a href="#section-about">About</a></li>  
                    <li><a href="#section-works">Our Works</a></li>
                    <li><a href="#section-services">Services</a></li>
                    <li><a href="#section-contact">Contact</a></li>
                </ul>
            </div>

        </div>
    </div>




  <%-- <section id="Homepage">
        <div class="container">
            <div class="row">
                <div data-scrollreveal="wait 0.5s and then ease-in-out 50px" class="col-md-6 col-md-offset-3">

                    <div class="align-center">
                      <!--   <h2 class="main-text">WELCOME TO COMMON INGESTION RUNNER</h2> -->

                    </div>
                </div>
            </div>
            <div class="row">
                <div data-scrollreveal="enter from the left 500px" class="col-md-6 col-md-offset-3">

                    <div class="align-center">
                        <div class="col-md-12 align-center">
                            <div class="hi-icon-effect-9 hi-icon-effect-9a">

							<form:form method="get" action="hello.html">
								<h2 class="main-text">${jobType.importfromDatabase}</h2>
								
								
								<br>
								
								
								   <a href="./hello.html" class="hi-icon hi-icon-contract"></a>
						    	</form:form>
						   </div>
                            <br />
                          
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section> --%>
     <!--END HOMEPAGE SECTION-->

<section id="section-contact" class="section">
        <div class="container" data-scrollreveal="enter left and move 40px over 0.8s">
            <div class="row">
                <div class="col-md-offset-2 col-md-8">
                    <div>
                        <h2 class="heading">Please enter details for adding source    </h2>
                         <h1 class ="heading" >${sourcename} </h1>

                    </div>
                </div>
            </div>
        </div>
    </section>
    <section>
        <div class="container">
            <div class="row" data-scrollreveal="enter right and move 40px, over 0.8s">
           
                <div class="col-md-16">
                
                    <div  id="contact-form" ><%-- commandName="sourceForm" --%>  
                    
     <form:form method="post" action="savesource" commandName="sourceForm">
     
	 
	<fieldset class="col-md-12 form-group" id="form0" style="margin-top: 50px;">
 	 <legend>ingestion  Details::</legend>
		                      
		                       <div class="col-md-12 form-group">
		                               <!--  <label for="name">Source Name</label> -->
		                  
		                                <input type="hidden" name="sourcename" class="form-control" id="sourcename" placeholder="Source Name" value=${sourcename} />
		                        
		                            </div>
		                            
		                           
		                        
		                      
		                        <div class="col-md-6 form-group">
		                                 <label for="validate_header_footer_flag"> Validate Header Footer</label><br>
		                               <input type="radio"   name="validate_header_footer_flag" id="validate_header_footer_flag"   value="false"> False
		                               
		                                &nbsp;  <input type="radio"   name="validate_header_footer_flag" id="validate_header_footer_flag"  value="true" checked> True
		  								
		                               
		                            </div>
		                            
		                             <div class="col-md-6 form-group">
		                                <label for="quarantine_flag"> Enable Quarantine</label><br>
		                              <input type="radio"   name="quarantine_flag" id="quarantine_flag"   value="false"> False
		                                 &nbsp; <input type="radio"   name="quarantine_flag" id="quarantine_flag"  value="true" checked> True
		  								
		                               
		                               
		                            </div>
		                            
		                             <div class="col-md-6 form-group">
		                                <label for="encoding_flag">Enable Encoding check</label><br>
		                                
		  								<input type="radio"   name="encoding_flag" id="encoding_flag"   value="false"> False
		                                &nbsp; <input type="radio"   name="encoding_flag" id="encoding_flag"  value="true" checked> True
		                               
		                            </div>
		                            
		                            
		                             <div class="col-md-6 form-group">
		                                <label for="archive_flag"> Enable Archival</label><br>
		                                <input type="radio"   name="archive_flag" id="archive_flag"   value="false"> False
		                                &nbsp; <input type="radio"   name="archive_flag" id="archive_flag"  value="true" checked> True
		  								
		                               
		                               
		                            </div>
		
		
							
							
							<div class="col-md-6 form-group">
									<label for="file_header">Reg Exp for file header</label> <input
										type="text" name="file_header" class="form-control"
										id="file_header" placeholder="Reg Exp for file pattern" />
								</div>
								
								
								<div class="col-md-6 form-group">
									<label for="file_footer">Reg Exp for file footer</label> <input
										type="text" name="file_footer" class="form-control"
										id="file_footer" placeholder="Reg Exp for file footer" />
								</div>
		
		
								<div class="col-md-6 form-group">
									<label for="file_name_pattern">Reg Exp for file pattern</label> <input
										type="text" name="file_name_pattern" class="form-control"
										id="file_name_pattern" placeholder="Reg Exp for file pattern" />
								</div>
		
								<div class="col-md-6 form-group">
									<label for="original_file_encoding">Original file
										Encoding</label> <input type="text" name="original_file_encoding"
										class="form-control" id="original_file_encoding"
										placeholder="Original file Encoding" />
								</div>
		
								<div class="col-md-6 form-group">
									<label for="quarantine_file_system">file System for Quarantine</label> 
									<input type="text" name="quarantine_file_system"
										class="form-control" id="quarantine_file_system"
										placeholder="HDFS or Local" />
								</div>
		
								<div class="col-md-6 form-group">
									<label for="output_compression">Output compression</label> <select
										id="output_compression" name="output_compression"
										class="form-control">
										<option value="none">select a value</option>
										<option value="GZip">GZip</option>
										<option value="snappy">snappy</option>
										<option value="Lzo">Lzo</option>
									</select>
		
								</div>
		                       	<div class="col-md-6 form-group">
									<label for="output_file_type">Output compression Type</label> <select
										id="output_compression_type" name="output_compression_type"
										class="form-control">
										<option value="none">select a value</option>
										<option value="BLOCK">BLOCK</option>
										<option value="RECORD">RECORD</option>
		
									</select>
		
								</div>
		
								<div class="col-md-6 form-group">
									<label for="output_file_type">Output File Type</label> <select
										id="output_file_type" name="output_file_type"
										class="form-control">
										<option value="none">select a value</option>
										<option value="text">Text</option>
										<option value="sequence">Sequence</option>
		
									</select>
		
								</div>
		
		
		 logging attribute start
								<div class="col-md-6 form-group">
									<label for="LOG_LEVEL">Log Level</label> <select id="LOG_LEVEL"
										name="LOG_LEVEL" class="form-control">
										<option value="none">select a value</option>
										<option value="DEBUG">DEBUG</option>
										<option value="INFO">INFO</option>
										<option value="ERROR">ERROR</option>
		
									</select>
		
								</div>
		
		
		
		
								<div class="col-md-6 form-group">
									<label for="error_log_retention_days">No of Days for
										ERROR log Retention for </label> <input type="text"
										name="error_log_retention_days" class="form-control"
										id="error_log_retention_days"
										placeholder="No of Days for log Retention" />
								</div>
		
								<div class="col-md-6 form-group">
									<label for="info_log_retention_days">No of Days for INFO
										log Retention for</label> <input type="text"
										name="info_log_retention_days" class="form-control"
										id="info_log_retention_days"
										placeholder="No of Days for log Retention" />
								</div>
		
								<div class="col-md-6 form-group">
									<label for="audit_log_retention_days">No of Days for
										AUDIT log Retention for</label> <input type="text"
										name="audit_log_retention_days" class="form-control"
										id="audit_log_retention_days"
										placeholder="No of Days for log Retention" />
								</div>
		
		
								logging attribute end
		
								<div class="col-md-6 form-group">
									<label for="max_files_limit_to_combine">Maximum Files
										Limit to Combine</label> <input type="text"
										name="max_files_limit_to_combine" class="form-control"
										id="max_files_limit_to_combine"
										placeholder="Max Files Limit to Combine" />
								</div>
		
								<div class="col-md-6 form-group">
									<label for="min_files_limit_to_combine">Minimum Files
										Limit to Combine</label> <input type="text"
										name="min_files_limit_to_combine" class="form-control"
										id="min_files_limit_to_combine"
										placeholder="No of Days for log Retention" />
								</div>
		
								<div class="col-md-6 form-group">
									<label for="min_total_file_size">Minimum Total Files
										Limit size </label> <input type="text" name="min_total_file_size"
										class="form-control" id="min_total_file_size"
										placeholder="No of Days for log Retention" />
								</div>
		
		
							
								
		</fieldset>			
						
		<fieldset class="col-md-12 form-group" id="hiveloaderform" >
 			<legend>hive loader  Details:</legend>
					<%-- <form:form method="post" name="" action="somepage" commandName="somedata"  > --%>
                    
						<div class="col-md-6 form-group">
							<label for="Stage loder script">Stage loder script</label> <input type="text"
								name="Stage_loder_script" class="form-control"
								id="Stage_loder_script"
								placeholder="Stage loder script" defalt=""/>
						</div>
					
					<!-- 	<div class="col-md-6 form-group">
							<label for="Transform loder script">Stage loder script</label> <input type="text"
								name="Transform_loder_script" class="form-control"
								id="Transform_loder_script"
								placeholder="Transform loder script" />
						</div> -->
 

					<button type="reset" style="height: 40px; margin-bottom: 50px;" class="col-md-offset-4 col-md-4 btn btn-primary">Clear</button>
                     
               </fieldset>          
               
                <button type="submit" style="height: 40px; margin-bottom: 50px; margin-left: 1%;" class="col-md-offset-2 col-md-2 btn btn-primary">Create configuration</button>
                      
	</form:form>
					
						
						
                    </div>
                </div>
           
                </div>
                <!-- ./span12 -->
            </div>

      <!--   </div> -->
    </section>


	<!-- END HEADER SECTION-->
</body>
</html>