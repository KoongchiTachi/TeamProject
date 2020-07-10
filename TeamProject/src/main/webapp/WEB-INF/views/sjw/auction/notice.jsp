<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<style>
.notice {
	min-height : 60vh;
}

textarea {
 	min-height: 50%; 
 }
</style>


<section class="about-us spad">
<div class="container notice">
	<div class="row">
                <div class="col-lg-12">
                    <div class="contact-title">
                        <div class="section-title">
                            <h2>공지사항</h2>
                        </div>
                    </div>
                </div>
            </div>
            
            
            <div class="row">
                <div class="col-lg-8">
                    <form action="#" class="contact-form">
                        <div class="row">
                            <div class="col-lg-12">
                                <input type="text" class="subject" placeholder="코로나 19 바이러스 관련 안내입니다." readonly/>
                                <textarea placeholder="케이옥션은 전시장의 위생관리를 위한 관리 시스템을 갖추고 안전 유지를 위해 최선을 다하고 있으니, 안심하시고 방문해 주시면 감사하겠습니다.
아울러, 전시장 출입시 반드시 입구에서 소독제로 손을 세척해 주시고, 마스크 착용을 부탁드립니다.
또 최근 해외 및 지방 방문 이력이 있으시거나 증상이 있으신 경우, 방문을 자제해 주시기를 부탁드립니다.
조속히 현 사태가 안정되기를 기원하며, 오늘 하루도 건강하게 보내시기 바랍니다." readonly></textarea>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
	</div>
	
	<div class="row">
			<div class="col-md-6">
			</div>
			<div class="col-md-2">
			<a href="/sjw/auction/noticeList" class="primary-btn">목록으로</a>
			</div>
			<div class="col-md-4">
				
			</div>
		</div>
</section>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>