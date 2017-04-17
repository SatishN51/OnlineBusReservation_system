<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/css/bootstrap-datepicker.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/css/bootstrap-datepicker.min.css">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<link href='http://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/js/bootstrap-datepicker.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/js/bootstrap-datepicker.min.js"></script>

<title>HomePage</title>
</head>
<style>
body {
      font-family: 'Roboto', sans-serif;
      font-size:16px;
    }

.form-control{
height: 45px;
padding:15px 10px 15px 50px;
}
#source{
background :url(map-icon.png) 5px  no-repeat #fff;
}
#destination{
background :url(map-icon.png) 5px  no-repeat #fff;
}
#fromDate{
background :url(cal-icon.png) 5px  no-repeat #fff;
}
#toDate{
background :url(cal-icon.png) 5px  no-repeat #fff;

}
</style>
<script type="text/javascript">

 function fn_check()
 {
	 if(document.getElementById("oneWay").checked)
		 {
		 	document.getElementById("toDateDiv").style.display="none";
		 }
	 else if(document.getElementById("roundTrip").checked)
		 {
		 	document.getElementById("toDateDiv").style.display="";
		 }
 }
 function fn_search()
 {
	 if(document.getElementById("oneWay").checked)
		 {
		 	if(document.getElementById("source").value !="" && document.getElementById("destination").value !="" &&
				 document.getElementById("fromDate").value !="")
			 {
		 		document.forms[0].action="reserveAction.do";
		 		document.forms[0].submit();

			 }
		 	else
			 {
			 	document.getElementById("errorDiv").style.display="";
			 }
		 }
	 else if (document.getElementById("roundTrip").checked)
		 {
		 	if(document.getElementById("source").value !="" && document.getElementById("destination").value !="" &&
				 document.getElementById("fromDate").value !="" && document.getElementById("toDate").value !="" )
			{
		 		document.forms[0].action="reserveAction.do";
		 		document.forms[0].submit();

			} 
		 	else
			 {
			 	document.getElementById("errorDiv").style.display="";
			 }
		 }
	 
 }
 
</script>
<body >
	<div class="container">
		<div class="page-header" >
			<img class="img-responsive" alt="" src="./SQL_Spartans.jpg">
		</div>
		<html:form action="reserveAction.do" >
		<div class="container" >
		<div class="col-sm-12 col-xs-12 col-lg-6 col-md-6 alert alert-warning" id="errorDiv" style="display:none;" >
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<strong>Error </strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Please fill all fields
		</div>	 
			
		<div class="col-sm-12 col-xs-12 col-lg-6 col-md-6 form-group" style="margin-left:18px;margin-bottom:20px;">
			<label class="radio-inline"><input type="radio" name="journeyChk" id="oneWay" onchange="fn_check();" checked>one way</label>
			<label class="radio-inline"><input type="radio" name="journeyChk" id="roundTrip" onchange="fn_check();" >round trip</label>
		</div>
		<div class="col-sm-12 col-xs-12 col-lg-12 col-md-12 " style="margin-bottom:20px;">
			<div class="col-sm-12 col-xs-12 col-lg-4 col-md-4">
				<label>From</label>
				<!-- <input type='text' class="form-control" name="reservationForm" property="source" id='source' list="dataList" required/> -->	
				<html:text name="reservationForm" styleClass="form-control" property="source" styleId='source' ></html:text>
				<!-- <datalist id="dataList">
					<option value="philadelphia">
					<option value="newyork">
					<option value="new jersey">
					<option value="delaware">
					<option value="baltimore">
				</datalist> -->
			</div>
			<div class="col-sm-12 col-xs-12 col-lg-4 col-md-4">
				<label>To</label>
				<html:text name="reservationForm" styleClass="form-control" property="destination" styleId='destination' ></html:text>
				<!-- input type='text' class="form-control" name="reservationForm" property="destination" id='destination' list="dataList" required/> -->
				<!-- <datalist id="dataList">
					<option value="philadelphia">
					<option value="newyork">
					<option value="new jersey">
					<option value="delaware">
					<option value="baltimore">
				</datalist> -->
			</div>
		</div>
		
		<div class="col-sm-12 col-xs-12 col-lg-12 col-md-12 " style="margin-bottom:20px;">
			<div class="col-sm-12 col-xs-12 col-lg-4 col-md-4 form-group">
				<label>Onward date</label>
				<!-- <input type='text' name="reservationForm" class="form-control datepicker" property="fromDate" id='fromDate'  required/> -->
	            <html:text name="reservationForm" styleClass="form-control datepicker" property="fromDate" styleId='fromDate'></html:text>
			</div>
			<div class="col-sm-12 col-xs-12 col-lg-4 col-md-4" id="toDateDiv" style="display:none;">
				<label>Return date</label>
				<html:text name="reservationForm" styleClass="form-control datepicker" property="toDate" styleId='toDate'></html:text>
				<!-- <input type='text' name="reservationForm" class="form-control datepicker" property="toDate" id='toDate' required/> -->
	            
			</div>
		</div>	
		<div class="col-sm-12 col-xs-12 col-lg-8 col-md-8 " style="margin-bottom:20px;text-align:center;">
			<button type="button" id="search" class="btn btn-primary" onclick="fn_search();">Search</button>
			
		</div>
	</div>
</html:form>
		
</div>
</body>

<script type="text/javascript">
$(function () {
    $('#fromDate').datepicker({
    	autoclose: true,    // It is false, by default
        format: 'dd-M-yy',
        startDate:new Date(),
        endDate:'31-DEC-2030'			//'12/31/2030'
    }).on('changeDate', function(){
        // set the "toDate" start to not be later than "fromDate" ends:
        $('#toDate').datepicker('setStartDate', new Date($(this).val()));
    }); 
    $('#toDate').datepicker({
    	autoclose: true,    // It is false, by default
        format: 'dd-M-yy',
        startDate:new Date(),
        endDate:'31-DEC-2030'					//'12/31/2030'
        
    }).on('changeDate', function(){
        // set the "fromDate" end to not be later than "toDate" starts:
        $('#fromDate').datepicker('setEndDate', new Date($(this).val()));
    });
   
});
</script>

</html>