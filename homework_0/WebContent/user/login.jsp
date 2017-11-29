<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/user/common/path.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>Login Form</title>
  <link rel="stylesheet" href="${path }Css/style.css">
  <!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
  <script type="text/javascript">
function checkForm(){
    //判断登陆名
    var userName_ = /^[a-zA-Z_0-9]{3,10}$/;
    //判断密码
    var password_ = /^[a-zA-Z_0-9]{3,20}$/;
    //判断验证码
    var verification_ = /\d{4}/;   
    //获得input对象
    var username = document.getElementById("userName");
    var password = document.getElementById("password");
    var verification = document.getElementById("verification");
    
     if(username == null || username.value == ""){
        alert("用户名不能为空");
         return false;
     }else if(username.value.match(userName_)==null){
        alert("用户名不正确");
        return false;
     } else if(password == null || password.value == ""){
        alert("密码不能为空");
         return false;
     }else if(password.value.match(password_) == null){
        alert("密码不正确");
        return false;
     }else if(verification == null || verification.value == ""){
        alert("请填写验证码");
         return false; 
     } else if(verification.value.match(verification_) == null){
        alert("验证码不正确");
        return false;
     }
     return true;
}
</script> 
</head>
<body>

  <section class="container">
    <div class="login">
      <h1>用户登录</h1>
      <form method="post" action="${pageContext.request.contextPath }/homework_0/loginuser/login" onsubmit="return checkForm();">
        <div class="form_row">
        <%
        	String msg = (String)request.getAttribute("message");
        if(msg!=null){
        	out.print(msg + "<br>");
        }
        %>
                    用户名：<input type="text"  name="userName" id="userName"  />
                    密码：<input type="password"  name="password" id="password" />
                    验证码：<input type="text"  name="verification" id="verification" />
            <img src="${pageContext.request.contextPath}/common/verification.jsp" />       
        <p class="remember_me">
          <label>
            <input type="checkbox" name="remember_me" id="remember_me">
            记住密码
          </label>
        </p>
        <p class="submit"><input type="submit" name="commit" value="登录"></p>
      </form>
    </div>

    <div class="login-help">
      <p>忘记密码? <a href="">点击修改</a></p>
    </div>
  </section>
<div style="text-align:center;">
</div>
</body>
</html>