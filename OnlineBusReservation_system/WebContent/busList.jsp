<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	

<title>Bus details</title>
</head>
<style>
	body {
      font-family: 'Roboto', sans-serif;
      font-size:16px;
    }
	
</style>
<script type="text/javascript">
	function fn_selectBus(route,time,busType,seats,price)
	{
		//alert("hi");
	document.forms[0].action="reserveAction.do?path=selectedBus&route="+route+"&time="+time+"&busType="+busType+"&seats="+seats+"&price="+price;
	//document.forms[0].action="/DB_Proj/reserveAction?actionFlag=selectedBus&route="+route+"&time="+time+"&busType="+busType+"&seats="+seats+"&price="+price;
		//document.forms[0].method="POST";
		//document.forms[0].submit();
	}
</script>
<body>
<div class="container">
		<div class="page-header">
			<img alt="" src="./SQL_Spartans.jpg">
		</div>
		<c:choose>
		<c:when test="${list == 'novalues' }">
			<div class="col-sm-12 col-xs-12 col-md-12 col-lg-12">
				<div class="col-sm-6 col-xs-6 col-md-6 col-lg-6" >
					Could not find any buses for given requirements.
					Please try with different criteria.	
				</div>
				<div class="col-sm-6 col-xs-6 col-md-6 col-lg-6" style="text-align:right;">
					<a href="index.jsp">Go back to Home Page</a> 
				</div>
			</div>
		</c:when>
		<c:when test="${list == 'notempty' }">
		<label style="padding-left:25px;margin-bottom:20px;">Available Buses in this route</label> 
	
		<html:form  action="reserveAction.do?path=selectedBus">
			<logic:present name="reservationForm" property="busDetailsList"> 
		 		<logic:notEmpty name="reservationForm" property="busDetailsList"> 
		 			<table style="width:96%;table-layout:fixed;" align="center">
			        	<tr class="tbheader1" style="width:100%;height:45px;background:#d9edf7" align="center" >
				        	<td width="18%"  align="center" valign="middle">Route</td>
						 	<td width="18%"  align="center" valign="middle">Time</td>
						 	<td width="18%"  align="center" valign="middle">Bus type</td>
						 	<td width="18%"  align="center" valign="middle">Available seats</td>
						 	<td width="18%"  style="word-wrap: break-word;" align="center" valign="middle">Price</td>
		 				</tr>
		 				<logic:iterate id="result" name="reservationForm" property="busDetailsList" >	
		 				<tr style="width:100%" align="center">
		 					<td width="18%" align="center" class="tbcellBorder"><bean:write name="result" property="route"  /></td>
	 						<td width="18%" align="center" class="tbcellBorder"><bean:write name="result" property="time"  /></td>
	 						<td width="18%" align="center" class="tbcellBorder"><bean:write name="result" property="busType"  /></td>
	 						<td width="18%" align="center" class="tbcellBorder"><bean:write name="result" property="seats"  /></td>
	 						<td width="18%" align="center" class="tbcellBorder"><bean:write name="result" property="price"  /></td>
	 						<td width="10%" align="center" class="tbcellBorder"><button type="submit" id="submit" class="btn btn-primary btn-sm" onclick="fn_selectBus('<bean:write name="result" property="route"  />','<bean:write name="result" property="time"  />','<bean:write name="result" property="busType"  />','<bean:write name="result" property="seats"  />','<bean:write name="result" property="price"  />');">Select</button></td>
	 					</tr>
		 				</logic:iterate>
		 			</table>	
		 		</logic:notEmpty>
	 		</logic:present>
	 		<html:hidden name="reservationForm" property="source" />
			<html:hidden name="reservationForm" property="destination" />
			<html:hidden name="reservationForm" property="fromDate" />
			<html:hidden name="reservationForm" property="toDate" />
			
	 		
	 	</html:form>	
	 	</c:when>
	 	</c:choose>
</div>	
</body>
</html>