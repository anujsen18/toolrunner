<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib  uri="http://www.springframework.org/tags" prefix="spring"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html class="no-js">
<!--<![endif]-->
      <!-- HEAD SECTION-->
<head>
    <meta charset="utf-8">
    <title>AIM Big Data Runner</title>
   
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">   
     <!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
    <!-- MAIN STYLE SECTION-->
    <link href="assets/plugins/isotope/isotope.css" rel="stylesheet" media="screen" />
   <!--  <link href="assets/plugins/fancybox/jquery.fancybox.css" rel="stylesheet" /> -->
    <link href="assets/plugins/IconHoverEffects-master/css/component.css" rel="stylesheet" />
    <link href="assets/plugins/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="assets/css/about-achivements.css" rel="stylesheet" />
    <link id="mainStyle" href="assets/css/style.css" rel="stylesheet" />
    <link href='http://fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'>
    <!-- END MAIN STYLE SECTION-->
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  
</head>

     <script type="text/javascript">
     
     function  executeFlow() {
    	 var source = document.getElementById("source").value;
    	 var env = document.getElementById("env").value;
    	 var operation = document.getElementById("operation").value;
    	    	 if (validation()) // Calling validation function
    	    	 {
    	    	 var x = document.getElementsByName('executorform');
    	    	 document.getElementById("msgBox").style.display = "block";
    	    	 x[0].submit(); //form submission
    	    	 alert("execting..." + operation+" for "+ source);
    	    	 }
    	    	 
    	    	
    	    	
     }
     
     function getfieldsPage(){
    
    
    	    	 if (validatesub()) // Calling validation function
    	    	 {
    	    	 var x = document.getElementsByName('fieldGetter');
    	    	 x[0].submit(); //form submission
    	    
    	    	 }
    }
     
     function validatesub(){
    	 var source = document.getElementById("sourcename").value; 
    	 if(source === 'none'||source ===''){
 	    	alert("Please provide source name for configuration");
 	    	return false;
 	    	}else {
 	    	return true;
 	    	}
     }
     
     
     function validation() {
    	 var source = document.getElementById("source").value;
    	 var env = document.getElementById("env").value;
    	 var operation = document.getElementById("operation").value;
    	 
    	if (source === 'none' || env === 'none' || operation === 'none') {
    	alert("Please select all fields...!!!!!!");
    	return false;
    	}else {
    	return true;
    	}
    	}
     
     
     function getClusterData(){ 
     	var  cluster = $('#clusterconf').val();
     	$("#source").empty();
        $("#source").append($('<option>').text("select a value").val("none"));
    	$("#env").empty();
        $("#env").append($('<option>').text("select a value").val("none"));
     	  var url="getCluster.html?cluster="+cluster;
        
      
     	     $projectKey = $('#projectKey');

     		 
     		            $.ajax({
     		                type: "GET",
     		                url: "getCluster.html",
     		                data: {"cluster": $('#clusterconf').val()},
     		                dataType: 'json',
     		                success: function(data){
     		                	  var listvar = [ '#source','#env']       
     		               $.each(data, function(index, value) {  
     		            	 
     		               var cuind=index
     		                    $.each(value, function(index, val2) {
     		                    	
     		                    	 
     		                       $(listvar[cuind]).append($('<option>').text(val2).val(val2));
     		                 
     		                  });  
     		                    });
     		                }
     		            });
     		       
     		
 }
     
   
     
   
     </script>
<body>
<%@ include file="header.jsp" %>
    

    <section id="Homepage">
        <div class="container">
            <div class="row">
                <div data-scrollreveal="wait 0.5s and then ease-in-out 50px" class="col-md-6 col-md-offset-3">

                    <div class="align-center">
                        <h2 class="main-text">WELCOME TO COMMON INGESTION RUNNER</h2>

                    </div>
                </div>
            </div>
            <div class="row">
                <div data-scrollreveal="enter from the left 500px" class="col-md-6 col-md-offset-3">

                    <div class="align-center">
                        <div class="col-md-12 align-center">
                            <div class="hi-icon-effect-9 hi-icon-effect-9a">
                             
                                <a href="#section-services" class="hi-icon hi-icon-cog"></a>
                                <a href="#section-contact" class="hi-icon  hi-icon-screen"></a>
                                <!-- <a href="#section-about" class="hi-icon  hi-icon-user"></a> -->
                                <a href="#section-works" class="hi-icon  hi-icon-images"></a>
                            </div>
                            <br />
                         
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
  
    <!-- SERVICES SECTION-->
    <section id="section-services" class="section" >
        <div class="container" data-scrollreveal='after 0.30s'>
            <div class="row">
                <div class="col-md-offset-2 col-md-8">
                    <div>
                        <h2 class="heading">Services</h2>
                        <p class="heading-text">
                            You can execute a flow by providing required details ... Go...
                        </p>

                        <p class="heading-text" id="msgBox" hidden="true">
                           Please wait ... Running Job for  
                        </p>

                    </div>
                </div>
            </div>
        </div>
    </section>
    <section  class="section bgcolor-whitesmoke">
        <div class="container">


<!--test  -->
 <div class="col-md-8">
                    <div  id="contact-form" >

                       <form name="executorform" method="get" action="submitJob.html">
                         
                         <div id="fordata">
                         
                         </div>
                       
                       
                           
                            <div class="col-md-6 form-group">
                                <label for="Source">Source</label>
                                <select id="source" name="source" class="form-control">
											<option value="none">select a value</option>
											
								<c:forEach items="${sourcelist}" var="sourceval">
								 <option value="${sourceval}">${sourceval}</option>
								</c:forEach>
								</select>
                                
                            </div>
                            <div class="col-md-6 form-group">
                               <label for="Environment">Environment</label>
                               <select id="env" name="env" class="form-control">
										<option value="none">select a value</option>
											<c:forEach items="${envrlist}" var="envval">
											 <option value="${envval}">${envval}</option>
											</c:forEach>
									</select>
                               
                            </div>
                            <div class="col-md-12 form-group">
                           
                            
                            
                                <label for="Operation">Operation</label>
                                <select id="operation" name="operation" class="form-control">
											<option value="none">select a value</option>
											<option value="ingestion">INGESTION</option>
											<option value="hiveloader">HIVELOADER</option>
											<option value="compaction">COMPACTION</option>
											<option value="import">IMPORT</option>
											<option value="archival">ARCHIVAL</option>

									</select>
                               
                            </div>
                            

                           
                        
                        <input type="button" style="height: 40px; margin-bottom: 50px; margin-left: 5.33%;" class="col-md-offset-4 col-md-4 btn btn-primary" value="Run Job" onclick="executeFlow()"/>
						
						<input type="button" style="height: 40px; margin-bottom: 50px;margin-left: 5.33%;" class="col-md-offset-4 col-md-4 btn btn-primary" value="Reset" onclick="reset()"/>
						</form>		




                    </div>
                </div>

<!-- test end  -->

            <div class="row">
                <div data-scrollreveal='over 0.8s' class="col-lg-3">
                    <div class="align-center">
                      <div class="col-md-6 form-group">
                      
                      
                      
       
                       </div> 
                    </div>
                </div>
               



                <div data-scrollreveal="enter right and move 40px, over 0.8s" class="col-lg-6">

                
                </div>

            </div>

        </div>
    </section>
    <!-- END SERVICES SECTION-->
    <!-- ADD SOURCE  SECTION-->
    <section id="section-contact" class="section">
        <div class="container" data-scrollreveal="enter left and move 40px over 0.8s">
            <div class="row">
                <div class="col-md-offset-2 col-md-8">
                    <div>
                        <h2 class="heading">ADD new Source Configuration</h2>
                        <p class="heading-text">
                           For Onboarding a new Source Please specified the Mandaotry configuration attribute here . 
                        </p>

                    </div>
                </div>
            </div>
        </div>
    </section>
    <section>
        <div class="container">
            <div class="row" data-scrollreveal="enter right and move 40px, over 0.8s">
             <img src="assets/img/intro/arch.png" style="border:1px solid #37AFFF ;margin-top: 20px;"  >
                <div class="col-md-16">
                
                    <div  id="contact-form" ><%-- commandName="sourceForm" --%>  
                    
     <form:form method="get" action="getAttributePage" name="fieldGetter" commandName="jobType">

							
							
							 <%-- <div class="col-md-16">
						<label for="name"  style=" margin-bottom: 30px; color:#3276b1">Select Cluster for adding configuration </label> 	
							 <select name='clusterconf' class="form-control">
								<option id="" >select a value</option>
								<c:forEach items="${clusterlist}" var="clusterval">
								 <option value="${clusterval}">${clusterval}</option>
									
								</c:forEach>
							</select> 
							</div> --%>
 <label for="name"  style=" margin-bottom: 30px; color:#3276b1">Select operations for configure the source </label> 
	   <div class="col-md-16 form-group">
	       <div class="col-md-3 form-group">
	         <label for="fileIngestion">1. </label>
  		    <input type="checkbox" name="fileIngestion" class="togel" id="fileIngestion" value="false" > 
 		    <label for="INGESTION">INGESTION</label>
 		    </div>
			
			
			<div class="col-md-3 form-group">
			    <label for="importfromDatabase">2. </label>
  		    <input type="checkbox" name="importfromDatabase" id="importfromDatabase" value="false"  > 
			  <label for="importfromDatabase" >DB Import</label>
			   
			</div>
			
			
			 <div class="col-md-3 form-group">
			    <label for="rawAreaArchival">3. </label>
  		    <input type="checkbox" name="rawAreaArchival" id="rawAreaArchival" value="false"  > 
			  <label for="rawAreaArchival">ARCHIVAL</label>
			</div>
			
			  <div class="col-md-3 form-group">
 		      <label for="bulkfileProcessing">4. </label>
 		    <input type="checkbox" name="bulkfileProcessing" class="togel"  id="bulkfileProcessing" value="false"  >
 		     <label for=" bulkfileProcessing"> Bulk file Processing</label>
 		     </div>
			
			

			<div class="col-md-3 form-group">
			    <label for="hDFSRetention">5. </label>
  		    <input type="checkbox" name="hDFSRetention" id="hDFSRetention" value="false"  > 
			  <label for="hDFSRetention">HDFS Retention</label>
			</div>
			
			
			 <div class="col-md-3 form-group">
 		     <label for="hIVECompaction">6. </label>
 		    <input type="checkbox" name="hIVECompaction"  id="hIVECompaction"  value="false"  > 
  			  <label for="hIVECompaction">HIVE Compaction</label>
  			 </div>
			
			
			<div class="col-md-3 form-group">
 		        <label for="exportToFtpServer">7. </label>
  			<input type="checkbox" name="exportToFtpServer" id="exportToFtpServer" value="false"  > 
  		     <label for="exportToFtpServer">Export To FtpServer</label>
  		    </div>
			
			<div class="col-md-3 form-group">
 		        <label for="exportToDatabase">8. </label>
  			<input type="checkbox" name="exportToDatabase" id="exportToDatabase" value="false"  > 
  		     <label for="exportToDatabase">Export To Database</label>
  		    </div>
			
			 <div class="col-md-3 form-group">
 		        <label for="dataDeDuplication">9. </label>
  		    <input type="checkbox" name="dataDeDuplication" id="dataDeDuplication" value="false"  > 
			  <label for="dataDeDuplication">Data De Duplication</label>
			</div>
			
			<div class="col-md-3 form-group">
			    <label for="automatedDeployment">10. </label>
  		    <input type="checkbox" name="automatedDeployment" id="automatedDeployment" value="false"  > 
			  <label for="automatedDeployment">Automated Deployment</label>
			</div>
			
</div>

 <div class="col-md-12 form-group">
		                                <label for="name">Source Name</label>
		                       
		                                <input type="text" name="sourcename"  id="sourcename" class="col-md-4 form-control" id="sourcename" placeholder="Source Name" defalt="" />
		                        
		                         
      </div>

<!-- 		  <input type="button" style="height: 40px; margin-bottom: 50px;" class="col-md-offset-2 col-md-2 btn btn-primary" onclick="getfieldsPage()"/>Create configuration -->
          <input type="button" style="height: 40px; margin-bottom: 50px; margin-left: 5.33%;" class="col-md-offset-4 col-md-4 btn btn-primary" value="Create configuration" onclick="getfieldsPage()"/>             
						 </form:form> 
					
						
						
                    </div>
                </div>
           
                </div>
                <!-- ./span12 -->
            </div>

      <!--   </div> -->
    </section>
   <%@ include file="footer.jsp" %>
     <!-- SCROLLUP LINK SECTION-->
    <a href="#Homepage" class="scrollup"><i class="fa fa-chevron-up"></i></a>
     <!--END SCROLLUP LINK SECTION-->
    <!-- STYLE SWITCHER SECTION-->
    <div  class="panel" style="color:white">
        <div id="styledemo"  style="left: 0px;">
		<span id="theme_blue" style="background-color:#37AFFF" ></span>
		<span id="theme_green" style="background-color:#469E66" ></span>
		<span id="theme_brown" style="background-color:#E69351" ></span>
		<span id="theme_red" style="background-color:#E7484E" ></span>
            </div>
</div>
<a class="trigger" href="#"></a>
    <!-- END STYLE SWITCHER SECTION-->
    <!-- MAIN SCRIPTS SECTION-->
    <script src="assets/js/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/scrollReveal.js"></script>
    <script>
      //  window.scrollReveal = new scrollReveal(); //please put this script here to show animation at the time of scroll
    </script>
    <script src="assets/js/jquery.easing.1.3.js"></script>
    <script src="assets/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="assets/plugins/isotope/jquery.isotope.min.js"></script>
    <script src="assets/plugins/fancybox/jquery.fancybox.pack.js"></script>
    <script src="assets/js/jquery.localscroll-1.2.7-min.js"></script>
    <script src="assets/js/jquery.appear.js"></script>
    <script src="assets/scripts/main.js"></script>
   
     <!--END MAIN SCRIPTS SECTION-->
</body>
<script type="text/javascript">
		$(document).ready(function(){
			 $('#ingestionform').hide(); 
			 $('#hiveloaderform').hide(); 	

			 $("input[type='checkbox']").on("change",function(){
				   if($(this).is(":checked"))
				      $(this).val("true");
				    else
				      $(this).val("false");
				});
/* 		 
	$('').click(function() {
			var formname = this.id;
			var app = formname + "form";
			if ($('#' + formname).is(":checked"))
				$('#' + app).show();
			else
				$('#' + app).hide();
		}); */
	});
</script> 
    <!--END  BODY SECTION-->
</html>
