<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<style>
.faq {min-height : 50vh;}
.tab {width:100%; background:#F6F9FB;}
.tab ul {text-align:center; font-size:0; line-height:0;}
.tab ul li {display:inline; margin:0 0 0 -1px;}
.tab ul li a {display:inline-block; font-size:20px; color:#333; letter-spacing:1.6px; padding:0 30px; margin:0 0 10px 0; border-left:1px #333 solid; border-right:1px #333 solid;}
.tab ul li.on a {color:#F9AD81; font-weight:600;}
</style>

    
<body>   
    <section class="contact-section spad">
        <div class="container faq">
            <div class="row">
                <div class="col-lg-12">
                    <div class="contact-title">
                        <div class="section-title">
                            <h2>FAQ</h2>
                        </div>
                    </div>
                </div>
            </div>
           
           <div class="col-lg-10">
                    <div class="info-box">
                    	<div class="tab">
                        <ul>
                            <li><a href="?">전체</a></li>
                			<li><a href="?cate=1">회원</a></li>
               				<li><a href="?cate=2">경매</a></li>
                			<li><a href="?cate=3">낙찰</a></li>
                			<li><a href="?cate=4">위탁</a></li>
                			<li><a href="?cate=5">기타</a></li>
                        </ul>
                    </div>
                 </div>
             </div>
        </div>
        
        <div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-6">
		</div>
		<div class="col-md-4">
		<div class="moreFaq" style="margin: 10px;">
			<p>· 더 궁금하신 사항은 1:1문의를 이용해 주세요.
				<a href="/sjw/auction/qnaForm" class="primary-btn">1:1문의 바로가기</a>
			</p>
		</div>
		</div>
	</div>
    </section>
    


<%@ include file="/WEB-INF/views/include/footer.jsp" %>