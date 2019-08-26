<html xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office"
	xmlns="http://www.w3.org/TR/REC-html40">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page import="com.orsb2bgw.supporttool.Objects.dto.*,java.util.List" %>
<%@ page import="com.orsb2bgw.supporttool.util.UtilityMethods,java.util.Map" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<head>

<!-- ended here -->

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
 <link href="<c:url value="/resources/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css"/>" rel="stylesheet">

      <link href="<c:url value="/resources/bower_components/font-awesome/css/jquery.alertable.css"/>" rel="stylesheet">

        <link href="<c:url value="/resources/bower_components/datatables-responsive/css/dataTables.responsive.css"/>" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<c:url value="/resources/dist/css/sb-admin-2.css"/>" rel="stylesheet">

    

    <!-- Custom Fonts -->
    <link href="<c:url value="/resources/bower_components/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet" type="text/css">
    <link href="<c:url value="/resources/bower_components/font-awesome/css/alertify.bootstrap.css"/>" rel="stylesheet" type="text/css">
    <link href="<c:url value="/resources/bower_components/font-awesome/css/alertify.core.css"/>" rel="stylesheet" type="text/css">
	<link href="<c:url value="/resources/bower_components/font-awesome/css/alertify.default.css"/>" rel="stylesheet"  id="toggleCSS" type="text/css">
    <link href="<c:url value="/resources/bower_components/font-awesome/css/jquery.alerts.css"/>" rel="stylesheet"  id="toggleCSS" type="text/css">

	<script src="<c:url value="/resources/bower_components/bootstrap/dist/js/jquery.1.10.2.min.js"/>"></script>   
   <!-- <script src="/CommonWeb/resources/bower_components/bootstrap/dist/js/jquery.alertable.js"></script> -->
   <%--  <script src="<c:url value="/resources/bower_components/bootstrap/dist/js/jquery.alertable.js"/>"></script> --%>
    
	<c:url value="/login?logout" var="logoutUrl" />
	<c:url value="/admin/supplierManagement" var="supplierManagementUrl" />
	<c:url value="/admin/insertNewSupplier" var="insertNewSupplier" />
	<c:url value="/admin/passwordManagement" var="passwordManagementUrl" />
	<c:url value="/admin/addUser" var="addUserUrl"/>
	<c:url value="/supportTool" var="supportToolUrl"/>
	<c:url value="workList" var="workListUrl"/>
	<c:url value="/admin/workList_resubmit" var="resubmit"/>
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
			<img src="/CommonWeb/resources/img/logo.gif" alt="" class="img-responsive logo" style="
					position: relative;
					top: 50%;
					left: 50%;
					transform: translate(-130%,5%);
					width: 50%;
					">
			</ul>
			<ul class="nav navbar-top-links navbar-left">
			<li><h3><spring:message code="label.home.header" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h3></li>
			</ul>
		
           <ul class="nav navbar-top-links navbar-right" id="reStatus">
                
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-tasks fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-tasks">
                        <li>
                            <a href="#">
                            
								 <input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" id="csrfff" /> 
                                <div>
                                    <p>
                                        <div id="reStatusMessage" style="color:#FF0000"></div>
                                         <div id="submittedStatusMessage" style="color:#006400"></div>
                                        
                                        
                                        
                                       
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%; color: green;background-color: green;">
                                            <span class="sr-only" ></span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                    </ul>
                    <!-- /.dropdown-tasks -->
                </li>
                <!-- /.dropdown -->
                
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
                            <a href="${workListUrl}"><i class="fa fa-list-alt fa"></i> <spring:message code="label.menu.workList" /></a>
                        </li>
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
                      
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
        <form role="form" name="myform" id="workListForm" >
            <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="page-header"><spring:message code="label.heading.worklist" /></h3>
					<div class="panel panel-default">
                        <div class="panel-heading" style="font-weight: 800;font-size: 12;">
                            <spring:message code="label.worklist.subHeading" />
                        </div>
                        <div class="panel-body" style="font-weight: 200;font-size: 12;">
                            <div class="row">
                                <div class="col-lg-6">
                                        <table>
                                        <tr>
                                        <td style="padding-right: 10px">
                                    	<div class="form-group">
                                            <label style="font-weight: 200;font-size: 12;"><spring:message code="lable.worklist.direction" /></label>
                                            <select id="messageType" class="form-control" style="width: 225px; height: 30px;">
                                                <option value="ALL" selected="selected" style="font-weight: 200;font-size: 12;"><spring:message code="lable.worklist.all" /></option>
                                                <option value="Inbound" style="font-weight: 200;font-size: 12;"><spring:message code="label.worklist.inbound"/></option>
                                                <option value="Outbound" style="font-weight: 200;font-size: 12;"><spring:message code="label.worklist.outbound" /></option>
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

                                        <!-- <button type="submit" class="btn btn-default">Change View</button> -->
                                        <!-- <input type="button"
			value="Change View" class="btn btn-default" name="Change View" id="Change View" onClick="submitForm(this)"> -->
			                            <input type="button" class="btn btn-default"  id="ChangeView" name="ChangeView" value="Change View" />
                                        <hr/>
                                        <div class="form-group">
                                            <label style="font-weight: 200;font-size: 12;"><spring:message code="label.supportTool.SenderMsgID" /></label>
                                            <input class="form-control" style="width: 225px; height: 30px;" id="senderMsgId" />
                                        </div>
										<div class="form-group">
                                            <label style="font-weight: 200;font-size: 12;"><spring:message code="label.supportTool.ReceiverMsgID" /></label>
                                            <input class="form-control" style="width: 225px; height: 30px;" id="receiverMsgId" />
                                        </div>
										<!-- <button type="submit" class="btn btn-default">Go</button> -->
										<input type="button" class="btn btn-default"  id="go" name="go" value="Search" />
										<hr/>
										<%-- <div id="loading-image"><img src="<c:url value="/resources/img/loader.gif"/>" style="
					position: relative;
					top: 10%;
					left: 10%;
					transform: translate(20%,5%);
					width: 171px; height: 174px" /></div> --%>
										<sec:authorize access="hasAnyRole('ADMIN', 'SUPERUSER')">
										<!-- <input type="button" class="btn btn-default" value="Resubmit" name="Resubmit" ID="Resubmit" onClick="doAjaxPost()" />
										<input type="button" class="btn btn-default" value="Remove" name="Remove" ID="Remove" onClick="doAjaxPost()"> -->
										<div><input type="hidden" id="csrf" name="${_csrf.parameterName}"
											value="${_csrf.token}" /></div>
										
										<button type="submit" class="btn btn-default"  id="Resubmit" name="Resubmit" value="Resubmit"><spring:message code="label.worklist.resubmit" /></button>
                                        <button type="submit" class="btn btn-default" id="Remove" name="Remove" value="Remove"><spring:message code="label.worklist.remove" /></button>
										
										<!-- <button type="submit" class="btn btn-default">ReSubmit</button> -->
<!--                                         <button type="reset" class="btn btn-default">Remove</button>
 -->                                      
                                        </sec:authorize>
                                </div>
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <div id="loading-image"> <img src='<c:url value="/resources/img/loader.gif"/>' style="
					position: relative;
					top: 50%;
					left: 30%;
					transform: translate(50%,-100%);
					width: 15%;
					">
					</div>
					
                </div>
                <!-- /.col-lg-12 -->
            </div>
             
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <spring:message code="label.worklist.table" />
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            
                            </div>
                            <!-- /.table-responsive -->
                            
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            </form>
                    
              
            <div class="dataTable_wrapper">
                                <table class="table table-striped table-bordered table-hover" id="workListDataTable">
                                    <thead>
                                        <tr style="font-size: 10px;">
                                        	<th align="left"><input type="checkbox" name="selecctall" value=""></th>
                                            <th><spring:message code="label.supportTool.SenderMsgID" /></th>
                                            <th><spring:message code="label.supportTool.ReceiverMsgID" /></th>
                                            <th><spring:message code="label.supportTool.Estimate" /></th>
                                            <th><spring:message code="label.worklist.supplierName" /></th>
                                            <th><spring:message code="label.supportTool.MessageCode" /></th>
											<th><spring:message code="lable.worklist.direction" /></th>
											<th><spring:message code="label.worklist.timeEntering" /></th>
                                        </tr>
                                    </thead>
                                    <tbody style="font-size:11 ">


     
                                        
                                    </tbody>
                                </table>
            
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

    <!-- Custom Theme JavaScript -->
    <script src="<c:url value="/resources/dist/js/sb-admin-2.js"/>"></script>
     <script src="<c:url value="/resources/bower_components/datatables/media/js/jquery.dataTables.min.js"/>"></script>
    <script src="<c:url value="/resources/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"/>"></script>
    <script src="<c:url value="/resources/bower_components/morrisjs/morris-0.4.1.min.js"/>"></script>
<%--     <script src="<c:url value="/resources/bower_components/morrisjs/jquery-1.8.2.min.js"/>"></script> --%>
     <script src="<c:url value="/resources/bower_components/morrisjs/raphael-min.js"/>"></script>
<%-- <script src="<c:url value="/resources/bower_components/bootstrap/dist/js/alertify.min.js"/>"></script> --%>
<%--       <script src="<c:url value="/resources/bower_components/bootstrap/dist/js/jquery-1.12.4.min.js"/>"></script>
 --%>     <script src="<c:url value="/resources/bower_components/bootstrap/dist/js/jquery.alertable.js"/>"></script>
<%--     <script src="<c:url value="/resources/bower_components/bootstrap/dist/js/alertify.js"/>"></script> --%>
    
         <script src="<c:url value="/resources/bower_components/bootstrap/dist/js/jquerysession.js"/>"></script>
     <script src="<c:url value="/resources/bower_components/bootstrap/dist/js/jquery.ui.draggable.js"/>"></script>
      <script src="<c:url value="/resources/bower_components/bootstrap/dist/js/jquery.alerts.js"/>"></script>
 
<!-- 		<link href="css/jquery.alerts.css" rel="stylesheet" type="text/css" media="screen" />  
 -->    
    <script>
    
   function updateDataTableSelectAllCtrl(table){
   var $table             = table.table().node();
   var $chkbox_all        = $('tbody input[type="checkbox"]', $table);
   var $chkbox_checked    = $('tbody input[type="checkbox"]:checked', $table);
   var chkbox_select_all  = $('thead input[name="selecctall"]', $table).get(0);

   // If none of the checkboxes are checked
   if($chkbox_checked.length === 0){
      chkbox_select_all.checked = false;
      if('indeterminate' in chkbox_select_all){
         chkbox_select_all.indeterminate = false;
      }

   // If all of the checkboxes are checked
   } else if ($chkbox_checked.length === $chkbox_all.length){
      chkbox_select_all.checked = true;
      if('indeterminate' in chkbox_select_all){
         chkbox_select_all.indeterminate = false;
      }

   // If some of the checkboxes are checked
   } else {
      chkbox_select_all.checked = true;
      if('indeterminate' in chkbox_select_all){
         chkbox_select_all.indeterminate = true;
      }
   }
}
var table='';
$(document).ready(function (){
   // Array holding selected row IDs
     $('button[type="submit"]').click(function(e){
          ButtonValue = $(this).val();
	});
   var rows_selected = [];
   table = $('#workListDataTable').DataTable({
          
       responsive: true,  
       bProcessing: true,
    	bDeferRender: true,                  
      'rowCallback': function(row, data, dataIndex){
         // Get row ID
         var rowId = data[0];

         // If row ID is in the list of selected row IDs
         if($.inArray(rowId, rows_selected) !== -1){
            $(row).find('input[type="checkbox"]').prop('checked', true);
            $(row).addClass('selected');
         }
      }
   });

   // Handle click on checkbox
   $('#workListDataTable tbody').on('click', 'input[type="checkbox"]', function(e){
      var $row = $(this).closest('tr');
      var data = table.row($row).data();
      var rowId = data[0];
      var index = $.inArray(rowId, rows_selected);
      if(this.checked && index === -1){
         rows_selected.push(rowId);

      // Otherwise, if checkbox is not checked and row ID is in list of selected row IDs
      } else if (!this.checked && index !== -1){
         rows_selected.splice(index, 1);
      }

      if(this.checked){
         $row.addClass('selected');
      } else {
         $row.removeClass('selected');
      }

      // Update state of "Select all" control
      updateDataTableSelectAllCtrl(table);

      // Prevent click event from propagating to parent
      e.stopPropagation();
   });

   // Handle click on table cells with checkboxes
   $('#workListDataTable').on('click', 'tbody td, thead th:first-child', function(e){
      $(this).parent().find('input[type="checkbox"]').trigger('click');
   });

   // Handle click on "Select all" control
   $('thead input[name="selecctall"]', table.table().container()).on('click', function(e){
      if(this.checked){
         $('#workListDataTable tbody input[type="checkbox"]:not(:checked)').trigger('click');
      } else {
         $('#workListDataTable tbody input[type="checkbox"]:checked').trigger('click');
      }

      // Prevent click event from propagating to parent
      e.stopPropagation();
   });

   // Handle table draw event
   table.on('draw', function(){
      // Update state of "Select all" control
      updateDataTableSelectAllCtrl(table);
   });
    
  
});

    var ButtonValue=''; 
    var mType='ALL';
    var senderMsgId='';
    var receiverMsgId=''; 
     
    $( window ).load(function() {
        $("#loading-image").hide();
 		getViaAjax();
});

         $("#ChangeView").click(function(){
         senderMsgId='';
         receiverMsgId='';
         mType=$('#messageType :selected').val();
         //alert(mType);
         getViaAjax();
    });
    
          $("#go").click(function(){
          senderMsgId=$('#senderMsgId').val();
          receiverMsgId=$('#receiverMsgId').val();
          if(senderMsgId=='' && receiverMsgId==''){
          
           $.alertable.alert("Please provide SenderMessageId or ReceiverMessageId");
          }
          //alert(senderMsgId + " " + receiverMsgId);
          getViaAjax();
    });
        

		$("#workListForm").submit(function(event) {	
				
			event.preventDefault();
			if( $('#workListDataTable tbody input[type="checkbox"]:checked').length>0)
			    postViaAjax(ButtonValue);
			else
			    $.alertable.alert("Please select  a Message to Resubmit or Remove ");

		});	

	
	
	function getViaAjax()
	{
		var workList = {}
		
		//supplier["supplierId"] = $("#supplierId").val();
		var csrf_token=$("#csrf").val();
		var token ={}
	
		workList["token"]=csrf_token;
		$(':button').prop('disabled', true); 
		//$("#loading-image").show();
		$("#loading-image").show();
		$.ajax({
			type : "GET",
			cache: false,
			contentType : "application/json",
			url : "getWorkList"+"?"+"view="+mType+"&ReceiverMsgID="+receiverMsgId+"&SenderMsgID="+senderMsgId,
			//data : workList,
			dataType : 'json',
			timeout : 60000,
			beforeSend: function (xhr)
            {
                xhr.setRequestHeader('X-CSRF-Token', csrf_token); 
                xhr.setRequestHeader("X-AjaxRequest", "1");
                
            },
			success : function(response) {
			
				displayExstTable(response);
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
				//enableSearchButton(true);
			},
			complete: function(){
			//$("#loading-image").hide();
        	$(':button').prop('disabled', false);
        	$('#loading-image').hide();
      }
		});
	
		
	}

	function postViaAjax(btn) {

		//var workListkeys = {}
		
		var arr = { 'keys' : []};
            $(":checked").each(function() {
            if(!($(this).val().indexOf('#') === -1))
            arr['keys'].push($(this).val());
          }); 
		
		//workListkeys["keys"] = arr;
	
		var csrf_token=$("#csrf").val();
		//var token ={}
	
		//workListkeys["token"]=csrf_token;
		//$('#loading-image').show();
		$(':button').prop('disabled', true); 
		$("#loading-image").show();
		$.ajax({
			type : "POST",
			contentType : "application/json; charset=utf-8",
			url : "worklist"+"?"+btn,
			//data : JSON.stringify(workListkeys),
			data: JSON.stringify(arr),
			dataType : 'json',
			timeout : 60000,
			beforeSend: function (xhr)
            {
                xhr.setRequestHeader('X-CSRF-Token', csrf_token); 
                xhr.setRequestHeader("X-AjaxRequest", "1");
            },
			success : function(response) {
			
				//alert(response.msg);
				 $.alertable.alert(response.msg);
				displayExstTable(response);
				
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
        	//$("#loading-image").hide();
        	$(':button').prop('disabled', false);
        	$("#loading-image").hide();
      }
		});

	}
	function displayExstTable(data)
	{
	
	  
	
	table.clear();	
	//$('#workListDataTable tr td').remove();
    var separator='*#*';
	
	var jsondata=data;

	$.each(jsondata.resultWorklist, function(i, d) {
	   var checkedValue=d.key+separator+d.keyType+separator+d.direction+separator+d.protocol_Messageid;
   	   var row='<tr>';
   	   var j=i+1;
   	   var row = table.row.add(['<td>'+"<input type='checkbox' class='checkbox1' name='allbox' value="+checkedValue+" >"+'</td>',d.sender_MsgId, 
   	   d.receiver_MsgId, d.estimate_Number, d.supplier_Id,d.message_Code , d.direction, d.timestamp]);
});
table.draw();
	
	}
    </script>
</body>
</html>