<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8"> 

<!-- <link rel="stylesheet" href="/resources/css/bids.css" type="text/css"> --> 
<link rel="stylesheet" href="/resources/css/k_auction/order-bids.css" type="text/css">
<link rel="stylesheet" href="/resources/css/k_auction/renewal.css" type="text/css">
   
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<script type="text/javascript">
	$(function($) {
		function floatLabel(inputType) {
			$(inputType).each(function() {
				var $this = $(this);
				// on focus add cladd active to label
				$this.focus(function() {
					$this.next().addClass("active");
				});
				//on blur check field and remove class if needed
				$this.blur(function() {
					if ($this.val() === "" || $this.val() === "blank") {
						$this.next().removeClass();
					}
				});
			});
		}
		// just add a class of "floatLabel to the input field!"
		floatLabel(".floatLabel"); 
	});
</script>
<div class="renewalBidding">
	<!-- 응찰하기 -->
	<div class="biddingWrap">
		<div class="mainWrap">
			<section class="artwork">
				<figure style="text-align: center;">
					<img src='https://d2ceo6ilwei9nc.cloudfront.net/www/Konline/Work/0220/22000104001.jpg' />
				</figure>
				<article class="information">
					<p class="lotNum">Lot 1</p>
					<p class="artist">박돈(박창돈)<span class="year">(b.1928)</span></p>
					<p class="subject">포도와 소녀</p>
					<p>1973</p>
					<p>캔버스에 유채</p>
					<p>45.5×37.9cm (8호)</p>
				</article>
				<article class="price">
					<dl id="ctl00_ContentPlaceHolder1_dlPrLH" class="estimate">
						<dt>추정가</dt>
						<dd>
							<span class="unit">KRW</span>2,000,000<br/><span class="range">~</span> 3,000,000
						</dd>
					</dl>
					<dl>
						<dt>시작가</dt>
						<dd>
							<span class="unit">KRW</span> 1,000,000
						</dd>
					</dl>
					<dl class="current">
						<dt>현재가</dt>
						<dd>
							<span class="unit">KRW</span> 0<a
								id="ctl00_ContentPlaceHolder1_lbtnBidReload"
								class="glinebtn btn"
								href="javascript:__doPostBack(&#39;ctl00$ContentPlaceHolder1$lbtnBidReload&#39;,&#39;&#39;)">새로고침</a>
						</dd>
					</dl>
				</article>
			</section>
			<section class="auction">
				<div class="bidding">
					<dl>
						<dt>응찰가격</dt>
						<dd>
							<div id="ctl00_ContentPlaceHolder1_divBid"
								style="font-size: 1em !important;">
								<span class="unit">KRW</span><input
									name="ctl00$ContentPlaceHolder1$txtPrBid" type="text"
									value="1,000,000" id="ctl00_ContentPlaceHolder1_txtPrBid"
									readonly="readonly" style="width: 60%;" />
							</div>
						</dd>
					</dl>
					<div class="btnWrap">
						<strong> <a onclick="return bid();"
							id="ctl00_ContentPlaceHolder1_btnBid"
							href="javascript:__doPostBack(&#39;ctl00$ContentPlaceHolder1$btnBid&#39;,&#39;&#39;)">응찰하기</a>
						</strong> <a
							href="Bid.aspx?work_seq=70309&page_no=1&auc_num=220&t_seq=&s_type=&s_str=&l_mode=I&n_mode=N&bid_type=R&pre_path="
							class="oboldbtn">자동응찰 하러가기</a>
					</div>
				</div>
				<dl>
					<dt>응찰단위</dt>
					<dd>
						<span class="unit">KRW</span> 100,000
					</dd>
				</dl>
				<dl>
					<dt>마감시간</dt>
					<dd>07/27 - 4:00 PM</dd>
				</dl>
				<dl>
					<dt>남은시간</dt>
					<dd>
						<span id="restTime">2일 23시간 53분 15초</span>
					</dd>
				</dl>
			</section>
		</div>
		<section id="ctl00_ContentPlaceHolder1_secBid" class="notice">
			<article class="bid">
				<em>응찰하시기 전에 <strong>반드시 확인</strong>하세요.
				</em>
				<ul>
					<li>본 경매 참여는 응찰자가 실물을 확인한 것을 전제로 하며, <strong>액자 또는 작품
							컨디션을 이유로 응찰 또는 낙찰을 취소할 수 없습니다.</strong></li>
					<li><strong>구매 대금은 낙찰일로부터 7일 이내에 입금</strong>해 주시기 바랍니다. <br />
					<strong>7일 초과 시 약관에 따라 추가 비용이 발생</strong>합니다. <a
						href="/Kmall/Clause.aspx?#9"><strong>[ 약관보기 ]</strong></a></li>
					<li>응찰하신 후에는 <strong>응찰 현황을 확인</strong>하시기 바랍니다.
					</li>
					<li>위 사항을 염두에 두시고, <strong>신중한 선택</strong>을 해주시기 바랍니다.
					</li>
				</ul>
			</article>
			<article class="commPrice">
				<dl class="current">
					<dt style="cursor: pointer; color: #e5410e;"
						onclick="informLayer('3');">경매 호가표</dt>
					<dd></dd>
				</dl>
				<dl class="current">
					<dt style="cursor: pointer;" onclick="informLayer('2')">예상 낙찰
						수수료</dt>
					<dd>198,000원</dd>
				</dl>
				<dl class="current">
					<dt>
						예상 배송비 <img onclick="informLayer('1');"
							src="/images/ico/ico_question_01.png" style="padding-top: 2px;"
							alt="close" />

					</dt>
					<dd>150,000원</dd>
				</dl>
				<dl class="current">
					<dd>
						<strong>※ 직접 방문 픽업 시 배송비 무료<br />&nbsp;&nbsp;&nbsp;(사전
							예약 필수)
						</strong>
					</dd>
				</dl>
			</article>
			<article class="reserve">
				<p>
					<span>현재 응찰가격보다 높은 금액으로 응찰을 원하는 경우에는</span> <span><strong>자동
							응찰을 이용</strong>하세요.</span>
				</p>
			</article>
		</section>
	</div>
	<!-- 응찰하기 -->
	<!-- 작품 컨디션 -->

	<!-- //작품 컨디션 -->
	<!-- 응찰 현황 -->
	<div class="bidState">
		<h3 class="title">응찰 현황</h3>
		<div class="stateDiv">
			<table class="stateTable" border="1" cellspacing="0">
				<caption>응찰 현황</caption>
				<colgroup>
					<col width="*" />
					<col width="*" />
					<col width="*" class="tnone" />
					<col width="*" class="tnone" />
					<col width="*" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col">회원ID</th>
						<th scope="col">응찰가</th>
						<th scope="col" class="tnone">응찰일자</th>
						<th scope="col" class="tnone">응찰시간</th>
						<th scope="col" class="last">비고</th>
					</tr>
				</thead>
				<tbody>

					<tr>
						<td colspan="5">응찰 내용이 없습니다.</td>
					</tr>

				</tbody>
			</table>
			<input type="hidden" name="ctl00$ContentPlaceHolder1$hdnWorkSeq"
				id="ctl00_ContentPlaceHolder1_hdnWorkSeq" value="70309" /><input
				type="hidden" name="ctl00$ContentPlaceHolder1$hdnPrStart"
				id="ctl00_ContentPlaceHolder1_hdnPrStart" value="1000000.0000" /><input
				type="hidden" name="ctl00$ContentPlaceHolder1$hdnPrAscend"
				id="ctl00_ContentPlaceHolder1_hdnPrAscend" value="100000.0000" /><input
				type="hidden" name="ctl00$ContentPlaceHolder1$hdnPrBid"
				id="ctl00_ContentPlaceHolder1_hdnPrBid" value="1000000" /><input
				type="hidden" name="ctl00$ContentPlaceHolder1$hdnPrBidPre"
				id="ctl00_ContentPlaceHolder1_hdnPrBidPre" />
		</div>
		<div class="tableAlert">
			<ul>
				<li>동일한 금액이 응찰된 경우에는 <strong>응찰 시간이 빠른 응찰자가 최종 낙찰로 인정</strong>됩니다.
				</li>
				<li>비고에 낙찰로 표시된 응찰자가 <strong>최종 낙찰자</strong>입니다.
				</li>
				<li>경매참여자 <strong>순위 20위까지</strong>만 볼 수 있습니다.
				</li>
			</ul>
		</div>
	</div>
	<!-- //응찰 현황 -->
	<div class="function">
		<div class="left">
			<a href="WorkView.aspx?work_seq=70309&pre_path=&page_no=1">작품
				상세보기</a>
		</div>
		<div class="right">
			<a href="javascript:printPage();">인쇄</a> <a
				id="ctl00_ContentPlaceHolder1_lbtnList"
				href="javascript:__doPostBack(&#39;ctl00$ContentPlaceHolder1$lbtnList&#39;,&#39;&#39;)">목록으로
				돌아가기</a>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(
				function() {
					$(".thumb .swiper-wrapper .swiper-slide").eq(0).addClass(
							"active-nav");

					var contentSwiper = $('#slide').swiper({
						paginationClickable : true,
						slidesPerView : 1,
						maincheck : 1,
						followFinger : false,
						onSlideChangeStart : function() {
							updateNavPosition()
						}
					});

					function imgHeight() {
						var winWidth = $(window).width();
						var imHeight = $('#slide .swiper-slide-active img')
								.height();
						$('#slide').css('height', imHeight);
						$('#slide .swiper-wrapper').css('height', imHeight);
						$('#slide .swiper-wrapper .swiper-slide').css('height',
								imHeight);
					}

					$(window).load(function() {
						imgHeight();
					});

					var navSwiper = $('.thumb').swiper({
						visibilityFullFit : true,
						slidesPerView : '3',
						maincheck : 1,
						followFinger : false,
						onSlideClick : function() {
							contentSwiper.swipeTo(navSwiper.clickedSlideIndex)
						}
					});

					function updateNavPosition() {
						$('.thumb .active-nav').removeClass('active-nav')
						var activeNav = $('.thumb .swiper-slide').eq(
								contentSwiper.activeIndex).addClass(
								'active-nav')

						if (!activeNav.hasClass('swiper-slide-visible')) {
							if (activeNav.index() > navSwiper.activeIndex) {
								var thumbsPerNav = Math.floor(navSwiper.width
										/ activeNav.width()) - 1
								navSwiper.swipeTo(activeNav.index()
										- thumbsPerNav)
							} else {
								navSwiper.swipeTo(activeNav.index())
							}
						}
					}
					;

					$('.thumLeft').on('click', function(e) {
						e.preventDefault()
						navSwiper.swipePrev()
					})
					$('.thumRight').on('click', function(e) {
						e.preventDefault()
						navSwiper.swipeNext()
					})

					var thumNum = $('.thumb .swiper-slide').size();
					if (thumNum < 4) {
						$('.thumLeft, .thumRight').css('display', 'none');
					}

					// 다른 작품
					var mySwiper2 = new Swiper('#otherWork', {
						paginationClickable : true,
						loopedSlides : 4,
						slidesPerView : 4,
						autoplay : 5000,
						followFinger : false
					});

					$('.otherLeft').on('click', function(e) {
						e.preventDefault()
						mySwiper2.swipePrev()
					})
					$('.otherRight').on('click', function(e) {
						e.preventDefault()
						mySwiper2.swipeNext()
					})

					//modal
					var $section = $('.modalbox');
					$section.find('.panzoom').panzoom({
						$zoomIn : $section.find(".zoom-in"),
						$zoomOut : $section.find(".zoom-out"),
						$zoomRange : $section.find(".zoom-range"),
						$reset : $section.find(".reset")
					});
				});
	</script>
</div>

<!-- //내용시작 -->

</div>
</div>


<%@ include file="/WEB-INF/views/include/footer.jsp"%>