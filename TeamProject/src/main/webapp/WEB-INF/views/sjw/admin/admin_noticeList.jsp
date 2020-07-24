<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">									
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">									
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>									
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>									
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>									
</head>
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
		$("#admin_frmPage > input[name=keyword]").val(keyword);
		$("#admin_frmPage").submit();
	});
	
	// 제목 클릭 -> 공지내용보기
	$("a.n_title").click(function(e) {
		e.preventDefault();
		var nno = $(this).attr("data-nno");
		$("#admin_frmPage > input[name=nno]").val(nno);
		$("#admin_frmPage").attr("action", $(this).attr("href"));
		$("#admin_frmPage").submit();
	});
	
	// 페이지 번호
	$("a.page-link").click(function(e) {
		e.preventDefault();
		var page = $(this).attr("href").trim();
		$("#admin_frmPage > input[name=page]").val(page);
		$("#admin_frmPage").submit();
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
<body>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="jumbotron">
				<h2>공지사항 목록</h2>
					<p><a class="btn btn-primary btn-large" href="/sjw/admin/admin_noticeForm">공지사항 입력</a></p>
			</div>
			<div class="row">
				<div class="col-md-2">
				</div>
				<div class="col-md-8">
					<table class="table">
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
					<nav>
				<ul class="pagination">
				<!-- 이전 -->
					<c:if test="${noticePagingDto.startPage != 1}">
					<li class="page-item">
						<a class="page-link" href="${noticePagingDto.startPage - 1}">&laquo;</a>
					</li>
					</c:if>
					<!-- 페이지 넘버링 -->
					<c:forEach begin="${noticePagingDto.startPage}" end="${noticePagingDto.endPage}" var="v">
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
					<c:if test="${noticePagingDto.endPage < noticePagingDto.totalPage}">
					<li class="page-item">
						<a class="page-link" href="${noticePagingDto.endPage + 1}">&raquo;</a>
					</li>
					</c:if>
				</ul>
			</nav>
					<nav class="navbar navbar-expand-lg navbar-light bg-light">
						<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
							<form class="form-inline" >
								<input class="form-control mr-sm-2" type="text" id="keyword" name="keyword" value="${noticePagingDto.keyword}"/> 
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
</body>
</html>