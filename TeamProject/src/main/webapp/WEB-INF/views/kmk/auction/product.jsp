<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>

<%@ include file="/WEB-INF/views/include/header.jsp"%>

<link rel="stylesheet" href="/resources/css/product/product.css" type="text/css">
<link rel="stylesheet" href="/resources/css/product/concept.css" type="text/css">
<link href="/resources/js/photo-layer/bxslider.css" rel="stylesheet">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="/resources/js/photo-layer/bxslider.js"></script> 
  
<style> 
.col-lg-offset-1 {
    margin-left: 8.33333333%;
} 
</style>
 
<div class="container" style="margin-top: 120px;"> 
	<div class="contant-body">
		<div class="col-lg-10 col-lg-offset-1 top-border">
			<div class="row"> 
				<div class="col-lg-7">
					<div class="row">
						<div class="sns-shere">
							<span>${productVo.pno}</span>
						</div>
					</div>
				</div>
				<div class="col-lg-5">
					<div class="row">
						<div class="count-down">
							<div class="count-info">
								<p>
									<strong>남은시간</strong>
									<span class="import-color" id="time" data-until="${productVo.p_until}">로딩중</span>
									<strong>마감</strong>
									<fmt:formatDate value="${productVo.p_until}" pattern="MM-dd() HH:mm" var="until_date"/>${until_date} 
								</p>
							</div> 
						</div> 
					</div>
				</div>
			</div>
<style type="text/css">
#box {
	width: 100%;
	height: 384px;
	padding-top: 80px;
	margin: 60px;
	position: relative;
	margin: auto;
}

#box img {
	display: block;
	position: absolute;
	top: 0%;
	right: 0;
	bottom: 0;
	left: 0%;
	width: 80%;
}
</style>
			<div class="row">
				<div class="col-lg-7 col-xs-12 ">
					<div class="row">
						<div class="col-lg-10 col-xs-12">
							<div class="row">
								<div class="thumbnail ">
									<a class=" text-center moreview btn-example"
										id="target_lightgallery" 
										style="width: 100%; display: table-cell; vertical-align: middle;">
										<ul class="th-list lightgallery">
											<li class="plpl" data-responsive="/resources/img/bag/${productVo.p_img}"
												data-src="/resources/img/bag/${productVo.p_img}" alt="1"><img class=""
												src="/resources/img/bag/${productVo.p_img}"/></li>
											<li class="plpl" data-responsive="/_img/data/2007/001 2.jpg"
												data-src="/_img/data/2007/001 2.jpg " alt="2"><img class=""
												src="/_img/data/2007/001 2.jpg" /></li>
											<li class="plpl" data-responsive="/_img/data/2007/001 3.jpg"
												data-src="/_img/data/2007/001 3.jpg" alt="3"><img class=""
												src="/_img/data/2007/001 3.jpg" /></li>
										</ul>
									</a>
								</div>
							</div> 
						</div>
						<div class="col-lg-2 col-xs-12 ">
							<div class="row">
								<div class="th-body" id="thr">
									<a data-slide-index="0" class="image"> <span class="trick">
											<img class="img" src="/resources/img/bag/${productVo.p_img}" alt="1" />
									</span>
									</a> <a data-slide-index="1" class="image"> <span class="trick">
											<img class="img" src="/_img/data/2007/T/001 2.jpg" alt="2" />
									</span>
									</a> <a data-slide-index="2" class="image"> <span class="trick">
											<img class="img" src="/_img/data/2007/T/001 3.jpg" alt="3" />
									</span>
									</a>
								</div>
							</div>
						</div>
					</div>
<style type="text/css">
</style>
<script type="text/javascript">
	$('.th-list').bxSlider({
	  pagerCustom: '#thr',
	  adaptiveHeight:false, 
	  controls:false,
	  infiniteLoop: false,
	}); 
</script>
<div style="clear: both"></div>
				</div>
				<div class="col-lg-5 col-xs-12">
					<div class="row">
						<div class="detail-right" style="width: 100%;">
							<div class="goods-info">
								<h2>1</h2>
								<p class="artist">
									${productVo.p_name}
								</p>
								<p class="product">
									<strong>Dialogue ( 작가 서명)<!-- <span>No.2007250001</span>--></strong>
								</p>
								<dl class="product-info">
									<dd>26.5×43.5cm</dd>
									<dd>천에 작가 서명</dd>
									<dd>2019</dd>
									</dd>
								</dl>
								<div class="detail-check">
									<label>
										<div class="aaa">
											<strong>관심추가</strong><span>마이페이지에서 관심리스트를 확인 할 수 있습니다.</span>
										</div> <!--<input type="checkbox" class="option-input checkbox "    />-->
									</label>
								</div>
							</div>
							<div class="goods-value">
								<p>
									<span>응찰수</span><strong>10</strong>
								</p>
								<p>
									<span>시작가</span>
									<strong class="import-color strong">
										<fmt:setLocale value="ko_KR" />
										<fmt:formatNumber type="currency" value="${productVo.s_price}" />
									</strong>
								</p>
								<p>
									<span>현재가</span>
									<strong class="normal-color strong">
									<fmt:setLocale value="ko_KR" /> 
									<c:choose>
										<c:when test="${productVo.p_price != 0}">
											<fmt:formatNumber type="currency" value="${productVo.p_price}" />
										</c:when> 
										<c:otherwise> 
											<fmt:formatNumber type="currency" value="${productVo.s_price}" />
										</c:otherwise>
									</c:choose>
									</strong>
								</p> 
							</div>
							<div class="goods-button">
								<div class="row">
									<div class="col-lg-5 col-xs-12">
										<div class="row bt-are">
											<div class="col-lg-6 col-xs-6 ">
												<a class=" text-center backlink2 mobile-bbt" href="/pages/auction/">리스트</a>
											</div>
											<div class="col-lg-6 col-xs-6 ">
												<a class="text-center backlink3 mobile-bbt" href="" data-toggle="modal" data-target="#biding-list">응찰현황</a>
											</div>
										</div>
									</div>
									<div class="col-lg-7 col-xs-12 pull-right"> 
										<div class="row bt-are">
											<div class="col-lg-6 col-xs-6 ">
												<button style="width: 100%; display: block" 
													class="btn-white-border mobile-bbt "
													onclick="location.href='online-auction-pay.php?owcode=OW2007250001&oacode=O2007001&page=1'"
													type="button" id="bid_pay">예약응찰</button> 
											</div>
											<div class="col-lg-6 col-xs-6 ">
												<button style="width: 100%; display: block"
													class=" btn-artday3 mobile-bbt "
													onclick="location.href='online-auction-bid.php?owcode=OW2007250001&oacode=O2007001&page=1'"
													type="button" id="bid_bid">응찰</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="artist-spec ">
					<div class="row">
						<div class="col-lg-6 ">
							<h3>배송안내</h3>
							<div class="item-intu ">
								<ul>
									<li></li>
									<li>본 상품에 한하여 낙찰자 직접픽업 또는 배송업체를 통해 유료로 배송드립니다. (서울
										50,000원 / 수도권 100,000원 / 그 외 지역 150,000원) 단, 배송지역에 따라
										배송비가 소폭 변동 될 수 있으니 양해부탁드립니다.</li>
								</ul>
							</div>
						</div>
						<div class="col-lg-6 " style="">
							<h3>상품소개</h3>
<style>
#myList span {
	display: none;
}

#loadMore {
	color: #000;
	padding: 0 8px;
	cursor: pointer;
}

#loadMore:hover {
	color: black;
}

#showLess {
	padding: 0 8px;
	color: #000;
	cursor: pointer;
}

#showLess:hover {
	color: black;
}
</style>
							<div class="artist-intu" id="myList">
								<span> <strong>학력</strong><br>
								<br> 니혼대학교 철학 학사<br>서울대학교 중퇴<br>
								<br>

								</span> <span> </span> <span> <strong>전시(개인)</strong><br>
								<br>
								<br>
									</p>
									<p style="line-height: 1.2;">외 다수&nbsp;</p>
									<br>
								<br>
								</span><span><strong>전시(그룹)</strong><br>
								<br>
								<br>
								</span>
								<div id="loadMore"
									style="padding: 4px 12px !important; margin-bottom: 10px"
									class="pull-left btn btn-white-border mobile-bbt">더보기</div>
								<div id="showLess"
									style="padding: 4px 12px !important; margin-bottom: 10px"
									class="pull-right btn-white-border mobile-bbt">닫기</div>
							</div>
						</div>
					</div>
<script>
$(document).ready(function () {
	size_li = $("#myList span").length;
	x=2;
	$('#myList span:lt('+x+')').show();
	$('#loadMore').click(function () {
		x= (x+1 <= size_li) ? x+1 : size_li;
		$('#myList span:lt('+x+')').show();
	});
	$('#showLess').click(function () {
		x=(x-3<0) ? 3 : x-3;
		$('#myList span').not(':lt('+x+')').hide();
	});
});
</script>
				</div>
			</div>
			<div class="add-product-set">
				<div class="row">
					<div class="col-lg-12">
						<h3>해당 상품 브랜드의 다른 상품</h3>
					</div>
				</div>
				<div class="row" style="display: none">
					<div class="col-lg-12">
						<h3>관련전시</h3>
					</div>
					<div class="col-lg-2 col-xs-4">
						<div class="item-list">
							<img src="" alt="" />
						</div>
					</div>
					<div class="col-lg-2 col-xs-4">
						<div class="item-list">
							<img src="" alt="" />
						</div>
					</div>
					<div class="col-lg-2 col-xs-4">
						<div class="item-list">
							<img src="" alt="" />
						</div>
					</div>
					<div class="col-lg-2 col-xs-4">
						<div class="item-list">
							<img src="" alt="" />
						</div>
					</div>
					<div class="col-lg-2 col-xs-4">
						<div class="item-list">
							<img src="" alt="" />
						</div>
					</div>
					<div class="col-lg-2 col-xs-4">
						<div class="item-list">
							<img src="" alt="" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
$(function() {
	// countdown timer
	const countDownTimer = function(c_tag, date) {
		var untilDate = new Date(date);
		var timer;
		function showRemaining() { 
			var currentDate = new Date().getTime();
			var timeLeft = untilDate - currentDate;
	
			var days = Math.floor(timeLeft / (1000 * 60 * 60 * 24));
 			//if (days < 10) days = "0" + days; 
			
			var hours = Math.floor((timeLeft % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
			if (hours < 10) hours = "0" + hours;
			
			var minutes = Math.floor((timeLeft % (1000 * 60 * 60)) / (1000 * 60));
			if (minutes < 10) minutes = "0" + minutes;
			
			var seconds = Math.floor((timeLeft % (1000 * 60)) / 1000);
			if (seconds < 10) seconds = "0" + seconds;
 			//if (days < 1) {} else {}
			c_tag.html(days + '일' + hours + '시' + minutes + '분' + seconds + '초');
			if (timeLeft <= 0) {
				clearInterval(timer);
				c_tag.html('경매 종료');
				return;
			}
		}    
		timer = setInterval(showRemaining, 1000);  
	}
	
	// product apply timer 
	var that = $("#time"); 
	var endDate = that.attr("data-until"); 
	var dateObj = new Date(endDate); 
	countDownTimer(that, dateObj); 
});
</script>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>