<%@page import="java.util.Set"%>
<html xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office"
	xmlns="http://www.w3.org/TR/REC-html40">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.orsb2bgw.supporttool.util.*,java.util.Properties" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@page session="false" %>


<head>
    <title>ORSS Gateway Support Tool</title>
    <!-- Bootstrap Core CSS -->
    <link href="<c:url value="/resources/bower_components/bootstrap/dist/css/bootstrap.min.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/bower_components/font-awesome/css/jquery.alertable.css"/>" rel="stylesheet">
    <script src="<c:url value="/resources/bower_components/bootstrap/dist/js/jquery.alertable.js"/>"></script>
    


    <!-- MetisMenu CSS -->
    <link href="<c:url value="/resources/bower_components/metisMenu/dist/metisMenu.min.css" />" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<c:url value="/resources/dist/css/sb-admin-2.css" />" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<c:url value="/resources/bower_components/font-awesome/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">

	
<script language="JavaScript">
 function validateForm(){
   var userNameVal=document.getElementById("username").value.trim();
   var pwd=document.getElementById("password").value.trim();
   if(userNameVal===""){
   $.alertable.alert("Please provide Username ");
   return false;
   }
   if(pwd===""){
   $.alertable.alert("please provide Password");
   return false;
   }
   if(!document.getElementById('userRole').checked){
   $.alertable.alert("Please select Role");
   return false;
   }
   return true;
	
}

</script>
</head>

<body>
	
<header class="top-header" style="background-color:white">
	<div class="container">
		<div class="row">
			<div class="col-xs-5 header-logo">
			<br>
				<img src="<c:url value="/resources/img/logo.gif"/>" alt="" class="img-responsive logo" style="
					position: relative;
					top: 50%;
					left: 50%;
					transform: translate(-250%, -15%);
					width: 30%;
					">
			</div>
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<img src="<c:url value="/resources/img/btlogo.gif"/>" class="img-responsive logo" 
					 style="align:right;
						position: relative;
						top: 50%;
						left: 50%;
						transform: translate(45%,18%);
						width: 12%;
						">
			</div> <!-- / .container-fluid -->
			</nav>
		</div>
		</div>
</header> <!-- end of header area -->
<div Style="background-color:#C0C0C0;">
</div>

<div class="container" >
	<div class="row">
		<center><h3 ><spring:message
                                code="label.welcome1" /></h3></center>
            <div class="col-md-4 col-md-offset-4">
				<div class="login-panel panel panel-default">
					<div class="panel-heading">
                        <h3 class="panel-title"><spring:message code="label.singInHeader" /></h3>
                    </div>
                    <div class="panel-body">
                        <form method="post" id="loginform"  action="<c:url value='register'/>" >
                            <fieldset>
                            	<div class="form-group">
                            	<span olspan="2" style="color: red">${message}</span>
                            	</div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="User-Name" type="text" name="username" id="username" maxlength="25" required autofocus />
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Password" type="password" name="password" id="password" required maxlength="25"/>
                                </div>
                                <div>
                                <input type="radio" name="userRole" id="userRole" value="ROLE_ADMIN" />ADMIN
                                </div>
                                <input type="hidden" id="csrft" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
                               
                                <td><input  type=submit value="Submit" onClick="return validateForm()"  class="btn btn-lg btn-success btn-block"/>
                                
                                </td> 
                                <td>&nbsp;&nbsp;
                                </td>
                                <td>&nbsp;&nbsp;
                                </td>
                                <td><input type=reset value="Reset" class="btn btn-lg btn-success btn-block"/>
                                </td>
                                </tr>
                                </table>
                                </center>
								
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
     </div>
</div>
	

	<br/><br/><br/>
	
	
<div>
	
	


    <!-- jQuery -->
    <script src="<c:url value="/resources/bower_components/jquery/dist/jquery.min.js"/>"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="<c:url value="/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"/>"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="<c:url value="/resources/bower_components/metisMenu/dist/metisMenu.min.js"/>"></script>

    <!-- Custom Theme JavaScript -->
    <script src="<c:url value="/resources/dist/js/sb-admin-2.js"/>"></script>
	
	<script src="<c:url value="/resources/bower_components/bootstrap/dist/js/jquery.alertable.js"/>"></script>
  <link href="<c:url value="/resources/bower_components/font-awesome/css/jquery.alertable.css"/>" rel="stylesheet">
	<!-- footer starts here -->
	<hr/>
	<footer class="footer clearfix" style="background-color:white align:bottom position: relative; bottom: 50%; left: 50%; transform: translate(-7%,-10%);">
		<div class="container">
		</div>
	</footer>





</body>

</html>