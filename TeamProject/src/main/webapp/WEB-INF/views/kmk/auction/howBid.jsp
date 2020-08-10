<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/include/header.jsp" %>

<link rel="stylesheet" type="text/css" href="/resources/css/note.css"/>
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
<div id="container">
	<div id="content"> 
<!-- 		<div id="location"> -->
<!-- 			<span><img src="../images/ico/ico_home.gif" alt="home" /></span> -->
<!-- 			<span>OnlineAuction</span> <span class="last">온라인 응찰방법</span> -->
<!-- 		</div> --> 
		<!-- 내용시작 -->
		<div id="auction">
			<div id="bidMethod">
				<!-- 01 -->
				<div class="division">
					<div class="subject">
						<h3>
							<span>01.</span>경매
						</h3>
						<img src="/resources/img/howbid/bid_how01.gif" alt="경매" class="o1"/>
					</div>
					<div class="cont">
						<h4>
							<span>온라인 경매</span> 소개
						</h4>
						<p class="dot">온라인경매는 별도의 가입비 없이 간단한 인터넷 가입과 경매 전 본인인증만으로 참여
							가능합니다. 온라인경매의 프리뷰 기간 중 24시 홈페이지를 통해 응찰 가능하며, 경매 마감 시간부터 순차적으로
							마감됩니다.</p>
						<p class="dot">
							<strong>2006년 시작한 온라인경매</strong>는 연 8-10회 진행되며 미술품의 대중화와 활성화를 위해
							기존 경매보다 폭넓은 작가군과 합리적인 가격의 작품들을 선보입니다. 판화경매나 만원경매 등 독득한 테마를 가진 온라인
							경매도 진행하며 미술품 경매가 극소수의 향유층을 대상으로 하는 것이 아니라 <strong>누구나 누릴
								수 있는 문화 체험의 장으로써 발전</strong>해가고 있습니다.
						</p>
					</div>
				</div>
				<!-- //01 -->

				<!-- 02 -->
				<div class="division">
					<div class="subject">
						<h3>
							<span>02.</span><u>회원가입</u>
						</h3>
						<img src="/resources/img/howbid/bid_how02.gif" alt="준회원가입" class="s2" />
					</div>

					<div class="cont">
						<h4>
							<span>회원가입</span> 안내
						</h4>
						<p class="txt dep">K옥션 홈페이지 회원은 국내거주자와 해외거주자로 구분되며 홈페이지를 통해
							간편하게 가입하실 수 있습니다. 본인인증을 완료한 온라인 홈페이지 회원에 한하여 온라인 경매를 참여하실 수 있습니다.
						</p>
						<p class="dot">
							준회원 <br /> 간편가입(네이버 아이디)을 통해 가입한 회원으로 지난경매 결과, 경매결과출력, 응찰 가능한 현재가
							확인 가능하나 경매응찰이 제한됩니다.
						</p>

						<p class="dot">
							정회원 <br /> 휴대폰 본인인증을 완료한 회원으로 홈페이지 내 모든 서비스 사용가능하며 경매응찰 가능합니다.
						</p>
						<div class="x-scroll">
							<table>
								<colgroup>
									<col style="width: 120px;" />
									<col style="width: auto;" />
									<col style="width: auto;" />
								</colgroup>
								<tr class="header">
									<td></td>
									<td>국내거주자 홈페이지회원</td>
									<td>해외거주자 홈페이지회원</td>
								</tr>
								<tr class="body">
									<td>본인인증방식</td>
									<td>국내핸드폰 인증</td>
									<td>이메일 인증</td>
								</tr>
								<tr class="body">
									<td>무료 서비스</td>
									<td>홈페이지에서 지난 경매 결과 및 이미지 제공 <br /> 경매 전자 도록 및 온라인 소식지
										이메일 송부 <br /> 경매 리플렛 또는 문자 안내메시지 송부 <br /> 홈페이지에서 경매 대상 작품
										위탁 신청 <br /> 홈페이지에서 온라인경매 응찰 및 자동응찰 가능
									</td>
									<td>홈페이지에서 지난 경매 결과 및 이미지 제공 <br /> 경매 전자 도록 및 온라인 소식지
										이메일 송부 <br /> 경매 안내 이메일 송부 <br /> 홈페이지에서 경매대상작품 위탁 신청 <br />
										온라인경매 응찰 및 자동응찰 시 별도 전화 문의
									</td>
								</tr>
								<tr class="body">
									<td>유료 서비스</td>
									<td>경매 도록 송부 (연 20만원, 도록서비스 메뉴에서 신청)</td>
									<td>경매 도록 송부 (연 USD 300, 도록서비스 메뉴에서 신청)</td>
								</tr>
								<tr class="body">
									<td></td>
									<td style="text-align: center;"><a
										href="/Member/step02.aspx?type=004&kind=010"
										class="new-btn orange">국내 거주자 회원 가입</a></td>
									<td style="text-align: center;"><a
										href="/Member/step02.aspx?type=005&kind=010"
										class="new-btn gray">해외 거주자 회원 가입</a></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<!-- //02 -->

				<!-- 03 -->
				<div class="division">
					<div class="subject">
						<h3>
							<span>03.</span><u>프리뷰</u>
						</h3>
						<img src="/resources/img/howbid/bid_how03.gif" alt="프리뷰" class="s3" />
					</div>

					<div class="cont">
						<p class="dot2">프리뷰는 경매 출품작을 경매전에 감상하고 작품 상태를 확인할 수 있는 전시회입니다.</p>
						<p class="dot2">누구나 관람이 가능하며, 현장에서 작품과 관련된 자세한 안내를 받으실 수 있습니다.
						</p>
						<p class="dot2">초대장, 홈페이지, 도록을 통해 경매 프리뷰 및 경매 날짜가 공지 됩니다.</p>
						<div class="gWrap">
							<div class="graybox">
								<ul>
									<li>당사는 경매물품을 있는 그대로 출품합니다.</li>
									<li>경매되는 작품상태에 대한 보증은 경매 시점의 상태에 준합니다.</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<!-- 03 -->

				<!-- 04 -->
				<div class="division">
					<div class="subject">
						<h3>
							<span>04.</span>응찰
						</h3>
						<img src="/resources/img/howbid/bid_how04.gif" alt="응찰" class="s4" />
					</div>

					<div class="cont">
						<p class="txt">
							온라인경매 프리뷰 기간동안 홈페이지를 통해 24시 응찰 가능하며, <span>경매 마감 시간부터
								순차적으로 마감</span>됩니다.
						</p>

						<p class="txt">온라인경매 낙찰 우선순위는</p>

						<div class="bidStep">
							<ul>
								<li class="ot01">
									<p>자동 응찰</p>
								</li>
								<li class="ot02">
									<p>실시간 응찰</p>
								</li>
							</ul>
						</div>

						<p class="txt">순으로 순위가 주어집니다.</p>
						<p class="txt">
							동일한 금액의 응찰이 발생할 경우 서버시간에 따라 먼저 응찰금액을 입력하신 분에게 우선 순위가 주어집니다. <br />
							<strong>응찰 및 낙찰 후 취소가 불가능</strong> 하오니, 응찰전 신중히 선택하시기 바랍니다.
						</p>
						<p class="txt">
							전시를 통해 작품의 실물을 확인하였음을 전제로 진행합니다.<br /> <strong>따라서 경매
								시작 전 프리뷰(PREVIEW) 기간 중 충분히 상태를 확인하신 후 응찰</strong>하시길 권유합니다.
						</p>

						<div class="gWrap">
							<div class="graybox">
								<p class="title">온라인 응찰 / On-line Bidding</p>
								<p class="txt2">
									프리뷰 기간동안 홈페이지에서 해당 경매의 각 작품에서 <strong>"응찰하기" 버튼을 클릭</strong>하여
									응찰.
								</p>
								<p class="txt2">
									<strong>응찰 : </strong>주어진 금액에 따라 1회씩 응찰.
								</p>
								<p class="txt2">
									<span>자동응찰 : </span>해당 작품에 대한 한도액을 미리 적어 자동으로 응찰되는 방식. 상대 응찰자가
									없으면 최소금액으로 낙찰.
								</p>
							</div>
						</div>
					</div>
				</div>
				<!-- //04 -->

				<!-- 05 -->
				<div class="division">
					<div class="subject">
						<h3>
							<span>05.</span>낙찰
						</h3>
						<img src="/resources/img/howbid/bid_how05.gif" alt="낙찰" class="s5" />
					</div>

					<div class="cont">
						<p class="txt">
							경매 종료 후, 홈페이지에서 로그인 하신 후, <span>‘MY Page - 온라인 낙찰내역’에서
								온라인경매 낙찰결과를 확인</span>하실 수 있습니다.
						</p>
						<p class="txt">
							낙찰자는 <strong>경매 후 7일 이내에 낙찰가와 낙찰수수료, 부가가치세를 합친 낙찰대금을 당사로
								지불</strong>하셔야 합니다.<br /> 낙찰대금은 현금, 자기앞 수표, 폰뱅킹, 인터넷 뱅킹, 메일 뱅킹 등의 각종
							계좌이체, 당사 은행 계정 송금 등으로 지급하실 수 있으며, <strong>수수료에 한해서는
								신용카드로 결제</strong>하실 수 있습니다. (단, 신용카드로 결제하실 경우는 당사를 방문하셔야 가능합니다.)
						</p>
						<p class="txt">낙찰대금을 입금하신 후 본사로 연락주시면 입금확인을 하실 수 있습니다.</p>

						<div class="gWrap">
							<div class="graybox">
								<p class="title">낙찰 수수료</p>
								<ul>
									<li><strong>낙찰가(Hammer Price) :</strong> 경매 마감시간에 응찰된 최고
										금액입니다.</li>
									<li><strong>구매가(Purchase Price) :</strong> 낙찰가 + 낙찰수수료 +
										부가가치세가 합산된 금액입니다.</li>
									<li>약관 개정에 따른 적용 수수료율은 아래와 같습니다.</li>

									<li class="dep">1. 경매일 기준 2020년 5월 19일부터 <br />&nbsp;&nbsp;&nbsp;-
										낙찰가 구간별로 다른 수수료율(부가가치세 별도)을 적용하여 산출합니다. <br />
									<br />
										<table border="0"
											style="border: 1px solid #000000; border-left: 0; border-bottom: 0;">
											<tr>
												<td
													style="text-align: center; border-width: 0px 0px 1px 1px; border-bottom-style: solid; border-left-style: solid; border-bottom-color: rgb(0, 0, 0); border-left-color: rgb(0, 0, 0); width: 30%; height: 32px; background-color: rgb(204, 204, 204);"
													class=""><b><span
														style="font-family: 맑은 고딕, dotumche; color: rgb(0, 0, 0);">&nbsp;낙찰가
															(원)</span></b></td>
												<td
													style="text-align: center; border-width: 0px 0px 1px 1px; border-bottom-style: solid; border-left-style: solid; border-bottom-color: rgb(0, 0, 0); border-left-color: rgb(0, 0, 0); width: 70%; height: 32px; background-color: rgb(204, 204, 204);"
													class=""><b><span
														style="font-family: 맑은 고딕, dotumche; color: rgb(0, 0, 0);">&nbsp;수수료율
															(VAT 별도)</span></b></td>
											</tr>
											<tr>
												<td
													style="text-align: center; border-width: 0px 0px 1px 1px; border-bottom-style: solid; border-left-style: solid; border-bottom-color: rgb(0, 0, 0); border-left-color: rgb(0, 0, 0); height: 32px; background-color: rgb(255, 255, 255);"
													class=""><span
													style="font-family: 맑은 고딕, dotumche; color: rgb(0, 0, 0);">~
														10,000,000</span></td>
												<td
													style="text-align: center; border-width: 0px 0px 1px 1px; border-bottom-style: solid; border-left-style: solid; border-bottom-color: rgb(0, 0, 0); border-left-color: rgb(0, 0, 0); height: 32px; background-color: rgb(255, 255, 255);"
													class=""><span
													style="font-family: 맑은 고딕, dotumche; color: rgb(0, 0, 0);">낙찰가의
														18%</span></td>
											</tr>
											<tr>
												<td
													style="text-align: center; border-width: 0px 0px 1px 1px; border-bottom-style: solid; border-left-style: solid; border-bottom-color: rgb(0, 0, 0); border-left-color: rgb(0, 0, 0); height: 32px; background-color: rgb(255, 255, 255);"
													class=""><span
													style="font-family: 맑은 고딕, dotumche; color: rgb(0, 0, 0);">10,000,001
														~</span></td>
												<td
													style="text-align: center; border-width: 0px 0px 1px 1px; border-bottom-style: solid; border-left-style: solid; border-bottom-color: rgb(0, 0, 0); border-left-color: rgb(0, 0, 0); height: 32px; background-color: rgb(255, 255, 255);"
													class=""><span
													style="font-family: 맑은 고딕, dotumche; color: rgb(0, 0, 0);">&nbsp;1,000만원
														x 18% + ( 낙찰가 - 1,000만원 ) x 15%</span></td>
											</tr>
										</table> <br />
										<ul>
											<li>예시) <strong>낙찰가 5,000만원일 경우</strong></li>
											<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>낙찰수수료</strong>
												: 1,000만원 x 18% + 4,000만원 x 15% = 780만원
											</li>
											<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>부가가치세</strong>
												: 낙찰수수료 (780만원) x 10% = 78만원
											</li>
											<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>총
													구매대금</strong> : 5,000만원 + 780만원 + 78만원 = 5,858만원
											</li>
										</ul>
									</li>
									<li>하나은행 196-910005-07204 ㈜K옥션</li>

								</ul>
							</div>
						</div>
					</div>
				</div>
				<!-- //05 -->

				<!-- 06 -->
				<a name="6">
					<div class="division">
						<div class="subject">
							<h3>
								<span>06.</span><u class="textresize">작품 픽업 및 배송</u>
							</h3>
							<img src="/resources/img/howbid/bid_how06.gif" alt="보험 및 배송" class="o6" />
						</div>
						<div class="cont">
							<p class="txt">
								<p class="dot2">작품 픽업</p>
								<p class="txt">프리미엄/위클리 온라인 경매의 낙찰작은 직접 픽업(낙찰 후 7일 이내) 을 원칙으로 하며, <span>방문을 원하시는 날짜 하루 전 (주말의 경우 금요일, 연휴인 경우 연휴 시작 하루 전) 오후 5시까지</span> 담당자와 픽업일정을 예약하신 후 방문해 주시기 바랍니다. (사전 예약없이 방문시 픽업이 불가능합니다)</p>
	                         	<p class="txt"> 일반 승용차 기준 작품 전체 크기 <span>90x120cm</span>까지 적재 가능하니, 픽업 전 차량의 공간과 작품 크기를 꼭 확인해 주시기 바랍니다.</p>
	                         	<p class="txt">운영시간: 월~일 10:30am~6:00pm<br />문의: 02-3479-8888</p>
                    		</p>
                    		<p class="txt">
							<p class="dot2">배송 </p>
                       			<p class="txt">직접 픽업이 어려운 경우, 낙찰작의 배송을 요청할 수 있으며, 아래와 같이 배송비가 부과됩니다.<br />
		                        <br/>서울: 50,000원
		                        <br/>수도권: 100,000원
		                        <br/>그 외 지역: 150,000원
		                        <br/><span>※ 동일 경매에서 1점 초과 낙찰 시 초과분부터는 배송료 1만원씩만 추가 발생. (단, 동일 장소/동일 시간일 경우에 한함)</span>
		                        <br/>예) 서울 지역 3점 낙찰 시 50,000+10,000+10,000 = 70,000 원</p>
                     		</p>
                    		<p class="txt">
							<p class="dot2">설치</p>
                       		<p class="txt">
								<span>80호 미만은 점당 3만원(추가 점당 1만원), 80호 이상은 점당 10만원(추가 점당 2만원)의</span> 비용이 발생합니다.
                        <br />대리석, 콘크리트, 가벽, 레일 등 현장 난이도에 따라 비용이 추가될 수 있습니다.</p>
                    </p>
                    <p class="txt">
                        
							<p class="dot2">보관</p>
                        <p class="txt">낙찰 및 판매 이후 7일 경과 시 입금여부와 무관하게 일 30,000원/점의 비용이 발생합니다.</p>
                    </p>
               		</div> 
            	</div>
                </a>
            <!-- //06 -->
        </div>
	        <script type="text/javascript">
	            $(document).ready(function () {
	                $('.division:last-child').css({ 'border': '0', 'padding': '50px 0 0 0' });
	            });
	        </script>
    	</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>