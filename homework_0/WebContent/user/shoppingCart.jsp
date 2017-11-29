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
<script type="text/javascript">
function sub() {
	var products = document.getElementsByName("productid");
	if (products.length == 0) {
		alert("您还没有挑选任何商品呢哦~");
	}else {
		document.productForm.submit();
	}
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
            <h1 class="h1_book_title"><a href="${pageContext.request.contextPath }/BookServlet">Also from A Book Apart</a></h1> 
				
					<table id="table-4">
						<tr>
							<th>书名</th>
							<th>单价</th>
							<th>数量</th>
							<th>操作</th>
						</tr>
						<c:forEach items="${sessionScope.cart }" var="bcb">
							<tr>
								<td>${bcb.bookBean.bookName }</td>
								<td>${bcb.bookBean.bookPrice}</td>
								<td><input type="hidden" name="productid"value="${bcb.bookBean.bookId}" /> 
									<a href="${pageContext.request.contextPath }/AddBookServlet?bookid=${bcb.bookBean.bookId }">+&nbsp[</a>
									${bcb.bookCount}
									<a href="${pageContext.request.contextPath }/CutBookServlet?bookid=${bcb.bookBean.bookId }">]&nbsp-</a></td>
								<td><a href="${pageContext.request.contextPath }/DeleteBookServlet?bookid=${bcb.bookBean.bookId }">删除</a></td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="4" style="text-align: center;">
								<form action="${pageContext.request.contextPath }/OrderServlet" method="post" >
									<input type="submit" value="生成订单" onclick="sub();" />
								</form>
							</td>
						</tr>
					</table>
				
			</div>
       <%@ include file="footer_index.jsp" %>
    </div>
 </div>
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>