<html xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office"
	xmlns="http://www.w3.org/TR/REC-html40">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.orsb2bgw.supporttool.util.UtilityMethods,java.util.Map" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

<c:url value="/help" var="helpUrl"/>
    <title>ORSSG</title>

    <!-- Bootstrap Core CSS -->
    <link href="<c:url value="/resources/bower_components/bootstrap/dist/css/bootstrap.min.css"/>" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="<c:url value="/resources/bower_components/metisMenu/dist/metisMenu.min.css"/>" rel="stylesheet">

    <!-- Timeline CSS -->
    <link href="<c:url value="/resources/dist/css/timeline.css"/>" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<c:url value="/resources/dist/css/sb-admin-2.css"/>" rel="stylesheet">
    
     <link href="<c:url value="/resources/dist/css/jquery.alertable.css"/>" rel="stylesheet">
    
    
       <link href="<c:url value="/resources/bower_components/bootstrap/dist/css/jquery.alertable.css"/>" rel="stylesheet">


    <!-- Morris Charts CSS -->
    <link href="<c:url value="/resources/bower_components/morrisjs/morris.css"/>" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<c:url value="/resources/bower_components/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet" type="text/css">

	<script src="<c:url value="/resources/bower_components/bootstrap/dist/js/jquery.1.10.2.min.js"/>"></script>
	
	<c:url value="/login?logout" var="logoutUrl" />
	<c:url value="/admin/supplierManagement" var="supplierManagementUrl" />
	<c:url value="/admin/insertNewSupplier" var="insertNewSupplier" />
	<c:url value="/admin/updateUserPassword" var="updateUserPassword" />
	<c:url value="/admin/passwordManagement" var="passwordManagementUrl" />
	<c:url value="/admin/addUser" var="addUserUrl"/>
	<c:url value="/admin/userRegistration" var="userRegistration"/>
	<c:url value="/supportTool" var="supportToolUrl"/>
    <c:url value="/workList" var="workListUrl"/>

    
  <script language="JavaScript">
function showAlert(){
 alert(Msg);
 } 

var Msg ='<%=request.getAttribute("failureMsg")%>';
    if (Msg !== "null" && Msg!=="") {
window.onload = showAlert;
 
 }
  
 
function userValidation(){
	var username=document.getElementById("username").value;
	var pass=document.getElementById("password").value;
	var conpass=document.getElementById("Con_Password").value;
    var user_res=usernameValidation(username,pass,conpass);
	if(user_res==true)
		return true;
	else 
		return false;
}
function usernameValidation(username,pass,conpass){
     if(username==""){
         alert("Username is empty ");
		 document.getElementById("username").focus();
		 return false;
	 }
	 if(username.length > 15 ){
         alert("Username cannot be more than 15 characters");
		 document.getElementById("username").focus();
		 return false;
	 }
	 if(username.length < 8 ){
         alert("Username cannot be less than 8 characters");
		 document.getElementById("username").focus();
		 return false;
	 }
	 var pass_res=passwordValidation(pass,conpass);
	 if(pass_res==true)
		return true;
	 else 
		return false;
}

function passwordValidation(password,conpass)
{
	var iChars = "!@#$%^&*()+=-[]\\\';,./{}|\":<>?";
	var numericVal= "0123456789";
	var charFlag="0";
	var numFlag="0";
	 if(password==""){
          alert("Password cannot be empty ");
		  return false;
	 }
	if(password.length > 15){
		   alert("Password cannot be more than 15 characters");
		   return false;
	}
	if(password.length < 8 ){
		   alert("Password cannot be less than 8 characters");
		   return false;
	}
	  for (var i = 0; i < password.length; i++) {
            if (iChars.indexOf(password.charAt(i)) != -1) 
			  charFlag="1";
		    if(numericVal.indexOf(password.charAt(i)) != -1)
				numFlag="1";
         }

		 if(charFlag=="0"){
			  alert ("Password must include atleast one Special character"); 
			 return false;
		 }else if(numFlag=="0"){
            alert ("Password  must include atleast one Numeric value");
			 return false;
		 }
         else{
			 var conpass_res=confirmpass(password,conpass);
             if(conpass_res==true)
				return true;
			else 
				return false;
		 }
}
function confirmpass(pass,conpass)
{
	if(conpass==""){
          alert("Confirm Password is empty");
		   document.getElementById("Con_Password").focus();
		 return false;
	 }
	if(pass==conpass){
		return true;
	}else{
        alert("ConfirmPassword should match with Password");
		return false;
	}
}

</script>

    
    
    
    

</head>

<body>
	<c:url value="/login?logout" var="logoutUrl" />
    <div id="wrapper" style="height:50">
	

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
					
                </button>
                <a class="navbar-brand" href="index.html"></a>
		
            </div>
            <!-- /.navbar-header -->
			<ul class="nav navbar-top-links navbar-left">
			<li><img src="<c:url value="/resources/img/logo.gif"/>" alt="" class="img-responsive logo" style="
					position: relative;
					top: 50%;
					left: 50%;
					transform: translate(-130%,5%);
					width: 50%;
					"></li>
			</ul>
			<ul class="nav navbar-top-links navbar-left">
			<li><h3><spring:message code="label.home.header" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h3></li>
			</ul>
		
            <ul class="nav navbar-top-links navbar-right">
                
              
                
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        
                        <li><a href="${logoutUrl}"><i class="fa fa-sign-out fa-fw"></i> <spring:message code="label.logout" /></a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                  <li>
                  <h6 style="color:337ab7"><spring:message code="label.userName" /> 
  <span style="color:green"><sec:authentication property="principal.username" /></span></h6>
   <sec:authorize access="hasAnyRole('ADMIN')"><h6 style="color:337ab7"><spring:message code="label.role" /> <span style="color:green"><spring:message code="label.role.admin" /></span></h6></sec:authorize>
      <sec:authorize access="hasAnyRole('SUPERUSER')"><h6 style="color:337ab7"><spring:message code="label.role" />: <span style="color:green"> <spring:message code="lable.role.superUser" /></span></h6></sec:authorize>
   <sec:authorize access="hasAnyRole('NORMALUSER')"><h6 style="color:337ab7"><spring:message code="label.role" />  <span style="color:green"><spring:message code="label.role.user" /></span></h6></sec:authorize>
                </li>
                <!-- /.dropdown -->
				<li>
				<img src="<c:url value="/resources/img/btlogo.gif"/>" class="img-responsive logo" 
						 style="align:right;
						position: relative;
						top: 50%;
						left: 50%;
						transform: translate(15%,10%);
						width: 50%;
						">
				
				</li>
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                      
						 <li style="margin-top: 20px;">
                            <a href="home"><i class="fa fa-dashboard fa-fw"></i> <spring:message code="label.menu.dashboard" /></a>
                        </li>
                        <li>
                            <a href="${supportToolUrl}"><i class="fa fa-wrench fa"></i><spring:message code="label.menu.supportTool" /></a>
                        </li>
                        <li>
                            <a href="${workListUrl}"><i class="fa fa-list-alt fa"></i><spring:message code="label.menu.workList" /></a>
                        </li>
                        <li>
                            <a href="${addUserUrl}"><i class="fa fa-user fa"></i><spring:message code="label.menu.newUser" /></a>
                        </li>
						
						 <li>
                            <a href="${supplierManagementUrl}"><i class="fa fa-group fa"></i><spring:message code="label.menu.supplierManagement" /></a>
                        </li>
						
						<li>
                            <a href="${passwordManagementUrl}"><i class="fa fa-desktop fa"></i><spring:message code="label.menu.userManagement" /></a>
                        </li>
                        <li>
                            <a href="${helpUrl}"><i class="fa fa-question-circle"></i>Help</a>
                        </li>
                            <!--   <li>
                            <a href="#"><i class="fa fa-wrench fa-fw"></i> UI Elements<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="panels-wells.html">Panels and Wells</a>
                                </li>
                                <li>
                                    <a href="buttons.html">Buttons</a>
                                </li>
                                <li>
                                    <a href="notifications.html">Notifications</a>
                                </li>
                                <li>
                                    <a href="typography.html">Typography</a>
                                </li>
                                <li>
                                    <a href="icons.html"> Icons</a>
                                </li>
                                <li>
                                    <a href="grid.html">Grid</a>
                                </li>
                            </ul>
                      /.nav-second-level
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-sitemap fa-fw"></i> Multi-Level Dropdown<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="#">Second Level Item</a>
                                </li>
                                <li>
                                    <a href="#">Second Level Item</a>
                                </li>
                                <li>
                                    <a href="#">Third Level <span class="fa arrow"></span></a>
                                    <ul class="nav nav-third-level">
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                    </ul>
                               
                                </li>
                            </ul>
                       
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-files-o fa-fw"></i> Sample Pages<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="blank.html">Blank Page</a>
                                </li>
                                <li>
                                    <a href="login.html">Login Page</a>
                                </li>
                            </ul>
                     
                        </li> -->
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
       	 <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="page-header"><spring:message code="label.addUser.heading" /></h3>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading" style="font-weight: 800;font-size: 12;">
                            <spring:message code="label.addUser.subHeading" />
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                <span olspan="2" style="color: green">${successMsg}</span>
                 				<span olspan="2" style="color: red">${failureMsg}</span>
                                    <form role="form"  id="adduser"  >
                                        <div class="form-group">
                                            <label style="font-weight: 200;font-size: 12;"><spring:message code="label.addUser.userName" /></label>
                                            <input class="form-control" placeholder="user name" maxlength="20" type="text" required name="username" id="username" pattern=".{8,}" title="Username should only contain Minimum Eight Characters" style="width: 225px; height: 30px;">
                                           
                                        </div>
                                        <div class="form-group">
                                            <label style="font-weight: 200;font-size: 12;"><spring:message code="label.addUser.pwd" /></label>
                                            <input class="form-control" type="password" placeholder="password" maxlength="20" required name="password" id="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" style="width: 225px; height: 30px;">
                                        </div>
										<div class="form-group">
                                            <label style="font-weight: 200;font-size: 12;"><spring:message code="label.userPasswordmanagement.confirmPwd" /></label>
                                            <input class="form-control" type="password" maxlength="20" placeholder="confirm password" required name="Con_Password" id="Con_Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" style="width: 225px; height: 30px;">
                                        </div>
                                        
                                        <div class="form-group">
                                            <label style="font-weight: 200;font-size: 12;" id="userRole"><spring:message code="label.addUser.userRole" /></label>
                                            <div class="radio">
                                                <label style="font-weight: 200;font-size: 12;">
                                                    <input type="radio" value="ROLE_NORMALUSER" id="userRole" checked name="userRole"><spring:message code="label.role.userr" />
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label style="font-weight: 200;font-size: 12;">
                                                    <input type="radio" value="ROLE_SUPERUSER" id="userRole" name="userRole"><spring:message code="lable.role.superUserr" />
                                                </label>
                                            </div>
                                            <div class="form-group">
											 <label style="font-weight: 200;font-size: 12;"><spring:message code="label.userPasswordmanagement.siteName" /></label>
											  <input class="form-control" name="sitename" id="sitename" value="<%= UtilityMethods.getSiteMap().get((String)session.getAttribute("curSiteName")) %>" disabled size="17" style="width: 225px; height: 30px;">
											</div>
                                            
                                        </div>
                                        <input type="hidden" name="${_csrf.parameterName}"
											value="${_csrf.token}" id="csrf"/>
                                        <button type="submit" id="submitButton" class="btn btn-default"><spring:message code="label.addUser.create" /></button>
                                        <button type="reset" class="btn btn-default"><spring:message code="label.userPasswordmanagement.reset" /></button>
                                    </form>
                                </div>
                                
                                <!-- /.col-lg-6 (nested) -->
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
    <!-- jQuery -->
    <script src="<c:url value="/resources/bower_components/jquery/dist/jquery.min.js"/>"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="<c:url value="/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"/>"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="<c:url value="/resources/bower_components/metisMenu/dist/metisMenu.min.js"/>"></script>

 <script src="<c:url value="/resources/bower_components/bootstrap/dist/js/jquery.alertable.js"/>"></script>
 
 
 

 

    <!-- Custom Theme JavaScript -->
    <script src="<c:url value="/resources/dist/js/sb-admin-2.js"/>"></script>
	
	<script>
	jQuery(document).ready(function($) {
		
		
		var strings = new Array();
      strings['confirm'] = "<spring:message code='label.userPasswordmanagement.confirm' javaScriptEscape='true' />";
	  strings['pwdMismatch'] = "<spring:message code='label.userPasswordmanagement.pwdMismatch' javaScriptEscape='true' />";
	  strings['sure'] = "<spring:message code='label.userPasswordmanagement.sure' javaScriptEscape='true' />";

	
	
	/*  $("#submitButton").click(function(){
      if (confirm("Click OK to continue?")){
         $("form#adduser").submit();
      }
   });
	 */
	
	
	$("#adduser").submit(function(event) {

		
		
		var password = $("#password").val();
    	var confirmPassword= $("#Con_Password").val();
    	if (password != confirmPassword ) {
    	
    	
    			flag=1;
  				event.preventDefault(event);
         	 $.alertable.alert(strings['pwdMismatch']);
 
         //   alert("Passwords do not match.");
		//return false;
		}
		else
		{  				event.preventDefault(event);
		
    	//if (confirm("Click OK to continue?")){
    	/* if($.alertable.confirm("Click OK to continue?").){
        	
        	} */
      $.alertable.confirm(strings['sure']).then(function() {
      AddUser();
    }, function() {
      console.log('Cancel');      
    });
        	
      }
			
		
			
			
			
			
			
		});
	
	
	
	});
	
	function AddUser()
	{
		var user ={};
    	var flag=0;
		userName= $("#username").val();
    	var password = $("#password").val();
    	var confirmPassword= $("#Con_Password").val();
    	//var role = $("#userRole").val();
    	var role=$("input[name=userRole]:checked").val();
    	
    	//  alert($("input[name=userRole]:checked").val());
    		
    	//if (password != confirmPassword ) {
    	
    	//
    		//	flag=1;
  			//	event.preventDefault(event);
         //	 $.alertable.alert("Passwords do not match.");
 
         //   alert("Passwords do not match.");
		//return false;
	//	}
	
	if(flag==0)
	{
		user["username"]=userName;
		user["password"]=password;
		user["userRole"]=role;
		var csrf_token=$("#csrf").val();
	
		user["token"]=csrf_token;
		
		
		event.preventDefault();
		$(':button').prop('disabled', true);

		$("#loading-image").show();
		$.ajax({
			type : "POST",
			contentType : "application/json",
			url : "${home}userRegistration",
			data : JSON.stringify(user),
			dataType : 'json',
			timeout : 60000,
			beforeSend: function (xhr)
            {
                xhr.setRequestHeader('X-CSRF-Token', csrf_token); 
                xhr.setRequestHeader("X-AjaxRequest", "1");
            },
			success : function(data) {
			/* 	console.log("SUCCESS: ", data); */
				/* display(data); */
				//display(data);
				//drawTable(data);
			
			$(':button').prop('disabled', false);
				
				//alert(data.msg);
				
				//flag=1;
  //event.preventDefault(event);
          $.alertable.alert(data.msg);
 
				
			},
			error : function(x, t, e) {
			if (x.status == 601) {
                              $.alertable.confirm('Session Expired. Click OK to login').then(function() {
                                        window.location.href = "/CommonWeb/index.jsp";
                                        }, function() {
                                       $(':button').prop('disabled', false);
                                   });
                            }
				console.log("ERROR: ", e);
				display(e);
			},
			done : function(e) {
				console.log("DONE");
				enableSearchButton(true);
			},
			complete: function(){
        	$("#loading-image").hide();
      }
		});
		
	}
	}
		</script>

</body>

</html>