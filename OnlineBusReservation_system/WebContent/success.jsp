<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>

<html>
<head>
<meta charset="utf-8">
 	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<link href='http://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<title>Success</title>
</head>
<style>
body {
      font-family: 'Roboto', sans-serif;
      font-size:16px;
    }
#tckdTD1,#tckdTD2,#tckdTD3,#tckdTD4
{
	font-size:20px;border:2px solid #31708f !important;
	
	
}
td
{
	width:25%;
	
}
table
{
	width:50%;
	background:#eee;
	margin-bottom:20px;
}
</style>
<body>
<div class="container">
	<div class="page-header">
			<img alt="" src="./SQL_Spartans.jpg">
	</div>
	<c:choose>
		<c:when test="${msg == 'success' }"> 
		    <h3><label>Reservation Confirmed successfully</label></h3> <br> <br>
		    <div class="container">
		    	<label>Ticket Details</label>
		    	<table>
		    		<tr>
		    			<td></td>
		    			<td></td>
		    			<td></td>
		    			<td id="tckdTD1">T<bean:write name="reservationForm" property="route"/>00<bean:write name="reservationForm" property="passSeat1"/>
		    			</td>
		    		</tr>
		    		<tr>
		    			<td>From </td>
		    			<td><bean:write name="reservationForm" property="source"/></td>
		    			<td>To </td>
		    			<td><bean:write name="reservationForm" property="destination"/></td>
		    		</tr>
		    		<tr>
		    			<td>Start time </td>
		    			<td><bean:write name="reservationForm" property="time"/></td>
		    			<td></td>
		    			<td></td>
		    			
		    		</tr>
		    		<tr>
		    			<td>Seat number</td>
		    			<td><bean:write name="reservationForm" property="passSeat1"/></td>
		    			<td></td>
		    			<td></td>
		    			
		    		</tr>
		    		
		    	</table>
		    	<logic:notEmpty name="reservationForm" property="passName2">
		    		<table>
		    		<tr>
		    			<td></td>
		    			<td></td>
		    			<td></td>
		    			<td id="tckdTD2">T<bean:write name="reservationForm" property="route"/>00<bean:write name="reservationForm" property="passSeat2"/></td>
		    		</tr>
		    		<tr>
		    			<td>From </td>
		    			<td><bean:write name="reservationForm" property="source"/></td>
		    			<td>To </td>
		    			<td><bean:write name="reservationForm" property="destination"/></td>
		    		</tr>
		    		<tr>
		    			<td>Start time </td>
		    			<td><bean:write name="reservationForm" property="time"/></td>
		    			
		    		</tr>
		    		<tr>
		    			<td>Seat number</td>
		    			<td><bean:write name="reservationForm" property="passSeat2"/></td>
		    		</tr>
		    		
		    	</table>
		    	</logic:notEmpty>
		    	<logic:notEmpty name="reservationForm" property="passName3">
		    		<table>
		    		<tr>
		    			<td></td>
		    			<td></td>
		    			<td></td>
		    			<td id="tckdTD3">T<bean:write name="reservationForm" property="route"/>00<bean:write name="reservationForm" property="passSeat3"/></td>
		    		</tr>
		    		<tr>
		    			<td>From </td>
		    			<td><bean:write name="reservationForm" property="source"/></td>
		    			<td>To </td>
		    			<td><bean:write name="reservationForm" property="destination"/></td>
		    		</tr>
		    		<tr>
		    			<td>Start time </td>
		    			<td><bean:write name="reservationForm" property="time"/></td>
		    			
		    		</tr>
		    		<tr>
		    			<td>Seat number</td>
		    			<td><bean:write name="reservationForm" property="passSeat3"/></td>
		    		</tr>
		    		
		    	</table>
		    	</logic:notEmpty>
		    	
		    	<logic:notEmpty name="reservationForm" property="passName4">
		    		<table>
		    		<tr>
		    			<td></td>
		    			<td></td>
		    			<td></td>
		    			<td id="tckdTD4" ><b>T<bean:write name="reservationForm" property="route"/>00<bean:write name="reservationForm" property="passSeat4"/></b></td>
		    		</tr>
		    		<tr>
		    			<td >From </td>
		    			<td ><bean:write name="reservationForm" property="source"/></td>
		    			<td >To </td>
		    			<td ><bean:write name="reservationForm" property="destination"/></td>
		    		</tr>
		    		<tr>
		    			<td >Start time </td>
		    			<td><bean:write name="reservationForm" property="time"/></td>
		    			
		    		</tr>
		    		<tr>
		    			<td>Seat number</td>
		    			<td><bean:write name="reservationForm" property="passSeat4"/></td>
		    		</tr>
		    		
		    	</table>
		    	</logic:notEmpty>
		    </div>
		 </c:when>
		 <c:when test="${msg == 'fail' }"> 
		    <label>Could not reserve the ticket <br> Please try again</label>
		 </c:when>
	</c:choose>	 
	<div style="margin-top:20px;">   
		<input type="button" class="button btn" value="Print this page" onClick="window.print()"><br><br><br>
		
		<a href="index.jsp">Go to Home page</a>
	</div>
</div>
</body>
</html>