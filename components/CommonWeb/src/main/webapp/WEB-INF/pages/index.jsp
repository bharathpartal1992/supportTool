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

    <!-- MetisMenu CSS -->
    <link href="<c:url value="/resources/bower_components/metisMenu/dist/metisMenu.min.css" />" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<c:url value="/resources/dist/css/sb-admin-2.css" />" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<c:url value="/resources/bower_components/font-awesome/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">

	
<script language="JavaScript">
 function validateFormElement(){
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
   return validateForm();
	
}
function validateForm()
{
	 var count=0; 

	  
	 var strings = new Array();
  strings['defaultMessage'] = "<spring:message code='label.defaultMessage' javaScriptEscape='true' />";
  
	  
	event.preventDefault();
			$.alertable.confirm(strings['defaultMessage']).then(function() {
			// $(this).unbind("submit").submit();
			 //return true;
			 $('form').submit();
   //  changeUserAccess(btn);
    }, function() {
  //  return(false);
     console.log('Cancel');      
    });
		
	  
	// var go = confirm("You have accessed the ORSS Gateway Support Tool.You are required to have a personal authorisation from the system administrator before you use this System and you are strictly limited to the use set out in that written authorisation. Unauthorised access to or misuse of this system is prohibited and may constitute an offence under the Computer Misuse Act 1990.\nIf you disclose customer or BT information without authority you may be sacked and/or prosecuted.");
	/*  if(go==true){
      return(true);
	 }else{return(false);}
   */
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
<%
Properties properties=PropertyReader.getPropertiesInstance(ORSS_Constants.SupportToolProp);
    		String path=properties.getProperty("NOTIFICATION");
    		String notification=UtilityMethods.getTextAsString(path);
    		
 %>
<!-- <marquee>Downtime on 14-3-2016, Please do not use the application during downtime</marquee> -->
<marquee><%=notification %></marquee>
</div>

<div class="container" >
	<div class="row">
		<center><h3 ><spring:message
                                code="label.welcome" /></h3></center>
            <div class="col-md-4 col-md-offset-4">
				<div class="login-panel panel panel-default">
					<div class="panel-heading">
                        <h3 class="panel-title"><spring:message code="label.singInHeader" /></h3>
                    </div>
                    <div class="panel-body">
                        <form method="post" id="loginform"  action="<c:url value='j_spring_security_check'/>" >
                            <fieldset>
                            	<div class="form-group">
                            	<span olspan="2" style="color: red">${message}</span>
                            	</div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="User-Name" type="text" name="user_name" id="username" maxlength="25" required autofocus />
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Password" type="password" name="pass_word" id="password" required maxlength="25"/>
                                </div>
                                <input type="hidden" id="csrft" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
                                
                                <!-- Change this to a button or input when using this as a form -->
                                <center>
                                <table>
                                <tr>
                                <!-- <td><a href="admintoolset.jsp" class="btn btn-lg btn-success btn-block">Login</a>
                                </td> -->
                 <!--         onClick="return validateForm()"  -->
                                <td><input  type=submit value="Submit" onClick="return validateFormElement()"  class="btn btn-lg btn-success btn-block"/>
                                
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
	
	
	
<!-- <script> -->
<!-- jQuery(document).ready(function($) {


$("#loginform").submit(function(event) {

event.preventDefault(event);
		
    	//if (confirm("Click OK to continue?")){
    	/* if($.alertable.confirm("Click OK to continue?").){
        	
        	} */
      $.alertable.confirm('You have accessed the ORSS Gateway Support Tool.You are required to have a personal authorisation from the system administrator before you use this System and you are strictly limited to the use set out in that written authorisation. Unauthorised access to or misuse of this system is prohibited and may constitute an offence under the Computer Misuse Act 1990.\nIf you disclose customer or BT information without authority you may be sacked and/or prosecuted.').then(function() {
      loginUser();
    }, function() {
      console.log('Cancel');      
    });
		
		});

});

function loginUser()
{
	
    	//var flag=0;
		var user_name= $("#username").val();
    	var pass_word = $("#password").val();
    	
    	//alert("It came here");
    	
    	
		var csrf_token=$("#csrft").val();
	
		
		
		event.preventDefault();
		$(':button').prop('disabled', true);

		$("#loading-image").show();
		$.ajax({
			type : "POST",
			url : "${home}j_spring_security_check",
			data : {user_name,pass_word},
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
			
			$(':button').prop('disabled', false);
				
				//alert(data.msg);
				
				//flag=1;
  //event.preventDefault(event);
        //  $.alertable.alert(data.msg);
 
				
			},
			error : function(e) {
				console.log("ERROR: ", e);
				//display(e);
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


</script> -->
	
	
	
	
	<!-- footer starts here -->
	<hr/>
	<footer class="footer clearfix" style="background-color:white align:bottom position: relative; bottom: 50%; left: 50%; transform: translate(-7%,-10%);">
		<div class="container">
			<%-- <div class="row">
				<div class="col-xs-6 footer-para">
					<h6>&copy;<spring:message code="label.footer" /></h6>
					
				</div>
				
			</div> --%>
		</div>
	</footer>





</body>

</html>