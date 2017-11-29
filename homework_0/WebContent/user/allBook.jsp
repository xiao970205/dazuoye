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
             <ul>
            	<c:forEach items="${subList}" var="book">
            	 <c:set var="str" value="${path }${book.bookImgurl }"></c:set>
				<li>
                	<dl>
                    	<dd><img src="${str}" alt="book" /></dd>
                        <dt>
                        	<p class="book_title"><a href="#" target="_blank">${book.bookName}</a></p>
                            <p class="book_inline">by${book.bookAuthor}，出版于${book.bookPublisher}，<br></>价格 ${book.bookPrice}</p>
                            <a class="book_buy" href="${pageContext.request.contextPath }/AddBookServlet?bookid=${book.bookId }" >BUY</a>
                        </dt>
                    </dl>
                </li>
				</c:forEach>
            </ul>
          <c:if test="${page != null && page.page_count > 1 }">
							<a href="${pageContext.request.contextPath }/BookServlet?current_page=1">首页</a>&nbsp;&nbsp;
							<c:if test="${page.current_page > 1 }">
								<a href="${pageContext.request.contextPath }/BookServlet?current_page=${page.current_page - 1 }">上一页</a>&nbsp;&nbsp;
							</c:if>
							<c:if test="${page.current_page != page.page_count }">
								<a href="${pageContext.request.contextPath }/BookServlet?current_page=${page.current_page + 1 }">下一页</a>&nbsp;&nbsp;
							</c:if>
							<a href="${pageContext.request.contextPath }/BookServlet?current_page=${page.page_count }">尾页</a>
		 </c:if>           	       	
      </div>
       <%@ include file="footer_index.jsp" %>
    </div>
</div>
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>