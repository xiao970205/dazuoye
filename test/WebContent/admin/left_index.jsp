<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="nav-navicon admin-main admin-sidebar">
	<c:if test="${admin == null}">	
	<div class="sideMenu am-icon-dashboard"
		style="color: #aeb2b7; margin: 10px 0 0 0;">&nbsp&nbsp&nbsp&nbsp请先<a href="${path }login.jsp">登录</a></div>			
	</c:if>
	<c:if test="${admin != null}">				
	<div class="sideMenu am-icon-dashboard"
		style="color: #aeb2b7; margin: 10px 0 0 0;">欢迎系统管理员：<br>&nbsp&nbsp&nbsp&nbsp${admin.realName }<br>
		<a href="${pageContext.request.contextPath }/LoginOutServlet2">注销</a>
		
	</div>
	</c:if>
	
	<div class="sideMenu">
		<h3 class="am-icon-flag">
			<em></em> <a href="#">系统设置</a>
		</h3>
		<ul>
			<li><a href="${path }index.jsp">后台首页</a></li>
			<li><a href="#">留言页</a></li>

		</ul>
		<h3 class="am-icon-cart-plus">
			<em></em> <a href="#"> 订单管理</a>
		</h3>
		<ul>
			<li><a href="${pageContext.request.contextPath }/order/showAllOrder">查看所有订单</a></li>
			<li><a href="${path }finOrder.jsp">搜索订单</a></li>
		</ul>
		<h3 class="am-icon-users">
			<em></em> <a href="#">商品管理</a>
		</h3>
		<ul>
			<li><a href="${pageContext.request.contextPath }/Admin/Book/AdminFindAllBook">商品列表</a></li>
			<li><a href="${path }addBook.jsp">添加商品</a></li>
			<li><a href="${path }selectBook.jsp">商品搜索</a></li>
		</ul>
		<h3 class="am-icon-volume-up">
			<em></em> <a href="#">管理员维护</a>
		</h3>
		<ul>			
			<li><a href="${pageContext.request.contextPath }/ShowAdminServlet2">查看所有管理员</a></li>	
			<li><a href="#">修改密码</a></li>		
			<li><a href="${path }addAdmin.jsp">新增管理员</a></li>
		</ul>
		<h3 class="am-icon-gears">
			<em></em> <a href="#">用户管理</a>
		</h3>
		<ul>
			<li><a href="${pageContext.request.contextPath }/ShowUserServlet2"">管理用户</a></li>
		</ul>
	</div>
	<!-- sideMenu End -->

	<script type="text/javascript">
			jQuery(".sideMenu").slide({
				titCell:"h3", //鼠标触发对象
				targetCell:"ul", //与titCell一一对应，第n个titCell控制第n个targetCell的显示隐藏
				effect:"slideDown", //targetCell下拉效果
				delayTime:300 , //效果时间
				triggerTime:150, //鼠标延迟触发时间（默认150）
				defaultPlay:true,//默认是否执行效果（默认true）
				returnDefault:true //鼠标从.sideMen移走后返回默认状态（默认false）
				});
			</script>
</div>