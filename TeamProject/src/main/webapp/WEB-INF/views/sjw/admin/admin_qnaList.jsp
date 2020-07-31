<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/include/sidebarHeader.jsp"%>
<script src="http://code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>
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
		
// 		var msg = "${msg}";
// 		if (msg == "insertSuccess") {
// 			alert("등록되었습니다.");
// 		}
// 		if (msg == "deleteSuccess") {
// 			alert("삭제되었습니다.");
// 		}
		
// 		$("#chkAll").click(function() {
// 			var chk = $(this).prop("checked");
// 			if (chk) {
// 				$(".chkNotice").prop("checked", true);
// 			} else {
// 				$(".chkNotice").prop("checked", false);
// 			}
// 		});
// 		$(".chkNotice").click(function() {
// 			$("#chkAll").prop("checked", false);
// 		});
		
// 		$("#btnCheck").click(function() {
// 			var checkArr = new Array();
// 			$(".chkNotice:checked").each(function() {			
// 				checkArr.push($(this).attr("data-nno"));
// 			});
// 			if (checkArr == null || checkArr == "") {
// 				alert("선택된 글이 없습니다.");
// 				return;
// 			}
// 			var r = confirm("삭제하시겠습니까?");
// 			if (r == false) {
// 				return;
// 			}
// 			var url = "/sjw/admin/admin_noticeDeleteChk";
// 			$.ajax({
// 				"type" : "post",
// 				"url" : url,
// 				"data" : { chbox : checkArr },
// 				"success" : function(result) {
// 					alert("삭제되었습니다.");
// 					$(".chkNotice:checked").parent().parent().hide();
// 				},
// 				"error" : function(data) {
// 					alert("에러가 발생했습니다.");
// 					return false;
// 				}
// 			});
// 		});
	
// 	// 검색
// 	$("#btnSearch").click(function () {
// 		var searchType = $("select[name=searchType]").val();
// 		var keyword = $("#keyword").val();
// 		$("#adminFrmPageN > input[name=searchType]").val(searchType);
// 		$("#adminFrmPageN > input[name=keyword]").val(keyword);
// 		$("#adminFrmPageN").submit();
// 	});
	
	// 제목 클릭 -> 공지내용보기
	$("a.q_title").click(function(e) {
		e.preventDefault();
		var qno = $(this).attr("data-qno");
		$("#adminFrmPageQ > input[name=qno]").val(qno);
		$("#adminFrmPageQ").attr("action", $(this).attr("href"));
		$("#adminFrmPageQ").submit();
	});
	
	// 페이지 번호
	$("a.page-link").click(function(e) {
		e.preventDefault();
		var page = $(this).attr("href").trim();
		$("#adminFrmPageQ > input[name=page]").val(page);
		$("#adminFrmPageQ").submit();
	});
	
	// 현재 페이지 액티브
	$("a.page-link").each(function () {
		var page = $(this).attr("href");
		if (page == "${qnaPagingDto.page}") {
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
				1:1문의 목록
			</h3>
			<div class="row">
				<div class="col-md-2">
				</div>
				<div class="col-md-8">
							<form class="form-inline md-form mr-auto mb-4" style="float: right;">
								<select class="mdb-select md-form colorful-select dropdown-primary" name="searchType" style="width: 100px; height: 38px; border: 1px solid #cfcfcf; border-radius: 5px 5px 5px 5px;">
									<option value="tc"
										<c:if test="${qnaPagingDto.searchType == 'tc'}">selected</c:if>
									>전체</option>
									<option value="t"
										<c:if test="${qnaPagingDto.searchType == 't'}">selected</c:if>
									>제목</option>
									<option value="c"
										<c:if test="${qnaPagingDto.searchType == 'c'}">selected</c:if>
									>내용</option>
								</select>&nbsp;&nbsp;
								<input class="form-control mr-sm-2" type="text"
									placeholder="Search" aria-label="Search" id="keyword"
									name="keyword" value="${qnaPagingDto.keyword}">
								<button class="btn btn-elegant btn-rounded my-0"
									type="submit" id="btnSearch" style="background-color: #979494; color: #fff;">검색</button>
							</form>
					<table class="table table-hover" style="border-top: 3px solid #979697; border-bottom: 3px solid #979697;" >
						<thead>
							<tr style="text-align: center;">
								<th>글번호</th>
								<th>문의유형</th>
								<th>작성자</th>
								<th style="width: 250px;">제목</th>
								<th>작성일</th>
								<th>답변여부</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="qnaVo">
								<tr style="text-align: center;">
									<td>${qnaVo.qno}</td>
									<td>${qnaVo.q_kind}</td>
									<td>${qnaVo.m_id}</td>
									<td><a href="/sjw/admin/admin_qnaRead" class="q_title" style="color: #525252;" data-qno="${qnaVo.qno}">${qnaVo.q_title}</a></td>
									<td>${qnaVo.q_date}</td>
									<c:choose>
										<c:when test="${qnaVo.q_answer == 'N'}">
											<td>답변대기</td>
										</c:when>
										<c:otherwise>
											<td>답변완료</td>
										</c:otherwise>
									</c:choose>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="row">
						<div class="col-md-6">
							<nav style="float: right; margin-top: 20px;">
								<ul class="pagination">
									<!-- 이전 -->
									<c:if test="${qnaPagingDto.startPage != 1}">
										<li class="page-item"><a class="page-link"
											href="${qnaPagingDto.startPage - 1}">&laquo;</a></li>
									</c:if>
									<!-- 페이지 넘버링 -->
									<c:forEach begin="${qnaPagingDto.startPage}"
										end="${qnaPagingDto.endPage}" var="v">
									<li class="page-item"
										<c:choose>
 											<c:when test="${qnaPagingDto.page == v}">
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
										test="${qnaPagingDto.endPage < qnaPagingDto.totalPage}">
										<li class="page-item"><a class="page-link"
											href="${qnaPagingDto.endPage + 1}">&raquo;</a></li>
									</c:if>
								</ul>
							</nav>
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