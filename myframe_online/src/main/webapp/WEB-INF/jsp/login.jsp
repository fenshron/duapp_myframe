<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html >
  <head>
    <meta charset="UTF-8">
    <title>登录</title>
      <link rel="stylesheet" href="./css/loginstyle.css">
      <script type="text/javascript"	src="<%=basePath%>common/js/plugins/webUI/jquery-1.7.2.js"></script>
      <script type="text/javascript">
	     function changeValidateImg() {
	      document.getElementById('validateImg').src='/servlet/CheckCode?t='+new Date().getTime();
	 	 }  
	     function validatetorLogin(){
		     $('#title').text("正在登录中，请稍后！")
		     $('.form').fadeOut(500);
		   	 $('.form').submit(); 
	      }
		</script>
  </head>

  <body>
    <div class="wrapper">
	<div class="container">
		<h1 id="title">My Frame Demo</h1>
		<form class="form" action="dologin.htm" method="post">
			<input type="text" placeholder="Username" name="userAccount" required pattern=.*\S.*>
			<input type="password" placeholder="Password" name="userPassword" required pattern=.*\S.*>
			<c:if test="${sessionScope.showCheckCode==1}">
		        <div class="field">
		         	<input type="text" id="fieldvalidate" placeholder="code" name="validateCode" class="input" required pattern=.*\S.* />
		       	</div>
		        <div class="field" style="height: 32px;">
		       		<div style="margin: 10px;">
						<div>
				            <img id="validateImg" alt="无法显示验证码" src="/servlet/CheckCode" onclick="changeValidateImg();return false;"/>
				            <a href="javascript:void(0);" onclick="changeValidateImg();return false;" style="color: #497BE8;font-size: 10px;">换一张</a>
				        </div>
				    </div>
		        </div>
	        </c:if>
	        <button id="login-button" class="btn" onclick="validatetorLogin()">Login</button>
		</form>
	</div>
	<ul class="bg-bubbles">
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
	</ul>
</div>
  </body>
</html>
