<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>

<html>
<head>
<meta charset="utf-8">
 	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<!-- Global CSS -->
    <link rel="stylesheet" type="text/css" href="./menu.css">
	<!-- Global CSS -->
	<link href='http://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	

<title>journeyDetails</title>
</head>
<style>
body {
      font-family: 'Roboto', sans-serif;
      font-size:16px;
    }

</style>
<script type="text/javascript">
function fn_noOfPassenegers(value)
{
	if(value==1)
		{
			if(document.getElementById('tr2').style.display != "none")
			{	document.getElementById('tr2').style.display = "none";	
				
			}
			if(document.getElementById('tr3').style.display != "none")
			{	document.getElementById('tr3').style.display = "none";	
				
			}
			if(document.getElementById('tr4').style.display != "none")
			{	document.getElementById('tr4').style.display = "none";	
				
			}
			document.getElementById('tr1').style.display = "";
		}
	else if(value==2)
		{
			if(document.getElementById('tr1').style.display == "none")
			{	document.getElementById('tr1').style.display = "";	
				
			}	
			if(document.getElementById('tr3').style.display != "none")
			{	document.getElementById('tr3').style.display = "none";	
				
			}
			if(document.getElementById('tr4').style.display != "none")
			{	document.getElementById('tr4').style.display = "none";	
				
			}
			document.getElementById('tr2').style.display = "";
		}
	else if(value==3)
	{
		if(document.getElementById('tr1').style.display == "none")
		{	document.getElementById('tr1').style.display = "";	
			
		}
		if(document.getElementById('tr2').style.display == "none")
		{	document.getElementById('tr2').style.display = "";	
			
		}
		if(document.getElementById('tr4').style.display != "none")
		{	document.getElementById('tr4').style.display = "none";	
			
		}
		document.getElementById('tr3').style.display = "";
	}
	else 
	{
		if(document.getElementById('tr1').style.display == "none")
		{	document.getElementById('tr1').style.display = "";	
			
		}
		if(document.getElementById('tr2').style.display == "none")
		{	document.getElementById('tr2').style.display = "";	
			
		}
		if(document.getElementById('tr3').style.display == "none")
		{	document.getElementById('tr3').style.display = "";	
			
		}
		document.getElementById('tr4').style.display = "";
	}
	
		
}
</script>
<body>
<div class="container">
	<div class="page-header">
			<img alt="" src="./SQL_Spartans.jpg">
	</div>
	<div class="col-sm-6 col-xs-6 col-md-5 col-lg-5">
		<img src="./seating-plan.jpg"  style="width:100%;margin-top:30px;margin-left:-50px;"/>
	</div>
	<div class="col-sm-6 col-xs-6 col-md-7 col-lg-7">
		<div class="col-sm-12 col-xs-12 col-md-12 col-lg-12" style="margin-bottom:25px;">
			select number of seats	
			<select name="reservationForm" title="" onchange="fn_noOfPassenegers(this.value);">
					<option value="1" >1</option>
					<option value="2" >2</option>
					<option value="3" >3</option>
					<option value="4" >4</option>
			</select>
		</div>
		<div class="col-sm-12 col-xs-12 col-md-12 col-lg-12" style="margin-bottom:25px;margin-top:5px;">
		passenger details
		<html:form  action="reserveAction.do?path=selectedPassengers">
			<table style="width:100%;table-layout:fixed;margin-bottom:25px;margin-top:5px;" align="center">
				<tr class="tbheader1" style="width:100%;height:30px;" align="center" >
		        	<td width="25%"  align="center" valign="middle">Name</td>
				 	<td width="25%"  align="center" valign="middle">Age</td>
				 	<td width="25%"  align="center" valign="middle">Mobile number</td>
				 	<td width="25%"  align="center" valign="middle">seat number</td>
				</tr>
				<tr id ="tr1" class="tbheader1" style="width:100%;height:30px;" align="center"  >
		        	<td width="25%"  align="center" valign="middle"><input type="text" class="form-control" style="width:75%;" id="passName1" name="passName1" placeholder="name" required></td>
				 	<td width="25%"  align="center" valign="middle"><input type="text" class="form-control" style="width:75%;" id="passAge1" name="passAge1" placeholder="age" ></td>
				 	<td width="25%"  align="center" valign="middle"><input type="text" class="form-control" style="width:75%;" id="passMob1" name="passMob1" placeholder="mobile number" ></td>
				 	<td width="25%"  align="center" valign="middle">
				 		<html:select name="reservationForm" property="passSeat1" styleId="passSeat1" styleClass="form-control"   >
							<html:option value="">---- select ------</html:option>
							
							<html:options property="sNo" collection="seatList" labelProperty="sNo" />
						</html:select>
				 		<!-- <input type="text" class="form-control" style="width:75%;" id="passSeat1" name="passSeat1" placeholder="seat number" > -->
				 	</td>
				</tr>
				<tr id ="tr2" class="tbheader1" style="width:100%;height:30px;display:none;" align="center"  >
		        	<td width="25%"  align="center" valign="middle"><input type="text" class="form-control" style="width:75%;" id="passName2" name="passName2" placeholder="name" ></td>
				 	<td width="25%"  align="center" valign="middle"><input type="text" class="form-control" style="width:75%;" id="passAge2" name="passAge2" placeholder="age" ></td>
				 	<td width="25%"  align="center" valign="middle"><input type="text" class="form-control" style="width:75%;" id="passMob2" name="passMob2" placeholder="mobile number" ></td>
				 	<td width="25%"  align="center" valign="middle">
				 		<html:select name="reservationForm" property="passSeat2" styleId="passSeat2" styleClass="form-control"   >
							<html:option value="">---- select ------</html:option>
							
							<html:options property="sNo" collection="seatList" labelProperty="sNo" />
						</html:select>
				 		
				 	</td>
				</tr>
				<tr id ="tr3" class="tbheader1" style="width:100%;height:30px;display:none;" align="center"  >
		        	<td width="25%"  align="center" valign="middle"><input type="text" class="form-control" style="width:75%;" id="passName3" name="passName3" placeholder="name" ></td>
				 	<td width="25%"  align="center" valign="middle"><input type="text" class="form-control" style="width:75%;" id="passAge3" name="passAge3" placeholder="age" ></td>
				 	<td width="25%"  align="center" valign="middle"><input type="text" class="form-control" style="width:75%;" id="passMob3" name="passMob3" placeholder="mobile number" ></td>
				 	<td width="25%"  align="center" valign="middle">
				 		<html:select name="reservationForm" property="passSeat3" styleId="passSeat3" styleClass="form-control"   >
							<html:option value="">---- select ------</html:option>
							
							<html:options property="sNo" collection="seatList" labelProperty="sNo" />
						</html:select>
				 		
				 	</td>
				</tr>
				<tr id ="tr4" class="tbheader1" style="width:100%;height:30px;display:none;" align="center"  >
		        	<td width="25%"  align="center" valign="middle"><input type="text" class="form-control" style="width:75%;" id="passName4" name="passName4" placeholder="name" ></td>
				 	<td width="25%"  align="center" valign="middle"><input type="text" class="form-control" style="width:75%;" id="passAge4" name="passAge4" placeholder="age" ></td>
				 	<td width="25%"  align="center" valign="middle"><input type="text" class="form-control" style="width:75%;" id="passMob4" name="passMob4" placeholder="mobile number" ></td>
				 	<td width="25%"  align="center" valign="middle">
				 		<html:select name="reservationForm" property="passSeat4" styleId="passSeat4" styleClass="form-control"   >
							<html:option value="">---- select ------</html:option>
							
							<html:options property="sNo" collection="seatList" labelProperty="sNo" />
						</html:select>
				 		
				 	</td>
				</tr>
		 	</table>
			<button type="submit" class="btn btn-primary sm" style="margin-bottom:25px;margin-top:5px;" >Continue</button>	
			
			<html:hidden name="reservationForm" property="route" />
			<html:hidden name="reservationForm" property="time" />
			<html:hidden name="reservationForm" property="busType" />
			<html:hidden name="reservationForm" property="seats" />
			<html:hidden name="reservationForm" property="price" />
			<html:hidden name="reservationForm" property="source" />
			<html:hidden name="reservationForm" property="destination" />
			<html:hidden name="reservationForm" property="fromDate" />
			<html:hidden name="reservationForm" property="toDate" />
			
		</html:form>
		</div>
	</div>	
</div>
</body>
</html>