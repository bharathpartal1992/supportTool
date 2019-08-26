<html xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office"
	xmlns="http://www.w3.org/TR/REC-html40">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title><spring:message code="label.home.title" /></title>

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
  
  
  
  <link rel="stylesheet" href="<c:url value="/resources/bower_components/font-awesome/css/reset.css"/>" > <!-- CSS reset -->
	<link rel="stylesheet" href="<c:url value="/resources/bower_components/font-awesome/css/style.css"/>"> <!-- Resource style -->
 
	    <script src="<c:url value="/resources/bower_components/bootstrap/js/modernizr.js"/>"></script>
	
	   
 	<script src="<c:url value="/resources/bower_components/bootstrap/dist/js/jquery.1.10.2.min.js"/>"></script>
    
	
	<c:url value="/login?logout" var="logoutUrl" />
	<c:url value="/admin/supplierManagement" var="supplierManagementUrl" />
	<c:url value="/admin/passwordManagement" var="passwordManagementUrl" />
	<c:url value="/admin/addUser" var="addUserUrl"/>
	<c:url value="/supportTool" var="supportToolUrl"/>
	<c:url value="/workList" var="workListUrl"/>
	<c:url value="/home" var="home"/>
	<c:url value="/help" var="helpUrl"/>
	
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
			<li><h3 style="
    font-weight: 500;
    margin-top: 20px;
    margin-bottom: 10px;
    font-size: 24;
    font-weight: 500;
">ORSS Gateway Support Tool &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h3></li>
			</ul>
		
            <ul class="nav navbar-top-links navbar-right">
                
               
                
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                       
                 
                        <li><a href="${logoutUrl}"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                        
                        
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
                
                <li>
                <h6 style="color:337ab7">USER: 
  <span style="color:green"><sec:authentication property="principal.username" /></span></h6>
   <sec:authorize access="hasAnyRole('ADMIN')"><h6 style="color:337ab7">ROLE: <span style="color:green">ADMIN</span></h6></sec:authorize>
      <sec:authorize access="hasAnyRole('SUPERUSER')"><h6 style="color:337ab7">ROLE: <span style="color:green"> SUPER USER</span></h6></sec:authorize>
   <sec:authorize access="hasAnyRole('NORMALUSER')"><h6 style="color:337ab7">ROLE:  <span style="color:green">NORMAL USER</span></h6></sec:authorize>
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
			
                            <a href="${home}"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                        </li>
                        <li>
                        
                            <a href="${supportToolUrl}"><i class="fa fa-wrench fa"></i>Support Tool</a>
                        </li>
                        <sec:authorize access="hasAnyRole('ADMIN', 'SUPERUSER')">
                        <li>
                            <a href="${workListUrl}"><i class="fa fa-list-alt fa"></i> Work List</a>
                        </li>
                        </sec:authorize>
                   		<sec:authorize url="/admin">
                        <li>
                            <a href="${addUserUrl}"><i class="fa fa-user fa"></i>Create New User</a>
                        </li>
						
						 <li>
                            <a href="${supplierManagementUrl}"><i class="fa fa-group fa"></i>Supplier Management</a>
                        </li>
						
						<li>
                            <a href="${passwordManagementUrl}"><i class="fa fa-desktop fa"></i>User Management</a>
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
                    <h3 class="page-header"><spring:message code="label.help.faq" /></h3>
                    <h6><spring:message code="label.help.heading" /></h6>
                       </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
        
	

	<div class="cd-faq-items" style="
    padding-left: 10px;">
		<ul id="basics" class="cd-faq-group">
			<li class="cd-faq-title"><h3></h3></li>
			<li>
				<a class="cd-faq-trigger" href="#0"><spring:message code="label.help.search" /></a>
				<div class="cd-faq-content">
				<ul>
				
									<p style="font-size: 12px;"><li><spring:message code="label.help.search1" /></li></p>
				
				
									<p style="font-size: 12px;"> <li><spring:message code="label.help.search2" /></li></p>
				
				
									<p style="font-size: 12px;"><li><spring:message code="label.help.search3" /></li></p>
				
				
									<p style="font-size: 12px;"><li><spring:message code="label.help.search4" /></li></p>
				
				
				
				</ul>
				</div> <!-- cd-faq-content -->
			</li>

			<li>
				<a class="cd-faq-trigger" href="#0"><spring:message code="label.help.searchResult" /></a>
				<div class="cd-faq-content">
				<ul>
				
									<p style="font-size: 12px;"><li><spring:message code="label.help.searchResult1" /></li></p>
				
				
									<p style="font-size: 12px;"> <li><spring:message code="label.help.searchResult2" /></li></p>
									
				</ul>
					</div> <!-- cd-faq-content -->
			</li>

			<li>
				<a class="cd-faq-trigger" href="#0"><spring:message code="label.help.downloadResult" /></a>
				<div class="cd-faq-content">
				
				<ul>
				
									<p style="font-size: 12px;"><li><spring:message code="label.help.downloadResult1" /></li></p>
				</ul>
					</div> <!-- cd-faq-content -->
			</li>

			<li>
				<a class="cd-faq-trigger" href="#0"><spring:message code="label.help.status" /></a>
				<div class="cd-faq-content">
					<ul>
				
									<p style="font-size: 12px;"><li><spring:message code="label.help.status1" /></li></p>
				</ul>
				
				</div> <!-- cd-faq-content -->
			</li>
			
			<li>
				<a class="cd-faq-trigger" href="#0"><spring:message code="label.help.payload" /></a>
				<div class="cd-faq-content">
					<ul>
				
									<p style="font-size: 12px;"><li><spring:message code="label.help.payload1" /></li></p>
				</ul>
				
				</div> <!-- cd-faq-content -->
			</li>
			
			<li>
				<a class="cd-faq-trigger" href="#0"><spring:message code="label.help.newuser" /></a>
				<div class="cd-faq-content">
					<ul>
				
									<p style="font-size: 12px;"><li><spring:message code="label.help.newuser1" /></li></p>
				</ul>
				
				</div> <!-- cd-faq-content -->
			</li>
			
			
		</ul> <!-- cd-faq-group -->

		
	</div> <!-- cd-faq-items -->


               
            </div>
            </div>
			
            
    <!-- /#wrapper -->

    <!-- jQuery -->
    
    <script src="<c:url value="/resources/bower_components/bootstrap/js/jquery-2.1.1.js"/>"></script>
<script src="<c:url value="/resources/bower_components/bootstrap/js/jquery.mobile.custom.min.js"/>"></script>
<script src="<c:url value="/resources/bower_components/bootstrap/js/main.js"/>"></script> <!-- Resource jQuery -->
    
    
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
    
    
    
    $("help").click(function(){
    alert("The paragraph was clicked.");
});
    
     var strings = new Array();
      strings['selectSiteMessage'] = "<spring:message code='label.alert.selectSite' javaScriptEscape='true' />";
    
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
	  $.alertable.alert($("#sitename").val()+strings['selectSiteMessage']);
	  
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
			timeout : 100000,
			beforeSend: function (xhr)
            {
                xhr.setRequestHeader('X-CSRF-Token', csrf_token); 
                xhr.setRequestHeader("X-AjaxRequest", "1");
            },
			success : function(data) {
			
			$(':button').prop('disabled', false);
			/* 	console.log("SUCCESS: ", data); */
				/* display(data); */
				//display(data);
				//drawTable(data);
				// $("input:text").val("");
			
				
			//	displayExstTable(data);
				//loadDownloadSearchResultInputs(data);
			//	$(':button').prop('disabled', false);
			
			/* 	$('#suppAddDel' supplierId).val(""); */
	
				
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