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

<title>Confirmation</title>
</head>
<style>
	body {
      font-family: 'Roboto', sans-serif;
      font-size:16px;
    }
    td{
    width:25% !important;
    }
	
</style>
<script type="text/javascript">
function fn_goBack(route)

{
	document.forms[0].action="reserveAction.do?path=selectedBus&route="+route;
	document.forms[0].submit();
		
}
</script>
<body>
<div class="container">
	<div class="page-header">
			<img alt="" src="./SQL_Spartans.jpg">
	</div>
	<html:form  action="reserveAction.do?path=confirmTckt">
		<div class="col-sm-12 col-xs-12 col-md-12 col-lg-12">
			Confirmation<br><br><br>
			<label>Journey details</label><br><br>
			<table style="width:96%;table-layout:fixed;" align="center">
		       	<tr class="tbheader1" style="width:100%;height:30px;"  >
		        	<td width="25%"  valign="middle">Date</td>
		        	<td width="25%"><bean:write name="reservationForm" property="fromDate"  /></td>
		        	<td width="25%">From</td>
				 	<td width="25%"  valign="middle">&nbsp;&nbsp;&nbsp;&nbsp;<bean:write name="reservationForm" property="source"  /></td>
				</tr>
				<tr class="tbheader1" style="width:100%;height:30px;"  >
					<td width="25%" valign="middle">Time</td>
					<td width="25%"  valign="middle"><bean:write name="reservationForm" property="time"  /></td>
					<td width="25%"  valign="middle">To</td>
					<td width="25%"  valign="middle"><bean:write name="reservationForm" property="destination"  /></td>
				</tr>
				
			</table>			
			<label>Passenger 1 details</label><br><br>
			<table style="width:96%;table-layout:fixed;" align="center">
		       	<tr class="tbheader1" style="width:100%;height:30px;" >
		        	<td width="25%"   valign="middle">Name</td>
				 	<td width="25%"   valign="middle"><bean:write name="reservationForm" property="passName1"  /></td>
				 	<td width="25%"  valign="middle">Age</td>
					<td width="25%"   valign="middle"><bean:write name="reservationForm" property="passAge1"  /></td>
				</tr>
				<tr class="tbheader1" style="width:100%;height:30px;"  >
					<td width="25%"   valign="middle">Mobile number</td>
					<td width="25%"   valign="middle"><bean:write name="reservationForm" property="passMob1"  /></td>
					<td width="25%"  valign="middle">Seat number</td>
					<td width="25%"   valign="middle"><bean:write name="reservationForm" property="passSeat1"  /></td>
				</tr>
			</table>			
			
			 	<c:if test="${p2 == '2yes' }"> 
		     		<label>Passenger 2 details</label><br><br>
			     	<table style="width:96%;table-layout:fixed;" align="center">
				       	<tr class="tbheader1" style="width:100%;height:30px;"  >
				        	<td width="18%"   valign="middle">Name</td>
						 	<td width="18%"   valign="middle"><bean:write name="reservationForm" property="passName2"  /></td>
							<td width="18%"   valign="middle">Age</td>
							<td width="18%"   valign="middle"><bean:write name="reservationForm" property="passAge2"  /></td>
						</tr>
						<tr class="tbheader1" style="width:100%;height:30px;"  >
							<td width="18%"   valign="middle">Mobile number</td>
							<td width="18%"  valign="middle"><bean:write name="reservationForm" property="passMob2"  /></td>
							<td width="18%"  valign="middle">Seat number</td>
							<td width="18%"   valign="middle"><bean:write name="reservationForm" property="passSeat2"  /></td>
						</tr>
				</table>			
				
		     	</c:if>
				<c:if test="${p3 == '3yes' }"> 
		     		<label>Passenger 3 details</label><br><br>
		     		<table style="width:96%;table-layout:fixed;" align="center">
				       	<tr class="tbheader1" style="width:100%;height:30px;"  >
				        	<td width="18%"  valign="middle">Name</td>
						 	<td width="18%"  valign="middle"><bean:write name="reservationForm" property="passName3"  /></td>
							<td width="18%"  valign="middle">Age</td>
							<td width="18%"   valign="middle"><bean:write name="reservationForm" property="passAge3"  /></td>
						</tr>
						<tr class="tbheader1" style="width:100%;height:30px;"  >
							<td width="18%"   valign="middle">Mobile number</td>
							<td width="18%"   valign="middle"><bean:write name="reservationForm" property="passMob3"  /></td>
							<td width="18%"   valign="middle">Seat number</td>
							<td width="18%"  valign="middle"><bean:write name="reservationForm" property="passSeat3"  /></td>
						</tr>
					</table>			
				</c:if>
				<c:if test="${p4 == '4yes' }"> 
		     		<label>Passenger 4 details</label><br><br>
		     		<table style="width:96%;table-layout:fixed;" align="center">
				       	<tr class="tbheader1" style="width:100%;height:30px;"  >
				        	<td width="18%"  align="center" valign="middle">Name</td>
						 	<td width="18%"  align="center" valign="middle"><bean:write name="reservationForm" property="passName4"  /></td>
							<td width="18%"  align="center" valign="middle">Age</td>
							<td width="18%"  align="center" valign="middle"><bean:write name="reservationForm" property="passAge4"  /></td>
						</tr>
						<tr class="tbheader1" style="width:100%;height:30px;"  >
							<td width="18%"  align="center" valign="middle">Mobile number</td>
							<td width="18%"  align="center" valign="middle"><bean:write name="reservationForm" property="passMob4"  /></td>
							<td width="18%"  align="center" valign="middle">Seat number</td>
							<td width="18%"  align="center" valign="middle"><bean:write name="reservationForm" property="passSeat4"  /></td>
						</tr>
					</table>			
					
				</c:if>
			
					
		</div>
		<div class="col-sm-12 col-xs-12 col-md-12 col-lg-12" style="margin-top:35px;">
			<div class="col-sm-6 col-xs-6 col-md-6 col-lg-6" style="text-align:right;">
				<button type="submit" class="btn btn-primary sm" >Confirm and Book</button>	
			</div>
			<div class="col-sm-6 col-xs-6 col-md-6 col-lg-6">
				<a href="#" onclick="javascript:fn_goBack('<bean:write name="reservationForm" property="route"  />');">Go back</a> 
			</div>
			
			
		</div>
		<html:hidden name="reservationForm" property="route" />
			<html:hidden name="reservationForm" property="source" />
			<html:hidden name="reservationForm" property="destination" />
			<html:hidden name="reservationForm" property="fromDate" />
			<html:hidden name="reservationForm" property="toDate" />
			<html:hidden name="reservationForm" property="route" />
			<html:hidden name="reservationForm" property="time" />
			<html:hidden name="reservationForm" property="busType" />
			<html:hidden name="reservationForm" property="seats" />
			<html:hidden name="reservationForm" property="price" />
			<html:hidden name="reservationForm" property="passName1" />
			<html:hidden name="reservationForm" property="passAge1" />
			<html:hidden name="reservationForm" property="passMob1" />
			<html:hidden name="reservationForm" property="passSeat1" />
			<html:hidden name="reservationForm" property="passName2" />
			<html:hidden name="reservationForm" property="passAge2" />
			<html:hidden name="reservationForm" property="passMob2" />
			<html:hidden name="reservationForm" property="passSeat2" />
			<html:hidden name="reservationForm" property="passName3" />
			<html:hidden name="reservationForm" property="passAge3" />
			<html:hidden name="reservationForm" property="passMob3" />
			<html:hidden name="reservationForm" property="passSeat3" />
			<html:hidden name="reservationForm" property="passName4" />
			<html:hidden name="reservationForm" property="passAge4" />
			<html:hidden name="reservationForm" property="passMob4" />
			<html:hidden name="reservationForm" property="passSeat4" />
			
			
	</html:form>	
</div>
</body>
</html>