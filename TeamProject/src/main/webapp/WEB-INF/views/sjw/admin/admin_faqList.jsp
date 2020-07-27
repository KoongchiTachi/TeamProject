<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>faq 목록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">									
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">									
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>									
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>									
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>									
</head>
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
<body>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="jumbotron">
				<h2>
					faq 목록
				</h2>
				<p>
					<a class="btn btn-primary btn-large" href="/sjw/admin/admin_faqForm">faq 입력</a>
				</p>
			</div>
			<div class="row">
				<div class="col-md-2">
				</div>
				<div class="col-md-8">
					<div class="tabbable" id="tabs-900">
						<ul class="nav nav-tabs">
							<li class="nav-item">
								<a class="nav-link active" href="#tab1" data-toggle="tab">전체</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="#tab2" data-toggle="tab">회원</a>
							</li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="panel-146431">
								<p>
									
								</p>
							</div>
							<div class="tab-pane" id="tab2">
								<p>
									
								</p>
							</div>
						</div>
					</div>
					<table class="table">
							<thead>
								<tr>
									<th>글번호</th>
									<th>제목</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${list}" var="faqVo">
								<tr>
									<td>${faqVo.fno}</td>
									<td><a href="/sjw/admin/admin_faqRead" class="f_title" data-fno="${faqVo.fno}">${faqVo.f_title}</a></td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
						<nav>
				<ul class="pagination">
				<!-- 이전 -->
					<c:if test="${faqPagingDto.startPage != 1}">
					<li class="page-item">
						<a class="page-link" href="${faqPagingDto.startPage - 1}">&laquo;</a>
					</li>
					</c:if>
					<!-- 페이지 넘버링 -->
					<c:forEach begin="${faqPagingDto.startPage}" end="${faqPagingDto.endPage}" var="v">
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
					<li class="page-item">
						<a class="page-link" href="${faqPagingDto.endPage + 1}">&raquo;</a>
					</li>
					</c:if>
				</ul>
			</nav>
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
						<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
							<form class="form-inline" >
								<input class="form-control mr-sm-2" type="text" id="keyword" name="keyword" value="${faqPagingDto.keyword}"/> 
								<button class="btn btn-primary my-2 my-sm-0" type="submit">
									검색
								</button>
							</form>
							
						</div>
					</nav>
				</div>
				<div class="col-md-2">
				</div>
			</div>
		</div>
	</div>
</div>
</div>
</body>
</html>