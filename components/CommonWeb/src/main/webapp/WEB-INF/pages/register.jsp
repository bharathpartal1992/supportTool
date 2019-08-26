<%@page import="com.orsb2bgw.supporttool.Objects.dto.UserDTO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Registration Form</title>
<%! String userName=null;
int result=0; %>
<%
session=request.getSession();
if(session.getAttribute("newUserName")!=null)
userName=(String)session.getAttribute("newUserName");
if(session.getAttribute("result")!=null)
result=(Integer)session.getAttribute("result");
session.removeAttribute("newUserName");
session.removeAttribute("result"); %>
<script type="text/javascript">
window.onload="myFunction()";
function myFunction(){
var uName='<%=userName%>';
var resultCount='<%=result%>';
if(uName!=null && resultCount!=-1)
   alert(uName+ " User created Successfully .");
else if(uName!=null && resultCount==-1)
   alert(uName+ " User creation Failed.");
   else{
   alert("Hello");
   }
   }
   function validateForm(){
   var userNameVal=document.getElementById("username").value.trim();
   var pwd=document.getElementById("password").value.trim();
   if(userNameVal===""){
   alert("Please provide Username ");
   return false;
   }
   if(pwd===""){
   alert("please provide Password");
   return false;
   }
   if(!document.getElementById('userRole').checked){
   alert("Please select Role");
   return false;
   }
   return true;
   }
</script>
</head>
<body>
	<center>
		<br /> <br /> <br />
		<h1>Enter Login Details Here</h1>
		<br />
		<div style="text-align: center; padding: 30px;border: 1px solid green;width: 250px;">
			<form method="post" if="myForm" action="register">

				<table>
					<tr>
						<td>User Name:</td>
						<td><input type="text" id="username" name="username" />
						</td>
					</tr>
					<tr>
						<td>Password:</td>
						<td><input type="password" id="password" name="password" />
						</td>
					</tr>
					<tr>
						<td>Role:</td>
						<!-- <td><input type="radio" name="userRole" value="ROLE_USER" />USER -->
						<td><input type="radio" name="userRole" id="userRole" value="ROLE_ADMIN" />ADMIN
						</td>
					</tr>
					
					<tr>
						<td>&nbsp;</td>
						<td><input type="submit" value="Register" onclick="return validateForm();"/>
						</td>

					</tr>
				</table>
				<input type="hidden" name="${_csrf.parameterName}"
											value="${_csrf.token}" />
			</form>
		</div>
	</center>
</body>
</html>