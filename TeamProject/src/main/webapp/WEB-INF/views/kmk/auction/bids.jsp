<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">

<!-- <link rel="stylesheet" href="/resources/css/bids.css" type="text/css"> -->
<link rel="stylesheet" href="/resources/css/k_auction/order-bids.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/k_auction/renewal.css"
	type="text/css">

<%@ include file="/WEB-INF/views/include/header.jsp"%>
<style>
/* 0810 active */
.inner-header .main-menu ul li a.active {
	color: #F9AD81;
}
</style>
<script>
// 0810 active
$(function() {
	$(".nav2").addClass("active");
});
</script>
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
<!-- container -->
<div id="container">
	<div id="content">
		<div class="renewalBidding">
			<!-- 응찰하기 -->
			<div class="biddingWrap">
				<div class="mainWrap">
					<section class="artwork">
						<figure style="text-align: center;">
							<img src='/resources/img/bag/${ProductVo.p_img}'/>
						</figure>
						<article class="information">
							<p class="lotNum">${ProductVo.pno}</p>
							<p class="artist">${ProductVo.p_name}<span class="year">AA</span></p>
							<p class="subject">BB</p> 
							<p>1973</p>
							<p>캔버스에 유채</p>
							<p>45.5×37.9cm (8호)</p>
						</article>
						<article class="price">
							<%-- <dl id="ctl00_ContentPlaceHolder1_dlPrLH" class="estimate">
								<dt>추정가</dt>
								<dd>
									<span class="unit">KRW</span>${ProductVo.s_price}<br/><span class="range">~</span> 3,000,000
								</dd>
							</dl> --%>
							<dl>
								<dt>시작가</dt>
								<dd>
									<span class="unit">KRW</span>${ProductVo.s_price}
								</dd>
							</dl>
							<dl class="current">
								<dt>현재가</dt>
								<dd>
									<span class="unit">KRW</span>${ProductVo.p_price}
									<a id="ctl00_ContentPlaceHolder1_lbtnBidReload" class="glinebtn btn"
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
								</strong> <a href="Bid.aspx?work_seq=70309&page_no=1&auc_num=220&t_seq=&s_type=&s_str=&l_mode=L&n_mode=A&bid_type=R&pre_path="
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
								<span id="restTime">2일 22시간 27분 45초</span>
							</dd>
						</dl>
					</section>
				</div>
				<section id="ctl00_ContentPlaceHolder1_secBid" class="notice">
					<article class="bid"> 
						<em >응찰하시기 전에 <strong>반드시 확인</strong>하세요.
						</em>
						<ul>
							<li>본 경매 참여는 응찰자가 실물을 확인한 것을 전제로 하며, <strong>액자 또는
									작품 컨디션을 이유로 응찰 또는 낙찰을 취소할 수 없습니다.</strong></li>
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
							<dt style="cursor: pointer;" onclick="informLayer('2')">예상
								낙찰 수수료</dt>
							<dd>198,000원</dd>
						</dl>
						<dl class="current">
							<dt>
								예상 배송비 <img onclick="informLayer('1');"
									src="/resources/img/bid/ico_question_01.png"
									style="padding-top: 2px;" alt="close" />
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
				<h3 class="title">
					응찰 현황
					<!--span><a id="ctl00_ContentPlaceHolder1_lbtnBidListReload" class="glinebtn btn" href="javascript:__doPostBack(&#39;ctl00$ContentPlaceHolder1$lbtnBidListReload&#39;,&#39;&#39;)">새로고침</a></span-->
				</h3>
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
						<li>동일한 금액이 응찰된 경우에는 <strong>응찰 시간이 빠른 응찰자가 최종 낙찰로
								인정</strong>됩니다.
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
				<div class="right">
					<a id="ctl00_ContentPlaceHolder1_lbtnList"
						href="javascript:__doPostBack(&#39;ctl00$ContentPlaceHolder1$lbtnList&#39;,&#39;&#39;)">목록으로
						돌아가기</a>
				</div>
			</div>
		</div>

	</div>
	<!-- //내용시작 -->
</div>
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>