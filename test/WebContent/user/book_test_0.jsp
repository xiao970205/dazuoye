<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/user/common/path.jsp"%>
<%@ page import="com.sh.entity.book"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">
.table0 {
	width: 60px;
	height: 44px;
	border: 0px solid #ababab;
}

.input1 {
	text-align: center;
	border: 1px solid #ababab;
	width: 43px;
	height: 42px;
}

.input2 {
	width: 25px;
	height: 23px;
	position: relative;
	left: 44px;
	top: -46px;
}

.input3 {
	width: 25px;
	height: 24px;
	position: relative;
	left: 16px;
	top: -24px;
}
</style>
<title>响应式布局</title>
<link type="text/css" rel="stylesheet" href="${path }Css/reset.css" />
<link type="text/css" rel="stylesheet" href="${path }Css/1024_768.css" />
<script type="text/javascript"
	src="${path }《龙族IV奥丁之渊（京东版随机附赠明信片）》(江南)【摘要 书评 试读】- 京东图书_files/conversion_async.js.下载"></script>
<script
	src="${path }《龙族IV奥丁之渊（京东版随机附赠明信片）》(江南)【摘要 书评 试读】- 京东图书_files/gtm.js.下载"></script>
<script
	src="${path }《龙族IV奥丁之渊（京东版随机附赠明信片）》(江南)【摘要 书评 试读】- 京东图书_files/push.js.下载"></script>
<link type="text/css" rel="stylesheet"
	href="${path }《龙族IV奥丁之渊（京东版随机附赠明信片）》(江南)【摘要 书评 试读】- 京东图书_files/saved_resource" />
<link rel="stylesheet" type="text/css"
	href="${path }《龙族IV奥丁之渊（京东版随机附赠明信片）》(江南)【摘要 书评 试读】- 京东图书_files/saved_resource(1)" />
<script
	src="${path }《龙族IV奥丁之渊（京东版随机附赠明信片）》(江南)【摘要 书评 试读】- 京东图书_files/saved_resource(2)"></script>
<script
	src="${path }《龙族IV奥丁之渊（京东版随机附赠明信片）》(江南)【摘要 书评 试读】- 京东图书_files/log_client.js.下载"></script>
<script
	src="${path }《龙族IV奥丁之渊（京东版随机附赠明信片）》(江南)【摘要 书评 试读】- 京东图书_files/saved_resource(3)"></script>
<link charset="utf-8" rel="stylesheet"
	href="${path }《龙族IV奥丁之渊（京东版随机附赠明信片）》(江南)【摘要 书评 试读】- 京东图书_files/saved_resource(4)" />
<link charset="utf-8" rel="stylesheet"
	href="${path }《龙族IV奥丁之渊（京东版随机附赠明信片）》(江南)【摘要 书评 试读】- 京东图书_files/saved_resource(5)" />
</head>
<%
	book book = (book) request.getSession().getAttribute("book");
	if (book == null) {
		response.setContentType("text/html; charset=UTF-8");
		response.sendRedirect(request.getContextPath());
		return;
	}
%>
<body>
	<div class="w_100_l top_title">
		<div class="main">

			<p>
				<a href="">Buy more than one book and save big! </a><a href="#">Read
					more</a>
			</p>
		</div>
	</div>

	<div class="w_100_l">
		<div class="main">
			<%@ include file="top_index.jsp"%>
			<div id="root-nav">
				<div class="w">
					<div class="breadcrumb">
						<strong> <a href="">图书</a>
						</strong> <span>&nbsp;&gt;&nbsp; <a href="">青春文学</a>&nbsp;&gt;&nbsp;
							<a href="">${book.book_value }</a>&nbsp;&gt;&nbsp;
						</span> <span> <a href="">${book.book_name }</a>
						</span>
					</div>
				</div>
			</div>
			<div class="p-box">
				<div class="w">
					<div id="product-intro" class="m-item-grid clearfix">

						<div id="preview">
							<div id="spec-n1" class="jqzoom">
								<!-- 以下部分显示左侧大图 -->
								<img width="350" height="350"
									src="${path }Images/${book.book_image }" />
							</div>

							<div id="short-share">
								<a id="share-list" class="share-list" href=""> <b></b><em>分享</em>
								</a> <a id="choose-btn-coll" class="choose-btn-coll" href=""><b></b><em>关注商品</em></a>
								<div class="right-btns">
									<a class="report-btn" href="" target="_blank">举报</a>
								</div>
							</div>
						</div>

						<div class="m-item-inner">
							<div id="itemInfo">
								<div id="name">
									<!-- 显示书名 -->
									<h1>${book.book_name }</h1>
									<!-- 简介 -->
									<div id="p-ad" class="p-ad J-ad-11827512">${book.book_introduction }</div>
									<div class="p-author" id="p-author">
										<!-- 作者 -->
										<a target="_blank"
											href="/book/show_paging_author?name=${book.book_author }">${book.book_author }</a>
										著
									</div>
								</div>
								<div id="summary">
									<div class="summary-info J-summary-info clearfix">
										<div id="comment-count" class="comment-count item fl">
											<p class="comment">累计评价</p>
											<!-- 评价总数 -->
											<a class="count J-comm-11827512" href="">1万+</a>
										</div>
									</div>
									<div id="summary-price">
										<div class="dt">新 售 价：</div>
										<div class="dd">
											<!-- 售价 -->
											<%
												double price = (book.getBook_price() * 0.75);
											%>
											<strong class="p-price" id="jd-price">￥<%=price%></strong> <span
												class="p-discount">[7.5折]</span> <span class="pricing">[定价：
												<del id="page_maprice">￥${book.book_price }.00</del> ]
											</span>


										</div>
									</div>

									<div id="summary-quan" class="li p-choose hide"
										style="display: block;">
										<div class="dt">优 惠 券：</div>
										<div class="dd">
											<dl>
												<dt class="fl"></dt>
												<dd class="lh">
													<a class="J-open-tb" href="" title="仅可购买自营图书音像商品 有效期3天">
														<span class="quan-item"> <s></s><b></b> <span
															class="text">满105减6</span>
													</span> <span class="quan-item"> <s></s><b></b> <span
															class="text">满200减16</span>
													</span>
													</a>
												</dd>
											</dl>
										</div>
									</div>
									<div id="summary-support" class="li hide"
										style="display: block;">
										<div class="dt">增值业务：</div>
										<div class="dd">
											<ul class="choose-support lh">
												<li class="giftbuy"><a target="_blank"
													title="可为商品选择京东定制礼品包装和贺卡后下单" href=""> <i
														class="giftbuy"></i> <span>礼品包装</span>
												</a></li>
											</ul>
										</div>
									</div>
									<div id="summary-order" class="li">
										<div class="dt">排 名：</div>
										<div class="dd">
											<a href="" target="_blank">青春文学销量榜 </a> 第 <font
												style="color: red;">24</font> 位
										</div>
									</div>
									<div id="summary-stock">
										<div class="dt">配 送 至：</div>
										<div class="dd clearfix">
											<div id="store-selector" class="">
												<!-- 地址 -->
												<div class="text">
													<div title="">石家庄</div>
													<b></b>
												</div>
											</div>
											<div id="store-prompt">
												<strong>有货</strong>，支持&nbsp;<a href="" target="_blank">99元免基础运费(20kg内)</a>&nbsp;&nbsp;|&nbsp;&nbsp;
												<a href="">货到付款</a> <span class="charges"></span>
											</div>
										</div>
										<span class="clr"></span>
									</div>
									<div id="summary-service">
										<div class="dt">服 务：</div>
										<div class="dd">
											由 <span class="hl_red">卖家</span> 发货, 并提供售后服务. 23:00前下单,预计<b>明天(12月04日)</b>送达
										</div>
									</div>
									<div id="summary-weight" class="li" style="">
										<div class="dt">重 量：</div>
										<div class="dd">0.59kg</div>
									</div>
								</div>

								<div id="choose" class="clearfix p-choose-wrap">
									<div id="choose-attrs">
										<div id="choose-attr-1" class="li p-choose">
											<div class="dt">选择系列：</div>
											<!-- 同一系列 -->
											<div class="dd">
												<div class="item" title="龙族1：火之晨曦">
													<b></b> <a href=""> <img
														src="${path }Images/5680f66fN4739e275.jpg" width="25"
														height="25" alt="龙族1：火之晨曦" /><i>龙族1：火之晨曦</i></a>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div id="choose-btns" class="li">
									<!-- 选择数量 -->
									<script type="text/javascript">
										function j2s() {

											x = document.getElementById("test").value;
											x = parseInt(x)
											x = x + 1;
											document.getElementById("test").value = x;
										}
										function jian2s() {
											x = document.getElementById("test").value;
											x = x - 1;
											if (x > 0) {

												document.getElementById("test").value = x;
											}

										}
									</script>
									<form>
										<div class="table0" style="float:left">
											<input type="text" class="input1" id="test" value="1" />
											<button type="button" class="input2" onclick="j2s()">+</button>
											<button type="button" class="input3" onclick="jian2s()">-</button>
										</div>
										<div style="width: 40px; height: 10px; float: left"></div>
										<!-- 加入购物车 -->
										<div class="btn" id="choose-btn-append" style="float: left">
											<a class="btn-append "
												href="${pageContext.request.contextPath }/cart/add_cart?bookid=${book.book_id }">加入购物车<b></b></a>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="w">
				<div class="right">
					<div id="product-detail" class="m m1">
						<div class="mt J-detail-tab" id="pro-detail-hd"></div>
						<div class="ui-switchable-panel ui-switchable-panel-selected"
							style="display: block;">
							<div class="mc" id="product-detail-1">
								<div class="p-parameter">
									<ul id="parameter2" class="p-parameter-list">
										<li title="长江出版社">出版社： <a target="_blank" href="">${book.book_press }</a>
										</li>
										<li title="9787549237814">ISBN：${book.book_ISBN }</li>
										<li title="1">版次：1</li>
										<li title="11827512">商品编码：11827512</li>
										<li title="平装">包装：${book.book_packing }</li>
										<li title="16开">开本：16开</li>
										<li title="2015-10-01">出版时间：2015-10-01</li>
										<li title="轻型纸">用纸：轻型纸</li>
										<li title="374">页数：${book.book_page_number }</li>
										<li title="300000">字数：300000</li>
									</ul>
								</div>
								<div id="book-timeline"
									class="book-timeline book-timelineV2 hide"></div>
								<div class="detail-content clearfix z-have-detail-nav">
									<div class="detail-content-wrap">

										<div class="detail-content-item">
											<div id="activity_header"></div>
											<div id="J-detail-content">
												<div id="detail-tag-id-1" class="book-detail-item">
													<div class="item-mt">
														<h3>内容介绍</h3>
													</div>
													<div class="item-mc">
														<div class="book-detail-content">
															<p>
																<img title="11827512_2.jpg"
																	src="${path }Images/${book.book_introduction_img }" />
															</p>
														</div>
													</div>
												</div>
											</div>
											<div id="activity_footer"></div>
										</div>
									</div>

								</div>

							</div>
						</div>
						<div class="ui-switchable-panel mc hide" id="product-detail-4"
							style="display: none;"></div>

					</div>

					<div id="comments-list" class="m">
						<div class="mt">
							<div class="mt-inner m-tab-trigger-wrap clearfix">
								<ul class="m-tab-trigger">
									<li class="ui-switchable-item trig-item curr"><a href="">全部评价<em>(1万+)</em></a></li>
									<li class="ui-switchable-item trig-item"><a href="">晒图<em>(500)</em></a></li>
									<li class="ui-switchable-item trig-item"><a href="">好评<em>(9800+)</em></a></li>
									<li class="ui-switchable-item trig-item"><a href="">中评<em>(200+)</em></a></li>
									<li class="ui-switchable-item trig-item"><a href="">差评<em>(100+)</em></a></li>
									<li class="trig-item hide"><a href="">试用报告<em>()</em></a></li>
									<li class="comm-curr-sku trig-item"><span> <input
											type="checkbox" id="comm-curr-sku" />
									</span> <label for="comm-curr-sku">只看当前商品评价</label></li>
								</ul>
								<div class="fr">
									<div class="sort-select J-sort-select hide">
										<div class="current">
											<span class="J-current-sortType">推荐排序</span><i></i>
										</div>
										<div class="others">
											<div class="curr">
												<span class="J-current-sortType">推荐排序</span><i></i>
											</div>
											<ul>
												<li class="J-sortType-item">推荐排序</li>
												<li class="J-sortType-item">时间排序</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div id="comment-0"
							class="mc ui-switchable-panel comments-table ui-switchable-panel-selected"
							style="display: block;">
							<div class="com-table-main">
								<div class="comments-item">
									<div class="com-item-main clearfix">
										<div class="column column1">
											<div class="grade-star g-star5"></div>
											<div class="comment-time type-item">2015-11-07 22:10</div>
											<div class="features type-item">
												<ul class="clearfix">
												</ul>
											</div>
										</div>
										<div class="column column2">
											<div class="p-comment">收到了?超级超级超级超级超级超级开心? 书啊 台历啊 海报啊
												小画册啊都保护的很好?但是礼盒的盒子也许是因为快递的原因坏了好几个地方?看起来超级心痛?也许避免不了吧?不过为了南大我忍了?希望大卖?and龙蛋们赶紧入手吧~</div>
											<div class="p-otherFeatures">
												<ul class="clearfix">
												</ul>
											</div>
											<div class="J-p-show-img p-show-img clearfix"
												style="display: block;">
												<ul class="clearfix">
													<!--1-->
													<!--0-->
													<li><div class="J-show-more-pic">
															<img src="${path }Images/563e06b9Nbf2cd707.jpg"
																alt="1***p 的晒单图片" />
														</div></li>
												</ul>
											</div>
											<div class="J-big-photo p-photos hide"></div>
											<div class="comment-operate">
												<a class="nice J-nice" href="" title="4">点赞（4）</a> <a
													class="replylz J-reply-trigger" href="" target="_blank">回复（<span>1</span>）
												</a>
												<div class="reply-textarea J-reply-con hide">
													<div class="reply-arrow">
														<b class="layer1"></b><b class="layer2"></b>
													</div>
													<div class="inner">
														<textarea class="reply-input J-reply-input"></textarea>
														<div class="operate-box">
															<span class="txt-countdown">还可以输入<em>120</em>字
															</span> <a class="reply-submit J-submit-reply J-submit-reply-lz"
																href="" target="_self">提交</a>
														</div>
													</div>
												</div>
											</div>
											<div class="comment-replylist"></div>
										</div>
										<div class="column column3">
											<div class="user-item clearfix">
												<img src="${path }Images/peisong.jpg" width="25" height="25"
													alt="1***p" class="user-ico" />
												<div class="user-name">1***p</div>
											</div>
											<div class="type-item">
												<span class="u-vip-level" style="color: #666666">银牌会员</span>
											</div>
											<div class="user-item">
												<span class="user-access">来自京东Android客户端</span>
											</div>
										</div>
									</div>
								</div>

							</div>
							<div
								class="J-reputaton-default comment-default-good-reputation hide">还有2000+位用户给了默认评价</div>
							<div class="com-table-footer">
								<!-- 评论分页功能 -->
								<div class="ui-page-wrap clearfix">
									<div class="ui-page">
										<a rel="1" class="ui-page-curr" href="javascript:void(0)">1</a><a
											rel="2" href="">2</a><a rel="3" href="">3</a><a rel="4"
											href="">4</a><a rel="5" href="">5</a><a rel="6" href="">6</a><span>...</span>
										<a rel="2" class="ui-pager-next" href="">下一页</a>
									</div>
								</div>
							</div>
						</div>

					</div>
					<div id="try-report" class="m try-report"></div>
					<div style="display: none">
						<a href="">销售联盟</a><a href="">京东公益</a><a href="">友情链接</a>

					</div>
				</div>
				<div class="left">

					<div id="view-buy" class="m m2 related-buy"></div>
					<div id="reco_104002" class="m m2 related-buy">
						<div class="mt">
							<h2>达人选购</h2>
						</div>
						<div class="mc">
							<ul>
								<li class="fore1">
									<div class="p-img">
										<a target="_blank" title="曹文轩纯美小说：草房子（2016版）" href=""> <img
											height="100" width="100" alt="曹文轩纯美小说：草房子（2016版）"
											src="${path }Images/59e5a7efNc8a36761.jpg" /></a>
									</div>
									<div class="p-name ac">
										<a target="_blank" title="曹文轩纯美小说：草房子（2016版）" href="">曹文轩纯美小说：草房子（2016版）</a>
									</div>
									<div class="p-price">
										<strong class="J-p-11911791">￥12.80</strong>
									</div>
								</li>
								<li class="fore2">
									<div class="p-img">
										<a target="_blank" title="红星照耀中国（青少版） " href=""> <img
											height="100" width="100" alt="红星照耀中国（青少版） "
											src="${path }Images/593a460aNe3be65ad.jpg" /></a>
									</div>
									<div class="p-name ac">
										<a target="_blank" title="红星照耀中国（青少版） " href="">红星照耀中国（青少版）
										</a>
									</div>
									<div class="p-price">
										<strong class="J-p-12093815">￥21.50</strong>
									</div>
								</li>
								<li class="fore3">
									<div class="p-img">
										<a target="_blank" title="新版林格伦作品选集 美绘版-长袜子皮皮" href=""> <img
											height="100" width="100" alt="新版林格伦作品选集 美绘版-长袜子皮皮"
											src="${path }Images/555bda38Na32e9ad6.jpg" /></a>
									</div>
									<div class="p-name ac">
										<a target="_blank" title="新版林格伦作品选集 美绘版-长袜子皮皮" href="">新版林格伦作品选集
											美绘版-长袜子皮皮</a>
									</div>
									<div class="p-price">
										<strong class="J-p-10086823">￥12.80</strong>
									</div>
								</li>
								<li class="fore4">
									<div class="p-img">
										<a target="_blank" title="杨红樱笑猫日记（新套装共20册）" href=""> <img
											height="100" width="100" alt="杨红樱笑猫日记（新套装共20册）"
											src="${path }Images/58620bc7N594bedaa.jpg" /></a>
									</div>
									<div class="p-name ac">
										<a target="_blank" title="杨红樱笑猫日记（新套装共20册）" href="">杨红樱笑猫日记（新套装共20册）</a>
									</div>
									<div class="p-price">
										<strong class="J-p-11579219">￥225.00</strong>
									</div>
								</li>
								<li class="fore5">
									<div class="p-img">
										<a target="_blank" title="追风筝的人" href=""> <img
											height="100" width="100" alt="追风筝的人"
											src="${path }Images/rBEhVVHD7AwIAAAAAAQs0hn4M90AAAaJwGGLAcABCzq334.jpg" /></a>
									</div>
									<div class="p-name ac">
										<a target="_blank" title="追风筝的人" href="">追风筝的人</a>
									</div>
									<div class="p-price">
										<strong class="J-p-11258976">￥17.70</strong>
									</div>
								</li>
								<li class="fore6">
									<div class="p-img">
										<a target="_blank" title="中国科幻基石丛书·三体（2）黑暗森林" href=""> <img
											height="100" width="100" alt="中国科幻基石丛书·三体（2）黑暗森林"
											src="${path }Images/592bf161N3c12cc3a.jpg" /></a>
									</div>
									<div class="p-name ac">
										<a target="_blank" title="中国科幻基石丛书·三体（2）黑暗森林" href="">中国科幻基石丛书·三体（2）黑暗森林</a>
									</div>
									<div class="p-price">
										<strong class="J-p-10199768">￥21.20</strong>
									</div>
								</li>
								<li class="fore7">
									<div class="p-img">
										<a target="_blank" title="目送（插图新版） " href=""> <img
											height="100" width="100" alt="目送（插图新版） "
											src="${path }Images/rBEhU1LTYSEIAAAAAAKQOvTi7DUAAH3VAEIpbgAApBS735.jpg" /></a>
									</div>
									<div class="p-name ac">
										<a target="_blank" title="目送（插图新版） " href="">目送（插图新版） </a>
									</div>
									<div class="p-price">
										<strong class="J-p-11391416">￥25.80</strong>
									</div>
								</li>
								<li class="fore8">
									<div class="p-img">
										<a target="_blank" title="天才在左疯子在右完整版　[荐书联盟推荐]" href=""> <img
											height="100" width="100" alt="天才在左疯子在右完整版　[荐书联盟推荐]"
											src="${path }Images/592bf16cN9315c9fc.jpg" /></a>
									</div>
									<div class="p-name ac">
										<a target="_blank" title="天才在左疯子在右完整版　[荐书联盟推荐]" href="">天才在左疯子在右完整版
											[荐书联盟推荐]</a>
									</div>
									<div class="p-price">
										<strong class="J-p-11825528">￥27.50</strong>
									</div>
								</li>
							</ul>
						</div>
					</div>



					<div id="side-ad" class="m"></div>

				</div>
				<span class="clr"></span>
			</div>

		</div>
		<%@ include file="footer_index.jsp"%>
	</div>

	<div style="display: none">
		<script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540'
			language='JavaScript' charset='gb2312'></script>
	</div>
</body>
</html>