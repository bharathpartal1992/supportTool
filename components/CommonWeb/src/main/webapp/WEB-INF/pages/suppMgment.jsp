<html xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office"
	xmlns="http://www.w3.org/TR/REC-html40">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%-- <%@page session="false"%> --%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
	<c:url value="/admin/passwordManagement" var="passwordManagementUrl" />
	<c:url value="/admin/addUser" var="addUserUrl"/>
	<c:url value="/supportTool" var="supportToolUrl"/>
	<c:url value="/workList" var="workListUrl"/>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    
 <%--    <c:url var="home" value="/" scope="request" /> --%>


<%-- <spring:url value="/resources/core/css/hello.css" var="coreCss" /> --%>

<%-- <link href="<c:url value="/resources/bower_components/bootstrap/dist/css/bootstrapcssforJqueryjs/bootstrap.min.js"/>" rel="stylesheet" /> --%>
<%-- <link href="${coreCss}" rel="stylesheet" /> --%>


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
      <sec:authorize access="hasAnyRole('SUPERUSER')"><h6 style="color:337ab7"><spring:message code="label.role" /> <span style="color:green"> <spring:message code="lable.role.superUser" /></span></h6></sec:authorize>
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
                            <a href="${workListUrl}"><i class="fa fa-list-alt fa"></i> <spring:message code="label.menu.workList" /></a>
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
                    <h3 class="page-header"><spring:message code="label.menu.supplierManagement" /></h3>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading" style="font-weight: 800;font-size: 12;">
                            Add or Remove Suppliers
                        </div>
                         
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                <span olspan="2" id="sMessage" style="color: green">${successMsg}</span>
                                <span olspan="2" id="fMessage" style="color: red">${failureMsg}</span>
                                    <form commandName="suplier" id="suppAddDel" <%-- action="<c:url value='insertNewSupplier'/>" method="post" --%> >
                                        <div class="form-group">
                                            <label style="font-weight: 200;font-size: 12px;"><spring:message code="label.suppMgment.supplierName" /></label>
                                            <input class="form-control" type="text" placeholder="Supplier Name" id="supplierId" style="width: 200px; height: 30px; font-size: 12;" required  pattern="[A-Z0-9]{2,}" title="Supplier Name should be in Uppercase letters" name="supplierId"/>
                                           <input id="url" value="<c:url value='insertNewSupplier'/>" type="hidden"/><label style="font-weight: 200;font-size: 12;"><spring:message code="label.userPasswordmanagement.siteName" /></label><input class="form-control" name="sitename" id="sitename" value='<%=UtilityMethods.getSiteMap().get((String)session.getAttribute("curSiteName")) %>' disabled size="17" style="width: 225px; height: 30px;">
                                        </div>
                                        <div class="form-group">
											 
											  
											</div>
                                        <input type="hidden" id="csrf" name="${_csrf.parameterName}"
											value="${_csrf.token}" />
                                        <button type="submit" class="btn btn-default"  id="sbtn" name="add" value="add"><spring:message code="label.suppMgment.add" /></button>
                                        <button type="submit" class="btn btn-default" id="sbtn" name="remove" value="remove"><spring:message code="label.suppMgment.remove" /></button>
                                        
                                    </form>
                                          <div id="loading-image"><img src="<c:url value="/resources/img/loader.gif"/>" style="
					position: relative;
					top: 50%;
					left: 50%;
					transform: translate(50%,50%);
					width: 30%;
					" /></div>   
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
         <h3>UserName:&nbsp;&nbsp;<sec:authentication property="principal.username" /></h3>
         <h3>UserRole:&nbsp;&nbsp;<sec:authentication property="principal.authorities" /></h3>
            </center>
        </div>
      </div>
      
    </div>
  </div>	
                          
                                <!-- /.col-lg-6 (nested) -->
                                <div class="col-lg-6">
                                    
									
                                        
                                              <div class="row">
                <div class="col-lg-6" style="width: 352px">
                    <div class="panel panel-default">
                        <div class="panel-heading" style="font-weight: 800;font-size: 11px;">
                            <spring:message code="label.suppMgment.supplierList" />
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive" style="height: 350px; " >
        
                                <table class="table table-striped table-bordered table-hover" id="supplierDataTable">
                                    <thead style="display:block;
    
     width: 280;">
                                        <tr>
                                            <th style="font-weight: 600;font-size: 11px;width: 98px;" ">ID</th>
                                            <th style="font-weight: 600;font-size: 11px;width: 268px;">Supplier Name</th>
                                           
                                        </tr>
                                        
                                    </thead>
                                    
                                    <tbody id="tbody" style="font-size:11 " >
                               <%--  style="display:block;
    height:350px;
    overflow:auto; width: 280;"   <c:set var="count" value="1" scope="page" />
                                    <c:choose>
                                    <c:when test="${supplierList ne null }">
                                    <c:forEach var="supplier" items="${supplierList}" >
                                    	 <tr>
                                            <td>${count}</td>
                                            <td>${supplier.supplierId}</td>
                                         
                                        </tr>
                                    <c:set var="count" value="${count + 1}" scope="page"/>
                                    </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                     <tr>
                                     <td>
                                     <p style="color:red;">No records exists!</p>
                                     </td>
                                     </tr>
                                    </c:otherwise>
                                    </c:choose> --%>
                                    </tbody>
                                    </div>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
			</div>
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
                                    
                                </div>
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
						 <!-- /.row -->
						
     
        </div>
        <!-- /#page-wrapper -->
		
    </div>
   <!-- /#wrapper -->

    <!-- jQuery -->
  <%-- <script src="<c:url value="/resources/bower_components/bootstrap/dist/js/jquery.1.10.2.min.js"/>"></script>  --%>
<%--         <script src="<c:url value="/resources/bower_components/jquery/dist/jquery.min.js"/>"></script> --%>

    <!-- Bootstrap Core JavaScript -->
<%--      <script src="<c:url value="/resources/bower_components/bootstrap/dist/js/bootstrapforjquery/bootstrap.min.js"/>"></script>
 --%><script src="<c:url value="/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"/>"></script>
    <script src="<c:url value="/resources/bower_components/jquery/dist/jquery.min.js"/>"></script>

      
    <!-- Metis Menu Plugin JavaScript -->
    <script src="<c:url value="/resources/bower_components/metisMenu/dist/metisMenu.min.js"/>"></script>

    <!-- Morris Charts JavaScript -->
    <script src="<c:url value="/resources/bower_components/raphael/raphael-min.js"/>"></script>
<%--     <script src="<c:url value="/resources/bower_components/morrisjs/morris.min.js"/>"></script>
    <script src="<c:url value="/resources/js/morris-data.js"/>"></script>

    <!-- Custom Theme JavaScript -->
    <script src="<c:url value="/resources/dist/js/sb-admin-2.js"/>"></script> --%>
     <script src="<c:url value="/resources/bower_components/bootstrap/dist/js/jquery.alertable.js"/>"></script>
    
    <script>
    
    
	
	
	
    
    
    jQuery(document).ready(function($) {
    
    var strings = new Array();
      strings['confirm'] = "<spring:message code='label.userPasswordmanagement.confirm' javaScriptEscape='true' />";
	  
   var ButtonValue;
   $('button[type="submit"]').click(function(e){
   ButtonValue = $(this).val();
	});
   
   
    
    
    $( window ).load(function() {
 
 		getViaAjax();
});
/* 		$("#suppAddDel").reset(); */
		$("#suppAddDel").submit(function(event) {

			// Disble the search button
			enableSearchButton(false);

			// Prevent the form from submitting via the browser.
			event.preventDefault();
		  $.alertable.confirm(strings['confirm']).then(function() {
      searchViaAjax(ButtonValue);
    }, function() {
      console.log('Cancel');      
    });	
			
			
	/* 	if (confirm("Click OK to continue?")){
        		searchViaAjax(ButtonValue);
      }
		 */

		});
		
		
		
		
		
		
		
		

	});
	
	function getViaAjax()
	{
		var supplier = {}
		
		supplier["supplierId"] = $("#supplierId").val();
	
		var csrf_token=$("#csrf").val();
		var token ={}
	
		$(':button').prop('disabled', true);
		supplier["token"]=csrf_token;
		$("#loading-image").show();
		$.ajax({
			type : "GET",
			cache : false,
			contentType : "application/json",
			url : "${home}getAllSuppliers",
			data : JSON.stringify(supplier),
			/* data : JSON.stringify({"supplier":supplier,"token":csrf_token}), */
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
				
				displayExstTable(data);
				$(':button').prop('disabled', false);
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

	function searchViaAjax(btn) {

		var supplier = {}
		
		supplier["supplierId"] = $("#supplierId").val();
	/* 	supplier[csrfParameter] = csrfToken; */
		var csrf_token=$("#csrf").val();
		var token ={}
	
		supplier["token"]=csrf_token;
		
		//$(':button').prop('disabled', false);
		
	// $.alertable.alert("Test");
		
		
		/*  var token = {};
		 
		 var headers={};
		
			var csrfParameter = $("meta[name='_csrf_parameter']").attr("content");
			var csrfHeader = $("meta[name='_csrf_header']").attr("content");
			var csrfToken = $("meta[name='_csrf']").attr("content");
		
		token[csrfParameter] = csrfToken;
		headers[csrfHeader] = csrfToken;
		 */
		 $(':button').prop('disabled', true);
		$("#loading-image").show();
		$.ajax({
			type : "POST",
			contentType : "application/json",
			url : "${home}insertNewSupplier"+"?"+btn,
			data : JSON.stringify(supplier),
			/* data : JSON.stringify({"supplier":supplier,"token":csrf_token}), */
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
				$("input:text").val("");
				event.preventDefault();
				 $.alertable.alert(data.msg);
				//alert(data.msg);
				displayExstTable(data);
				$(':button').prop('disabled', false);
				
			
			/* 	$('#suppAddDel' supplierId).val(""); */
	
				
			},
			error : function(x, t, e) {
				console.log("ERROR: ", e);
				if (x.status == 601) {
                              $.alertable.confirm('Session Expired. Click OK to login').then(function() {
                                        window.location.href = "/CommonWeb/index.jsp";
                                        }, function() {
                                       $(':button').prop('disabled', false);
                                   });
                            }
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
	function displayExstTable(data)
	{
		/* var jsondata=$.parseJSON('{"response":[["name0","id0"],["name1","id1"]]}');

	$.each(jsondata.response, function(i, d) { */
	$('#supplierDataTable tr td').remove();

	
	var jsondata=data;

	$.each(jsondata.result, function(i, d) {
   	var row='<tr>';
   	var j=i+1;
   	row+='<td >'+j+'</td>';//style="font-weight: 200;font-size: 11px;width: 76px;"
   	$.each(d, function(j, e) {
      row+='<td >'+e+'</td>';//style="font-weight: 200;font-size: 11px;width: 188px;"
   	});
   	i=i+1;
  	 row+='</tr>';
   	$('#supplierDataTable tbody').append(row);
});
	
	}
	
	function drawTable(data) {
	
    for (var i = 0; i < data.length; i++) {
        drawRow(data[i]);
    }
  
    
	}
	
	function drawRow(rowData) {
    var row = $("<tr>")
    $("#tbody").append(row); //this will append tr element to table... keep its reference for a while since we will add cels into it
    row.append($("<td>" + 1 + "</td>"));
    row.append($("<td>" + JSON.stringify(rowData.result.supplierId) + "</td></tr>"));
    
}

	function enableSearchButton(flag) {
		$("#btn-search").prop("disabled", flag);
	}

	function display(data) {
		
				
				var html = '<table border="1">';
        $.each(data.result, function(key, value){
            html += '<tr>';
            html += '<td>' + value + '</td>';
            html += '</tr>';
        });
        html += '</table>';
				
				
				
		$('#feedback').html(html);
	}
        

    </script>
   
    

</body>

</html>