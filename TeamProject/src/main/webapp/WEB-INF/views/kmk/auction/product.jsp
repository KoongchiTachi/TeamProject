<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>

<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ include file="/WEB-INF/views/include/kmk/hideForm.jsp" %>

<link rel="stylesheet" href="/resources/css/product/product.css" type="text/css">
<link rel="stylesheet" href="/resources/css/product/concept.css" type="text/css">
<link href="/resources/js/product/bxslider.css" rel="stylesheet">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="/resources/js/product/bxslider.js"></script>
<script src="/resources/js/product/bid_list.js"></script> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/3.6.95/css/materialdesignicons.css">


<style>  
.col-lg-offset-1 {
    margin-left: 8.33333333%;
}

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

.btn-artday3 {
	cursor: pointer;
}

</style>

<!-- content start -->
<div class="container" style="margin-top: 120px;"> 
	<div class="contant-body">
		<div class="col-lg-10 col-lg-offset-1 top-border">
			<div class="row"> 
				<div class="col-lg-7">
					<div class="row">
						<div class="sns-shere">
							<span id="pno">${productVo.pno}</span>
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
			<div class="row">
				<div class="col-lg-7 col-xs-12 ">
					<div class="row">
						<div class="col-lg-10 col-xs-12">
							<div class="row">
								<div class="thumbnail ">
									<a class=" text-center moreview btn-example" id="target_lightgallery" 
									style="width: 100%; display: table-cell; vertical-align: middle;">
										<ul class="th-list lightgallery">
											<li class="plpl" data-responsive="/resources/img/bag/${productVo.p_img1}"
												data-src="/resources/img/bag/${productVo.p_img1}" alt="1">
												<img class="" src="/resources/img/bag/${productVo.p_img1}"/></li>
											<li class="plpl" data-responsive="/resources/img/bag/${productVo.p_img2}"
												data-src="/resources/img/bag/${productVo.p_img2}" alt="2">
												<img class="" src="/resources/img/bag/${productVo.p_img2}"/></li>
											<li class="plpl" data-responsive="/resources/img/bag/${productVo.p_img3}"
												data-src="/resources/img/bag/${productVo.p_img3}" alt="3">
												<img class="" src="/resources/img/bag/${productVo.p_img3}" /></li>
											<li class="plpl" data-responsive="/resources/img/bag/${productVo.p_img4}"
												data-src="/resources/img/bag/${productVo.p_img4}" alt="4">
												<img class="" src="/resources/img/bag/${productVo.p_img4}" /></li>
										</ul>
									</a>
								</div> 
							</div> 
						</div>
						<div class="col-lg-2 col-xs-12 ">
							<div class="row">
								<div class="th-body" id="thr">
									<a data-slide-index="0" class="image">
										<span class="trick"><img class="img" src="/resources/img/bag/${productVo.p_img1}" alt="1"/></span>
									</a>
									<a data-slide-index="1" class="image">
										<span class="trick"><img class="img" src="/resources/img/bag/${productVo.p_img2}" alt="2"/></span>
									</a> 
									<a data-slide-index="2" class="image">
										<span class="trick"><img class="img" src="/resources/img/bag/${productVo.p_img3}" alt="3"/></span>
									</a>
									<a data-slide-index="3" class="image">
										<span class="trick"><img class="img" src="/resources/img/bag/${productVo.p_img4}" alt="4"/></span>
									</a>
								</div> 
							</div>
						</div>
					</div>
<style type="text/css">
</style>
<script type="text/javascript">
	// Image slider 
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
								<h2 style="color: red;">${fn:toUpperCase(productVo.b_name)}</h2> 
								<p class="artist"> 
									${productVo.p_name}
								</p>
								<p class="product"><strong><!-- <span>No.2007250001</span>--></strong></p>
								<dl class="product-info">
									<dd>${productVo.p_info}</dd>
								</dl>
							</div>
							<div class="goods-value">
								<p>
									<span>응찰수</span><strong>${cnt}</strong>
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
								<div class="row" style="font-size: smaller;">
									<div class="col-lg-5 col-xs-12">
										<div class="row bt-are">
											<div class="col-lg-6 col-xs-6 "> 
												<a class=" text-center backlink2 mobile-bbt" href="/kmk/auction/premium">리스트</a>
											</div>
											<div class="col-lg-6 col-xs-6 ">
												<a class="text-center backlink3 mobile-bbt" data-toggle="modal" 
												data-target="#biding_list" id="bid_list">응찰현황</a>
											</div>
										</div>
									</div>
									<div class="col-lg-7 col-xs-12 pull-right"> 
										<div class="row bt-are"> 
											<div class="col-lg-4 col-xs-4 "></div>
											<div class="col-lg-8 col-xs-8 ">
												<button style="width: 100%; display: block" class="btn-artday3 mobile-bbt" data-toggle="modal"
													type="button" id="bid_bid" href="/kjy/member/login"
													 <c:choose>
									                	<c:when test="${not empty sessionScope.m_id}">
									                		data-target="#bid_subscription"
									                	</c:when> 
									                	<c:otherwise>
									                		onclick="return confirm('로그인 후 응찰이 가능합니다.\n로그인 하시겠습니까?');"
									                	</c:otherwise>
									                </c:choose>
													>응찰</button>
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
				<div class="artist-spec">
					<div class="row">
						<div class="col-lg-6">
							<h3>배송안내</h3>
							<div class="item-intu">
								<ul>
									<li></li>
									<li>
										본 상품에 한하여 낙찰자 직접픽업 또는 배송업체를 통해 유료로 배송드립니다. (서울
										50,000원 / 수도권 100,000원 / 그 외 지역 150,000원) 단, 배송지역에 따라
										배송비가 소폭 변동 될 수 있으니 양해부탁드립니다.
									</li>
								</ul>
							</div>
						</div>
						<div class="col-lg-6">
							<h3>상품소개</h3>
							<div class="artist-intu" id="myList">
								<span><strong>학력</strong>
								<br><br>니혼대학교 철학 학사<br>서울대학교 중퇴<br><br>
								</span><span></span><span><strong>전시(개인)</strong>
								<br><br><br>
								<p style="line-height: 1.2;">외 다수&nbsp;</p>
								<br><br>
								</span><span><strong>전시(그룹)</strong>
								<br><br><br>
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
			
			<div class="row">
				<div class="col-lg-12">
					<div class="warning">
						<div class="col-lg-2"><h5>응찰전 유의사항</h5></div>
						<div class="col-lg-10">
							<ul class="warning-list">
								<li>1. 응찰 후에는 <span class="import-color">취소가 불가</span>합니다. 신중히 결정해 주시기 바랍니다.</li>
								<li>2. 본 경매는 <span class="import-color">실물 확인 후 응찰을 전제</span>로 하며, 상품 상태에 대한 이유로 응찰철회가 불가합니다.</li>
								<li>3. 경매 종료 시간은 아트데이 서버시간 기준으로 진행되오니 유념해 주시기 바랍니다.</li>
								<li>4. 마감시간 30초 전 응찰이 있을 경우 자동으로 30초의 경매시간이 연장됩니다. </li>
								<li>5. <span class="import-color">응찰 현황에 '낙찰' </span>이라고 표시되기 이전까지 응찰이 가능하며 응찰 전후 새로고침 버튼을 눌러 응찰현황에 표기된 현재가격을 확인바랍니다.  </li>
								<li>6. 구매대금은 낙찰일로부터 <span class="import-color">7일 이내 입금</span> 이 원칙이며, <span class="import-color">등급별 구매 수수료(부가가치세 별도)</span>가 합산됩니다.</li>
								<li>7. 7일 초과 시 약관에 따라 추가 비용이 발생되오니 원활한 경매 진행을 위해 빠른 입금 바랍니다.</li>
							</ul>
						</div>
					</div>
				</div>
			</div>	
		</div>
	</div> 
</div>

<!-- content end -->

<!-- bid status modal start -->
<div class="modal fade" id="biding_list" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">응찰현황</h5>
				<span class="title-header-bt">
					<button class="btn-repage" type="button"
						onclick="javascript:bid_list();"> 
						<span class="glyphicon glyphicon-refresh"></span> 새로고침
					</button>
				</span>
			</div>
			<div class="modal-body"
				style="background: #fff; max-height: 500px; overflow-y: scroll;">
				<div class="bid-right">
					<table class="bidding-table">
						<tr>
							<th style="width: 30%">아이디</th>
							<th style="width: 30%">응찰가</th>
							<th style="width: 40%">응찰일시</th> 
						</tr>
						<tbody id="bid_tr">
						</tbody>
					</table>
				</div>
			</div> 
			<div class="modal-footer" style="text-align: center;">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- bid status modal end -->

<!-- bid subscrition modal start -->
<div class="modal fade" id="bid_subscription" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="bidding-box2">
				<div class="row py-5 p-4 bg-white rounded shadow-sm">
						<div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">응찰</div>
						<div class="p-4">
							<p class="policy mb-4" style="color: red; font-weight: 900;"> 
								응찰 이후 취소는 Luxion 약관에 의거하여 불이익이 발생할 수 있습니다. 금액을 확인 후 응찰하시겠습니까?
							</p> 
							<ul class="list-unstyled mb-4">
								<li class="d-flex justify-content-between py-3 border-bottom">
									<strong class="text-muted">시작가</strong>
									<strong>
										<fmt:setLocale value="ko_KR" />
										<fmt:formatNumber type="currency" value="${productVo.s_price}"/> 원
									</strong>
								</li> 
								<li class="d-flex justify-content-between py-3 border-bottom">
									<strong class="text-muted">현재가</strong>
									<strong>
										<fmt:setLocale value="ko_KR"/>
										<c:choose>
											<c:when test="${productVo.p_price != 0}">
												<fmt:formatNumber type="currency" value="${productVo.p_price}"/>
											</c:when> 
											<c:otherwise> 
												<fmt:formatNumber type="currency" value="${productVo.s_price}"/>
											</c:otherwise>
										</c:choose> 원
									</strong> 
								</li>
								<li class="d-flex justify-content-between py-3 border-bottom">
									<strong class="text-muted">응찰 단위</strong>
									<strong>
										<fmt:formatNumber type="currency" value="${unit}"/> 원 
									</strong>
								</li>
								<li class="d-flex justify-content-between py-3 border-bottom">
									<strong class="text-muted">응찰 금액</strong>
									<div class="input-group">
										<input type="text" name="quant[1]" id="bid_price"class="form-control input-number"
											style="font-size: 17px; font-weight: bold; text-align: right;" 
												<c:choose>
													<c:when test="${productVo.p_price == 0}">
														value="<fmt:formatNumber type="currency" value="${productVo.s_price + unit}"/>"
													</c:when> 
													<c:otherwise>
														value="${productVo.p_price}" 
													</c:otherwise>
												</c:choose>
											min="${productVo.s_price}" max="1000000000" id="now_quant" readonly>
										<span class="input-group-btn">
											<button type="button" class="btn bid-number btn-number"
												data-type="plus" data-field="quant[1]">
												<span class="mdi mdi-plus"></span>
											</button>
										</span> 
										<span class="input-group-btn">
											<button type="button" class="btn bid-number btn-number"
												disabled="disabled" data-type="minus" data-field="quant[1]">
												<span class="mdi mdi-minus"></span> 
											</button>
										</span>
									</div>
								</li>
							</ul>
							<a href="#" class="btn btn-dark rounded-pill py-2 btn-block">신청</a>
						</div>
				</div>
				<!-- 				<div class="row">  -->
<!-- 					<div class="col-lg-12 " style="border-right: 1px solid #ddd;"> -->
<!-- 						<div class="bid-left">  -->
<!-- 							<div class="row">  -->
<!-- 								<div class="col-xs-6"> -->
<!-- 					 				<h3>응찰</h3>  -->
<!--  							</div>  -->
<!-- 								<div class="col-xs-6"> -->
<!-- 									<div class="bding2"> -->
<!-- 										<div class="form-group"> -->
<!-- 											<div class="row pd-b10"> -->
<!-- 												<label for="###" class="col-sm-6 control-label gray-color">남은시간</label> -->
<!-- 												<div class="col-sm-6"> -->
<!-- 													<strong class="import-color" id="time"></strong> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 											<div class="row pd-b10">  -->
<!-- 												<label for="###" class="col-sm-6 control-label gray-color">시작가</label> -->
<!-- 												<div class="col-sm-6"> -->
<!-- 													<strong class="normal-color"> -->
<%-- 														<fmt:setLocale value="ko_KR" /> --%>
<%-- 														<fmt:formatNumber type="currency" value="${productVo.s_price}" /> --%>
<!-- 													</strong> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 											<div class="row pd-b10"> -->
<!-- 												<label for="###" class="col-sm-6 control-label gray-color">현재가</label> -->
<!-- 												<div class="col-sm-6"> -->
<%-- 													<fmt:setLocale value="ko_KR" />  --%>
<%-- 													<c:choose> --%>
<%-- 														<c:when test="${productVo.p_price != 0}"> --%>
<%-- 															<fmt:formatNumber type="currency" value="${productVo.p_price}" /> --%>
<%-- 														</c:when>  --%>
<%-- 														<c:otherwise>  --%>
<%-- 															<fmt:formatNumber type="currency" value="${productVo.s_price}" /> --%>
<%-- 														</c:otherwise> --%>
<%-- 													</c:choose> --%>
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 											<div class="row pd-b10"> -->
<!-- 												<label for="###" class="col-sm-6 control-label gray-color">응찰단위</label> -->
<!-- 												<div class="col-sm-6"> -->
<!-- 													<strong class="normal-color"> -->
<%-- 														<c:choose> --%>
<%-- 															<c:when test="${productVo.s_price >= 1000000}"> --%>
<%-- 																<fmt:formatNumber type="currency" value="100000"/>  --%>
<%-- 															</c:when> --%>
<%-- 															<c:when test="${productVo.s_price <= 1000000}"> --%>
<%-- 																<fmt:formatNumber type="currency" value="50000"/> --%>
<%-- 															</c:when> --%>
<%-- 														</c:choose> --%>
<!-- 													</strong> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 											<div class="row pd-b10"> -->
<!-- 												<label for="###" class="col-sm-6 control-label gray-color">응찰금액</label> -->
<!-- 												<div class="col-sm-6"> -->
<!-- 													<strong class="import-color"></strong> -->
<!-- 													<form name="form1" method="post" -->
<!-- 														action="online-auctiuon-bid-proc.php"> -->
<!-- 														<input type="hidden" name="owcode" value="OW2007250001"> -->
<!-- 														<input type="hidden" name="oacode" value="O2007001"> -->
<!-- 														<input type="hidden" name="page" value="1"> -->
<!-- 														<div class="input-group "> -->
<!-- 															<input type="text" name="quant[1]" class="form-control input-number" -->
<!-- 																style="font-size: 17px; font-weight: bold;" value="380,000원"  -->
<%-- 																min="${productVo.s_price}" max="1000000000" id="now_quant" readonly> --%>
<!-- 															<span class="input-group-btn"> -->
<!-- 																<button type="button" class="btn bid-number btn-number" -->
<!-- 																	data-type="plus" data-field="quant[1]"> -->
<!-- 																	<span class="glyphicon glyphicon-plus"></span> -->
<!-- 																</button> -->
<!-- 															</span> <span class="input-group-btn"> -->
<!-- 																<button type="button" class="btn bid-number btn-number" -->
<!-- 																	disabled="disabled" data-type="minus" data-field="quant[1]"> -->
<!-- 																	<span class="glyphicon glyphicon-minus"></span> -->
<!-- 																</button> -->
<!-- 															</span> -->
<!-- 														</div> -->
<!-- 													</div> -->
<!-- 														<div class="bid-button"> -->
<!-- 														<div class=""> -->
<!-- 															<button class="btn btn-artday2 " style="width: 100%;" data-toggle="modal" href="#bid"  -->
<!-- 															type="button" id="bid_button">응찰하기</button> -->
<!-- 															<div class="modal " id="bid"> -->
<!-- 																<div class="bid-dialog " style=""> -->
<!-- 																	<div class="modal-content"> -->
<!-- 																		<div class="modal-body">  -->
<!-- 																			응찰 이후 취소는 Luxion 약관에 의거하여<br> 불이익이 발생할 수 있습니다. <br> -->
<!-- 																			금액을 확인 후 응찰하시겠습니까? -->
<!-- 																		</div> -->
<!-- 																		<div class="modal-footer"> -->
<!-- 																			<a href="#" data-dismiss="modal" class=" bid-cancel " style="color: #333">취소</a> -->
<!-- 																			<a href="javascript:bid_proc();" class=" bid-submit " style="color: #fff;">응찰하기</a> -->
<!-- 																		</div> -->
<!-- 																	</div> -->
<!-- 																</div> -->
<!-- 															</div> -->
<!-- 														</div> -->
<!-- 													</div>  -->
<!-- 												</form> -->
<!-- 												</div> -->
<!-- 											</div>  -->
<!-- 									</div>  -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div>  -->
			</div>
		</div>
	</div>
</div> 
<!-- bid subscription modal end -->

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
	
	// bid list
	$("#bid_list").click(function() { 
		bid_list(); 
	});
	
	// bid subscription
	$("#bid_bid").click(function(e) {
		var pno = "${productVo.pno}";
		var b_price;
		if (${productVo.p_price != 0}) {
			b_price = ${productVo.p_price} + ${unit};
		} else {
			b_price = ${productVo.s_price} + ${unit};
		}
		var b_note = "낙찰 예정";
		var m_id = "<%=session.getAttribute("m_id") %>" 
		var sendData = {
				"m_id" : m_id,
				"b_price" : b_price,
				"b_note"  : b_note,
				"pno"	: pno
		};
		var url = "/kjy/member/bidSubscription";
		$.ajax({
			"type" : "post",
			"url"  : url,
			"dataType" 	: "text",
			"data" : JSON.stringify(sendData),
			"headers" 	: {
				"Content-Type"	: "application/json",
				"X-HTTP-Method-Override"	: "post"
			},
			"success"	: function(rData) {
				console.log(rData);
				/* $("#btnComment").trigger("click"); */
			}
		});	 
	});
});
</script> 

<%@ include file="/WEB-INF/views/include/footer.jsp"%>