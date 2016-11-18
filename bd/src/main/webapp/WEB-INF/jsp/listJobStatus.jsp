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
    <!-- END MAIN STYLE SECTION-->
    
      <c:set var="jobs" value="${jobs}" />
</head>
 <style>

<!-- .responstable {
	  margin: 1em 0;
	  width: 100%;
	  overflow: hidden;
	  background: #FFF;
	  color: #024457;
	  border-radius: 10px;
	  border: 1px solid #167F92;
	}
	.responstable tr {
	  border: 1px solid #D9E4E6;
	}
	.responstable tr:nth-child(odd) {
	  background-color: #EAF3F3;
	}
	.responstable th {
	  display: none;
	  border: 1px solid #FFF;
	  background-color: #37AFFF;
	  color: #FFF;
	  padding: 1em;
	}
	.responstable th:first-child {
	  display: table-cell;
	  text-align: center;
	}
	.responstable th:nth-child(2) {
	  display: table-cell;
	}
	.responstable th:nth-child(2) span {
	  display: none;
	}
	.responstable th:nth-child(2):after {
	  content: attr(data-th);
	}
	@media (min-width: 480px) {
	  .responstable th:nth-child(2) span {
	    display: block;
	  }
	  .responstable th:nth-child(2):after {
	    display: none;
	  }
	}
	.responstable td {
	  display: block;
	  word-wrap: break-word;
	  max-width: 7em;
	}
	.responstable td:first-child {
	  display: table-cell;
	  text-align: center;
	  border-right: 1px solid #D9E4E6;
	}
	@media (min-width: 480px) {
	  .responstable td {
	    border: 1px solid #D9E4E6;
	  }
	}
	.responstable th, .responstable td {
	  text-align: left;
	  margin: .5em 1em;
	}
	@media (min-width: 480px) {
	  .responstable th, .responstable td {
	    display: table-cell;
	    padding: 1em;
	  }
	}
</style>
<body>

   <%@ include file="header.jsp" %>



 <%--  <section id="Homepage">
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
								<h2 class="main-text">${jobs}</h2>
								
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
    </section>
    
     --%>
    
      <section  class="section">
        <div class="container">



<!--test  -->
 <div class="col-md-12">
                    <div  id="contact-form" >

                       <form name="executorform" method="get" action="submitJob.html">
                         <h2 class="main-text" style="color: #37AFFF;">Scheduled jobs : </h2>  
                          
                            <table class="responstable">
  
							  <tr>
							    <th>Source</th>
							    <th>Operation</th>
							    <th>Environment</th>
							    <th>Minute</th>
							    <th>Hour</th>
							    <th>Day</th>
							    <th>Month</th>
							    <th>Status</th>
							   
							  </tr>
							  
						<c:forEach items="${jobs}" var="jobsa">
						 <tr>
							   <td>${jobsa.sourceName}</td>
							   <td> ${jobsa.operation}</td> 
							    <td> ${jobsa.env}</td>
							    <td>${jobsa.schMin}</td>
							    <td> ${jobsa.schHour}</td>
							    <td> ${jobsa.schDay}</td>
							    <td> ${jobsa.schMonth}</td>
							    <td> ${jobsa.status}</td>
							    </tr>
						</c:forEach> 
												
						</table>
                           
                        
                      
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
     <!--END HOMEPAGE SECTION-->

	<!-- END HEADER SECTION-->
</body>
</html>