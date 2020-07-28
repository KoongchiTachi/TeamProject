<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<style>
#admin { 
	margin-top : 150px;
 	min-height : 90vh;
 }
</style>
<script>
$(function() {
	
	var msg = "${msg}";
	if (msg == "insertSuccess") {
		alert("faq 등록 성공");
	}
	if (msg == "deleteSuccess") {
		alert("faq 삭제 성공");
	}
	
	// 검색
	$("#btnSearch").click(function () {
		var keyword = $("#keyword").val();
		console.log("keyword: " + keyword);
		$("#adminFrmPageF > input[name=keyword]").val(keyword);
		$("#adminFrmPageF").submit();
	});
	
	// 제목 클릭 -> faq내용보기
	$("a.f_title").click(function(e) {
		e.preventDefault();
		var fno = $(this).attr("data-fno");
		$("#adminFrmPageF > input[name=fno]").val(fno);
		$("#adminFrmPageF").attr("action", $(this).attr("href"));
		$("#adminFrmPageF").submit();
	});
	
	// 페이지 번호
	$("a.page-link").click(function(e) {
		e.preventDefault();
		var page = $(this).attr("href").trim();
		$("#adminFrmPageF > input[name=page]").val(page);
		$("#adminFrmPageF").submit();
	});
	
	// 현재 페이지 액티브
	$("a.page-link").each(function () {
		var page = $(this).attr("href");
		if (page == "${faqPagingDto.page}") {
			$(this).parent().addClass("active");
			return;
		}
	});
	
	
});
</script>
<%@ include file="/WEB-INF/views/include/sjw/admin_frmPage.jsp" %>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12" id="admin">
			<h3 class="text-center">
				FAQ 목록 (관리자)
			</h3>
			<div class="row">
				<div class="col-md-2">
				</div>
				<div class="col-md-8">
				<nav class="navbar navbar-expand-lg navbar-light bg-light" style="float: right;">
						<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" style="background-color: white;">
							<form class="form-inline">
								<input class="form-control mr-sm-2" type="text" id="keyword" name="keyword" value="${faqPagingDto.keyword}"/> 
								<button class="btn btn-primary my-2 my-sm-0" type="submit">
									검색
								</button>
							</form>
							
						</div>
					</nav>
					<table class="table table-hover">
						<thead>
							<tr>
								<th>카테고리</th>
								<th>글번호</th>
								<th>제목</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="faqVo">
								<tr>
									<c:choose>
										<c:when test="${faqVo.f_cate == 'f1001'}">
											<td>회원</td>
										</c:when>
										<c:when test="${faqVo.f_cate == 'f1002'}">
											<td>경매</td>
										</c:when>
										<c:when test="${faqVo.f_cate == 'f1003'}">
											<td>낙찰</td>
										</c:when>
										<c:when test="${faqVo.f_cate == 'f1004'}">
											<td>위탁</td>
										</c:when>
										<c:otherwise>
											<td>기타</td>
										</c:otherwise>
									</c:choose>
									<td>${faqVo.fno}</td>
									<td><a href="/sjw/admin/admin_faqRead" class="f_title" data-fno="${faqVo.fno}">${faqVo.f_title}</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="row">
						<div class="col-md-11">
							<nav>
								<ul class="pagination">
									<!-- 이전 -->
									<c:if test="${faqPagingDto.startPage != 1}">
										<li class="page-item"><a class="page-link"
											href="${faqPagingDto.startPage - 1}">&laquo;</a></li>
									</c:if>
									<!-- 페이지 넘버링 -->
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
									</li>
									</c:forEach>
									<!-- 다음 -->
									<c:if test="${faqPagingDto.endPage < faqPagingDto.totalPage}">
										<li class="page-item"><a class="page-link"
											href="${faqPagingDto.endPage + 1}">&raquo;</a></li>
									</c:if>
								</ul>
							</nav>
						</div>
						<div class="col-md-1">
							<p>
								<a class="btn btn-success" href="/sjw/admin/admin_faqForm">글쓰기</a>
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-2">
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>