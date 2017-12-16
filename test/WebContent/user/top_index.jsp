<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="top_banner">
	<div class="top_logo">
		<img src="${path }Images/top_logo.jpg" alt="A BOOK APART LOGO" />
	</div>
	<div class="top_menu">
		<ul>
			<li ><a href="${path }index.jsp">主页</a></li>
			<li><a href="/homework_0/book/show_paging"">购买商品</a></li>
			<li><a href="${path }showInfo.jsp">查看个人信息</a></li>
			<li><a href="${path }shoppingCart.jsp">我的购物车</a></li>
			<li><a href="${pageContext.request.contextPath }/order/showAllOrder">我的订单</a></li>			
			<li><a href="#">帮助</a></li>
			<li><a href="#">投诉</a></li>
			<li><a href="${path }register.jsp">注册</a></li>
		</ul>

	</div>
	<c:if test="${user == null}">				
	<div class="top_shop_cur">
		请先<a href="${path }login.jsp">登录</a>
	</div>
	</c:if>
	<c:if test="${user != null}">				
	<div class="top_shop_cur">
		亲爱的${user.realName },您好!<br>
		<a href="${pageContext.request.contextPath }/loginuser/LoginOutServlet">注销</a>
	</div>
	</c:if>
	
</div>