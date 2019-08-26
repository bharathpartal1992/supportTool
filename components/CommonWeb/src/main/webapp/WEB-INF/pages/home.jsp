<%@page import="java.util.HashMap"%>
<html xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office"
	xmlns="http://www.w3.org/TR/REC-html40">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page import="com.orsb2bgw.supporttool.util.*,java.util.Map" %>


<%Map<String,String> siteNameMap=UtilityMethods.getSiteNames();
if(!siteNameMap.containsKey("site2")){
		request.getSession().setAttribute("curSiteName", "site1");
		}

 %>
<head>


    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title><spring:message code="label.home.title" /></title>

    <c:url value="/help" var="helpUrl"/>
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
	
	   
 	<script src="<c:url value="/resources/bower_components/bootstrap/dist/js/jquery.1.10.2.min.js"/>"></script>
    
	
	<c:url value="/login?logout" var="logoutUrl" />
	<c:url value="/admin/supplierManagement" var="supplierManagementUrl" />
	<c:url value="/admin/passwordManagement" var="passwordManagementUrl" />
	<c:url value="/admin/addUser" var="addUserUrl"/>
	<c:url value="/supportTool" var="supportToolUrl"/>
	<c:url value="/workList" var="workListUrl"/>
	<c:url value="/home" var="home"/>
	
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    

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
                       
                 
                        <li><a href="${logoutUrl}"><i class="fa fa-sign-out fa-fw"></i><spring:message code="label.logout" /></a>
                        </li>
                        
                        
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
                <li>
                <h6 style="color:337ab7"><spring:message code="label.userName" /> 
  <span style="color:green"><sec:authentication property="principal.username" /></span></h6>
   <sec:authorize access="hasAnyRole('ADMIN')"><h6 style="color:337ab7"><spring:message code="label.role" /> <span style="color:green"><spring:message code="label.role.admin" /></span></h6></sec:authorize>
      <sec:authorize access="hasAnyRole('SUPERUSER')"><h6 style="color:337ab7"><spring:message code="label.role" /> <span style="color:green"><spring:message code="lable.role.superUser" /></span></h6></sec:authorize>
   <sec:authorize access="hasAnyRole('NORMALUSER')"><h6 style="color:337ab7"><spring:message code="label.role" />  <span style="color:green"><spring:message code="label.role.user" /></span></h6></sec:authorize>
                </li>
               
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
			
                            <a href="${home}"><i class="fa fa-dashboard fa-fw"></i> <spring:message code="label.menu.dashboard" /></a>
                        </li>
                        <li>
                        
                            <a href="${supportToolUrl}"><i class="fa fa-wrench fa"></i><spring:message code="label.menu.supportTool" /></a>
                        </li>
                        <sec:authorize access="hasAnyRole('ADMIN', 'SUPERUSER')">
                        <li>
                            <a href="${workListUrl}"><i class="fa fa-list-alt fa"></i> <spring:message code="label.menu.workList" /></a>
                        </li>
                        </sec:authorize>
                   		<sec:authorize url="/admin">
                        <li>
                            <a href="${addUserUrl}"><i class="fa fa-user fa"></i><spring:message code="label.menu.newUser" /></a>
                        </li>
						
						 <li>
                            <a href="${supplierManagementUrl}"><i class="fa fa-group fa"></i><spring:message code="label.menu.supplierManagement" /></a>
                        </li>
						
						<li>
                            <a href="${passwordManagementUrl}"><i class="fa fa-desktop fa"></i><spring:message code="label.menu.userManagement" /></a>
                        </li>
                		</sec:authorize>
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
                    <h1 class="page-header" style="padding-bottom: 1px;margin-bottom: 10px;border-bottom-width: 1px;height: 82px;"><spring:message code="label.menu.dashboard" />
  				 <form role="form"  id="changeSite" >
  				 
                      <select class="form-control"  id="sitename" style="width: 150px;height: 31px;position: relative;left: 800px;top: -25px;">
                    <option value="select"><spring:message code="label.menu.selectSite" /></option>
                    <%
  				 String options=null;
  				 if(request.getSession().getAttribute("curSiteName")!=null)
  				 options= (String)request.getSession().getAttribute("curSiteName");
  				 for(String key: siteNameMap.keySet()){
  				 if(options!=null && options.equalsIgnoreCase(key)) {
  				  %><option value="<%=key %>" selected="selected"><%=siteNameMap.get(key) %></option>
  				  <%}else{ %>
  				  <option value="<%=key %>"><%=siteNameMap.get(key) %></option>
  				  <%}
  				 
                    } %>
                    
                    </select>
                     <input type="hidden" name="${_csrf.parameterName}"
											value="${_csrf.token}" id="csrft" />
                                      
                    <button type="submit" class="btn btn-default" style="
    left: 970px;
    position: relative;
    top: -56px;
    width: 65px;
    height: 31px;"><spring:message code="label.button.select" /></button>
                    
                </form>    
                    
                    </h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-wrench fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                   <!-- <div class="huge">Support Tool</div>-->
									<div><spring:message code="label.menu.supportTool" /></div>
                                   
                                </div>
                            </div>
                        </div>
                        <a href="${supportToolUrl}">
                            <div class="panel-footer">
                                <span class="pull-left"><spring:message code="label.button.clickToNav" /></span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <sec:authorize access="hasAnyRole('ADMIN', 'SUPERUSER')">
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-list-alt fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <!--<div class="huge">Work List</div>-->
									<div><spring:message code="label.menu.workList" /></div>
                            
                                </div>
                            </div>
                        </div>
                        <a href="${workListUrl}">
                            <div class="panel-footer">
                                <span class="pull-left"><spring:message code="label.button.clickToNav" /> </span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                </sec:authorize>
				<sec:authorize url="/admin">
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-violet">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-user fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <!--<div class="huge">Create new User</div>-->
									<div><spring:message code="label.menu.newUser" /></div>
                             
                                </div>
                            </div>
                        </div>
                        <a href="${addUserUrl}">
                            <div class="panel-footer">
                                <span class="pull-left"><spring:message code="label.button.clickToNav" /> </span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-yellow">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-group fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                   <!-- <div class="huge">Supplier Management</div>-->
                                     <div><spring:message code="label.menu.supplierManagement" /></div>
                                </div>
                            </div>
                        </div>
                        <a href="${supplierManagementUrl}">
                            <div class="panel-footer">
                                <span class="pull-left"><spring:message code="label.button.clickToNav" /></span>
                                
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
				<div class="col-lg-3 col-md-6">
                    <div class="panel panel-red">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-desktop fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <!--<div class="huge">User Password Management</div>-->
									<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<spring:message code="label.menu.userManagement" /></div>
                                    
                                </div>
                            </div>
                        </div>
                        <a href="${passwordManagementUrl}">
                            <div class="panel-footer">
                                <span class="pull-left"><spring:message code="label.button.clickToNav" /> </span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                </sec:authorize>
            </div>
            </div>
			
            
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="<c:url value="/resources/bower_components/jquery/dist/jquery.min.js"/>"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="<c:url value="/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"/>"></script>
       <script src="<c:url value="/resources/bower_components/bootstrap/dist/js/jquerysession.js"/>"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="<c:url value="/resources/bower_components/metisMenu/dist/metisMenu.min.js"/>"></script>

    <!-- Morris Charts JavaScript -->
    <script src="<c:url value="/resources/bower_components/raphael/raphael-min.js"/>"></script>
<%--     <script src="<c:url value="/resources/bower_components/morrisjs/morris.min.js"/>"></script>
  <script src="<c:url value="/resources/js/morris-data.js"/>"></script>
 --%>
    <!-- Custom Theme JavaScript -->
    <script src="<c:url value="/resources/dist/js/sb-admin-2.js"/>"></script>
    	<script src="<c:url value="/resources/bower_components/bootstrap/dist/js/jquery.alertable.js"/>"></script>
    
    
    
    <script>
    jQuery(document).ready(function($) {
    
	 var strings = new Array();
      strings['selectSiteMessage'] = "<spring:message code='label.alert.selectSite' javaScriptEscape='true' />";
	  strings['isSelected'] = "<spring:message code='label.alert.isSelected' javaScriptEscape='true' />";
    
    
     $( window ).load(function() {
    // alert($.session.get('curSiteName'));
   //  var sitename=$( "#changeSite option:selected" ).text();
    // 	  $.session.set('curSiteName',sitename);
  //    $.alertable.alert("Currently Selected Site is "+sitename+"  Please use Site Selection Dropdown to change.");
     
     });
    
    $("#changeSite").submit(function(event) {
    
    var searchCriteria={};
    	
  //  alert(sitename);
    
    event.preventDefault(event);
    
    var sitename = $("#sitename").val(); 
    if(sitename=="select")
    {
    	event.preventDefault(event);
             $.alertable.alert(strings['selectSiteMessage']);
		
    }
    else
    {
	  //$.session.set('curSiteName',sitename);
	 // $.request.
	//  $.removeCookie("curSiteName");
	//  var siteName=$.session.get('curSiteName');
 		$("#sitename").val(sitename);
	  //$.alertable.alert($("#sitename option:selected").text()+" "+strings['isSelected']);
	  
	 searchCriteria["siteName"]=sitename;
    	
    	var csrf_token=$("#csrft").val();
	
		searchCriteria["token"]=csrf_token;
		
    	event.preventDefault();
		
		$(':button').prop('disabled', true);
		$("#loading-image").show();
		$.ajax({
			type : "POST",
			contentType : "application/json",
			url : "setSiteName",
			data : JSON.stringify(searchCriteria),
			dataType : 'json',
			timeout : 60000,
			beforeSend: function (xhr)
            {
                xhr.setRequestHeader('X-CSRF-Token', csrf_token); 
                xhr.setRequestHeader("X-AjaxRequest", "1");
            },
			success : function(data) {
			
                        var message=data.msg;
			if(message!==""){
			$.alertable.alert(message);
			$("#sitename").val('site1');
			}
			else
			$.alertable.alert($("#sitename option:selected").text()+" "+strings['isSelected']);
			    
			$(':button').prop('disabled', false);
			
	
				
			},
			error : function(x,t,m) {
			if(t==="timeout") {
            $.alertable.alert("Time out Occured.Please try after sometime.");
        } else {
            $.alertable.alert(t);
        }
        if (x.status == 601) {
                              $.alertable.confirm('Session Expired. Click OK to login').then(function() {
                                        window.location.href = "/CommonWeb/index.jsp";
                                        }, function() {
                                       $(':button').prop('disabled', false);
                                   });
                            }
				console.log("ERROR: ", m);
				//display(e);
			},
			done : function(e) {
				console.log("DONE");
				enableSearchButton(true);
			},
			complete: function(){
			$('#loading-image').hide();
        	
      }
		});
    
    
	 }
    });
    
    function setSiteInSession(sitename)
    {
    	
    
    }
    
    
    
    });
    
    </script>

</body>

</html>