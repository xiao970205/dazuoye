<%@ page language="java" contentType="text/html; charset=utf-8"  
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
<title>操作</title> 

</head>  
<body>  
<center>
<h1>留言信息列表</h1>
<%
	if(request.getAttribute("list")==null){
		response.sendRedirect("/homework_0/book/show_paging");
	}
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
                <a href="<%=request.getContextPath()%>/book/show_paging?pageNo=${page.topPageNo}"><input type="button" name="fristPage" value="首页" /></a>
                <c:choose>
                  <c:when test="${page.pageNo!=1}">             
                      <a href="<%=request.getContextPath()%>/book/show_paging?pageNo=${page.previousPageNo }"><input type="button" name="previousPage" value="上一页" /></a>                
                  </c:when>
                  <c:otherwise>   
                      <input type="button" disabled="disabled" name="previousPage" value="上一页" />       
                  </c:otherwise>
                </c:choose>
                <c:choose>
                  <c:when test="${page.pageNo != page.totalPages}">
                    <a href="<%=request.getContextPath()%>/book/show_paging?pageNo=${page.nextPageNo }"><input type="button" name="nextPage" value="下一页" /></a>
                  </c:when>
                  <c:otherwise>    
                      <input type="button" disabled="disabled" name="nextPage" value="下一页" />
                  </c:otherwise>
                </c:choose>
                <a href="<%=request.getContextPath()%>/book/show_paging?pageNo=${page.bottomPageNo}"><input type="button" name="lastPage" value="尾页" /></a>
            </td>
        </tr>
     </table>
        <br>
</center> 
</body>  
</html>  