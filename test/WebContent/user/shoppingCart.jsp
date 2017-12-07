<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/user/common/path.jsp" %>
    <%@ page import="com.sh.entity.book_cart_type" %>
    <%@ page import="java.util.List" %>
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
</head>

<body>
<%
	if(request.getSession().getAttribute("user")==null){
		response.setContentType("text/html; charset=UTF-8");   
		response.sendRedirect("request.getContextPath()");  
		return;
	}
%>
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
						
						<%

							int a=0;
							List<book_cart_type> books=(List<book_cart_type>)request.getSession().getAttribute("cart");
							if(books!=null|books.size()==0){
								int c=0;
								for(int i=0;i<books.size();i++){
									if(books.get(i).getBook_num()==0){
										books.remove(i);
									}
								}
								
								
								
						%>
						<tr>
							<th></th>
							<th>书名</th>
							<th>单价</th>
							<th>数量</th>
							<th>操作</th>
						</tr>
						<%
							for(int i=0;i<books.size();i++){
								a+=(books.get(i).getBook_price()*books.get(i).getBook_num());
						%>
						
						<tr>
							<td>
								<img src="${path }Images/<%=books.get(i).getBook_img_min() %>" />
							</td>
							<td><%=books.get(i).getBook_name() %></td>
							<td><%=books.get(i).getBook_price() %></td>
							<td><%=books.get(i).getBook_num() %></td>
							<td>
								<a href="${pageContext.request.contextPath }/cart/add_cart?bookid=<%=books.get(i).getId() %>"><img src="${path }Images/jiahao.gif" width="50px" height="50px"/></a>
								<a href="${pageContext.request.contextPath }/cart/jian_cart?bookid=<%=books.get(i).getId() %>"><img src="${path }Images/jianhao.gif" width="50px" height="50px"/></a>
								<a href="${pageContext.request.contextPath }/cart/delete_cart?bookid=<%=books.get(i).getId() %>"><img src="${path }Images/chahao.gif" width="50px" height="50px"/></a>
							</td>
						</tr>
						<%
							}
						%>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td>总价：<%=a %>元</td>
						</tr>
						<tr>
							<td colspan="5" style="text-align: right;">
								<form  method="post" action="">
										<input type="hidden" name="bookid" value="${book.book_id }"/>
										<input type="submit" value="" 
											style="width:213px;height:96px;
												background:url(${path }Images/tijiao2.gif)">
										</input>
								</form>
							</td>
						</tr>
						<%
							}else
							{
						%>
						<tr>
							<td colspan="5">您还没有购买任何商品！</td>
						</tr>
						<%
								
							}
						%>
						
					</table>
				
			</div>
       <%@ include file="footer_index.jsp" %>
    </div>
 </div>
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>