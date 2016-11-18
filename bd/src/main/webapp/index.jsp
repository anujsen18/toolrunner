<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
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
    <meta charset="utf-8">
    <title>Bootstrap Multipurpose Template - Tridenta</title>
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script>
    var poscounter = 0;
    $().ready(
    		
    		
    		function() {  
        $('#add').click(function() {  poscounter = poscounter+1;
       $length = $('#select1').children('option:selected').length;
        if($length > 1 ){
        alert("Please select only one operation at a time ");
        return false;}
        else {
        $selval=$('#select1 option:selected');
        alert($selval.val);
        alert($selval);
        	return !$('#select1 option:selected').val(+"#"+poscounter).remove().appendTo('#select2');
        	
        	}
        });  
        $('#remove').click(function() {   poscounter = poscounter-1;	
        alert(poscounter);
           return !$('#select2 option:selected').remove().appendTo('#select1');  
        });  
    });
    
    </script>
</head>
<style>

.arrow {
    width:120px;
}

.line {
    margin-top:14px;
    width:90px;
    background:blue;
    height:10px;
    float:left;
}
.point {    
    width: 0;
    height: 0; 
    border-top: 20px solid transparent;
    border-bottom: 20px solid transparent;
    border-left: 30px solid blue;
    float:right;
}
</style>
<body>

   <!-- HEADER SECTION-->
   <!--  <div class="navbar navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="fa fa-bars mobile-bars" style=""></span>
                </button>
                <a class="navbar-brand" href="index.html" >
                    <img src="assets/img/logo.png" alt="" /> logo here
                </a>
            </div>
            <div class="navbar-collapse collapse" data-scrollreveal="enter from the right 50px">
                <ul class="nav navbar-nav">
                    <li class=""><a href="#Homepage">Home</a></li>menu links
                    <li><a href="#section-about">About</a></li>  
                    <li><a href="#section-works">Our Works</a></li>
                    <li><a href="#section-services">Services</a></li>
                    <li><a href="#section-contact">Contact</a></li>
                </ul>
            </div>

        </div>
    </div> -->
  <input type="radio"   name="encoding_flag" id="encoding_flag"   value="false">
   <!--   <img src="assets/img/intro/Picture1.png" alt="" />  -->
   
   <div>  
  <select multiple id="select1">  
  
   
<option value="ingestion">INGESTION</option>
<option value="hiveloader">HIVELOADER</option>
<option value="compaction">COMPACTION</option>
<option value="import">IMPORT</option>
<option value="archival">ARCHIVAL</option>
  </select>  
  <a href="#" id="add">add &gt;&gt;</a>  
</div>  
<div>  
  <select multiple id="select2"></select>  
  <a href="#" id="remove">&lt;&lt; remove</a>  
</div>  
</body>
</html>
 --%>
 
 <jsp:forward page="getHome.html"></jsp:forward>