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
<link type="text/css" rel="stylesheet" media="screen and (max-width:480px)" href="Css/tel.css" />
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
<style type="text/css">
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
	height: 18px;
	background-color: #fff;
	color: #999999;
	border: 1px #DFDFDF solid;
	float: left;
}


.terms {
	padding: 0 0 0 80px;
}
</style>
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
      <p class="index_hr"></p>
       
      <div class="content">
            <h1 class="h1_book_title">Also from A Book Apart</h1>
	          <form   action="${pageContext.request.contextPath }/RegisterServlet" method="post" onsubmit="return checkForm();">
	            <div class="form_row">
	              <label class="contact"><strong>用户名:</strong></label>
	              <input type="text" class="contact_input" name="username" id="userName" />
	              <div class="terms">必填项,3-10位,字母、数字或下划线</div> 
	            </div>
	            <div class="form_row">
	              <label class="contact"><strong>密码:</strong></label>
	              <input type="password" class="contact_input" name="password" id="password" />
	           	  <div class="terms">必填项,3-20位,字母、数字或下划线</div>
	            </div>
	            <div class="form_row">
	              <label class="contact"><strong>确认密码:</strong></label>
	              <input type="password" class="contact_input" name="password2" id="rePassword" />
	              <div class="terms">必填项,请确定上述密码与本次输入密码一致</div>
	            </div>
	            <div class="form_row">
	              <label class="contact"><strong>邮箱:</strong></label>
	              <input type="text" class="contact_input" name="email" id="email" />
	              <div class="terms">必填项,请输入有效的邮箱</div>
	            </div>
	            <div class="form_row">
	              <label class="contact"><strong>电话:</strong></label>
	              <input type="text" class="contact_input" name="telephone" id="telephone" />
	              <div class="terms">必填项,请输入有效的电话号码</div>      
	            </div>
	            <div class="form_row">
	              <label class="contact"><strong>地址:</strong></label>
	              <input type="text" class="contact_input" name="address" id="address" />
	              <div class="terms">必填项,请输入有效的地址</div>
	            </div>
	            <div class="form_row">
	              <div class="terms">
	                <input type="checkbox" name="terms" />
	                                我已阅读并同意  <a href="#">交易条款 &amp; 社区条款</a> </div>
	            </div>
	            <div class="form_row">
	              <input type="submit" class="register" value="注册" />
	            </div>
	          </form>	      
    
      </div>
       <%@ include file="footer_index.jsp" %>
    </div>
</div>
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>