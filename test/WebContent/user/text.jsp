<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
function sub1(){
	 document.sub0.action="${pageContext.request.contextPath }/book/test1";
	 document.sub0.method="get";
    document.sub0.submit();
}
function sub2(){
	 document.sub0.action="${pageContext.request.contextPath }/book/test2";
	 document.sub0.method="post";
    document.sub0.submit();
}
</script>
<form action="" name="sub0" method="post">
		<input type="text" name="a"/>
		<input type="text" name="b"/>
		<input type="text" name="c"/>
		全选：<input type="checkbox" onclick="swapCheck()" />
		<input type="checkbox" name="d" id="test1">
		<input type="checkbox" name="e" id="test2">
		<input type="button" onclick="sub1()" value="1">
		<input type="button" onclick="sub2()" value="2">
	</form>
</body>
</html>