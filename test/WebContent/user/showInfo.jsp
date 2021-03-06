<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/user/common/path.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>响应式布局</title>
<link type="text/css" rel="stylesheet" href="${path }Css/reset.css" />
<link type="text/css" rel="stylesheet" href="${path }Css/1024_768.css" />
<link type="text/css" rel="stylesheet" media="screen and (min-width:861px) and (max-width:960px)" href="${path }Css/pad_heng.css" />
<link type="text/css" rel="stylesheet" media="screen and (min-width:601px) and (max-width:860px)" href="${path }Css/pad.css" />
<link type="text/css" rel="stylesheet" media="screen and (min-width:481px) and (max-width:600px)" href="${path }Css/tel_heng.css" />
<link type="text/css" rel="stylesheet" media="screen and (max-width:480px)" href="${path }Css/tel.css" />
<style type="text/css">
/* Border styles */
#table-4 thead, #table-4 tr {
	border-top-width: 1px;
	border-top-style: solid;
	border-top-color: rgb(211, 202, 221);
}

#table-4 {
	border-bottom-width: 1px;
	border-bottom-style: solid;
	border-bottom-color: rgb(211, 202, 221);
	width: 800px;
}

/* Padding and font style */
#table-4 td, #table-4 th {
	height:52px;
	padding: 5px 10px;
	font-size: 25px;
	font-family: Verdana;
	color: rgb(95, 74, 121);
}

/* Alternating background colors */
#table-4 tr:nth-child(even) {
	background: rgb(223, 216, 232)
}

#table-4 tr:nth-child(odd) {
	background: #FFF
}
</style>

</head>

<body>
<%
	if(request.getSession().getAttribute("user")==null){
		response.setContentType("text/html; charset=UTF-8");   
		response.sendRedirect("index.jsp");  
		return;
	}
%>
<div class="w_100_l top_title">
	<div class="main">
    	<p><a href="#">Buy more than one book and save big! </a><a href="#">Read more</a></p>
    </div>
</div>

<div class="w_100_l">
	<div class="main">
      <%@ include file="top_index.jsp" %>
        <span class="index_img"><img src="${path }Images/banner_img.jpg" alt="Dan Cederholm" border="0" usemap="#Map" />      
        </span>
        <p class="index_hr"></p>
      <div class="content">
      <table id="table-4">
      	<thead>
      		<td>${user.realName }的注册信息表</td>
      	</thead>
		<tr>
			<td>用户名：</td><td>${user.loginName }</td>
		</tr>
		<tr>
			<td>电子邮件：</td><td>${user.email }</td>
		</tr>
		<tr>
			<td>地址：</td><td>${user.address }</td>
		</tr>
		<tr>
			<td><a href="${path }alertInfo.jsp">修改个人信息</a> </td>
		</tr>
	</table>
      </div>
       <%@ include file="footer_index.jsp" %>
    </div>
</div>
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>