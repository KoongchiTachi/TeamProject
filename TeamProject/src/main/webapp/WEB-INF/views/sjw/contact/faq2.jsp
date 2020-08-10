<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<link rel="stylesheet" href="/resources/css/accordion.css">
<script src="/resources/js/accordion.js"></script>
<style>
.faq {
	min-height: 50vh;
}
.tab {
	width: 100%;
}
.tab ul {
	text-align: center;
	font-size: 0;
	line-height: 0;
}
.tab ul li {
	display: inline;
	margin: 0 0 0 -1px;
}
.tab ul li a {
	display: inline-block;
	font-size: 20px;
	color: #333;
	letter-spacing: 1.6px;
	padding: 0 30px;
	margin: 0 0 10px 0;
	border-left: 1px #333 solid;
	border-right: 1px #333 solid;
}
.tab ul li.on a {
	color: #F9AD81;
	font-weight: 600;
}
.info-box {
	height: 100px;
	margin-bottom: 40px;
}
.faq {
	min-width: 90%;
	padding-left: 250px;
}
.blog-right {
	float: right;
 	margin-top: 20px;
}
.blog-right .blog-search input {
	color : #5E5E5E;
	width: 64%;
	height: 40px;
	border: none;
	border-bottom: 1px solid #888888;
	font-size: 15px;
	font-weight: 600;
}
.blog-right .blog-search button {
	color: #ffffff;
	font-size: 14px;
	font-weight: 600;
	padding: 0 24px;
	height: 100%;
	position: absolute;
	right: 0;
	top: 0;
	background: #F9AD81;
	border: none;
	cursor: pointer;
}
.blog-search input::placeholder { 
	color: #BDBDBD;
}
.moreFaq a {
	border: 1px dashed #ebe8e8;
}
.inner-header .main-menu ul li a.active {
	color: #F9AD81;
}
</style>
<script>
$(function() {
	$(".nav5").addClass("active");
});
</script>
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
					<ul class="tab_menu">
						<li><a href="/sjw/contact/faqList">전체</a></li>
						<li><a href="/sjw/contact/faq1">회원</a></li>
						<li class="on"><a href="/sjw/contact/faq2">경매</a></li>
						<li><a href="/sjw/contact/faq3">낙찰</a></li>
						<li><a href="/sjw/contact/faq4">위탁</a></li>
						<li><a href="/sjw/contact/faq5">기타</a></li>
					</ul>
				</div>
			</div>
			<div class="accordion-started accordion-bral row">
				<c:forEach items="${list}" var="faqVo">
					<div class="col-sm-12 col-md-12 col-lg-12" id="heading">
						<input class="ac-input" id="ac-1" name="accordion-1" type="radio" />
						<label class="ac-label" for="ac-1">${faqVo.f_title}<i></i></label>
						<div class="article ac-content">
							<p class="text-justify" style="color: #5E5E5E;">${faqVo.f_content}</p>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="row">
				<div class="col-md-5"></div>
				<div class="col-md-2"></div>
				<div class="col-md-5"></div>
			</div>
		</div>
	</div>

	<div class="row" style="margin-top: 50px;">
		<div class="col-md-4"></div>
		<div class="col-md-6">
			<div class="moreFaq" align="left">
				<p style="font-size: 16px;">
					· 더 궁금하신 사항은 1:1문의를 이용해 주세요.&emsp;<a href="/sjw/contact/qnaForm"
						class="primary-btn" style="height: 60px; color:black; font-weight:bold; background-color: white;" >1:1문의 바로가기</a>
				</p>
			</div>
		</div>
		<div class="col-md-2">
		</div>
	</div>

</section>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>