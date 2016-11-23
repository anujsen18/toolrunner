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
    <link href="assets/plugins/fancybox/jquery.fancybox.css" rel="stylesheet" />
    <link href="assets/plugins/IconHoverEffects-master/css/component.css" rel="stylesheet" />
    <link href="assets/plugins/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="assets/css/about-achivements.css" rel="stylesheet" />
    <link id="mainStyle" href="assets/css/style.css" rel="stylesheet" />
    <link href='http://fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'>
    <!-- END MAIN STYLE SECTION-->
</head>
<!-- END HEAD SECTION-->

     <!-- BODY SECTION-->
     
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
    <section>
        <div class="container">

   <form action="displayjobs.html" method="post" commandName="cronjb">     
<!--  -->
         <div class="col-md-12">
                    <div  id="contact-form" >
                    
                  
                           
                             <div class="col-md-12 form-group">
                                <label for="Source">Cluster</label>   
                            <select name='clusterconf' id="clusterconf" class="form-control" onchange="getClusterData()">
								<option >select a value</option>
								<c:forEach items="${clusterlist}" var="clusterval">
								 <option value="${clusterval}">${clusterval}</option>
									
								</c:forEach>
							</select>
                           
                            </div>
                           
                           
                            <div class="col-md-6 form-group">
                                <label for="Source">Source</label>
                                <select id="source" name="source" class="form-control">
											<option value="none">select a value</option>
											<option value="cdr_source">CDR</option>
											<option value="CALLRECORDS">CALLRECORDS</option>
								</select>
                                
                            </div>
                            <div class="col-md-6 form-group">
                               <label for="Environment">Environment</label>
                               <select id="env" name="env" class="form-control">
											<option value="none">select a value</option>
											<option value="dev">DEV</option>
											<option value="prod">PROD</option>
									</select>
                               
                            </div>
                            <div class="col-md-6 form-group">
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
                       
					
							 <div class="col-md-6 form-group ">
                               <label for="Minute">Minute:</label>
                          
                               <input class="form-control" type="text" name="minute" " placeholder="Minut(0-59)">
                           
                            </div>
                            
                            
                             <div class="col-md-6 form-group">
                               <label for="Hour" >Hour:</label>
                      
                               <input class="form-control" type="text" name="hour"  placeholder="Hour(0-23)">
                             
                            </div>
                            <div class="col-md-6 form-group">
                               <label for="Day" >Day:</label>
                          
                               <input class="form-control" type="text" name="day" placeholder="Day(1-31)">
                          
                            </div>
                            <div class="col-md-6 form-group">
                               <label for="Month" >Month:</label>
                         
                               <input class="form-control" type="text" name="month" placeholder="Month(1-12)">
                            
                            </div>
                            <div class="col-md-6 form-group">
                               <label for="Day-of-week" >Day-of-week:</label>
                           
                               <input class="form-control" type="text" name="dow" placeholder="DOW(0-7)">
                             
                            </div>
                            	
                            
                            
                    </div>
                </div>                   

                     
                                                
                                               
                           
                           
                               
                        <input type="submit" style="height: 40px;margin-bottom: 50px;margin-left: 5.33%;width: 126px;" class="col-md-offset-4 col-md-4 btn btn-primary" value="Schedule Job" />
						
						<input type="button" style="height: 40px;margin-bottom: 50px;margin-left: 5.33%;width: 126px;" class="col-md-offset-4 col-md-4 btn btn-primary" value="Reset" onclick="reset()"/>
						
						<h1>${msg}</h1>
						</form>		




                    </div>
                </div>
                
                
                
                
                
                 

<!-- test end  -->

            <div class="row">
                <div data-scrollreveal='over 0.8s' class="col-lg-3">
                    <div class="align-center">
                      <div class="col-md-6 form-group">
                      
                      
                      
                      <!-- Executor form start   -->
       <%--    <form:form method="get" action="submitJob.html" >
			<form action="submitJob.html" method="get">
							<table>
								<tr>
									<td>  <label for="Source">Source</label></td>
									<td><select id="source" name="source" class="form-control">
											<option value="none">select a value</option>
											<option value="cdr_source">CDR</option>
											<option value="CALLRECORDS">CALLRECORDS</option>
									</select></td>
								</tr>
								<tr>
									<td>  <label for="Environment">Environment</label> </td>
									<td><select id="env" name="env" class="form-control">
											<option value="none">select a value</option>
											<option value="dev">DEV</option>
											<option value="prod">PROD</option>
									</select></td>
								</tr>
								<tr>
									<td><label for="Operation">Operation</label></td>
									<td><select id="operation" name="operation" class="form-control">
											<option value="none">select a value</option>
											<option value="ingestion">INGESTION</option>
											<option value="hiveloader">HIVELOADER</option>
											<option value="compaction">COMPACTION</option>
											<option value="import">IMPORT</option>
											<option value="archival">ARCHIVAL</option>

									</select></td>
								</tr>
								<tr></tr>
								<tr>
									<td>
									<input type="submit" style="height: 40px; margin-bottom: 50px;" class="col-md-offset-4 col-md-4 btn btn-primaryvalue="Run Job"></td>
									<td>
									<input type="button" style="height: 40px; margin-bottom: 50px;" class="col-md-offset-4 col-md-4 btn btn-primaryvalue="Reset"></td>
								</tr>
							</table>
						</form:form> --%>
                       </div> 
                    </div>
                </div>
               



                <div data-scrollreveal="enter right and move 40px, over 0.8s" class="col-lg-6">

                   <!--  <div data-scrollreveal="enter right">
                        <ul class="timeline">
                            <li class="time-label">
                                <span class="bg-green">Things We Have For You
                                </span>
                                <br />
                                <br />
                            </li>

                            <li>
                                <i class="fa fa-comments bg-yellow"></i>
                                <div class="timeline-item">

                                    <div class="timeline-body" style="background-color: whitesmoke;">
                                        Sed accumsan venenatis blandit. Duis auctor hendrerit metus sed accumsan.
                                    </div>
                                    <div class='timeline-footer'>
                                        <a class="btn btn-primary btn-xs">Request Quote</a>
                                        <a class="btn btn-danger btn-xs">Order Now</a>
                                    </div>
                                </div>
                            </li>

                            <li>
                                <i class="fa fa-user bg-aqua"></i>
                                <div class="timeline-item">
                                    <span class="time">New Service</span>
                                    <h3 class="timeline-header no-border"><a href="#"> Sed accumsan</a> Duis auctor hendrerit metus</h3>
                                </div>
                            </li>
                            <li class="time-label">

                                <span class="bg-blue">Call US : +04-000-000-00
                                </span>
                            </li>

                            <li>
                                <i class="fa fa-clock-o"></i>
                            </li>
                        </ul>
                    </div> -->
                </div>

            </div>

        </div>
    </section>
    <!-- END SERVICES SECTION-->
    
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

    <!--END  BODY SECTION-->
</html>
