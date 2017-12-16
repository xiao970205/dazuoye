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
<script type="text/javascript">
function checkForm(){

    //获得input对象
    var bookname = document.getElementById("bookname");
    var author = document.getElementById("author");
    var publisher = document.getElementById("publisher");
    var price = document.getElementById("price");
    var description = document.getElementById("description");
    var imgurl = document.getElementById("imgurl");
    var typeid = document.getElementById("typeid");  
     if(bookname == null || bookname.value == ""){
        alert("书名不能为空！");
         return false;
     } else if(author == null || author.value == ""){
        alert("请填写作者！");
         return false;
     }else if(publisher == null || publisher.value == ""){
        alert("请填写出版社！");
         return false; 
     }else if(price == null || price.value == ""){
         alert("请填写图书价格！");
          return false; 
      }else if(description == null || description.value == ""){
          alert("请填写图书描述！");
          return false; 
      }else if(imgurl == null || imgurl.value == ""){
          alert("请填写真实图片地址！");
          return false; 
      }else if(typeid == null || typeid.value == ""){
          alert("请填写真实图书类型！");
          return false; 
      }
     return true;
}
</script>
<style type="text/css">
#last {
	position: fixed;
	bottom: 0;
}

.contact_form {
	width: 355px;
	float: left;
	padding: 25px;
	margin: 20px 0 0 15px;
	_margin: 20px 0 0 5px;
	border: 1px #DFD1D2 dashed;
	position: relative;
}

.form_row {
	width: 350px;
	_width: 355px;
	clear: both;
	padding: 10px 0 10px 0;
	_padding: 5px 0 5px 0;
	color: #a53d17;
}

label.contact {
	width: 75px;
	float: left;
	font-size: 16px;
	text-align: right;
	padding: 4px 5px 0 0;
	color: #333333;
}

input.contact_input {
	width: 253px;
	height: 27px;
	background-color: #fff;
	color: #999999;
	border: 1px #DFDFDF solid;
	float: left;
}

.terms {
	width:800px;
	padding: 0 0 0 80px;
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
					<div class="xinxitj">新增图书</div>
					<form action="${pageContext.request.contextPath }/Admin/Book/AdminAddBook"
						method="post" onsubmit="return checkForm();">
						<div class="form_row">
							<label class="contact"><strong>书名:</strong></label> <input
								type="text" class="contact_input" name="book_name" id="bookname" />
						</div>
						<div class="form_row">
							<label class="contact"><strong>图书类型:</strong></label> <input
								type="text" class="contact_input" name="book_value" id="typeid" />
								<div class="terms">必填项,请填数据库中存在的类型</div>
						</div>
						<div class="form_row">
							<label class="contact"><strong>作者:</strong></label> <input
								type="text" class="contact_input" name="book_author" id="author" />
						</div>
						<div class="form_row">
							<label class="contact"><strong>出版社:</strong></label> <input
								type="text" class="contact_input" name="book_press"
								id="publisher" />
						</div>
						<div class="form_row">
							<label class="contact"><strong>价格:</strong></label> <input
								type="text" class="contact_input" name="book_price" id="price" />
						</div>
						<div class="form_row">
							<label class="contact"><strong>内容:</strong></label> <input
								type="text" class="contact_input" name="book_Introduction" id="description" />
						</div>
						<div class="form_row">
							<label class="contact"><strong>装裱方式:</strong></label> <input
								type="text" class="contact_input" name="book_packing" />
						</div>
						<div class="form_row">
							<label class="contact"><strong>ISBN:</strong></label> <input
								type="text" class="contact_input" name="book_ISBN" />
						</div>
						<div class="form_row">
							<label class="contact"><strong>页数:</strong></label> <input
								type="text" class="contact_input" name="book_page_number" />
						</div>
						<div class="form_row">
							<label class="contact"><strong>书开:</strong></label> <input
								type="text" class="contact_input" name="book_folie" />
						</div>
						<div class="form_row">
							<label class="contact"><strong>图片地址:</strong></label> <input
								type="text" class="contact_input" name="book_image" id="imgurl" />
						</div>
						<div class="form_row">
							<label class="contact"><strong>小图片地址:</strong></label> <input
								type="text" class="contact_input" name="book_img_min" />
						</div>
						<div class="form_row">
							<label class="contact"><strong>详情图片地址:</strong></label> <input
								type="text" class="contact_input" name="book_introduction_img"/>
						</div>
						<div class="form_row">
							<input type="submit" class="register" value="添加" />
						</div>
					</form>
				</div>
				<%@ include file="footer_index.jsp"%>
			</div>

		</div>
	</div>
</body>
</html>