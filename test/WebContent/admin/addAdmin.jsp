<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/admin/common/path.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>A Book Apart后台管理系统</title>
<meta name="description" content="这是一个 index 页面">
<meta name="keywords" content="index">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="icon" type="image/png" href="${path }assets/i/favicon.png">
<link rel="apple-touch-icon-precomposed"
	href="${path }assets/i/app-icon72x72@2x.png">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="stylesheet" href="${path }assets/css/amazeui.min.css" />
<link rel="stylesheet" href="${path }assets/css/admin.css">
<script src="${path }assets/js/jquery.min.js"></script>
<script src="${path }assets/js/app.js"></script>
<script type="text/javascript">
function checkForm(){
    //判断登陆名
    var userName_ = /^[a-zA-Z_0-9]{3,10}$/;
    //判断密码
    var password_ = /^[a-zA-Z_0-9]{3,20}$/;
    //获得input对象
    var username = document.getElementById("userName");
    var password = document.getElementById("password");
    var rePassword = document.getElementById("rePassword");
    var realname = document.getElementById("realname");  
     if(username == null || username.value == ""){
        alert("用户名不能为空");
         return false;
     }else if(username.value.match(userName_)==null){
        alert("您输入的用户名与规定类型不匹配");
        return false;
     } else if(password == null || password.value == ""){
        alert("密码不能为空");
         return false;
     }else if(password.value.match(password_) == null){
        alert("您输入的密码与规定类型不匹配");
        return false;
     }else if(password.value != rePassword.value){
        alert("两次密码不一致");
         return false;
     }else if(realname == null || realname.value == ""){
        alert("请填写真实姓名");
         return false; 
     }
     return true;
}
</script>
<style type="text/css">
#last {
	position: fixed;
	bottom: 0;
}

.contact_form {
	width: 355px;
	float: left;
	padding: 25px;
	margin: 20px 0 0 15px;
	_margin: 20px 0 0 5px;
	border: 1px #DFD1D2 dashed;
	position: relative;
}

.form_row {
	width: 350px;
	_width: 355px;
	clear: both;
	padding: 10px 0 10px 0;
	_padding: 5px 0 5px 0;
	color: #a53d17;
}

label.contact {
	width: 75px;
	float: left;
	font-size: 16px;
	text-align: right;
	padding: 4px 5px 0 0;
	color: #333333;
}

input.contact_input {
	width: 253px;
	height: 27px;
	background-color: #fff;
	color: #999999;
	border: 1px #DFDFDF solid;
	float: left;
}

.terms {
	width:800px;
	padding: 0 0 0 80px;
}
</style>
</head>
<body>
	<%@ include file="top_index.jsp"%>
	<div class="am-cf admin-main">
		<%@ include file="left_index.jsp"%>
		<div class=" admin-content">
			<div class="daohang"></div>
			<div class="admin">
				<div class="admin-biaoge">
					<div class="xinxitj">新增管理员</div>
					<form action="${pageContext.request.contextPath }/AddAdminServlet2"
						method="post" onsubmit="return checkForm();">
						<div class="form_row">
							<label class="contact"><strong>用户名:</strong></label> <input
								type="text" class="contact_input" name="username" id="userName" />
							<div class="terms">必填项,3-10位,字母、数字或下划线</div>
						</div>
						<div class="form_row">
							<label class="contact"><strong>密码:</strong></label> <input
								type="password" class="contact_input" name="password"
								id="password" />
							<div class="terms">必填项,3-20位,字母、数字或下划线</div>
						</div>
						<div class="form_row">
							<label class="contact"><strong>确认密码:</strong></label> <input
								type="password" class="contact_input" name="password2"
								id="rePassword" />
							<div class="terms">必填项,请确定上述密码与本次输入密码一致</div>
						</div>
						<div class="form_row">
							<label class="contact"><strong>真实姓名:</strong></label> <input
								type="text" class="contact_input" name="realname" id="realname" />
							<div class="terms">必填项,请填写真实姓名</div>
						</div>
						<div class="form_row">
							<input type="submit" class="register" value="添加" />
						</div>
					</form>
				</div>
				<%@ include file="footer_index.jsp"%>
			</div>

		</div>
	</div>
</body>
</html>