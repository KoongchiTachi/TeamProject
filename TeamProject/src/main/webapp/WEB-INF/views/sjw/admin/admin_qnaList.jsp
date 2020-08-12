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
.optionGroup {
    font-weight: bold;
}
</style>
<script>
$(function() {
		
		$("#chkAll").click(function() {
			var chk = $(this).prop("checked");
			if (chk) {
				$(".chkQna").prop("checked", true);
			} else {
				$(".chkQna").prop("checked", false);
			}
		});
		$(".chkQna").click(function() {
			$("#chkAll").prop("checked", false);
		});
		
		// 글 삭제 (체크박스)
		$("#btnCheck").click(function() {
			var checkArr = new Array();
			$(".chkQna:checked").each(function() {			
				checkArr.push($(this).attr("data-qno"));
			});
			if (checkArr == null || checkArr == "") {
				alert("선택된 글이 없습니다.");
				return;
			}
			var r = confirm("삭제하시겠습니까?");
			if (r == false) {
				location.reload();
 				return;
			}
			var url = "/sjw/admin/admin_qnaDeleteChk";
			$.ajax({
				"type" : "post",
				"url" : url,
				"data" : { chbox : checkArr },
				"success" : function(result) {
					alert("삭제되었습니다.");
					$(".chkQna:checked").parent().parent().hide();
				},
				"error" : function(data) {
					alert("에러발생.");
					return false;
				}
			});
		});
	
 	// 검색
	$("#btnSearch").click(function () {
		var searchType = $("select[name=searchType]").val();
		var keyword = $("#keyword").val();
		$("#adminFrmPageN > input[name=searchType]").val(searchType);
		$("#adminFrmPageN > input[name=keyword]").val(keyword);
		$("#adminFrmPageN").submit();
	});
	
	// 제목 클릭 -> 1:1문의 조회
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
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<form class="form-inline md-form mr-auto mb-4"
						style="float: right;">
						<select
							class="mdb-select md-form colorful-select dropdown-primary"
							name="searchType"
							style="width: 120px; height: 38px; border: 1px solid #cfcfcf; border-radius: 5px 5px 5px 5px;">
							<option class="optionGroup" selected disabled>선택하세요</option>
							<optgroup label="답변상태">
							<option value="N"
								<c:if test="${qnaPagingDto.searchType == 'N'}">selected</c:if>
							>답변대기</option>
							<option value="Y"
								<c:if test="${qnaPagingDto.searchType == 'Y'}">selected</c:if>
							>답변완료</option>
							</optgroup>
							<optgroup label="검색조건">
							<option value="kind"
								<c:if test="${qnaPagingDto.searchType == 'kind'}">selected</c:if>
							>문의유형</option>
							<option value="id"
								<c:if test="${qnaPagingDto.searchType == 'id'}">selected</c:if>
							>작성자</option>
							<option value="t"
								<c:if test="${qnaPagingDto.searchType == 't'}">selected</c:if>
							>제목</option>
							<option value="c"
								<c:if test="${qnaPagingDto.searchType == 'c'}">selected</c:if>
							>내용</option>
							</optgroup>
						</select>&nbsp;&nbsp; <input class="form-control mr-sm-2" type="text"
							placeholder="Search" aria-label="Search" id="keyword"
							name="keyword" value="${qnaPagingDto.keyword}">
						<button class="btn btn-elegant btn-rounded my-0" type="submit"
							id="btnSearch" style="background-color: #979494; color: #fff;">검색</button>
					</form>
					<table class="table table-hover"
						style="border-top: 3px solid #979697; border-bottom: 3px solid #979697;">
						<thead>
							<tr style="text-align: center;">
								<th style="width: 50px;"><input type="checkbox" id="chkAll"></th>
								<th>글번호</th>
								<th>문의유형</th>
								<th style="width: 300px;">제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>답변여부</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="qnaVo">
								<tr style="text-align: center;">
									<td><input type="checkbox" class="chkQna"
										data-qno="${qnaVo.qno}"></td>
									<td>${qnaVo.qno}</td>
									<td>${qnaVo.q_kind}</td>
									<td><a href="/sjw/admin/admin_qnaRead" class="q_title"
										style="color: #525252; text-decoration: underline;"
										data-qno="${qnaVo.qno}">${qnaVo.q_title}</a></td>
									<td>${qnaVo.m_id}</td>
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
						<div class="col-md-10">
							<nav>
								<ul class="pagination">
									<c:if test="${qnaPagingDto.startPage != 1}">
										<li class="page-item"><a class="page-link"
											href="${qnaPagingDto.startPage - 1}">&laquo;</a></li>
									</c:if>
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
 										</c:choose>>
											<a class="page-link" href="${v}">${v}</a>
										</li>
									</c:forEach>
									<c:if test="${qnaPagingDto.endPage < qnaPagingDto.totalPage}">
										<li class="page-item"><a class="page-link"
											href="${qnaPagingDto.endPage + 1}">&raquo;</a></li>
									</c:if>
								</ul>
							</nav>
						</div>
						<div class="col-md-2" align="right">
							<button type="button" class="btn btn-secondary" id="btnCheck">삭제</button>
						</div>
					</div>
				</div>
				<div class="col-md-2"></div>
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/sidebarFooter.jsp"%>