<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript"	src="<%=basePath%>common/js/plugins/webUI/jquery-1.7.2.js"></script>
<script>
$(function(){
	initData();
});
function initData(){
	console.info("initData()");
	$.ajax({  		    		
		url: "<%=path%>/user/girl.htm", 
		type : "post",
		cache:false,
		dataType:"json",
		success:function(data){
			for(var i=1;i<=10;i++){
				$("#weath"+i).children('li').remove();
			}
			for(var i=0;i<=10;i++){
			//alert(data.showapi_res_body.cityInfo.c1);
				$("#weath"+i).append(
						"<li>"+(data.showapi_res_body[i].title)+"</li>"+
						"<li><a target='_blank' href='"+(data.showapi_res_body[i].url)+"'><img src='"+(data.showapi_res_body[i].picUrl)+"'/></a></li>"+
						"<li>"+(data.showapi_res_body[i].description)+"</li>"
				);
			}
			
			
			
			$("#J_GirlsList").children('li').remove();
			for(var i=0;i<=9;i++){
			//alert(data.showapi_res_body.cityInfo.c1);
				$("#J_GirlsList").append(
						"<li class='item'>"+
					    "<a href='"+(data.showapi_res_body[i].url)+"' target='_blank' class='item-link'>"+
					       " <div class='item-wrap'> "+
					           " <div class='img'><img src='"+(data.showapi_res_body[i].picUrl)+"'></div>"+
					           " <div class='info'>"+
					               " <span class='name'>"+(data.showapi_res_body[i].title)+"</span>"+
					           " </div>"+
					            "<div class='info row2'>"+
					               
					           " </div>"+
					       " </div>"+
					  "  </a>"+
					"</li>"
				);
			}
		},
		error:function(data){
			console.info("get girl images error!");
		}
	});
	
	
	$.ajax({  		    		
		url: "<%=path%>/user/girlpage2.htm", 
		type : "post",
		cache:false,
		dataType:"json",
		success:function(data){
			$("#J_GirlsList2").children('li').remove();
			for(var i=2;i<=16;i++){
			//alert(data.showapi_res_body.cityInfo.c1);
				$("#J_GirlsList2").append(
						"<li class='item'>"+
					    "<a href='"+(data[i].url)+"' target='_blank' class='item-link'>"+
					       " <div class='item-wrap'> "+
					           " <div class='img'><img src='"+(data[i].picUrl)+"'></div>"+
					           " <div class='info'>"+
					               " <span class='name'>"+(data[i].title)+"</span>"+
					           " </div>"+
					            "<div class='info row2'>"+
					               
					           " </div>"+
					       " </div>"+
					  "  </a>"+
					"</li>"
				);
			}
			
			},
		error:function(data){
			console.info("get girl images error!");
		}
	});
	
}

function reload(){
	initData();
}
</script>
<style>
ul{padding: 10px 18px;font-size: 13px;float: left; background-color:#E5F1E4;margin:10px 10px;
 -webkit-box-shadow:0 0 10px #335D5D;  
  -moz-box-shadow:0 0 10px #335D5D;  
  box-shadow:0 0 10px #335D5D;  }
li{list-style-type:none;color:#000; text-align: center;}
img{width: 190px;height: 290px;}
</style>
<!-- ===========================================================22222222222222222222222222222222222222222 -->

<style>
body {
    font: 12px/1.5 'Hiragino Sans GB','Microsoft Yahei',tahoma,sans-serif;
}
.girls-list-wrap {
    min-height: 400px;
    width: 100%;
    margin-top: 10px;
}
.girls-list-wrap .girls-list {
    width: 1155px;
    margin: 0 auto;
    background-color: transparent;
}
.clearfix {
    display: block;
    zoom: 1;
}
.girls-list-wrap .girls-list .item {
    width: 194px;
    height: 338px;
    float: left;
    position: relative;
    margin: -1px 0 0 -1px;
}
.girls-list-wrap .girls-list .item-wrap {
    width: 190px;
    height: 333px;
    position: absolute;
    float: left;
    border: 1px solid #a0a0a0;
    background-color: #fff;
    -webkit-transition-property: width height border margin z-index;
    -webkit-transition-duration: .2s;
    -webkit-transition-timing-function: ease-in-out;
    -moz-transition-property: width height border margin z-index;
    -moz-transition-duration: .2s;
    -moz-transition-timing-function: ease-in-out;
    -ms-transition-property: width height border margin z-index;
    -ms-transition-duration: .2s;
    -ms-transition-timing-function: ease-in-out;
    -o-transition-property: width height border margin z-index;
    -o-transition-duration: .2s;
    -o-transition-timing-function: ease-in-out;
    transition-property: width height border margin z-index;
    transition-duration: .2s;
    transition-timing-function: ease-in-out;
}
ul {
    list-style: none;
}
.girls-list-wrap .girls-list .item img {
    width: 100%;
    height: 285px;
    -webkit-transition-property: height;
    -webkit-transition-duration: .2s;
    -webkit-transition-timing-function: ease-in-out;
    -moz-transition-property: height;
    -moz-transition-duration: .2s;
    -moz-transition-timing-function: ease-in-out;
    -ms-transition-property: height;
    -ms-transition-duration: .2s;
    -ms-transition-timing-function: ease-in-out;
    -o-transition-property: height;
    -o-transition-duration: .2s;
    -o-transition-timing-function: ease-in-out;
    transition-property: height;
    transition-duration: .2s;
    transition-timing-function: ease-in-out;
}
fieldset, img {
    border: 0;
}
.girls-list-wrap .girls-list .item a:hover .item-wrap {
    width: 190px;
    height: 340px;
    border: 2px solid #282828;
    background-color: #282828;
    margin: -10px 0 0 -10px;
    z-index: 1;
}
.girls-list-wrap .girls-list .item a:hover img {
    height: 285px;
}
.girls-list-wrap .girls-list .item a:hover .info .city, .girls-list-wrap .girls-list .item a:hover .info .name {
    color: #fff;
}
.girls-list-wrap .girls-list .item .info .city {
    color: #a9a9a9;
    font-size: 12px;
    vertical-align: top;
}
.girls-list-wrap .girls-list .item a:hover .info {
    color: #fff;
}
.girls-list-wrap .girls-list .item .info {
    padding-left: 10px;
}
.girls-list-wrap .girls-list .item .info .name {
    color: #666;
    margin-right: 5px;
}
.girls-list-wrap .girls-list .item .info .city {
    color: #a9a9a9;
    font-size: 12px;
    vertical-align: top;
}
.girls-list-wrap .girls-list .item .row2 {
    color: #a9a9a9;
    font-size: 12px;
    margin-top: 3px;
}
ul{padding: 10px 18px;font-size: 13px;float: left; background-color:#E5F1E4;margin:10px 10px;
 -webkit-box-shadow:0 0 10px #335D5D;  
  -moz-box-shadow:0 0 10px #335D5D;  
  box-shadow:0 0 10px #335D5D;  }
li{list-style-type:none;color:#000; text-align: center;}
img{width: 190px;height: 290px;}
</style>
</head>
<body style="background-image: url('../common/images/weathbg.png');">
	<h3 style="color:#fff;">apix接口-美女图片<a style="color:#FBAA53"  href="javascript:void(0)" onclick="reload()">刷新</a> </h3>
	<div class="girls-list-wrap2 girls-list-wrap">
		<ul class="girls-list clearfix" id="J_GirlsList2">
		</ul>
	</div>
	<h3 style="color:#fff;">易源接口-美女图片<a style="color:#FBAA53"  href="javascript:void(0)" onclick="reload()">刷新</a> </h3>
	<div class="girls-list-wrap">
		<ul class="girls-list clearfix" id="J_GirlsList">
		</ul>
	</div>
	<ul id="weath1"></ul>
	<ul id="weath2"></ul>
	<ul id="weath3"></ul>
	<ul id="weath4"></ul>
	<ul id="weath5"></ul>
	<ul id="weath6"></ul>
	<ul id="weath7"></ul>
	<ul id="weath8"></ul>
	<ul id="weath9"></ul>
	<ul id="weath10"></ul>
	
</body>
</html>