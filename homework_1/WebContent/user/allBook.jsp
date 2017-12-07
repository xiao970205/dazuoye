<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/user/common/path.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>响应式布局</title>
<link type="text/css" rel="stylesheet" href="${path }Css/reset.css" />
<link type="text/css" rel="stylesheet" href="${path }Css/1024_768.css" />
<link type="text/css" rel="stylesheet"
	media="screen and (min-width:861px) and (max-width:960px)"
	href="${path }Css/pad_heng.css" />
<link type="text/css" rel="stylesheet"
	media="screen and (min-width:601px) and (max-width:860px)"
	href="${path }Css/pad.css" />
<link type="text/css" rel="stylesheet"
	media="screen and (min-width:481px) and (max-width:600px)"
	href="${path }Css/tel_heng.css" />
<link type="text/css" rel="stylesheet"
	media="screen and (max-width:480px)" href="${path }Css/tel.css" />
<link type="text/css" rel="stylesheet" href="css/normalize.css" />
<link rel="stylesheet" href="css/font-awesone.min.css" />
<link rel="stylesheet" type="text/css" href="css/demo.css" />
<link rel="stylesheet" href="css/style.css" />
</head>

<body>
	<div class="w_100_l top_title">
		<div class="main">
			<p>
				<a href="#">Buy more than one book and save big! </a><a href="#">Read
					more</a>
			</p>
		</div>
	</div>

	<div class="w_100_l">
		<div class="main">
			<%@ include file="top_index.jsp"%>
			<span class="index_img"><img
				src="${path }Images/banner_img.jpg" alt="Dan Cederholm" border="0"
				usemap="#Map" /> </span>
			<p class="index_hr"></p>
			<div class="content">
				<a href="/homework_0/book/show_paging">show_all</a>
				<form action="/homework_0/book/show_paging_0">
					<input type="text" placeholder="搜索从这里开始..." name="name" /> <input
						type="submit" value="搜索" />
				</form>
				<h1 class="h1_book_title">
					<a href="${pageContext.request.contextPath }/BookServlet">Also
						from A Book Apart</a>
				</h1>
				<ul>
					<c:forEach items="${list}" var="book">
						<c:set var="str" value="${path }Images/${book.book_img_min }"></c:set>
						<li>
							<dl>
								<dd>
									<a href="${pageContext.request.contextPath }/book/book_test_0?bookid=${book.book_id}">
										<img src="${str}" alt="book" />
									</a>
								</dd>
								<dt>
									
										<a
											href="${pageContext.request.contextPath }/book/book_test_0?bookid=${book.book_id}"
											>${book.book_name}</a>
									<br />
									<p class="book_inline">
										by<a href="${pageContext.request.contextPath }
											/book/show_paging_author
											?name=${book.book_author}">${book.book_author}
										  </a>
										，类型：<a href="${pageContext.request.contextPath }
											/book/show_paging_value
											?name=${book.book_value}">${book.book_value}
											  </a>，
										<br/>价格 ${book.book_price}
									</p>
									<a class="book_buy"
										href="${pageContext.request.contextPath }/book/book_test_0?bookid=${book.book_id}">BUY</a>
								</dt>
							</dl>
						</li>
					</c:forEach>
				</ul>

				<c:if test="${page != null && page.totalPages > 1 }">
					<p colspan="6" align="center" bgcolor="#5BA8DE">共${page.totalRecords}条记录
						共${page.totalPages}页 当前第${page.pageNo}页</p>
					<a
						href="${pageContext.request.contextPath }/book/<%=request.getAttribute("MethodName") %>?pageNo=${page.topPageNo}&name=<%= request.getAttribute("MethodValue")%>">首页</a>&nbsp;&nbsp;
							<c:if test="${page.pageNo!=1}">
						<a
							href="<%=request.getContextPath()%>/book/<%=request.getAttribute("MethodName") %>?pageNo=${page.previousPageNo }&name=<%= request.getAttribute("MethodValue")%>">上一页</a>&nbsp;&nbsp;
							</c:if>
					<c:if test="${page.pageNo != page.totalPages}">
						<a
							href="<%=request.getContextPath()%>/book/<%=request.getAttribute("MethodName") %>?pageNo=${page.nextPageNo }&name=<%= request.getAttribute("MethodValue")%>">下一页</a>&nbsp;&nbsp;
							</c:if>
					<a
						href="<%=request.getContextPath()%>/book/<%=request.getAttribute("MethodName") %>?pageNo=${page.bottomPageNo}&name=<%= request.getAttribute("MethodValue")%>">尾页</a>
				</c:if>
			</div>
			<%@ include file="footer_index.jsp"%>
		</div>
	</div>
	<div style="display: none">
		<script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540'
			language='JavaScript' charset='gb2312'></script>
	</div>
</body>
</html>