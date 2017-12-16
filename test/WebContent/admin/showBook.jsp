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
					<div class="xinxitj">商品列表</div>

					<table class="am-table" id="table-0">
						<thead>
							<tr>
								<th>id</th>
								<th>书名</th>
								<th>类型</th>
								<th>作者</th>
								<th>出版社</th>
								<th>价格</th>
								<th>装裱方式</th>
								<th>图片地址</th>
								<th>ISBN</th>
								<th>书页</th>
								<th>开</th>
								<th>信息图地址</th>
								<th>小图地址</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="book">
								<tr>
									<th>${book.book_id}</th>
									<td>${book.book_name}</td>
									<td>${book.book_value}</td>
									<td>${book.book_author}</td>
									<td>${book.book_press}</td>
									<td>${book.book_price}</td>
									<td>${book.book_packing}</td>
									<td>${book.book_image}</td>
									<td>${book.book_ISBN}</td>
									<th>${book.book_pages_number}</th>
									<td>${book.book_folie}</td>
									<td>${book.book_introduction_img}</td>
									<td>${book.book_img_min}</td>
									<td><a href="${pageContext.request.contextPath }/Admin/Book/AdminUpdateBook0?id=${book.book_id }">修改</a>/<a
										href="${pageContext.request.contextPath }/Admin/Book/AdminDeleteBook?id=${book.book_id }">删除</a></td>
								</tr>
							</c:forEach>


						</tbody>
					</table>
					<c:if test="${page != null && page.totalPages > 1 }">
						<p colspan="6" align="center" bgcolor="#5BA8DE">共${page.totalRecords}条记录
							共${page.totalPages}页 当前第${page.pageNo}页</p><br>
						<a href="${pageContext.request.contextPath }/Admin/Book/<%=request.getAttribute("MethodName") %>?pageNo=${page.topPageNo}&name=<%= request.getAttribute("MethodValue")%>">首页</a>
					<c:if test="${page.pageNo!=1}">
					<br>
						<a align="center" href="<%=request.getContextPath()%>/Admin/Book/<%=request.getAttribute("MethodName") %>?pageNo=${page.previousPageNo }&name=<%= request.getAttribute("MethodValue")%>">上一页</a>
					</c:if>
					<c:if test="${page.pageNo != page.totalPages}">
					<br>
						<a href="<%=request.getContextPath()%>/Admin/Book/<%=request.getAttribute("MethodName") %>?pageNo=${page.nextPageNo }&name=<%= request.getAttribute("MethodValue")%>">下一页</a>
					</c:if>
					<br>
						<a href="<%=request.getContextPath()%>/Admin/Book/<%=request.getAttribute("MethodName") %>?pageNo=${page.bottomPageNo}&name=<%= request.getAttribute("MethodValue")%>">尾页</a>
					</c:if>
				</div>

				<%@ include file="footer_index.jsp"%>
			</div>

		</div>
	</div>
</body>
</html>