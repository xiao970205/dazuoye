<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="/homework_0/loginuser/login2">注册</a>
	<form action="/homework_0/loginuser/login2" method="post">
		账号：<input type="text" name="loginName"/><br>
		密码：<input type="password" name="password"/><br>
		${errorinfo }
		<input type="submit" value="登陆"/>
	</form>
	
	<p>注册</p>
	<form action="/homework_0/loginuser/regist" method="post">
		账号：<input type="text" name="loginName"/><br>
		密码：<input type="password" name="password"/><br>
		昵称：<input type="text" name="realName"/><br>
		${regist_errinfo }
		<input type="submit" value="登陆"/>
	</form>
	
	<a href="/homework_0/book/show_all">all_book</a><br>
	<a href="/homework_0/book/show_select_jiangnan?name=江南">江南</a>
	<br>
	<form action="/homework_0/book/show_select_name">
		<input type="text" name="name"/><br>
		<input type="submit" value="书名搜索">
	</form>
	<br>
	<form action="/homework_0/book/show_select_author">
		<input type="text" name="author"/><br>
		<input type="submit" value="作者搜索">
	</form>
	<br>
	<form action="/homework_0/book/show_select_value">
		<input type="text" name="value"/><br>
		<input type="submit" value="类型搜索">
	</form>
	<br>
	<form action="/homework_0/book/show_select_press">
		<input type="text" name="press"/><br>
		<input type="submit" value="出版社搜索">
	</form>
	<form action="/homework_0/book/show_select_price">
		<input type="text" name="min"/><br>
		<input type="text" name="max"/><br> 
		<input type="submit" value="价格搜索">
	</form>
	<form action="/homework_0/book/show_select0">
		<input type="text" name="select"/><br>
		<input type="submit">
	</form>
</body>
</html>