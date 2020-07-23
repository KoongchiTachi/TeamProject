<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<link href="/resources/css/content.css" rel="stylesheet" type="text/css">
<style>
</style>
<script>

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
                            <h3>Why Luxtion</h3>
                        </div>
                    </div>
                </div>
            </div>
           
    <div id="content">
	<div id="howto">
		<div class="guidance">
			<div class="inbox">
				<h3><strong>01</strong> 위탁 접수</h3>
				<div class="infoBox">
					<ul>
						<li class="app last">
							<p class="tit">홈페이지 접수</p>
							<p class="txt">
								로그인 후 [Service] > [위탁신청]을 통해<br/> 편리하게 위탁을 신청하실 수 있습니다.
							</p>
							<div class="appbtn">
								<a id="form" href="/kmk/consign/consign_form"><span>위탁신청 바로가기</span></a>
							</div>
						</li>
					</ul>
				</div>
			</div>

			<div class="inbox">
				<h3><strong>02</strong> 감정 및 <br/>상품등록 안내</h3>
				<p class="hTxt">
				<strong>
				럭션은 진품만을 취급합니다. 자체 검증 시스템을 통과한 상품에 한해 상품 등록이 진행됩니다.<br/>
				제품의 연식, 컨디션 등 판매가 어려울 수 있을 경우 위탁이 거절될 수 있습니다.<br/></strong>
				
				-위탁불가 상품 및 위탁기간 경과 상품은 위탁자의 동의 없이 택배(착불)로 회수를 진행할 수 있습니다.<br/>
				- 회수 통보 후 30일 이내 회수되지 않은 상품은 위탁자의 회원정보에 기재된 주소로 택배(착불) 발송되며,<br/>
				주소지 불분명, 연락 두절 등의 사유로 인해 반송되는 제품은 회사에서 폐기처분되오니 유의해 주시기 바랍니다.
				<br/><br/><br/>
				※ 모든 브랜드는 높은 수준의 진품 기준이 있습니다.<br/> 
				럭션 역시 이에 부합하도록 업계 최고 수준의 감정 기술을 통해 모든 상품의 진품 여부를 판단 후 고객님들께 선보입니다.<br/>
				※ 위조된 상품을 위탁판매 시도할 경우 럭션은 위탁인에 대해 민/형사적 법적 조치를 취하고 영구 탈퇴 처리합니다.<br/>
				</p>
			</div>

			<div class="inbox last">
				<h3><strong>03</strong> 위탁 대금 안내</h3>

				<p class="hTxt">
					1) 럭션을 통해 위탁하신 물품이 낙찰되면 위탁자에게 개별적으로 통보합니다.<br/>
					&nbsp;&nbsp;&nbsp;(자세한 내역은 마이페이지 낙찰내역에서 확인 가능)<br/>
					2) 낙찰자를 통해 낙찰 대금이 완납되면 위탁 수수료를 제한 위탁 대금이 지급됩니다.
				</p>
				<div class="infoBox">
					<ul>
						<li class="fees">
							<p class="tit">위탁수수료</p>
							<p class="txt">
								위탁수수료는 낙찰가 3백만원 이하의 경우에는 낙찰가의 15%(부가가치세 별도)를 적용하고, 3백만원을 초과하는 경우에는 그 초과하는 금액에 대하여 10%(부가가치세 별도)로 적용하여 합산합니다. 자세한 사항은 럭션 약관을 참조하시길 바랍니다.
							</p>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

<script type="text/javascript">
$(document).ready(function() {

	$('.stepBox ul li .inner').matchHeight();

});
</script>

</div>
        </div>
    </section>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>