<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

   <!-- player skin -->
   <link rel="stylesheet" href="<%=basePath%>common/js/plugins/flowplayer-6.0.3/skin/functional.css">

   <!-- site specific styling -->
   <style>
   body { font: 12px "Myriad Pro", "Lucida Grande", sans-serif; text-align: center; padding-top: 5%; }
   .flowplayer { width: 80%; }
   </style>

   <!-- for video tag based installs flowplayer depends on jQuery 1.7.2+ -->
   <script type="text/javascript"	src="<%=basePath%>common/js/plugins/webUI/jquery-1.7.2.js"></script>

   <!-- include flowplayer -->
   <script src="<%=basePath%>common/js/plugins/flowplayer-6.0.3/flowplayer.min.js"></script>

</head>

<body>

   <!-- the player -->
   <div class="flowplayer" data-swf="flowplayer.swf" data-ratio="0.4167">
      <video>
         <source type="video/webm" src="https://stream.flowplayer.org/bauhaus.webm">
         <source type="video/mp4" src="https://stream.flowplayer.org/bauhaus.mp4">
      </video>
   </div>

</body>
</html>
