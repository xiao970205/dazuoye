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
<style type="text/css">
#table-0 {
	align: center;
	margin-left: 260px;
}

#last {
	position: fixed;
	bottom: 0;
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
					<div class="xinxitj">搜索商品</div>
						<form action="${pageContext.request.contextPath }/Admin/Book/select">
							<input type="text" placeholder="搜索从这里开始..." name="name" /> 
							<input type="submit" value="搜索" />
						</form>
				<%@ include file="footer_index.jsp"%>
			</div>

		</div>
	</div>
</body>
</html>