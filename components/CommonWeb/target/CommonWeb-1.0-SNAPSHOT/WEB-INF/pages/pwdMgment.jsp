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

    <!-- Morris Charts CSS -->
    <link href="<c:url value="/resources/bower_components/morrisjs/morris.css"/>" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<c:url value="/resources/bower_components/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet" type="text/css">

		     <link href="<c:url value="/resources/bower_components/font-awesome/css/jquery.alertable.css"/>" rel="stylesheet">
	
	<c:url value="/login?logout" var="logoutUrl" />
	<c:url value="/admin/supplierManagement" var="supplierManagementUrl" />
	<c:url value="/admin/insertNewSupplier" var="insertNewSupplier" />
	<c:url value="/admin/updateUserPassword" var="updateUserPassword" />
	<c:url value="/admin/passwordManagement" var="passwordManagementUrl" />
	<c:url value="/admin/addUser" var="addUserUrl"/>
	<c:url value="/supportTool" var="supportToolUrl"/>
	<c:url value="/workList" var="workListUrl"/>
	
    
 	<script src="<c:url value="/resources/bower_components/bootstrap/dist/js/jquery.1.10.2.min.js"/>"></script>
    
    
    
    
    

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
      <sec:authorize access="hasAnyRole('SUPERUSER')"><h6 style="color:337ab7"><spring:message code="label.role" /> <span style="color:green"><spring:message code="lable.role.superUser" /></span></h6></sec:authorize>
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
                    <h3 class="page-header"><spring:message code="label.menu.userManagement" /></h3>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                 
                    <div class="panel panel-default">
                        <div class="panel-heading" style="font-weight: 800;font-size: 12;">
                           <spring:message code="label.userPasswordmanagement.heading" /><span><font size="2"><%-- <spring:message code="label.userPasswordmanagement.subHeading" /> --%></font></span>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                <span olspan="2" style="color: green">${successMsg}</span>
                 				<span olspan="2" style="color: red">${failureMsg}</span>
                                    <form role="form" id="updateUserPassword">
                                    <table>
                                    <tr><td style="padding-right: 10px">
                                        <div class="form-group">
                                            <label style="font-weight: 200;font-size: 12;"><spring:message code="label.userPasswordmanagement.selectUser" /></label>
                                            <select class="form-control" name="username" id="username" style="width: 225px; height: 30px;">
                                               	<c:choose>
                                    			<c:when test="${userList ne null }">
                                    			<c:forEach var="user" items="${userList}" >
                                    			<c:if test="${user.enabled}">
												<option>${user.username}</option>
												</c:if>
												</c:forEach>
                                    			</c:when>
                                    			<c:otherwise>
                                     			<option><p style="color:red;"><spring:message code="label.userPasswordmanagement.noUserWarning" /></p></option>
                                   				</c:otherwise>
                                				</c:choose>
                                            </select>                                       
                                             </div>
                                        </td>
                                        <td style="padding-right: 10px" ><div class="form-group">
											 <label style="font-weight: 200;font-size: 12;"><spring:message code="label.userPasswordmanagement.siteName" /></label>
											  <input class="form-control" name="sitename" id="sitename" value="<%= UtilityMethods.getSiteMap().get((String)session.getAttribute("curSiteName"))  %>" disabled size="17" style="width: 225px; height: 30px;">
											</div>
											</td>
                                        </tr>
                                        </table>
                                        <div class="form-group">
                                            <label style="font-weight: 200;font-size: 12;"><spring:message code="label.userPasswordmanagement.password" /></label>
                                            <input class="form-control" placeholder="password"  required type="password" name="password" id="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" style="width: 225px; height: 30px;"/>
                                        </div>
										<div class="form-group">
                                            <label style="font-weight: 200;font-size: 12;"><spring:message code="label.userPasswordmanagement.confirmPwd" /></label>
                                            <input class="form-control" placeholder="confirm password" required  type="password" name="Con_Password" id="Con_Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" style="width: 225px; height: 30px;"/>
                                        </div>
                                        <input type="hidden" name="${_csrf.parameterName}"
											value="${_csrf.token}"  id="csrf"/>
                                      
                                        <button type="submit" class="btn btn-default"><spring:message code="label.userPasswordmanagement.changePwd" /></button>
                                        <button type="reset" class="btn btn-default"><spring:message code="label.userPasswordmanagement.reset" /></button>
                                    </form>
                                </div>
                                
                                 <div class="modal fade" id="roledisplay" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h6 class="modal-title" ><b>User Profile</b></h6>
        
        </div>
       
        <div class="modal-footer">
        <center>
         <h3><spring:message code="label.userName" /> &nbsp;&nbsp;<sec:authentication property="principal.username" /></h3>
         <h3><spring:message code="label.role" />&nbsp;&nbsp;<security:authorize access="hasAnyRole('ROLE_ADMIN')"><spring:message code="label.role.admin" /></security:authorize><security:authorize access="hasAnyRole('ROLE_NORMALUSER')"><spring:message code="label.role.user" /></security:authorize><security:authorize access="hasAnyRole('ROLE_SUPERUSER')"><spring:message code="lable.role.superUser" /></security:authorize></h3>
            
            
            
            </center>
        </div>
      </div>
      
    </div>
  </div>	
                                
                                <!-- /.col-lg-6 (nested) -->
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
					<div class="panel panel-default">
                        <div class="panel-heading" style="font-weight: 800;font-size: 12;">
                           <spring:message code="label.userPasswordmanagement.title" /><span><font size="2"><%-- <spring:message code="label.userPasswordmanagement.subTitle" /> --%></font></span>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                <span olspan="2" style="color: green">${successMessage}</span>
                 				<span olspan="2" style="color: red">${failureMessage}</span>
                                     <form role="form"  id="changeAccess" >
                                     <table>
                                        <tr>
                                        <td style="padding-right: 10px">
                                        <div class="form-group">
                                            <label style="font-weight: 200;font-size: 12;"><spring:message code="label.userPasswordmanagement.selectUser" /></label>
                                            <select class="form-control" name="username" id="usernamee" style="width: 225px; height: 30px;">
                                            </select>
                                           
                                        </div>
                                        </td>
                                        
                                        <td style="padding-right: 10px" ><div class="form-group">
											 <label style="font-weight: 200;font-size: 12;">Site Name</label>
											  <input class="form-control" name="sitename" id="sitename" value="<%= UtilityMethods.getSiteMap().get((String)session.getAttribute("curSiteName"))  %>" disabled size="17" style="width: 225px; height: 30px;">
											</div>
											</td>
                                        </tr>
                                        </table>
                                        <input type="hidden" name="${_csrf.parameterName}"
											value="${_csrf.token}" id="csrft" />
                                      
                                        <button type="submit" class="btn btn-default" id="disable" name="disable"><spring:message code="label.userPasswordmanagement.disable" /></button>
                                        <button type="submit" class="btn btn-default" id="enable" name="enable"><spring:message code="label.userPasswordmanagement.enable" /></button>
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
	
	var btn;
	
	var strings = new Array();
      strings['pwdMismatch'] = "<spring:message code='label.userPasswordmanagement.pwdMismatch' javaScriptEscape='true' />";
	   strings['confirm'] = "<spring:message code='label.userPasswordmanagement.confirm' javaScriptEscape='true' />";
	    strings['enabledisable'] = "<spring:message code='label.userPasswordmanagement.enabledisable' javaScriptEscape='true' />";
 
	 $("#usernamee").hover(function (e)
{
/* $select = $('#usernamee');
	 $select.html(''); */
//getAjaxusers();
    /*  var $target = $(e.target); 
     if($target.is('option')){
        alert($target.attr("id"));//Will alert id if it has id attribute
         alert($target.text());//Will alert the text of the option
         alert($target.val());//Will alert the value of the option 

*/}); 
	
	function getAjaxusers()
	{  
    var supplierLi={};
    var csrff_token=$("#csrft").val();
    
    $("#loading-image").show();
		$.ajax({
			type : "POST",
			contentType : "application/json",
			url : "${home}userAjaxList",
			data : JSON.stringify(supplierLi),
			/* data : JSON.stringify({"supplier":supplier,"token":csrf_token}), */
			dataType : 'json',
			timeout : 60000,
			beforeSend: function (xhr)
            {
                xhr.setRequestHeader('X-CSRF-Token', csrff_token); 
                xhr.setRequestHeader("X-AjaxRequest", "1");
            },
			success : function(newdata) {
			$(':button').prop('disabled', false); 
			       $("#usernamee").empty(); //remove all child nodes
			
				//alert(newdata.users);
				
		/* 		
				var options = $("#usernamee");
$.each(newdata.users, function() {
//if(this.enabled==)
    options.append($("<option />").val(this.enabled).text(this.username));
});
				 */
				 
				/*  
				  $.each(newdata.users, function (i, data) {
        var div_data = "<option value=" + data.enabled + ">" + data.username + "</option>";
        alert(div_data);
        $(div_data).appendTo('#usernamee');

    });
     */
  //  alert("jai ho");
  
  //var $el = $("#usernamee");
//$el.empty(); // remove old options
//alert("Ajax call inside ajax");
var div_blankoption="<option  value='2'></option>";
                $(div_blankoption).appendTo("#usernamee"); 

     $.each(newdata.users,function(i,obj)
                {
              //alert(obj.enabled+":"+obj.username);
          //    alert(obj.enabled);
              if (obj.enabled)
              {
              
              
                 var div_data="<option  value='1' style='color: green;'>"+obj.username+"</option>";
                 }
                 else
                 {
                     var div_data="<option value='0' style='color: red;'>"+obj.username+"</option>";
                 
                 }
                //alert(div_data);
                $(div_data).appendTo("#usernamee"); 
                });  
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
    
    
	
	
	$(".form-control").change(function (){
	
	$("#enable").prop("disabled",false);
	$("#disable").prop("disabled",false);
	var cssVar = $( "#usernamee" ).val(); 
    if(cssVar==1)
    {
    	$("#enable").prop("disabled",true);
    }
    if(cssVar==0)
    {
        	$("#disable").prop("disabled",true);
    

    }
    
});
	  $( window ).load(function() {
 
 		$("#loading-image").hide();
 		getAjaxusers();
 		
});



	
	
	$("button").click(function(e){
	
	 //getAjaxusers();
	
    		btn= e.target.id;
    		
    		
    
    		 
		});
		
		
		$("#userprofile").click(function(){
		
		//var role=$( "userrole" ).val();
		//role.slice(7,role.length);
		//role.slice(0,role.length - 1);
		//alert(role);
		
    jQuery("#roledisplay").modal('show');
});
	
	$("#updateUserPassword").submit(function(event) {

		var password = $("#password").val();
    	var confirmPassword= $("#Con_Password").val();
    
    	

    		
    	if (password != confirmPassword ) {
    		event.preventDefault(event);
             $.alertable.alert(strings['pwdMismatch']);
		
		}
		else
		{
		event.preventDefault(event);
			$.alertable.confirm(strings['confirm']).then(function() {
      UpdateUserPassword(); 
    }, function() {
      console.log('Cancel');      
    });
    }

			
			
			
			
			
		});
		
		
		$("#changeAccess").submit(function(event) {

		
			
event.preventDefault(event);


var cssVar = $( "#usernamee" ).val(); 
		if(cssVar==2)
		{
		
		 $.alertable.alert(strings['enabledisable']);
		
		}
		else
		{
			$.alertable.confirm(strings['confirm']).then(function() {
     changeUserAccess(btn);
    }, function() {
      console.log('Cancel');      
    });
		
			}
			
			
			
			
		});
		
		
	
	
	
	});
	
	
	function changeUserAccess(button)
	{
	
		var user ={};
		var cssVar = $( "#usernamee" ).val(); 
		if(cssVar==2)
		{
		
		 $.alertable.alert(strings['enabledisable']);
		return false;
		}
    	userName=$( "#changeAccess option:selected" ).text();
		//userName= $("#usernamee").text();
		//alert(userName);
			user["username"]=userName;
			var csrf_token=$("#csrft").val();
	
		user["token"]=csrf_token;
		
		
		event.preventDefault();
		$(':button').prop('disabled', true); 
		$("#loading-image").show();
		$.ajax({
			type : "POST",
			contentType : "application/json",
			url : "${home}userAccessManagement"+"?"+button,
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
			
			 $.alertable.alert(data.msg);
			
			//$('#usernamee option:gt(0)').remove(); 	
			
		//	getAjaxusers();
			//getAjaxusers();
			
				/* //alert(data.users);
				alert(data.msg);
				
				helpers.buildDropdown(data.msg.username,
                    $('#usernamee'),
                    'Select an option'
                ); */
                
                var supplierLi={};
    var csrff_token=$("#csrft").val();
    
    $("#loading-image").show();
		$.ajax({
			type : "POST",
			contentType : "application/json",
			url : "${home}userAjaxList",
			data : JSON.stringify(supplierLi),
			/* data : JSON.stringify({"supplier":supplier,"token":csrf_token}), */
			dataType : 'json',
			timeout : 60000,
			beforeSend: function (xhr)
            {
                xhr.setRequestHeader('X-CSRF-Token', csrff_token); 
                xhr.setRequestHeader("X-AjaxRequest", "1");
            },
			success : function(newdata) {
			$(':button').prop('disabled', false); 
			       $("#usernamee").empty(); //remove all child nodes
			
				//alert(newdata.users);
				
		/* 		
				var options = $("#usernamee");
$.each(newdata.users, function() {
//if(this.enabled==)
    options.append($("<option />").val(this.enabled).text(this.username));
});
				 */
				 
				/*  
				  $.each(newdata.users, function (i, data) {
        var div_data = "<option value=" + data.enabled + ">" + data.username + "</option>";
        alert(div_data);
        $(div_data).appendTo('#usernamee');

    });
     */
  //  alert("jai ho");
  
  //var $el = $("#usernamee");
//$el.empty(); // remove old options
//alert("Ajax call inside ajax");
var div_blankoption="<option value='2'></option>";
                $(div_blankoption).appendTo("#usernamee"); 

     $('#username').empty();
     $.each(newdata.users,function(i,obj)
                {
              //alert(obj.enabled+":"+obj.username);
          //    alert(obj.enabled);
              if (obj.enabled)
              {
              
              
                 var div_data="<option  value='1' style='color: green;'>"+obj.username+"</option>";                               
                 var div_dataupdated="<option >"+obj.username+"</option>";
                 $(div_dataupdated).appendTo("#username");
                 
                 }
                 else
                 {
                  
                     var div_data="<option value='0' style='color: red;'>"+obj.username+"</option>";
                 
                 }
                //alert(div_data);
                $(div_data).appendTo("#usernamee"); 
                });  
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
	
			},
			done : function(e) {
				console.log("DONE");
				enableSearchButton(true);
			},
			complete: function(){
        	$("#loading-image").hide();
      }
		});
    
                
                
                
                
                
                
				
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
			//getAjaxusers();
        	$("#loading-image").hide();
      }
		});
		
	
	
	
	}
	
	
	function UpdateUserPassword()
	{
		var user ={};
    	
    	var flag=0;
    	
		userName= $("#username").val();
    	var password = $("#password").val();
    	var confirmPassword= $("#Con_Password").val();
    
    	

    	
		
	
	if(flag==0)
	{
		user["username"]=userName;
		user["password"]=password;
		
		var csrf_token=$("#csrf").val();
	
		user["token"]=csrf_token;
		
		
		event.preventDefault();
		$(':button').prop('disabled', true); 

		$("#loading-image").show();
		$.ajax({
			type : "POST",
			contentType : "application/json",
			url : "${home}updateUserPassword",
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