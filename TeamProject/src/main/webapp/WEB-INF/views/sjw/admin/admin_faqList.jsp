<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ include file="/WEB-INF/views/include/sidebarHeader.jsp"%>
<style>
.pagination > li > a {
	background-color : white;
	color : black; 
}
.pagination > .page-item.active > .page-link {
	background-color: #979494;
	border: solid 1px #979494;
}
</style>
<script>
$(function() {
	
	var msg = "${msg}";
	if (msg == "insertSuccess") {
		alert("FAQ 등록 성공");
	}
	if (msg == "deleteSuccess") {
		alert("FAQ 삭제 성공");
	}
	
	// 검색
	$("#btnSearch").click(function () {
		var searchType = $("select[name=searchType]").val();
		var keyword = $("#keyword").val();
		$("#adminFrmPageF > input[name=searchType]").val(searchType);
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
		<div class="col-md-12">
			<h3 class="text-center">
				FAQ 목록
			</h3>
			<div class="row">
				<div class="col-md-2">
				</div>
				<div class="col-md-8">
					<form class="form-inline md-form mr-auto mb-4" style="float: right;">
						<select class="mdb-select md-form colorful-select dropdown-primary" name="searchType" style="width: 100px; height: 38px; border: 1px solid #cfcfcf; border-radius: 5px 5px 5px 5px;">
							<option value="tc"
								<c:if test="${faqPagingDto.searchType == 'tc'}">selected</c:if>
							>전체</option>
							<option value="t"
								<c:if test="${faqPagingDto.searchType == 't'}">selected</c:if>
							>제목</option>
							<option value="c"
								<c:if test="${faqPagingDto.searchType == 'c'}">selected</c:if>
							>내용</option>
						</select>&nbsp;&nbsp;
						<input class="form-control mr-sm-2" type="text"
							placeholder="Search" aria-label="Search" id="keyword"
							name="keyword" value="${faqPagingDto.keyword}">
						<button class="btn btn-elegant btn-rounded my-0"
							type="submit" id="btnSearch" style="background-color: #979494; color: #fff;">검색</button>
					</form>
					<table class="table table-hover" style="border-top: 3px solid #979697; border-bottom: 3px solid #979697;">
						<thead>
							<tr>
								<th>글번호</th>
								<th>카테고리</th>
								<th>제목</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="faqVo">
								<tr>
									<td>${faqVo.fno}</td>
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
								<a class="btn btn-secondary" href="/sjw/admin/admin_faqForm">글쓰기</a>
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

<%@ include file="/WEB-INF/views/include/sidebarFooter.jsp"%>