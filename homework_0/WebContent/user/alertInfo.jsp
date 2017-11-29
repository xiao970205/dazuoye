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

input{
	width: 253px;
	height: 28px;
	border: 1px #DFDFDF solid;
	float: left;
}
#sub{
	margin-top: 15px;
	font-size: 25px;
	font-family: Verdana;
	color: rgb(95, 74, 121);
	width:200px;
	height:58px;
}
</style>
<script type="text/javascript">
function checkForm(){
    //判断登陆名
    var userName_ = /^[a-zA-Z_0-9]{3,10}$/;
    //判断密码
    var password_ = /^[a-zA-Z_0-9]{3,20}$/;
    //判断电话号码
    var telephone_ = /\d{11}/;
    //判断邮箱
    var email_ = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;    
    
    //获得input对象
    var username = document.getElementById("userName");
    var password = document.getElementById("password");
    var rePassword = document.getElementById("rePassword");
    var address = document.getElementById("address");
    var email = document.getElementById("email");
    var telephone = document.getElementById("telephone");
    
     if(password == null || password.value == ""){
        alert("密码不能为空");
         return false;
     }else if(password.value.match(password_) == null){
        alert("您输入的密码与规定类型不匹配");
        return false;
     }else if(password.value != rePassword.value){
        alert("两次密码不一致");
         return false;
     }else if(email == null || email.value == ""){
        alert("email不能为空");
         return false; 
     } else if(email.value.match(email_) == null){
        alert("您输入的邮箱格式不正确");
        return false;
     }else if(address == null || address.value == ""){
        alert("地址不能为空");
        return false;
     }else if(telephone == null || telephone.vlaue == ""){
        alert("电话号码不能为空");
        return false;
     }else if(telephone.value.match(telephone_) == null){
        alert("您输入的电话号码无效");
        return false;
    }
     return true;
}
</script>
</head>

<body>
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
      		<th>${user.userName }的注册信息表</th>
      	</thead>
		<tr>
			<td>用户名：</td><td>${user.userName }</td>
		</tr>
		<form action="${pageContext.request.contextPath }/AlertInfoServlet" method="post" onsubmit="return checkForm();">
		<tr>
			<td>密码：</td><td><input type="password" class="contact_input" name="password" id="password" /></td>
		</tr>
		<tr>
			<td>确认密码：</td><td> <input type="password" class="contact_input" name="password2" id="rePassword" /></td>
		</tr>
		<tr>
			<td>电子邮件：</td><td><input type="text" class="contact_input" name="email" id="email" /></td>
		</tr>
		<tr>
			<td>电话：</td><td><input type="text" class="contact_input" name="telephone" id="telephone" /></td>
		</tr>

		<tr>
			<td>地址：</td><td><input type="text" class="contact_input" name="address" id="address" /></td>
		</tr>
		<tr>
			<td>注册时间：</td><td>${user.postTime }</td>
		</tr>
		

	</table>
				<input type="submit" id="sub" value="修改" /> 
		
		<form/>
      </div>
       <%@ include file="footer_index.jsp" %>
    </div>
</div>
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>