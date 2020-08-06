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
	
	var msg = "${msg}";
	if (msg == "insertSuccess") {
		alert("등록되었습니다.");
	}
	if (msg == "deleteSuccess") {
		alert("삭제되었습니다.");
	}
	
	$("#chkAll").click(function() {
		var chk = $(this).prop("checked");
		if (chk) {
			$(".chkFaq").prop("checked", true);
		} else {
			$(".chkFaq").prop("checked", false);
		}
	});
	$(".chkFaq").click(function() {
		$("#chkAll").prop("checked", false);
	});
	
	$("#btnCheck").click(function() {
		var checkArr = new Array();
		$(".chkFaq:checked").each(function() {			
			checkArr.push($(this).attr("data-fno"));
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
		var url = "/sjw/admin/admin_faqDeleteChk";
		$.ajax({
			"type" : "post",
			"url" : url,
			"data" : { chbox : checkArr },
			"success" : function(result) {
				alert("삭제되었습니다.");
				$(".chkFaq:checked").parent().parent().hide();
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
		$("#adminFrmPageF > input[name=searchType]").val(searchType);
		$("#adminFrmPageF > input[name=keyword]").val(keyword);
		$("#adminFrmPageF").submit();
	});
	
	// 제목 클릭 -> faq 조회
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
						<select class="mdb-select md-form colorful-select dropdown-primary" name="searchType" style="width: 120px; height: 38px; border: 1px solid #cfcfcf; border-radius: 5px 5px 5px 5px;">
							<option value="" selected disabled>선택하세요</option>
							<option value="cate"
								<c:if test="${faqPagingDto.searchType == 'cate'}">selected</c:if>
							>카테고리</option>
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
							<tr style="text-align: center;">
								<th style="width: 60px;"><input type="checkbox" id="chkAll"></th>
								<th style="width: 80px;">글번호</th>
								<th style="width: 80px;">카테고리</th>
								<th style="width: 480px;">제목</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="faqVo">
								<tr style="text-align: center;">
									<td><input type="checkbox" class="chkFaq" data-fno="${faqVo.fno}"></td>
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
									<td><a href="/sjw/admin/admin_faqRead" class="f_title" data-fno="${faqVo.fno}" style="text-decoration: underline;">${faqVo.f_title}</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="row">
						<div class="col-md-10">
							<nav>
								<ul class="pagination">
									<c:if test="${faqPagingDto.startPage != 1}">
										<li class="page-item"><a class="page-link"
											href="${faqPagingDto.startPage - 1}">&laquo;</a></li>
									</c:if>
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
									<c:if test="${faqPagingDto.endPage < faqPagingDto.totalPage}">
										<li class="page-item"><a class="page-link"
											href="${faqPagingDto.endPage + 1}">&raquo;</a></li>
									</c:if>
								</ul>
							</nav>
						</div>
						<div class="col-md-2">
							<button type="button" class="btn btn-secondary" id="btnCheck">삭제</button>
							<a class="btn btn-secondary" href="/sjw/admin/admin_faqForm">글쓰기</a>
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