<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/include/sidebarHeader.jsp"%>
<script>
$(function() {
		
		var msg = "${msg}";
		if (msg == "insertSuccess") {
			alert("공지사항 등록 성공");
		}
		if (msg == "deleteSuccess") {
			alert("공지사항 삭제 성공");
		}
	
	// 검색
	$("#btnSearch").click(function () {
		var keyword = $("#keyword").val();
		console.log("keyword: " + keyword);
		$("#adminFrmPageN > input[name=keyword]").val(keyword);
		$("#adminFrmPageN").submit();
	});
	
	// 제목 클릭 -> 공지내용보기
	$("a.n_title").click(function(e) {
		e.preventDefault();
		var nno = $(this).attr("data-nno");
		$("#adminFrmPageN > input[name=nno]").val(nno);
		$("#adminFrmPageN").attr("action", $(this).attr("href"));
		$("#adminFrmPageN").submit();
	});
	
	// 페이지 번호
	$("a.page-link").click(function(e) {
		e.preventDefault();
		var page = $(this).attr("href").trim();
		$("#adminFrmPageN > input[name=page]").val(page);
		$("#adminFrmPageN").submit();
	});
	
	// 현재 페이지 액티브
	$("a.page-link").each(function () {
		var page = $(this).attr("href");
		if (page == "${noticePagingDto.page}") {
			$(this).parent().addClass("active");
			return;
		}
	});
	
	
});
</script>
<%@ include file="/WEB-INF/views/include/sjw/admin_frmPage.jsp" %>


<div class="container-fluid" style="margin-top: 100px;">
	<div class="row">
		<div class="col-md-12">
			<h3 class="text-center">
				공지사항 목록
			</h3>
			<div class="row">
				<div class="col-md-2">
				</div>
				<div class="col-md-8">
							<form class="form-inline md-form mr-auto mb-4" style="float: right;">
								<input class="form-control mr-sm-2" type="text"
									placeholder="Search" aria-label="Search" id="keyword"
									name="keyword" value="${noticePagingDto.keyword}">
								<button class="btn btn-elegant btn-rounded my-0"
									type="submit" id="btnSearch" style="background-color: #979494; color: #fff;">검색</button>
							</form>
					<table class="table table-hover" style="border-top: 3px solid #979697; border-bottom: 3px solid #979697;" >
						<thead>
							<tr>
								<th>글번호</th>
								<th>제목</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="noticeVo">
								<tr>
									<td>${noticeVo.nno}</td>
									<td><a href="/sjw/admin/admin_noticeRead" class="n_title" style="color: #525252;" data-nno="${noticeVo.nno}">${noticeVo.n_title}</a></td>
									<td>${noticeVo.n_date}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="row">
						<div class="col-md-11">
							<nav>
								<ul class="pagination">
									<!-- 이전 -->
									<c:if test="${noticePagingDto.startPage != 1}">
										<li class="page-item"><a class="page-link"
											href="${noticePagingDto.startPage - 1}">&laquo;</a></li>
									</c:if>
									<!-- 페이지 넘버링 -->
									<c:forEach begin="${noticePagingDto.startPage}"
										end="${noticePagingDto.endPage}" var="v">
									<li class="page-item"
										<c:choose>
 											<c:when test="${noticePagingDto.page == v}">
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
									<c:if
										test="${noticePagingDto.endPage < noticePagingDto.totalPage}">
										<li class="page-item"><a class="page-link"
											href="${noticePagingDto.endPage + 1}">&raquo;</a></li>
									</c:if>
								</ul>
							</nav>
						</div>
						<div class="col-md-1">
							<p>
								<a class="btn btn-secondary" href="/sjw/admin/admin_noticeForm">글쓰기</a>
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