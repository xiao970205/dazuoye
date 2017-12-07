﻿# java项目实训--书店  
## 2017.12.7
### 解决问题
1.详情页，购物车页的无session时跳转的问题<br>
2.页面跳转地址改为request.getContextPath()<br>
3.jsp跳转路径${pageContext.request.contextPath }<br>
4.将加减数量增加到详情页（仿京东）<br>
### 未解决问题
1.未实现加减数量的购物车<br>
2.未设计查找（多个关键字的交集，只实现了并集）<br>
3.搜索未实现表单js格式验证<br>
4.注册未实现表单js格式验证<br>
## 2017.12.7
### 解决问题 
1.刷新界面导致购物车数目改变<br>
（解决方法：中间加一次跳转,将购物车list加入session)<br>
2.实现商品详情页的购买数目增加减少<br>
(解决方法：用js的表单函数验证）<br>
### 未解决问题
1.未实现商品详情页的购买数目未添加到购物车<br>
2.商品详情页的并未实现商品增加样式的修改<br>
3.未设计查找（多个关键字的交集，只实现了并集）
4.搜索未实现表单js格式验证
5.注册未实现表单js格式验证
## 2017.12.6
### 实现功能：
1.用户登录<br> 
2.仿京东购物页面<br> 
3.购物车增加减<br> 
4.查找分页<br> 
### 问题：
1.未设计查找（多个关键字的交集，只实现了并集）
