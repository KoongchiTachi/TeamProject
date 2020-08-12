<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<link href="/resources/css/content.css" rel="stylesheet" type="text/css">
<style>
ul{
   list-style:none;
}
.inner-header .main-menu ul li a.active {
	color: #F9AD81;
}
</style>
<script>
$(function() {
	$(".nav3").addClass("active");
});
</script>

<%@ include file="/WEB-INF/views/include/sjw/frmPage.jsp" %>

 <section class="services-section spad">
        <div class="container">
        <div class="row">
                <div class="col-lg-12">
                    <div class="contact-title">
                        <div class="section-title">
                            <h2>위탁안내</h2>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="contact-title">
                        <div class="section-title">
                            <h3><strong>Why Luxtion</strong></h3><br/><br/>
                             <h3><span style="font-size: 18px; color: #585858">다양한 경매 플랫폼과 홍보 활동</span></h3><hr>
                            <ul>
							<li>
								<dl>
									<dt style="font-weight: normal;"> · 2가지 경매 플랫폼</dt>
									<dd><p>&nbsp;&nbsp;프리미엄 경매, 일반 경매</p></dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt style="font-weight: normal;"> · 다양한 홍보 마케팅 및 SNS</dt>
									<dd><p>&nbsp;&nbsp;자선경매 등 사회공헌활동 및 페이스북, 인스타그램, 카카오톡, 블로그 등
										활발한 SNS</p></dd>
								</dl><br/>
							</li>
						</ul>
						<h3><span style="font-size: 18px; color: #585858">서비스 차별화</span></h3><hr>
						<ul>
							<li> · 럭션의 노하우로 엄선된 상품</li>
							<li> · 안전 거래 시스템 구축</li>
                    		<li> · 신속하고 친절한 배송</li> 
						</ul>
						<br/><br/><br/>
						<span style="font-size: 21px; color: #585858">&nbsp;&nbsp;&nbsp;소장하신 물품을 럭션에 위탁하시려면 다음의 절차에 따라 신청해주세요.</span>
					</div>
                    </div>
                </div>
            </div>
           
    <div id="content">
	<div id="howto">
		<div class="guidance">
			<div class="inbox">
				<h3><img src="/resources/img/위탁접수.jpg" alt=""><br/>
				<strong>01</strong> 위탁 접수</h3>
				<div class="infoBox">
					<ul>
						<li class="app last">
							<br/>
							<p class="tit">홈페이지 접수</p>
							<p class="txt" style="font-size: 17px;">
								로그인 후 [Service] > [위탁신청]을 통해<br/> 편리하게 위탁을 신청하실 수 있습니다.
							</p>
							<div class="appbtn">
								<a id="form" href="/kmk/consign/consign_form" style="margin-top: 15px; padding-top: 2px;"><span>위탁신청 바로가기</span></a>
							</div>
						</li>
					</ul>
				</div>
			</div>

			<div class="inbox">
				<h3><img src="/resources/img/위탁감정.jpg" alt=""><br/>
				<strong>02</strong>감정 및 <br/>상품등록 안내</h3>
				<p class="hTxt">
				<strong style="font-size: 17px;">
				럭션은 엄선된 진품만을 취급합니다. 자체 검증 시스템을 통과한 상품에 한해 상품 등록이 진행됩니다.<br/>
				제품의 연식, 컨디션 등 판매가 어려울 경우 위탁이 거절될 수 있습니다.<br/></strong>
				
				-위탁불가 상품 및 위탁기간 경과 상품은 위탁자의 동의 없이 택배(착불)로 회수를 진행할 수 있습니다.<br/>
				- 회수 통보 후 30일 이내 회수되지 않은 상품은 위탁자의 회원정보에 기재된 주소로 택배(착불) 발송되며,<br/>
				주소지 불분명, 연락 두절 등의 사유로 인해 반송되는 제품은 회사에서 폐기처분되오니 유의해 주시기 바랍니다.
				<br/><br/><br/>
				※ 위조된 상품을 위탁판매 시도할 경우 럭션은 위탁인에 대해 민/형사적 법적 조치를 취하고 영구 탈퇴 처리합니다.<br/>
				</p>
			</div>

			<div class="inbox last">
				<h3><img src="/resources/img/위탁대금.jpg" alt=""><br/>
				<strong>03</strong> 위탁 대금 안내</h3>
				<p class="hTxt">
					1) 럭션을 통해 위탁하신 물품이 낙찰되면 위탁자에게 개별적으로 통보합니다.<br/>
					&nbsp;&nbsp;&nbsp;(자세한 내용은 [MyPage] > [낙찰내역]에서 확인 가능)<br/>
					2) 낙찰자를 통해 낙찰 대금이 완납되면 위탁 수수료를 제한 위탁 대금이 지급됩니다.
				</p>
				<div class="infoBox">
					<ul>
						<li class="fees">
							<p class="tit">위탁수수료</p>
							<p class="txt">
								<br/>
								위탁수수료는 낙찰가 3백만원 이하의 경우에는 낙찰가의 15%(부가가치세 별도)를 적용하고, 3백만원을 초과하는 경우에는 그 초과하는 금액에 대하여 10%(부가가치세 별도)로 적용하여 합산합니다. 자세한 사항은 럭션 약관을 참조하시길 바랍니다.
							</p>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
        </div>
    </section>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>