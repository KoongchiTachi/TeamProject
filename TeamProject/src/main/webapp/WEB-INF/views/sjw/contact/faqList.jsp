<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
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
}
.panel-group {
	/* 	border-top: 1px solid #888888; */
	/* 	border-bottom: 1px solid #888888; */
	width: 98%;
	margin-left: 8px;
}
.panel-group .panel {
	border-radius: 0;
	box-shadow: none;
	border-color: #EEEEEE;
	border-left-color: #ffffff;
	border-right-color: #ffffff;
}
.panel-default>.panel-heading {
	padding: 0;
	border-radius: 0;
	color: #212121;
	background-color: #ffffff;
	border-color: #EEEEEE;
}
.panel-title {
	font-size: 17px;
}
.panel-title>a {
	display: block;
	padding: 15px;
	text-decoration: none;
	color: #212121;
}
.more-less {
	float: right;
	color: #212121;
}
.panel-default>.panel-heading+.panel-collapse>.panel-body {
	border-top-color: #EEEEEE;
	font-size: 16px;
	color: #5E5E5E;
}
/* ----- v CAN BE DELETED v ----- */
.demo {
	padding-top: 60px;
	padding-bottom: 60px;
}
p {
	font-size: 16px;
}
.faq {
	min-width: 90%;
	padding-left: 250px;
}
</style>
<script>
$(function() {

	$("a.page-link").click(function(e) {
		e.preventDefault();
		var page = $(this).attr("href").trim();
		$("#frmPage > input[name=page]").val(page);
		$("#frmPage").submit();
	});
	
	$("a.page-link").each(function () {
		var page = $(this).attr("href");
		if (page == "${faqPagingDto.page}") {
			$(this).parent().addClass("active");
			return;
		}
	});
});
</script>
<form id="frmPage" action="/sjw/contact/faqList" method="get">
	<input type="hidden" name="page" value="${faqPagingDto.page}"/>
	<input type="hidden" name="perPage" value="${faqPagingDto.perPage}"/>
</form> 
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
						<li class="on"><a href="/sjw/contact/faqList">전체</a></li>
						<li><a href="/sjw/contact/faq1">회원</a></li>
						<li><a href="/sjw/contact/faq2">경매</a></li>
						<li><a href="/sjw/contact/faq3">낙찰</a></li>
						<li><a href="/sjw/contact/faq4">위탁</a></li>
						<li><a href="/sjw/contact/faq5">기타</a></li>
					</ul>
				</div>
			</div>

			<div class="container demo">
				<c:forEach items="${list}" var="faqVo" varStatus="status">
						<div class="panel-group" id="accordion" role="tablist"
							aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab"
									id="heading${status.count}">
									<h4 class="panel-title">
										<a role="button" data-toggle="collapse"
											data-target="#collapse${status.count}"
											data-parent="#accordion" href="#collapseOne"
											aria-expanded="false" aria-controls="collapseOne"
											style="font-weight: bold;"> <i
											class="more-less glyphicon glyphicon-chevron-down"></i>${faqVo.f_title}
										</a>
									</h4>
								</div>
								<div id="collapse${status.count}"
									class="panel-collapse collapse" role="tabpanel"
									aria-labelledby="headingOne" data-parent="#accordion">
									<div class="panel-body">${faqVo.f_content}</div>
								</div>
							</div>
						</div>
				</c:forEach>
			</div>

			<div class="row">
				<div class="col-md-5"></div>
				<div class="col-md-2">
					<div class="pagination">
						<c:forEach begin="${faqPagingDto.startPage}"
							end="${faqPagingDto.endPage}" var="v">

						<li class="page-item"
 						<c:choose>
 							<c:when test="${faqPagingDto.page == v}">
 								class="page-item active"
 							</c:when>
 							<c:otherwise>
 						 		class="page-item"
							</c:otherwise>
 						</c:choose>
						>
							
							<a class="page-link" href="${v}">${v}</a>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-6"></div>
		<div class="col-md-4">
			<div class="moreFaq" style="margin: 10px;">
				<p>
					· 더 궁금하신 사항은 1:1문의를 이용해 주세요. <a href="/sjw/contact/qnaForm"
						class="primary-btn">1:1문의 바로가기</a>
				</p>
			</div>
		</div>
	</div>

</section>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>