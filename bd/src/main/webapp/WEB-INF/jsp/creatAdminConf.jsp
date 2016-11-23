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
       
      
   
   
</head>

<body>
<%@ include file="header.jsp" %>
   <!-- HEADER SECTION-->
   





 <section>
        <div class="container">
            <div class="row" data-scrollreveal="enter right and move 40px, over 0.8s">
           
                <div class="col-md-16">
                
                    <div  id="contact-form" ><%-- commandName="sourceForm" --%>  
                    
     <form:form method="post" action="saveclusterdtl" commandName="clusterForm">
     
	 
	<fieldset class="col-md-12 form-group" id="form0" style="margin-top: 50px;">
 	 <legend>Manage Cluster :</legend>

					<div class="col-md-6 form-group">
								<label for="label_for_clustername"> Cluster Name</label> 	<br>
								<input type="text" name="cluster_name" class="form-control"
								 id="cluster_name" placeholder="Name for cluster" />
				</div>
				
				
				<div class="col-md-6 form-group">
								<label for="label_for_host_address"> Host address</label> 	<br>
								<input type="text" name="host_address" class="form-control"
								 id="host_address" placeholder="Host address" />
				</div>	
				
				
				
				<div class="col-md-6 form-group">
								<label for="label_for_sysuser"> System user for Host</label> 	<br>
								<input type="text" name="sysuser" class="form-control"
								 id="sysuser" placeholder="System user for Host" />
				</div>	
				
				
				
				
				
				
				
				<div class="col-md-6 form-group">
								<label for="lanel_for_workspace">Workspace dir on host</label> 	<br>
								<input type="text" name="workspacedir_host" class="form-control"
								 id="workspacedir_host" placeholder="Workspace dir on host" />
				</div>
				
				
				<div class="col-md-6 form-group">
								<label for="lanel_for_env">Env</label> 	<br>
								<input type="text" name="Env" class="form-control"
								 id="Env" placeholder="Workspace dir on host" />
				</div>
				
				
				<div class="col-md-6 form-group">
								<label for="label_for_pasword">System password for Host</label> 	<br>
								<input type="password" name="host_pasword" class="form-control" style=""
								 id="host_pasword" placeholder="System password for Host" />
				</div>			
							
								
	</fieldset>			
						
		        
               
                <button type="submit" style="height: 40px; margin-bottom: 50px; margin-left: 1%;" class="col-md-offset-2 col-md-2 btn btn-primary">Add cluster</button>
                      
	</form:form>
					
						
						
                    </div>
                </div>
           
                </div>
                <!-- ./span12 -->
            </div>

      <!--   </div> -->
    </section>
  <%@ include file="footer.jsp" %>

	<!-- END HEADER SECTION-->
</body>
</html>