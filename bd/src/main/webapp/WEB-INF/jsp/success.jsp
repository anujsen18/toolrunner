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
</head>

<body>

 <%@ include file="header.jsp" %>



  <section id="Homepage">
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
								<h2 class="main-text">${msg}</h2>
								
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
     <!--END HOMEPAGE SECTION-->

	<!-- END HEADER SECTION-->
</body>
</html>