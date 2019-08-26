<html xmlns:v="urn:schemas-microsoft-com:vml"
	xmlns:o="urn:schemas-microsoft-com:office:office"
	xmlns="http://www.w3.org/TR/REC-html40">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page
	import="com.orsb2bgw.supporttool.util.UtilityMethods,java.util.Map"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>


<head>
<c:url value="/help" var="helpUrl" />
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>ORSSG</title>

<!-- Bootstrap Core CSS -->
<link
	href="<c:url value="/resources/bower_components/bootstrap/dist/css/bootstrap.min.css"/>"
	rel="stylesheet">
<link
	href="<c:url value="/resources/bower_components/bootstrap/dist/css/datepicker.css"/>"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link
	href="<c:url value="/resources/bower_components/metisMenu/dist/metisMenu.min.css"/>"
	rel="stylesheet">



<!-- Timeline CSS -->
<link
	href="<c:url value="/resources/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css"/>"
	rel="stylesheet">



<link
	href="<c:url value="/resources/bower_components/datatables-responsive/css/dataTables.responsive.css"/>"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="<c:url value="/resources/dist/css/sb-admin-2.css"/>"
	rel="stylesheet">



<!-- Custom Fonts -->
<link
	href="<c:url value="/resources/bower_components/font-awesome/css/font-awesome.min.css"/>"
	rel="stylesheet" type="text/css">
<link
	href="<c:url value="/resources/bower_components/font-awesome/css/alertify.bootstrap.css"/>"
	rel="stylesheet" type="text/css">

<link
	href="<c:url value="/resources/bower_components/font-awesome/css/alertify.core.css"/>"
	rel="stylesheet" type="text/css">

<link
	href="<c:url value="/resources/bower_components/font-awesome/css/alertify.default.css"/>"
	rel="stylesheet" id="toggleCSS" type="text/css">



<%-- 		  <link href="<c:url value="/resources/bower_components/font-awesome/css/jquery.alerts.css"/>" rel="stylesheet"  id="toggleCSS" type="text/css">
 --%>


<%-- 	
<link href="<c:url value="/resources/bower_components/bootstrap/dist/css/bootstrapcssforJqueryjs/bootstrap.min.js"/>" rel="stylesheet" /> --%>
<%-- <link href="${coreCss}" rel="stylesheet" /> --%>


<%-- <script src="<c:url value="/resources/bower_components/bootstrap/dist/js/jquery.1.10.2.min.js"/>"></script>
<script src="<c:url value="/resources/bower_components/bootstrap/dist/js/jquery-1.9.1.js"/>"></script>
 --%>

<link
	href="<c:url value="/resources/bower_components/bootstrap/dist/css/jquery.alertable.css"/>"
	rel="stylesheet">
<%--  <script src="<c:url value="/resources/bower_components/bootstrap/dist/js/jquery.alertable.js"/>"></script> --%>




<%-- <script src="<c:url value="/resources/bower_components/bootstrap/dist/js/jquery.bpopup.min.js"/>"></script> --%>



<c:url value="/login?logout" var="logoutUrl" />
<c:url value="/admin/supplierManagement" var="supplierManagementUrl" />
<c:url value="/admin/insertNewSupplier" var="insertNewSupplier" />
<c:url value="/admin/passwordManagement" var="passwordManagementUrl" />
<c:url value="/admin/addUser" var="addUserUrl" />
<c:url value="/supportTool" var="supportToolUrl" />
<c:url value="/workList" var="workListUrl" />
<c:url value="/downloadCSV" var="downloadCSV" />
<c:url value="/fetchMessage" var="fetchMessage" />




<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<style>
tbody tr.selected td {
	background-color: #ffd659;
}
</style>


<script type="text/javascript">
	function getPayload() {
		var key = $("#key").val();

		$.post('getPayload', {
			key : key
		}, function(data) {
			$('#results').html(data).hide().slideDown('slow');
		});
	}

	function validateForm() {

		var fDate = document.forms["downloadCSV"]["fD"].value;
		var tDate = document.forms["downloadCSV"]["tD"].value;

		if ((fDate == null || fDate == "") && (tDate == null || tDate == "")) {
			var tDate = new Date();
			var sTDate = tdate.getDate() + "/" + tdate.getMonth() + "/"
					+ tdate.getFullYear();
			document.forms["searchCriteriaForm"]["fromDate"].value = sTDate
			document.forms["searchCriteriaForm"]["toDate"].value = sTDate;
		}

	}
</script>





</script>




</head>

<body>

	<c:url value="/login?logout" var="logoutUrl" />
	<div id="wrapper" style="height: 50">


		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>

				</button>
				<a class="navbar-brand" href="index.html"></a>

			</div>
			<!-- /.navbar-header -->
			<ul class="nav navbar-top-links navbar-left">
				<li><img src="<c:url value="/resources/img/logo.gif"/>" alt=""
					class="img-responsive logo"
					style="position: relative; top: 50%; left: 50%; transform: translate(-130%, 5%); width: 50%;"></li>
			</ul>
			<ul class="nav navbar-top-links navbar-left">
				<li><h3>
						<spring:message code="label.home.header" />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</h3></li>
			</ul>

			<ul class="nav navbar-top-links navbar-right" id="reStatus">

				<!-- /.dropdown -->
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i class="fa fa-tasks fa-fw"></i>
						<i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-tasks">
						<li><a href="#"> <input type="hidden"
								name="${_csrf.parameterName}" value="${_csrf.token}" id="csrfff" />
								<div>
									<p>
									<div id="reStatusMessage" style="color: #FF0000"></div>
									<div id="submittedStatusMessage" style="color: #006400"></div>




									</p>
									<div class="progress progress-striped active">
										<div class="progress-bar progress-bar-success"
											role="progressbar" aria-valuenow="100" aria-valuemin="0"
											aria-valuemax="100"
											style="width: 100%; color: green; background-color: green;">
											<span class="sr-only"></span>
										</div>
									</div>
								</div>
						</a></li>
						<li class="divider"></li>

					</ul> <!-- /.dropdown-tasks --></li>
				<!-- /.dropdown -->

				<!-- /.dropdown -->
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
						<i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-user">


						<li><a href="${logoutUrl}"><i
								class="fa fa-sign-out fa-fw"></i> <spring:message
									code="label.logout" /></a></li>
					</ul> <!-- /.dropdown-user --></li>
				<li>
					<h6 style="color: 337ab7">
						<spring:message code="label.userName" />
						<span style="color: green"><sec:authentication
								property="principal.username" /></span>
					</h6> <sec:authorize access="hasAnyRole('ADMIN')">
						<h6 style="color: 337ab7">
							<spring:message code="label.role" />
							<span style="color: green"><spring:message
									code="label.role.admin" /></span>
						</h6>
					</sec:authorize> <sec:authorize access="hasAnyRole('SUPERUSER')">
						<h6 style="color: 337ab7">
							<spring:message code="label.role" />
							<span style="color: green"> <spring:message
									code="lable.role.superUser" /></span>
						</h6>
					</sec:authorize> <sec:authorize access="hasAnyRole('NORMALUSER')">
						<h6 style="color: 337ab7">
							<spring:message code="label.role" />
							<span style="color: green"><spring:message
									code="label.role.user" /></span>
						</h6>
					</sec:authorize>
				</li>
				<!-- /.dropdown -->
				<li><img src="<c:url value="/resources/img/btlogo.gif"/>"
					class="img-responsive logo"
					style="align: right; position: relative; top: 50%; left: 50%; transform: translate(15%, 10%); width: 50%;">

				</li>
			</ul>
			<!-- /.navbar-top-links -->

			<div class="navbar-default sidebar" role="navigation">
				<div class="sidebar-nav navbar-collapse">
					<ul class="nav" id="side-menu">

						<li style="margin-top: 20px;"><a href="home"><i
								class="fa fa-dashboard fa-fw"></i> <spring:message
									code="label.menu.dashboard" /></a></li>
						<li><a href="${supportToolUrl}"><i
								class="fa fa-wrench fa"></i>
							<spring:message code="label.menu.supportTool" /></a></li>
						<sec:authorize access="hasAnyRole('ADMIN', 'SUPERUSER')">
							<li><a href="${workListUrl}"><i
									class="fa fa-list-alt fa"></i> <spring:message
										code="label.menu.workList" /></a></li>
						</sec:authorize>
						<sec:authorize url="/admin">
							<li><a href="${addUserUrl}"><i class="fa fa-user fa"></i>
								<spring:message code="label.menu.newUser" /></a></li>

							<li><a href="${supplierManagementUrl}"><i
									class="fa fa-group fa"></i>
								<spring:message code="label.menu.supplierManagement" /></a></li>

							<li><a href="${passwordManagementUrl}"><i
									class="fa fa-desktop fa"></i>
								<spring:message code="label.menu.userManagement" /></a></li>
						</sec:authorize>
						<li><a href="${helpUrl}"><i class="fa fa-question-circle"></i>Help</a>
						</li>

					</ul>
				</div>
				<!-- /.sidebar-collapse -->
			</div>
			<!-- /.navbar-static-side -->
		</nav>
		<div id="page-wrapper"
			style="font-size: 10px; margin-bottom: -80px; min-height: 593px;">
			<div class="row">
				<div class="col-lg-12">
					<h3 class="page-header">
						<spring:message code="label.menu.supportTool" />


					</h3>

					<div class="panel panel-default">
						<div class="panel-heading"
							style="font-weight: 800; font-size: 12;">
							<spring:message code="label.supportTool.sC" />
						</div>
						<div class="panel-body" style="font-weight: 200; font-size: 12;">
							<div class="row">
								<div class="col-lg-6">
									<form role="form" id="searchCriteriaForm">
										<table>
											<tr>
												<td>
													<div class="form-group">
														<label style="font-weight: 200; font-size: 12;"><spring:message
																code="label.supportTool.SenderMsgID" /></label> <input
															class="form-control" name="senderMessageId"
															id="senderMessageId" value="" size="17"
															style="width: 225px; height: 30px;">
													</div>
												</td>
												<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
												<td><div class="form-group">
														<label style="font-weight: 200; font-size: 12;"><spring:message
																code="label.supportTool.ReceiverMsgID" /></label> <input
															class="form-control" name="receiverMessageId"
															id="receiverMessageId" value="" size="17"
															style="width: 225px; height: 30px;">
													</div></td>
											</tr>

											<tr>
												<td><div class="form-group">
														<label style="font-weight: 200; font-size: 12;"><spring:message
																code="label.supportTool.FromDate" /></label> <input
															class="form-control" id="fromDate"
															pattern="\d{1,2}/\d{1,2}/\d{4}" name="fromDate"
															style="width: 225px; height: 30px;">
													</div></td>
												<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
												<td><div class="form-group">
														<label style="font-weight: 200; font-size: 12;"><spring:message
																code="label.supportTool.ToDate" /></label> <input
															class="form-control" id="toDate"
															pattern="\d{1,2}/\d{1,2}/\d{4}" name="toDate"
															style="width: 225px; height: 30px;">
													</div></td>
											</tr>




											<tr>
												<td>
													<div class="form-group">
														<label style="font-weight: 200; font-size: 12;"><spring:message
																code="label.supportTool.Supplier" /></label> <select
															class="form-control" size="1" name="supplierId" value=""
															id="supplierId" style="width: 225px; height: 30px;">

															<option></option>
															<c:set var="count" value="1" scope="page" />
															<c:choose>
																<c:when test="${supplierList ne null }">
																	<c:forEach var="supplier" items="${supplierList}">


																		<option>${supplier.supplierId}</option>


																		<c:set var="count" value="${count + 1}" scope="page" />
																	</c:forEach>
																</c:when>
																<c:otherwise>

																	<option></option>
																</c:otherwise>
															</c:choose>





														</select>
													</div>


												</td>
												<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>


												<!--  </div> -->
												<!-- /.col-lg-6 (nested) -->
												<td>
													<!-- <div class="col-lg-6"> -->
													<div class="form-group">
														<label style="font-weight: 200; font-size: 12;"><spring:message
																code="label.supportTool.Estimate" /></label> <input
															class="form-control" name="estimateNumber"
															id="estimateNumber" value="" size="24"
															style="width: 225px; height: 30px;">
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<div class="form-group">
														<label style="font-weight: 200; font-size: 12;"><spring:message
																code="label.supportTool.Contract" /></label> <input
															class="form-control" name="contractNumber"
															id="contractNumber" value="" size="17"
															style="width: 225px; height: 30px;">
													</div>
												</td>
												<td></td>
												<td><div class="form-group">
														<label style="font-weight: 200; font-size: 12;"><spring:message
																code="label.supportTool.MessageCode" /></label> <select
															class="form-control" name="messageCode" id="messageCode"
															value="" style="width: 225px; height: 30px;">
															<option></option>
															<c:set var="count1" value="1" scope="page" />
															<c:choose>
																<c:when test="${messageCodes ne null }">
																	<c:forEach var="mc" items="${messageCodes}">


																		<option>${mc}</option>


																		<c:set var="count" value="${count1 + 1}" scope="page" />
																	</c:forEach>
																</c:when>
																<c:otherwise>


																</c:otherwise>
															</c:choose>



														</select>
													</div></td>
											</tr>
											<tr>
												<td>
													<div class="form-group">
														<label style="font-weight: 200; font-size: 12;"><spring:message
																code="label.supportTool.BusinessStatus" /></label> <select
															class="form-control" size="1" name="businessStatus"
															id="businessStatus" value=""
															style="width: 225px; height: 30px;">
															<option></option>
															<option value="FAILURE"><spring:message
																	code="label.supportTool.FAILURE" /></option>
															<option value="IN_TRANSIT"><spring:message
																	code="label.supportTool.inTRANSIT" /></option>
															<option value="MANUAL_RESUBMISSION"><spring:message
																	code="label.supportTool.manualRESUBMISSION" /></option>
															<option value="SUCCESS"><spring:message
																	code="label.supportTool.SUCCESS" /></option>
														</select>
													</div>
												</td>
												<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>


												<td><div class="form-group">
														<label style="font-weight: 200; font-size: 12;"><spring:message
																code="label.supportTool.sitename" /></label> <input
															class="form-control" name="sitename" id="sitename"
															value="<%=UtilityMethods.getSiteMap().get((String) session.getAttribute("curSiteName"))%>"
															disabled size="17" style="width: 225px; height: 30px;">
													</div></td>
											</tr>

											<tr>
												<td><div class="form-group">
														<input type="hidden" id="csrf"
															name="${_csrf.parameterName}" value="${_csrf.token}" />
														<button type="submit" class="btn btn-default">
															<spring:message code="label.supportTool.submit" />
														</button>
														<button type="reset" class="btn btn-default"
															name="reset_form" value="Reset">
															<spring:message code="label.supportTool.reset" />
														</button>
													</div></td>
											</tr>
										</table>

									</form>
									<div id="loading-image">
										<img src="<c:url value="/resources/img/loader.gif"/>"
											style="position: relative; top: 50%; left: 50%; transform: translate(40%, -150%); width: 30%;" />
									</div>




									<div class="modal fade" id="myModal" role="dialog">
										<div class="modal-dialog">

											<!-- Modal content-->
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal">&times;</button>
													<h4 class="modal-title" style="font-size: 13;">
														<b><spring:message
																code="label.supportTool.messagepayload" /></b>
													</h4>

												</div>
												<div class="modal-body">
													<p></p>

													<textarea rows="30" cols="100" id="getCode" disabled></textarea>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-default"
														data-dismiss="modal">
														<spring:message code="label.supportTool.close" />
													</button>
												</div>
											</div>

										</div>
									</div>



									<div class="modal fade" id="statusModal" role="dialog">
										<div class="modal-dialog">

											<!-- Modal content-->
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal">&times;</button>
													<h4 class="modal-title" style="font-size: 13;">
														<b><spring:message
																code="label.supportTool.messageStatus" /></b>
													</h4>

												</div>
												<div class="modal-body">
													<h5 style="font-size: 12;">
														<b><spring:message
																code="label.supportTool.statusEntrylogs" /></b>
													</h5>
													<table
														class="table table-striped table-bordered table-hover"
														id="msgStaus" style="font-size: 12;">


													</table>

													<table
														class="table table-striped table-bordered table-hover"
														id="errMsg" style="font-size: 12;">


													</table>
													<h5 style="font-size: 12;">
														<b><spring:message
																code="label.supportTool.Messagedetails" /></b>
													</h5>

													<table
														class="table table-striped table-bordered table-hover"
														id="msgTabledetails" style="font-size: 12;">


													</table>


												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-default"
														data-dismiss="modal" id="closeTable">
														<spring:message code="label.supportTool.close" />
													</button>
												</div>
											</div>

										</div>
									</div>






									<div class="modal fade" id="selector" role="dialog">
										<div class="modal-dialog">

											<!-- Modal content-->
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal">&times;</button>
													<h6 class="modal-title">
														<b><spring:message
																code="label.supportTool.confirmWhatToSelect" /></b>
													</h6>

												</div>

												<div class="modal-footer">
													<center>
														<button type="button" class="btn btn-default"
															data-dismiss="modal" id="status">
															<spring:message code="label.supportTool.status" />
														</button>
														<button type="button" class="btn btn-default"
															data-dismiss="modal" id="payload">
															<spring:message code="label.supportTool.payload" />
														</button>
													</center>
												</div>
											</div>

										</div>
									</div>



									<div class="modal fade" id="alert" role="dialog">
										<div class="modal-dialog">

											<!-- Modal content-->
											<div class="modal-content">
												<div class="modal-header" id="alertMessage">
													<button type="button" class="close" data-dismiss="modal">&times;</button>

													<!--      <h6 class="modal-title"  ></h6> -->

												</div>

												<div class="modal-footer">
													<button type="button" class="btn btn-default"
														data-dismiss="modal" id="closeTable">
														<spring:message code="label.supportTool.close" />
													</button>

												</div>
											</div>

										</div>
									</div>


















								</div>
								<!-- /.col-lg-6 (nested) -->


								<div class="col-lg-6">

									<h7>
									<spring:message code="label.supportTool.statusChart" /></h7>

									<%--   <form id="graphform">
                                <select id="mySelect">
 						 			<option value="1">Line</option>
 		 							<option value="2">Graph</option>
								</select>
								
                                </form> --%>

									<div id="line-example"></div>

								</div>











							</div>
							<!-- /.row (nested) -->
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>

			</div>

			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->



		<div class="row">
			<div class="col-lg-12" style="width: 1500px;">

				<div class="panel panel-default">
					<!-- <div id="toShowMsg" class="panel-heading"> -->
					<spring:message code="label.supportTool.table" />



					<form:form action="${downloadCSV}" id="downloadCSV" method="POST"
						onsubmit="return validateForCsvEmptyForm()">




						<input type="hidden" class="form-control" name="senderMessageId"
							id="sMId" value="" size="17" style="width: 225px; height: 30px;">
						<input type="hidden" class="form-control" name="receiverMessageId"
							id="rMId" value="" size="17" style="width: 225px; height: 30px;">
						<input type="hidden" class="form-control" size="1"
							name="supplierId" value="" id="sId"
							style="width: 225px; height: 30px;">

						<%-- 
<fmt:parseDate pattern="EEE MMM dd HH:mm:ss z yyyy" value="${searchedCriteria.fromDate}" var="parsedFromDate" />
<fmt:formatDate     value="${parsedFromDate}"   pattern="dd/MM/YYYY" var="formattedFromDate" /> 
<fmt:parseDate pattern="EEE MMM dd HH:mm:ss z yyyy" value="${searchedCriteria.toDate}" var="parsedToDate" />
<fmt:formatDate     value="${parsedToDate}"   pattern="dd/MM/YYYY" var="formattedToDate" />  --%>

						<%-- <c:choose>
<c:when test="${messageCodes ne null }">  --%>
						<input type="hidden" class="form-control" id="fD"
							pattern="\d{1,2}/\d{1,2}/\d{4}" name="fromDate"
							style="width: 225px; height: 30px;">
						<%-- </c:when>
</c:choose> --%>
						<input type="hidden" class="form-control" id="tD"
							pattern="\d{1,2}/\d{1,2}/\d{4}" name="toDate"
							style="width: 225px; height: 30px;">
						<input type="hidden" class="form-control" name="estimateNumber"
							id="eN" value="" size="24" style="width: 225px; height: 30px;">
						<input type="hidden" class="form-control" name="contractNumber"
							id="cN" value="" size="17" style="width: 225px; height: 30px;">
						<input type="hidden" class="form-control" name="messageCode"
							id="mC" value="" style="width: 225px; height: 30px;">
						<input type="hidden" class="form-control" size="1"
							name="businessStatus" id="bS" value=""
							style="width: 225px; height: 30px;">
						<input type="hidden" class="form-control" size="1" name="siteName"
							id="sN" value="" style="width: 225px; height: 30px;">




						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />

						<input id="submitId" type="submit" value="Download Search Result">

					</form:form>










				</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<div class="dataTable_wrapper">
						<table class="table table-striped table-bordered table-hover"
							id="dataTables-example">
							<thead>
								<tr style="font-size: 10px;">
									<th><spring:message code="label.supportTool.SenderMsgID" /></th>
									<th><spring:message code="label.supportTool.ReceiverMsgID" /></th>
									<th><spring:message code="label.supportTool.Estimate" /></th>
									<th><spring:message code="label.supportTool.SupplierID" /></th>
									<th><spring:message code="label.supportTool.Contract" /></th>
									<th style="padding-left: 50px;" id="sortTimestamp"><spring:message
											code="label.supportTool.timestamp" /></th>
									<th><spring:message code="label.supportTool.mc" /></th>
									<th><spring:message
											code="label.supportTool.BusinessStatus" /></th>
									<th><spring:message code="label.supportTool.nimsSlip" /></th>
									<th><spring:message code="label.supportTool.supRef" /></th>

								</tr>
							</thead>
							<tbody style="font-size: 11">
								<%--    <c:set var="count" value="1" scope="page" />
                                    <c:choose>
                                    <c:when test="${searchResultList ne null }">
                                    <c:forEach var="messageDetail" items="${searchResultList}" >
                                    	 <tr class="even gradeA">
                                    		<td>${messageDetail.senderMessageId}</td>
                                            <td>${messageDetail.receiverMessageId}</td>
                                            <td>${messageDetail.estimateNumber}</td>
                                            <td class="center">${messageDetail.supplierId}</td>
                                            <td class="center">${messageDetail.contractNumber}</td>
											<td>${messageDetail.messageTimeStamp}</td>
											<td>${messageDetail.messageCode}</td>
                                            <td class="center">${messageDetail.status}</td>
                                            <td class="center">${messageDetail.nimsSlipNumber}</td>
											<td>${messageDetail.supplierRefNumber}</td>
											<td style="width:50px;" >
											<!-- <div class="container"> -->
											<div>
 
  <!-- Trigger the modal with a button -->
  <button type="submit" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" >Click Here</button>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
            <h1>${messageDetail.payload}</h1>
        </div>
        <div class="modal-body">
          <p>Some text in the modal.</p>
        
          
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
</div>
									
											
											</td>
											</tr>
                                    <c:set var="count" value="${count + 1}" scope="page"/>
                                    </c:forEach>
                                    </c:when>
                                   <c:otherwise>
                                     <tr class="even gradeA">
                                     <td>
                                     <p style="color:red;">No records exists!</p>
                                     </td>
                                     </tr>
                                    </c:otherwise>
                                    </c:choose>
                                        								
										--%>

							</tbody>
						</table>
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

	</div>
	<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->
	<!-- jQuery -->
	<script
		src="<c:url value="/resources/bower_components/jquery/dist/jquery.min.js"/>"></script>
	<script
		src="<c:url value="/resources/bower_components/jquery/dist/jquery-2.2.4.min.js"/>"></script>

	<!-- Bootstrap Core JavaScript -->
	<script
		src="<c:url value="/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"/>"></script>
	<script
		src="<c:url value="/resources/bower_components/bootstrap/dist/js/bootstrap-datepicker.js"/>"></script>

	<%--      
	<script src="<c:url value="/resources/bower_components/bootstrap/dist/js/jquery-1.3.1.min.js"/>"></script>
	<script src="<c:url value="/resources/bower_components/bootstrap/dist/js/table2CSV.js"/>"></script>
	 --%>



	<!-- Metis Menu Plugin JavaScript -->
	<script
		src="<c:url value="/resources/bower_components/metisMenu/dist/metisMenu.min.js"/>"></script>

	<!-- Custom Theme JavaScript -->
	<script src="<c:url value="/resources/dist/js/sb-admin-2.js"/>"></script>
	<script
		src="<c:url value="/resources/bower_components/datatables/media/js/jquery.dataTables.min.js"/>"></script>
	<script
		src="<c:url value="/resources/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"/>"></script>
	<script
		src="<c:url value="/resources/bower_components/morrisjs/morris-0.4.1.min.js"/>"></script>
	<%--     <script src="<c:url value="/resources/bower_components/morrisjs/jquery-1.8.2.min.js"/>"></script> --%>
	<script
		src="<c:url value="/resources/bower_components/morrisjs/raphael-min.js"/>"></script>
	<%-- <script src="<c:url value="/resources/bower_components/bootstrap/dist/js/alertify.min.js"/>"></script> --%>
	<%--       <script src="<c:url value="/resources/bower_components/bootstrap/dist/js/jquery-1.12.4.min.js"/>"></script>
 --%>
	<script
		src="<c:url value="/resources/bower_components/bootstrap/dist/js/jquery.alertable.js"/>"></script>
	<%--     <script src="<c:url value="/resources/bower_components/bootstrap/dist/js/alertify.js"/>"></script> --%>

	<script
		src="<c:url value="/resources/bower_components/bootstrap/dist/js/jquerysession.js"/>"></script>
	<script
		src="<c:url value="/resources/bower_components/bootstrap/dist/js/jquery.ui.draggable.js"/>"></script>
	<script
		src="<c:url value="/resources/bower_components/bootstrap/dist/js/jquery.alerts.js"/>"></script>

	<!-- <link href="css/jquery.alerts.css" rel="stylesheet" type="text/css" media="screen" />   -->

	<script>
		jQuery(document)
				.ready(
						function($) {
						
						

							var strings = new Array();
							strings['messageManualResubmission'] = "<spring:message code='label.supportTool.messagesManualResubmission' javaScriptEscape='true' />";
							strings['messageResubmissionSuccess'] = "<spring:message code='label.supportTool.messagesResubmissionSuccess' javaScriptEscape='true' />";
							strings['SGM'] = "<spring:message code='label.supportTool.SGM' javaScriptEscape='true' />";

							//strings['too']="<spring:message code='label.supportTool.manyRecords' javaScriptEscape='true' />";

							/*  $("#graphform").submit(function(event) {
							 
							 	barchart();
							 	alert("It came here");
							 } */

							$('#mySelect').change(
									function() {

										var optSelected = $(
												"#mySelect option:selected")
												.val();
										if (optSelected == 2) {
											barchart();
										}
										if (optSelected == 1) {
											//added
											event.preventDefault(event);
											getViaAjax();
										}

									});

							/*  var text='{
							"element": "line-example",
							"data": [
							 { "y": "2012-02-24", "a": 100, "b": 90, "c":20 },
							 { "y": "2012-02-25", "a": 75,  "b": 65, "c":20 },
							 { "y": "2012-02-26", "a": 50,  "b": 40, "c":20 }
							],
							"xkey": "y",
							"ykeys": ["a", "b","c"],
							"labels": ["Success Message Count", "Failure Message Count","Resubmitted Success"]
							
							}';

							 Morris.Line(text); */

							var supplierLi = {};
							var csrff_token = $("#csrfff").val();
							supplierLi["token"] = csrff_token;
							supplierLi["supplierId"] = "supplierId";

							function barchart() {

								$(':button').prop('disabled', true);
								$("#loading-image").show();
								$
										.ajax({
											type : "POST",
											contentType : "application/json",
											url : "getWeeklyStatus",
											data : JSON.stringify(supplierLi),
											/* data : JSON.stringify({"supplier":supplier,"token":csrf_token}), */
											dataType : 'json',
											timeout : 60000,
											beforeSend : function(xhr) {
												xhr.setRequestHeader('X-CSRF-Token',csrff_token);
												xhr.setRequestHeader("X-AjaxRequest", "1");
											},
											success : function(newdata) {
												$(':button').prop('disabled',
														false);
												/* 	console.log("SUCCESS: ", data); */
												/* display(data); */
												//display(data);
												//drawTable(data);
												var json = newdata.statusDetails;
												Morris
														.Line({
															element : 'bar-example',
															data : json,
															xkey : 'y',
															ykeys : [ 'a', 'b',
																	'c' ],
															labels : [
																	'Success Message Count',
																	'Failure Message Count',
																	'Resubmitted Message Count' ],
															lineColors : [
																	'green',
																	'red',
																	'blue' ]
														});

											},
											error : function(x, t, m) {
												if (t === "timeout") {
													$.alertable.alert("Time out Occured.Please try after sometime.");
												}
												if (x.status == 601) {
                             		 				$.alertable.confirm('Session Expired. Click OK to login').then(function() {
                                        			window.location.href = "/CommonWeb/index.jsp";
                                        			}, function() {
                                       				$(':button').prop('disabled', false);
                                   					});
                            					}
												//console.log("ERROR: ", m);
												//display(e);
											},
											done : function(e) {
												console.log("DONE");
												enableSearchButton(true);
											},
											complete : function() {
												$("#loading-image").hide();
											}
										});

							}

							var callAjax = function() {

								// var siteName=$.session.get('curSiteName');

								//if(siteName!=null)
								//{

								$
										.ajax({
											type : "POST",
											contentType : "application/json",
											url : "getResubmissionStatusData",
											data : JSON.stringify(supplierLi),
											dataType : 'json',
											beforeSend : function(xhr) {
												xhr.setRequestHeader('X-CSRF-Token',csrff_token);
											},
											success : function(data) {

												var result = strings['messageManualResubmission']
														+ ""
														+ JSON
																.stringify(data.reSubCount);
												var resubmittedMessageCount = strings['messageResubmissionSuccess']
														+ ""
														+ JSON
																.stringify(data.messageResubmittedCount);
												$("#reStatusMessage").text(
														result);
												$("#submittedStatusMessage")
														.text(
																resubmittedMessageCount);
												var resub = JSON
														.stringify(data.reSubCount);
												var subre = JSON
														.stringify(data.messageResubmittedCount);
												var tot = subre + resub;

												var sum = 0;

												var up = subre * 100;
												var valeur = (up)
														/ (data.reSubCount + data.messageResubmittedCount);

												$('.progress-bar').css('width',
														valeur + '%')
														.attr('aria-valuenow',
																valeur);

											}
										});
							}
							// }
							setInterval(callAjax, 10000);

							$(
									'#dataTables-example td:nth-child(7):contains("Success")')
									.css('background-color', 'green');
							$(
									'#dataTables-example td:nth-child(8):contains("Failure")')
									.css('background-color', '#FF0000');
							$(
									'#dataTables-example td:nth-child(8):contains("In_Transit")')
									.css('background-color', '#FAFAD2');
							$(
									'#dataTables-example td:nth-child(8):contains("Manual_Resubmission")')
									.css('background-color', '#87CEFA');

							/* 
							 $("#dataTables-example td:nth-child(8):odd").addClass().css('background-color', '#FF00FF');
							 $("#dataTables-example td:nth-child(8):even").addClass().css('background-color', '#FF0000'); */
							/* 
							 $('#dataTables-example').dataTable({"fnRowCallback": function( nRow,aData, iDisplayIndex, iDisplayIndexFull ) {
							 switch(aData[7]){
							 case 'Success':
							
							 $(nRow).aData[7].addClass().css('background-color', '#3CB371')
							 break;
							 /*  case 'Failure':
							 $(nRow).addClass().css('background-color', '#FF0000')
							 break;
							 case 'In_Transit':
							 $(nRow).$(nCol(7)).addClass().css('background-color', '#FAFAD2')
							 break;
							 case 'Manual_Resubmission':
							 $(nRow).$(nCol(7)).addClass().css('background-color', '#87CEFA')
							 break;
							 }
							 }
							 }); */

							/* $(nRow).$(nCol(7)).addClass().css('background-color', '#3CB371')
							 $("#dataTables-example td:nth-child(8):contains('Success')").addClass().css('background-color', '#3CB371');
							 $("#dataTables-example td:contains('Success')").addClass().css('background-color', '#3CB371');
							    $("#dataTables-example td:contains('Failure')").addClass().css('background-color', '#FF0000');
							      $("#dataTables-example td:contains('In_Transit')").addClass().css('background-color', '#FAFAD2');
							        $("#dataTables-example td:contains('Manual_Resubmission')").addClass().css('background-color', '#87CEFA');
							 */

							$("#dataTables-example tbody")
									.on(
											"click",
											"tr",
											function(e) {

												$(e.currentTarget)
														.toggleClass("selected")
														.siblings(".selected")
														.removeClass("selected");

												//$(this).css('background-color', '#FFFF99');

												// TODO: figure out a way to single out the email hyperlinks

												// set up an array to hold the row's data. Need to clear every time
												var roeData = [];
												var idClicked;

												jQuery("#selector").modal(
														'show');
												$("button")
														.click(
																function(e) {

																	$(
																			e.currentTarget)
																			.children(
																					'td, th')
																			.css(
																					'background-color',
																					'#FFDAB9');

																	idClicked = e.target.id;

																	if (idClicked == 'closeTable') {

																	}

																	btn = idClicked;

																	getMessageViaAjax(
																			roeData,
																			idClicked);
																	$(
																			"#loading-image")
																			.hide();
																});

												// locate the current row you're on and push the data into the array.
												$('td', $(this).closest('tr'))
														.each(
																function() {
																	roeData
																			.push($(
																					this)
																					.text());

																});

												// this is another part of the code which does not concern what I'm looking fo

											});

							$(window).load(function() {

								$("#loading-image").hide();
								var siteName = $.session.get('curSiteName');
								//$("#sitename").val(siteName);
								//supplierLi["siteName"]=siteName;
								//if(siteName==null)
								//{
								//event.preventDefault();
								//   $.alertable.alert("Please Select Site to Proceed");

								//}
								//else
								//{
								getViaAjaxLatestData();
								//}
							});

							/* 
								$("#downloadCSV").submit(function(event) {
								
								downloadCsv();
								
								});
							 */

							function getViaAjaxLatestData() {

								$(':button').prop('disabled', true);
								$("#loading-image").show();
								$
										.ajax({
											type : "POST",
											contentType : "application/json",
											url : "getWeeklyStatus",
											data : JSON.stringify(supplierLi),
											/* data : JSON.stringify({"supplier":supplier,"token":csrf_token}), */
											dataType : 'json',
											timeout : 60000,
											beforeSend : function(xhr) {
												xhr.setRequestHeader('X-CSRF-Token',csrff_token);
												xhr.setRequestHeader("X-AjaxRequest", "1");
											},
											success : function(newdata) {
												$(':button').prop('disabled',
														false);
												/* 	console.log("SUCCESS: ", data); */
												/* display(data); */
												//display(data);
												//drawTable(data);
												var json = newdata.statusDetails;
												Morris
														.Line({
															element : 'line-example',
															data : json,
															xkey : 'y',
															ykeys : [ 'a', 'b',
																	'c' ],
															labels : [
																	'Success Message Count',
																	'Failure Message Count',
																	'Resubmitted Success Message Count' ],
															lineColors : [
																	'green',
																	'red',
																	'blue' ]
														});

											},
											error : function(x, t, m) {
												if (t === "timeout") {
													$.alertable
															.alert("Time out Occured.Please try after sometime.");
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
											complete : function() {
												$("#loading-image").hide();
											}
										});

							}

							$("#searchCriteriaForm").submit(function(event) {

								searchSupportTool(event);

							});

							$("#toDate").datepicker({
								format : "dd/mm/yyyy"
							});
							$("#fromDate").datepicker({
								format : "dd/mm/yyyy"
							});

						});

		function getMessageViaAjax(record, idClicked) {

			var messageRecord = {};
			messageRecord["senderMessageId"] = record[0];
			messageRecord["receiverMessageId"] = record[1];
			messageRecord["estimateNumber"] = record[2];
			messageRecord["supplierId"] = record[3];
			messageRecord["contractNumber"] = record[4];
			messageRecord["messageCode"] = record[6];
			var messageCode = record[6];
			//	messageRecord["siteName"]=$.session.get('curSiteName');

			//alert(messageCode);

			var csrf_token = $("#csrf").val();

			messageRecord["token"] = csrf_token;
			//$(':button').prop('disabled', true);
			$("#loading-image").show();
			$
					.ajax({
						type : "POST",
						contentType : "application/json",
						url : "getDetail" + "?" + idClicked,
						data : JSON.stringify(messageRecord),
						/* data : JSON.stringify({"supplier":supplier,"token":csrf_token}), */
						dataType : 'json',
						timeout : 60000,
						beforeSend : function(xhr) {
							xhr.setRequestHeader('X-CSRF-Token', csrf_token);
						},
						success : function(data) {
							//$(':button').prop('disabled', false);
							/* 	console.log("SUCCESS: ", data); */
							/* display(data); */
							//display(data);
							//drawTable(data);
							/* 	 alert(data.clobVal);
							windowX("Title", "demo.htm", "0", function () {
							        $.dialog.alert("Prompt Window", "Saved");
							    });
							    
							 */

							if (idClicked == 'payload') {
								$("#getCode").html(data.clobVal);
								jQuery("#myModal").modal('show');

							}

							if (idClicked == 'status') {

								/* $("#getCode").html(data.singlemessageDetail);
								jQuery("#myModal").modal('show');
								
								 */

								if (data.singlemessageDetail.status == 'In_Transit') {
									$('#msgStaus tr th').remove();
									$('#msgStaus tr td').remove();
									$('#errMsg tr th').remove();
									$('#errMsg tr td').remove();
									$('#msgTabledetails tr th').remove();
									$('#msgTabledetails tr td').remove();

									var tp;
									var jsondata = data;
									var curDate = new Date($.now());
									if (data.singlemessageDetail.direction == 'Inbound') {
										tp = 'Received';
									} else {
										tp = 'Sent';
									}

									var row = '<thead><tr><th>Date Time</th><th><spring:message code="label.supportTool.deliveryStatus" /></th></tr></thead><tbody><tr>';

									row += '<td >'
											+ jsondata.singlemessageDetail.messageTimeStamp
											+ '</td>'
											+ '<td >'
											+ tp
											+ '('
											+ jsondata.singlemessageDetail.direction
											+ ')' + '</td></tr>';

									row += '<tr><td>'
											+ jsondata.singlemessageDetail.curTimeStamp
											+ '</td>'
											+ '<td>'
											+ jsondata.singlemessageDetail.status
											+ '</td></tr></tbody>';

									var newRow = '<thead><tr><th><spring:message code="label.supportTool.SupplierID" /></th><th><spring:message code="label.supportTool.Estimate" /></th><th><spring:message code="label.supportTool.MessageCode" /></th></tr></thead><tbody><tr>';

									newRow += '<td>' + record[3] + '</td>'
											+ '<td >' + record[2] + '</td>'
											+ '<td >' + record[6]
											+ '</td></tr></tbody>';

									$('#msgTabledetails').append(newRow);

									$('#msgStaus').append(row);

									jQuery("#statusModal").modal('show');

								}

								if (data.singlemessageDetail.status == 'Success') {
									$('#msgStaus tr th').remove();
									$('#msgStaus tr td').remove();
									$('#errMsg tr th').remove();
									$('#errMsg tr td').remove();
									$('#msgTabledetails tr th').remove();
									$('#msgTabledetails tr td').remove();

									var tp;
									var jsondata = data;
									var curDate = new Date($.now());
									if (data.singlemessageDetail.direction == 'Inbound') {
										tp = 'Received';
									} else {
										tp = 'Sent';
									}

									var row = '<thead><tr><th>Date Time</th><th><spring:message code="label.supportTool.deliveryStatus" /></th></tr></thead><tbody><tr>';

									row += '<td >'
											+ jsondata.singlemessageDetail.messageTimeStamp
											+ '</td>'
											+ '<td >'
											+ tp
											+ '('
											+ jsondata.singlemessageDetail.direction
											+ ')' + '</td></tr>';

									row += '<tr><td>'
											+ jsondata.singlemessageDetail.receiptTimeStamp
											+ '</td>'
											+ '<td><spring:message code="label.supportTool.acknowledged" /></td></tr></tbody>';

									var newRow = '<thead><tr><th><spring:message code="label.supportTool.SupplierID" /></th><th><spring:message code="label.supportTool.Estimate" /></th><th><spring:message code="label.supportTool.MessageCode" /></th></tr></thead><tbody><tr>';

									newRow += '<td>' + record[3] + '</td>'
											+ '<td >' + record[2] + '</td>'
											+ '<td >' + record[6]
											+ '</td></tr></tbody>';

									$('#msgTabledetails').append(newRow);

									$('#msgStaus').append(row);

									jQuery("#statusModal").modal('show');

								}

								if (data.singlemessageDetail.status == 'Manual_Resubmission') {
									$('#msgStaus tr th').remove();
									$('#msgStaus tr td').remove();
									$('#errMsg tr th').remove();
									$('#errMsg tr td').remove();
									$('#msgTabledetails tr th').remove();
									$('#msgTabledetails tr td').remove();

									var tp;
									var jsondata = data;
									var curDate = new Date($.now());
									if (data.singlemessageDetail.direction == 'Inbound') {
										tp = 'Received';
									} else {
										tp = 'Sent';
									}

									var row = '<thead><tr><th>Date Time</th><th><spring:message code="label.supportTool.deliveryStatus" /></th></tr></thead><tbody><tr>';

									row += '<td >'
											+ jsondata.singlemessageDetail.messageTimeStamp
											+ '</td>'
											+ '<td >'
											+ tp
											+ '('
											+ jsondata.singlemessageDetail.direction
											+ ')' + '</td></tr>';

									var newRow = '<thead><tr><th><spring:message code="label.supportTool.SupplierID" /></th><th><spring:message code="label.supportTool.Estimate" /></th><th><spring:message code="label.supportTool.MessageCode" /></th></tr></thead><tbody><tr>';

									newRow += '<td>' + record[3] + '</td>'
											+ '<td >' + record[2] + '</td>'
											+ '<td >' + record[6]
											+ '</td></tr></tbody>';

									$('#msgTabledetails').append(newRow);

									$('#msgStaus').append(row);

									jQuery("#statusModal").modal('show');

								}

								if (data.singlemessageDetail.status == 'Failure') {

									$('#msgStaus tr th').remove();
									$('#msgStaus tr td').remove();
									$('#errMsg tr th').remove();
									$('#errMsg tr td').remove();
									$('#msgTabledetails tr th').remove();
									$('#msgTabledetails tr td').remove();

									var tp;
									var jsondata = data;

									if (data.singlemessageDetail.direction == 'Inbound') {
										tp = 'Received';
									} else {
										tp = 'Sent';
									}

									var row = '<thead><tr><th>Date Time</th><th><spring:message code="label.supportTool.deliveryStatus" /></th></tr></thead><tbody><tr>';

									row += '<td >'
											+ jsondata.singlemessageDetail.messageTimeStamp
											+ '</td>'
											+ '<td >'
											+ tp
											+ '('
											+ jsondata.singlemessageDetail.direction
											+ ')' + '</td></tr>';

									$('#msgStaus').append(row);

									var newRow = '<thead><tr><th><spring:message code="label.supportTool.SupplierID" /></th><th><spring:message code="label.supportTool.Estimate" /></th><th><spring:message code="label.supportTool.MessageCode" /></th></tr></thead><tbody><tr>';

									newRow += '<td>' + record[3] + '</td>'
											+ '<td >' + record[2] + '</td>'
											+ '<td >' + record[6]
											+ '</td></tr></tbody>';

									$('#msgTabledetails').append(newRow);

									var failureRow = '<thead><tr><th><spring:message code="label.supportTool.failureReason" /></th><td>'
											+ jsondata.singlemessageDetail.exceptionMessageCode
											+ '</td></tr>';

									$('#errMsg').append(failureRow);

									jQuery("#statusModal").modal('show');

								}

							}

						},
						error : function(x, t, m) {
							if (t === "timeout") {
								$.alertable.alert("Time out Occured.Please try after sometime.");
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
						complete : function() {
							$("#loading-image").hide();
						}
					});

		}

		/* function getReStatusData()
		{
			var supplier={};
			supplier["supplierId"]=csrf_token;
			var csrf_token=$("#csrfff").val();
			var token ={}
			$(':button').prop('disabled', true); 
			supplier["token"]=csrf_token;
			$.ajax({
				type : "GET",
				contentType : "application/json",
				url : "/getResubmissionStatusData",
				data : JSON.stringify(supplier),
				/* data : JSON.stringify({"supplier":supplier,"token":csrf_token}), 
				dataType : 'json',
				timeout : 100000,
				beforeSend: function (xhr)
		        {
		            xhr.setRequestHeader('X-CSRF-Token', csrf_token); 
		        },
				success : function(data) {
			//	console.log("SUCCESS: ", data); 
					/* display(data); */
		//display(data);
		//drawTable(data);
		//	$(':button').prop('disabled', false);
		///	alert(data);
		//	},
		//	error : function(e) {
		//	console.log("ERROR: ", e);
		//		
		//	},
		//done : function(e) {
		///		console.log("DONE");
		//		enableSearchButton(true);
		//	},
		//	complete: function(){
		// }
		//	});

		//  } */
		/*  function downloadCsv()
		 {
		 
		 
		 	var searchCriteria={};
		 	
		 	searchCriteria["senderMessageId"]= $("#sMId").val();
		 	searchCriteria["receiverMessageId"] = $("#rMId").val();
		 	searchCriteria["supplierId"]= $("#sId").val();
		 	searchCriteria["fromDate"] = $("#fD").val();
		 	searchCriteria["toDate"] = $("#tD").val();
		 	searchCriteria["estimateNumber"] = $("#eN").val();
		 	searchCriteria["contractNumber"] = $("#cN").val();
		 	searchCriteria["messageCode"]= $("#mC").val();
		 	searchCriteria["businessStatus"] = $("#bS").val();
		 	var csrf_token=$("#csrftn").val();
		
			searchCriteria["token"]=csrf_token;
			
			
			event.preventDefault();
			
			$(':button').prop('disabled', true); 
			$("#loading-image").show();
			$.ajax({
				type : "POST",
				contentType : "application/csv",
				url : "${home}downloadCSV",
				data : JSON.stringify(searchCriteria),
				dataType : 'json',
				timeout : 100000,
				beforeSend: function (xhr)
		         {
		             xhr.setRequestHeader('X-CSRF-Token', csrf_token); 
		         },
				success : function(data) {
				/* 	console.log("SUCCESS: ", data); */
		/* display(data); */
		//display(data);
		//drawTable(data);
		// $("input:text").val("");
		//	alert("Jai Ho");
		//$(':button').prop('disabled', false);

		/*	},
			error : function(e) {
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
		
		
		
		
		
		
		
		
		
		}*/

		function searchSupportTool(event) {
			// var siteName=$.session.get('curSiteName');

			validateForEmptyForm(event);

		}

		function getViaAjax() {
			var searchCriteria = {};

			searchCriteria["senderMessageId"] = $("#senderMessageId").val();
			searchCriteria["receiverMessageId"] = $("#receiverMessageId").val();
			searchCriteria["supplierId"] = $("#supplierId").val();
			searchCriteria["fromDate"] = $("#fromDate").val();
			searchCriteria["toDate"] = $("#toDate").val();
			searchCriteria["estimateNumber"] = $("#estimateNumber").val();
			searchCriteria["contractNumber"] = $("#contractNumber").val();
			searchCriteria["messageCode"] = $("#messageCode").val();
			searchCriteria["businessStatus"] = $("#businessStatus").val();

			//searchCriteria["siteName"]=$.session.get('curSiteName');

			var csrf_token = $("#csrf").val();

			searchCriteria["token"] = csrf_token;

			event.preventDefault();

			$(':button').prop('disabled', true);
			$("#loading-image").show();
			$
					.ajax({
						type : "POST",
						contentType : "application/json",
						url : "searchSupportTool",
						data : JSON.stringify(searchCriteria),
						dataType : 'json',
						timeout : 60000,
						beforeSend : function(xhr) {
							xhr.setRequestHeader('X-CSRF-Token', csrf_token);
							xhr.setRequestHeader("X-AjaxRequest", "1");
						},
						success : function(data) {
							var recordCount = data.searchResultCount;
							if (recordCount == 0) {
								displayExstTable(data);
								loadDownloadSearchResultInputs(data);
								$(':button').prop('disabled', false);
							} else {
								//event.preventDefault(event);
								$.alertable
										.confirm(
												"Too Many Records Returned Click OK to  Download Records OR Change the Search Criteria")
										.then(
												function() {
													loadDownloadSearchResultInputs(data);
													$("#downloadCSV").submit();
													console
															.log('Confirmation submitted');
												},
												function() {
													console
															.log('Confirmation canceled');
												});

								//$("#toShowMsg").append("<div id='manual'>"+"Large Number Of Records Found. Please Click above Download link to save results manually. "+"</div>")
								// #dataTables-example

								$(':button').prop('disabled', false);

							}

							/* 	$('#suppAddDel' supplierId).val(""); */

						},
						error : function(x, t, m) {
							if (t === "timeout") {
								$.alertable
										.alert("Time out Occured.Please try after sometime.");
							}
							if (x.status == 601) {
                              $.alertable.confirm('Session Expired. Click OK to login').then(function() {
                                        window.location.href = "/CommonWeb/index.jsp";
                                        }, function() {
                                       $(':button').prop('disabled', false);
                                   });
                            }
							console.log("ERROR: ", m);
							//console.warn(x.status);
							//display(e);
						},
						done : function(e) {
							console.log("DONE");
							enableSearchButton(true);
						},
						complete : function(data) {
							$('#loading-image').hide();
							/* var recordCount=data.searchResultCount;
							if(recordCount!=0){
							  $( "#downloadCSV" ).submit();
							
							} */

						}
					});

		}

		function loadDownloadSearchResultInputs(data) {

			if (data.searchCriteria.senderMessageId != null
					|| data.searchCriteria.senderMessageId != "") {
				$('#sMId').val(data.searchCriteria.senderMessageId);
			}
			if (data.searchCriteria.receiverMessageId != null
					|| data.searchCriteria.receiverMessageId != "") {
				$('#rMId').val(data.searchCriteria.receiverMessageId);
			}
			if (data.searchCriteria.supplierId != null
					|| data.searchCriteria.supplierId != "") {
				$('#sId').val(data.searchCriteria.supplierId);
			}

			if (data.searchCriteria.fromDate != null
					|| data.searchCriteria.fromDate != "") {
				$('#fD').val(data.searchCriteria.fromDate);
			} else {

				$('#fD').val("'' ''");
			}
			if (data.searchCriteria.toDate != null
					|| data.searchCriteria.toDate != "") {
				$('#tD').val(data.searchCriteria.toDate);
			} else {
				$('#tD').val("'' ''");
			}
			if (data.searchCriteria.estimateNumber != null
					|| data.searchCriteria.estimateNumber != "") {
				$('#eN').val(data.searchCriteria.estimateNumber);
			}
			if (data.searchCriteria.contractNumber != null
					|| data.searchCriteria.contractNumber != "") {
				$('#cN').val(data.searchCriteria.contractNumber);
			}
			if (data.searchCriteria.messageCode != null
					|| data.searchCriteria.messageCode != "") {
				$('#mC').val(data.searchCriteria.messageCode);
			}
			if (data.searchCriteria.businessStatus != null
					|| data.searchCriteria.businessStatus != "") {
				$('#bS').val(data.searchCriteria.businessStatus);
			}
			if (data.searchCriteria.siteName != null
					|| data.searchCriteria.siteName != "") {
				$('#sN').val(data.searchCriteria.siteName);
			}

		}

		function displayExstTable(data) {

			/* var jsondata=$.parseJSON('{"response":[["name0","id0"],["name1","id1"]]}');
			/* 
			$.each(jsondata.response, function(i, d) {
			$('#supplierDataTable tr td').remove();
			 */
			/* $('#dataTables-example tr td').remove().draw(false); */

			var table = $('#dataTables-example').DataTable({
				responsive : true,
				bProcessing : true,
				bDeferRender : true

			});

			var start = new Date();
			table.clear();

			var elapsed = new Date() - start;

			console.log('time elapsed for clearing table' + elapsed);

			var json = data.messageDetails;

			var start1 = new Date();
			
			var x = 0;
			

			$.each(json, function(i, v) {
			
			x = x+1

				var row = table.row.add([ v.senderMessageId,
						v.receiverMessageId, v.estimateNumber, v.supplierId,
						v.contractNumber, v.messageTimeStamp, v.messageCode,
						v.status, v.nimsSlipNumber, v.supplierRefNumber ]);
						
						

			})

			table.draw();

			/*  $("#dataTables-example td:nth-child(8):contains('Success')").addClass().css('background-color', '#3CB371');
			 $("#dataTables-example td:nth-child(8):contains('Failure')").addClass().css('background-color', '#FF0000');
			 $("#dataTables-example td:nth-child(8):contains('In_Transit')").addClass().css('background-color', '#FAFAD2');
			 $("#dataTables-example td:nth-child(8):contains('Manual_Resubmission')").addClass().css('background-color', '#87CEFA');
			
			
			 var arr = ["#3CB371", "#FF0000", "#FAFAD2","#87CEFA"];
			 $.each(table, function(index, val) {
			
			 $("#dataTables-example td:nth-child(8):contains('Success')").addClass().css('background-color', '#3CB371');
			 $("#dataTables-example td:nth-child(8):contains('Failure')").addClass().css('background-color', '#FF0000');
			 $("#dataTables-example td:nth-child(8):contains('In_Transit')").addClass().css('background-color', '#FAFAD2');
			 $("#dataTables-example td:nth-child(8):contains('Manual_Resubmission')").addClass().css('background-color', '#87CEFA');
			
			 });
			 */

			var elapsed1 = new Date() - start1;

			console.log('time in loading new data' + elapsed1);
			/* 
			 
			
			
			 */

			/* 

			$.each(jsondata.messageDetails, function(i, d) {
			var row='<tr class="even gradeA">';
			
			
			 row+='<td>'+d.senderMessageId+'</td>'+'<td>'+d.receiverMessageId+'</td>'+'<td>'+d.estimateNumber+'</td>';
			        row+='<td class="center">'+d.supplierId+'</td>'+'<td class="center">'+d.contractNumber+'</td>';
			         row+='<td>'+d.messageTimeStamp+'</td>'+'<td>'+d.messageCode+'</td>'+'<td class="center">'+d.status+'</td>';
			          row+='<td class="center">'+d.nimsSlipNumber+'</td>'+'<td>'+d.supplierRefNumber+'</td>'+'<td>'+d.status+'</td>';
			 
			
			
			
			
			
			
			/* 	$.each(d, function(j, e) {
			  row+='<td >'+e+'</td>';//style="font-weight: 200;font-size: 11px;width: 188px;"
			}); 
			i=i+1;
			 row+='</tr>';
			$('#dataTables-example tbody').append(row);
			});

			$('#dataTables-example').redrawTable() */
			
		}
		
		//$("#sortTimestamp").click();
		//$("#sortTimestamp").click();
		
		$('#dataTables-example').DataTable( {
	        "order": [[ 5, "desc" ]]
	    	} );
	    	
	    	

		function validateForCsvEmptyForm() {

			var supportTool = {};

			senderMessageId = $("#sMId").val();
			receiverMessageId = $("#rMId").val();
			supplierId = $("#sId").val();
			fromDate = $("#fD").val();
			toDate = $("#tD").val();
			estimateNumber = $("#eN").val();
			contractNumber = $("#cN").val();
			messageCode = $("#mC").val();
			businessStatus = $("#bS").val();

			if ((senderMessageId == null || senderMessageId == "")
					&& (receiverMessageId == null || receiverMessageId == "")
					&& (supplierId == null || supplierId == "")
					&& (fromDate == null || fromDate == "")
					&& (toDate == null || toDate == "")
					&& (estimateNumber == null || estimateNumber == "")
					&& (contractNumber == null || contractNumber == "")
					&& (messageCode == null || messageCode == "")
					&& (businessStatus == null || businessStatus == "")) {
				//alert("Please Search Before Download");
				//	return false;

				//  flag=1;
				event.preventDefault(event);
				$.alertable.alert(strings['criteria']);

			}

		}

		function resett() {
			$("#toggleCSS")
					.attr(
							"href",
							"<c:url value="/resources/bower_components/font-awesome/css/alertify.default.css"/>");
			alertify.set({
				labels : {
					ok : "OK",
					cancel : "Cancel"
				},
				delay : 50000,
				buttonReverse : false,
				buttonFocus : "ok"
			});
		}

		function unkown() {

		}
		function validateForEmptyForm(event) {
			var supportTool = {};
			var flag = 0;
			//   $.alertable.alert("Alert Message");

			senderMessageId = $("#senderMessageId").val();
			receiverMessageId = $("#receiverMessageId").val();
			supplierId = $("#supplierId").val();
			fromDate = $("#fromDate").val();

			toDate = $("#toDate").val();

			estimateNumber = $("#estimateNumber").val();
			contractNumber = $("#contractNumber").val();
			messageCode = $("#messageCode").val();
			businessStatus = $("#businessStatus").val();

			//  $.alertable.alert(senderMessageId+","+receiverMessageId+","+supplierId+","+fromDate+","+toDate+","+estimateNumber+","+contractNumber+","+messageCode+","+businessStatus);

			if ((senderMessageId == null || senderMessageId == "")
					&& (receiverMessageId == null || receiverMessageId == "")
					&& (supplierId == null || supplierId == "")
					&& (fromDate == null || fromDate == "")
					&& (toDate == null || toDate == "")
					&& (estimateNumber == null || estimateNumber == "")
					&& (contractNumber == null || contractNumber == "")
					&& (messageCode == null || messageCode == "")
					&& (businessStatus == null || businessStatus == "")) {

				$(':button').prop('disabled', false);

				flag = 1;
				event.preventDefault(event);
				$.alertable.alert("Search Criteria must not be empty");

			}

			if (businessStatus == "SUCCESS") {

				if ((senderMessageId == null || senderMessageId == "")
						&& (receiverMessageId == null || receiverMessageId == "")
						&& (supplierId == null || supplierId == "")
						&& (fromDate == null || fromDate == "")
						&& (toDate == null || toDate == "")
						&& (estimateNumber == null || estimateNumber == "")
						&& (contractNumber == null || contractNumber == "")
						&& (messageCode == null || messageCode == "")) {
					//	alert("Search Criteria must be greater than one when Business Status is Success");
					flag = 1;
					event.preventDefault(event);
					$.alertable
							.alert("Search Criteria must be greater than one when Business Status is Success");

				}

			}
			if (messageCode != null && messageCode != "") {

				if ((senderMessageId == null || senderMessageId == "")
						&& (receiverMessageId == null || receiverMessageId == "")
						&& (supplierId == null || supplierId == "")
						&& (fromDate == null || fromDate == "")
						&& (toDate == null || toDate == "")
						&& (estimateNumber == null || estimateNumber == "")
						&& (contractNumber == null || contractNumber == "")
						&& (businessStatus == null || businessStatus == "")) {
					//	alert("Search Criteria must be greater than one when Business Status is Success");
					flag = 1;
					event.preventDefault(event);
					$.alertable
							.alert("Search Criteria must be greater than one when only Message Code is selected");

				}

			}

			function toDateObject(dateStr) {
				var parts = dateStr.split("/");
				return new Date(parts[2], parts[1] - 1, parts[0]);
			}
			var fromDateObj = null;
			var toDateObj = null;
			if (fromDate != null && fromDate != "") {
				fromDateObj = toDateObject(fromDate);
			}

			if (toDate != null && toDate != "") {
				toDateObj = toDateObject(toDate);
			}
			if (fromDateObj == null && toDateObj != null) {

				flag = 1;
				event.preventDefault(event);
				$.alertable.alert("Enter the From Date");
			}
			if (fromDateObj != null && toDateObj == null) {

				flag = 1;
				event.preventDefault(event);
				$.alertable.alert("Enter the To Date");
			}
			if (fromDateObj != null && toDateObj != null
					&& fromDateObj > toDateObj) {
				//alert("To Date should not be less than From Date");
				//return false;

				flag = 1;
				event.preventDefault(event);
				$.alertable.alert("To Date should not be less than From Date");
			}
			if (flag == 0) {
				//added
				event.preventDefault(event);
				getViaAjax();
			}

		}

		$(document).ready(function() {

			/* $('#searchCriteriaForm').submit(function())
			{
				alert("control coming to jquery");
			}
			
			$('#toDate').datepicker({
			format: "dd/mm/yyyy"});
			$('#fromDate').datepicker({
			format: "dd/mm/yyyy"}); */
			/*  $('#dataTables-example').DataTable({
			         responsive: true
			 });
			 */
		});
	</script>

</body>
</html>