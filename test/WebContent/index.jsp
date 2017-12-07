<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
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
<br>
	<form action="/homework_0/book/show_select0">
		<input type="text" name="select"/><br>
		<input type="submit">
	</form>
	<br>
	<a href="/homework_0/book/show_paging">show_all</a>
	<br>
	<form action="/homework_0/book/show_name_paging">
		<input type="text" name="name"/><br>
		<input type="submit" value="名称查询"/>
	</form>
	<br>
	<form action="/homework_0/book/show_price_paging">
		min:<input type="text" name="min"/><br>
		max:<input type="text" name="max"/><br>
		<input type="submit" name="提交"/>
	</form>
	<br>
	<form action="/homework_0/book/show_paging_0">
		<input type="text" name="name"/><br>
		<input type="submit">
	</form>
	<br>
<%
	if(request.getAttribute("list")!=null){
%>
<form name="form">
  <table > 
    <tr>  
        <td>Id</td>  
        <td>Name</td>  
        <td>Title</td>  
        <td>phone</td> 
        <td>content</td> 
        <td>do</td>
    </tr>  
    <c:forEach items="${list }" var="book" varStatus="status">  
    <tr id="<c:out  value="${book.book_id}"/>"> 
        <td><input  value="${book.book_id}" readonly="readonly"/></td>  
        <td><input  name="list[${status.index}].book_name"      value="${book.book_name}"    readonly="readonly"/></td>  
        <td><input  name="list[${status.index}].book_author"     value="${book.book_author}"   readonly="readonly"/></td>  
        <td><input  name="list[${status.index}].book_value"     value="${book.book_value}"   readonly="readonly"/></td>
        <td><input  name="list[${status.index}].book_price"   value="${book.book_price}" readonly="readonly"/></td>     
    </tr> 
    </c:forEach>  
 </table>
</form>
   <br>
   <table>
       <tr>
            <td colspan="6" align="center" bgcolor="#5BA8DE">共${page.totalRecords}条记录 共${page.totalPages}页 当前第${page.pageNo}页<br>            
                <a href="<%=request.getContextPath()%>/book/<%=request.getAttribute("MethodName") %>?pageNo=${page.topPageNo}&name=<%= request.getAttribute("MethodValue")%>"><input type="button" name="fristPage" value="首页" /></a>
                <c:choose>
                  <c:when test="${page.pageNo!=1}">             
                      <a href="<%=request.getContextPath()%>/book/<%=request.getAttribute("MethodName") %>?pageNo=${page.previousPageNo }&name=<%= request.getAttribute("MethodValue")%>"><input type="button" name="previousPage" value="上一页" /></a>                
                  </c:when>
                  <c:otherwise>   
                      <input type="button" disabled="disabled" name="previousPage" value="上一页" />       
                  </c:otherwise>
                </c:choose>
                <c:choose>
                  <c:when test="${page.pageNo != page.totalPages}">
                    <a href="<%=request.getContextPath()%>/book/<%=request.getAttribute("MethodName") %>?pageNo=${page.nextPageNo }&name=<%= request.getAttribute("MethodValue")%>"><input type="button" name="nextPage" value="下一页" /></a>
                  </c:when>
                  <c:otherwise>    
                      <input type="button" disabled="disabled" name="nextPage" value="下一页" />
                  </c:otherwise>
                </c:choose>
                <a href="<%=request.getContextPath()%>/book/<%=request.getAttribute("MethodName") %>?pageNo=${page.bottomPageNo}&name=<%= request.getAttribute("MethodValue")%>"><input type="button" name="lastPage" value="尾页" /></a>
            </td>
        </tr>
     </table>
        <br>
</center> 
<%
	}
%>
</body>
</html>