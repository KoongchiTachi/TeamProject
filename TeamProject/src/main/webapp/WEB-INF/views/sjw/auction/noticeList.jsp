<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<style>
.noticeList {
 	min-height : 50vh;
}
.table {
	border-top: 2px solid #888888;
	border-bottom: 2px solid #888888;
}
.table td {
	font-size : 18px;
}
.blog-right {
	float: right;
/* 	margin-top: 0px; */
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
</style>
<script>
$(function() {
	var msg = "${msg}";
	if (msg == "success") {
		alert("공지사항 등록 성공");
	}
	
	// 검색
	$("#btnSearch").click(function () {
		var keyword = $("#keyword").val();
		console.log("keyword: " + keyword);
		$("#frmPage > input[name=keyword]").val(keyword);
		$("#frmPage").submit();
	});
	
	// 제목 클릭 -> 공지내용보기
	$("a.n_title").click(function(e) {
		e.preventDefault();
		var nno = $(this).attr("data-nno");
		$("#frmPage > input[name=nno]").val(nno);
		$("#frmPage").attr("action", $(this).attr("href"));
		$("#frmPage").submit();
	});
	
	// 페이지 번호
	$("a.page-link").click(function(e) {
		e.preventDefault();
		var page = $(this).attr("href").trim();
		$("#frmPage > input[name=page]").val(page);
		$("#frmPage").submit();
	});
	
	
});
</script>

<%@ include file="/WEB-INF/views/include/sjw/frmPage.jsp" %>

<section class="contact-section spad">
<div class="container noticeList">
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
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-10">

							<table class="table table-hover">
								<thead>
									<tr>
										<th>글번호</th>
										<th>제목</th>
										<th>작성일</th>
										<th>조회수</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list}" var="noticeVo">
										<tr>
											<td>${noticeVo.nno}</td>
											<td><a href="/sjw/auction/notice" class="n_title" data-nno="${noticeVo.nno}">${noticeVo.n_title}</a></td>
											<td>${noticeVo.n_date}</td>
											<td>${noticeVo.view_cnt}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div class="row">
								<div class="col-md-5"></div>
								<div class="col-md-2">
								
									<div class="blog-pagination">
									
									<c:forEach begin="${noticePagingDto.startPage}" end="${noticePagingDto.endPage}" var="v">
										<a class="page-link" href="${v}">${v}</a>
									</c:forEach>
									
									</div>
								
								</div>
								<div class="col-md-5">
									<div class="blog-right">
										<div class="blog-search">
											<input type="text" id="keyword" name="keyword" value="${noticePagingDto.keyword}">
											<button type="button" id="btnSearch">검색</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-1"></div>
					</div>
				</div>
			</div>
		</div>        
</section>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>