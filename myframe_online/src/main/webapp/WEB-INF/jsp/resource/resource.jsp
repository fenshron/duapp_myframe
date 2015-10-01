<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'user.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <jsp:include page="../baseJsCss.jsp"></jsp:include>  
  <body>

    <div class="easyui-layout" id="iid" fit="true">
	    <div data-options="region:'center',title:'',iconCls:'icon-ok',fit:true,border:false" style="padding:5px" > 
	      <table id="dg" fit="true" data-options="fit:true" ></table>
	    </div>
    </div>
  </body>
</html>
