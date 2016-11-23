<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<h2>Parameters Submitted :</h2>

<table>
<tr>
<td>Minut :</td>
<td>${cronjb.minute} </td>
</tr>
<tr>
<td>Hour:</td>
<td>${cronjb.hour} </td>
</tr>
<tr>
<td>Day :</td>
<td>${cronjb.day} </td>
</tr>
<tr>
<td>Month :</td>
<td>${cronjb.month} </td>
</tr>
<td>Day Of Week :</td>
<td>${cronjb.dow} </td>
</tr>
</table>
</body>
</html>