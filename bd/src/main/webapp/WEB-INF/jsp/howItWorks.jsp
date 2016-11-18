<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib  uri="http://www.springframework.org/tags" prefix="spring"%>
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


<body>
<%@ include file="header.jsp" %>
     <!-- HEADER SECTION-->
  

    <!--PAGE CONTENT--> 
    <!-- HOMEPAGE SECTION-->  

    <section id="Homepage">
        <div class="container">
            <div class="row">
                <div data-scrollreveal="wait 0.5s and then ease-in-out 50px" class="col-md-6 col-md-offset-3">

                    <div class="align-center">
                        <h2 class="main-text" style="color:rgba(21, 4, 4, 0.66)">How it works ...</h2>

                    </div>
                </div>
            </div>
            <div class="row">
                <div data-scrollreveal="enter from the left 100px" class="col-md-12 ">

                    <div class="align-center">
                        <div class="col-md-12 align-left">
                            
                            
                           <h2 class="main-text" >Configure </h2>   
                        
                           
                           <h2 class="main-text" >V </h2>   
                           <h2 class="main-text">Schedule  </h2> 
                            <h2 class="main-text" >V </h2>   
                           <h2 class="main-text">Run  </h2>   
                             <h2 class="main-text" >V </h2>   
                           <h2 class="main-text">Monitor  </h2>   
                
                      <!--       <h2 class="main-text">Configur
                          
                          
                          
                            <br />
                           <!--  <ul class="social-network social-circle">
                                <li><a href="#" class="icoRss" title="Rss"><i class="fa fa-rss"></i></a></li>
                                <li><a href="#" class="icoFacebook" title="Facebook"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#" class="icoTwitter" title="Twitter"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#" class="icoGoogle" title="Google +"><i class="fa fa-google-plus"></i></a></li>
                                <li><a href="#" class="icoLinkedin" title="Linkedin"><i class="fa fa-linkedin"></i></a></li>
                            </ul> -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
     <!--END HOMEPAGE SECTION-->
    
  
    <!-- FOOTER SECTION-->
    <section id="footer" class="section footer">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <ul class="social-network social-circle">
                        <li><a href="#" class="icoRss" title="Rss"><i class="fa fa-rss"></i></a></li>
                        <li><a href="#" class="icoLinkedin" title="Linkedin"><i class="fa fa-linkedin"></i></a></li>
                    </ul>
                </div>
                <div class="col-sm-6 align-center">
                    <div class="col-sm-12">
                        <p>Copyright &copy; www.cognizant.com</p>
                        <p>2014 All Rights Reserved</p>
                    </div>
                </div>
            </div>


        </div>

    </section>
     <!-- END FOOTER SECTION-->
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

		
		 
	$('.togel').click(function() {
			var formname = this.id;
			var app = formname + "form";
			if ($('#' + formname).is(":checked"))
				$('#' + app).show();
			else
				$('#' + app).hide();
		});
	});
</script> 
    <!--END  BODY SECTION-->
</html>
