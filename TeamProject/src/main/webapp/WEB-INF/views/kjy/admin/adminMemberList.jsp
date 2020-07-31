<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/include/sidebarHeader.jsp"%>
<script src="http://code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>

<style>
h2 {
	margin : 50px;
}
.col-md-12 {
	min-height: 70vh;
	text-align: center;
}
.pagination > li > a {
    background-color: white;
    color: black;
}
.pagination > .page-item.active > .page-link {
  	background-color: #979494;
  	border : solid 1px #979494;
}
</style>

<script>
$(function() {
	// 회원 삭제
	$(".btnDel").click(function() {
		var that = $(this);
		var m_id = that.attr("data-id");
		var sendData = {
			"m_id" : m_id	
		};
		var url = "/kjy/admin/deleteMember";
		$.get(url, sendData, function(rData) {
			if (rData == "success") {
				alert("회원을 삭제하였습니다.");
				that.parent().parent().hide();
			}
		});
	});
	
	// 등급으로 검색
	$("#btnSearch").click(function () {
		var searchType = $("select[name=searchType]").val();
		var keyword = $("#keyword").val();
		$("#adminFrmPage > input[name=searchType]").val(searchType);
		$("#adminFrmPage > input[name=keyword]").val(keyword);
		$("#adminFrmPage").submit();
	});
	
	// 페이징
	$("a.page-link").click(function(e) {
		e.preventDefault();
		var page = $(this).attr("href").trim();
		$("#adminFrmPage > input[name=page]").val(page);
		$("#adminFrmPage").submit();
	});
	
	$("a.page-link").each(function () {
		var page = $(this).attr("href");
		if (page == "${adminMemberListPagingDto.page}") {
			$(this).parent().addClass("active");
			return;
		}
	});
});
</script>

<%@ include file="/WEB-INF/views/include/kjy/adminForm.jsp" %>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<h2>전체 회원 목록</h2>
			<div class="row">
				<div class="col-md-1">
				</div>
				<div class="col-md-10">
				<form class="form-inline md-form mr-auto mb-4" style="float: right;">
					<select id="select" class="mdb-select md-form colorful-select dropdown-primary" name="searchType" style="width: 100px; height: 38px; border: 1px solid #cfcfcf; border-radius: 5px 5px 5px 5px;">
						<option value="g"
							<c:if test="${adminMemberListPagingDto.searchType == 'g'}">selected</c:if>
						>전체 등급</option>
						<option>----------</option>
						<option value="g1001"
							<c:if test="${adminMemberListPagingDto.searchType == 'g1001'}">selected</c:if>
						>Prime</option>
						<option value="g1002"
							<c:if test="${adminMemberListPagingDto.searchType == 'g1002'}">selected</c:if>
						>Vip</option>
						<option value="g1003"
							<c:if test="${adminMemberListPagingDto.searchType == 'g1003'}">selected</c:if>
						>VVip</option>
					</select>&nbsp;&nbsp;
					<button class="btn btn-elegant btn-rounded my-0"
						type="submit" id="btnSearch" style="background-color: #979494; color: #fff;">검색</button>
				</form>
				<table class="table table-hover">
				<thead>
					<tr>
						<th>아이디</th>
						<th>이름</th>
						<th>휴대전화</th>
						<th>주소</th>
						<th>이메일</th>
						<th>등급</th>
						<th>거래횟수</th>
						<th>경고누적수</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="memberVo"> 
						<tr>
							<td>${memberVo.m_id}</td> 
							<td>${memberVo.m_name}</td>
							<td>${memberVo.m_phone}</td>
							<td>${memberVo.m_address} ${memberVo.m_address2}</td>
							<td>${memberVo.m_email}</td>
							<c:choose>
								<c:when test="${memberVo.m_grade == 'g1001'}"><td>prime</td></c:when>
								<c:when test="${memberVo.m_grade == 'g1002'}"><td>vip</td></c:when>
								<c:otherwise><td>vvip</td></c:otherwise>
							</c:choose>
							<td>${memberVo.m_trade}</td>
							<td>${memberVo.m_warn}</td>
							<td><button type="button" class="btn btn-sm btn-secondary btnDel" data-id="${memberVo.m_id}">회원 삭제</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
				</div>
				<div class="col-md-1">
				</div>
			</div>
		
			<c:choose>
				<c:when test="${listSize != 0}">
				<div class="row">
					<div class="col-md-4">
					</div>
					<div class="col-md-4">
						<nav>
							<ul class="pagination" style="justify-content: center;">
								<!-- 이전 -->
								<c:if test="${adminMemberListPagingDto.startPage != 1}">
								<li class="page-item">
									<a class="page-link" href="${adminMemberListPagingDto.startPage - 1}">&laquo;</a>
								</li>
								</c:if>
								<!-- 페이지 넘버링 -->
								<c:forEach begin="${adminMemberListPagingDto.startPage}" end="${adminMemberListPagingDto.endPage}" var="v">
								<li class="page-item">
									<a class="page-link" href="${v}">${v}</a>
								</li>
								</c:forEach>
								<!-- 다음 -->
								<c:if test="${adminMemberListPagingDto.endPage < adminMemberListPagingDto.totalPage}">
								<li class="page-item">
									<a class="page-link" href="${adminMemberListPagingDto.endPage + 1}">&raquo;</a>
								</li>
								</c:if>
							</ul>
						</nav>
					</div>
					<div class="col-md-4">
					</div>
				</div>
				</c:when>
			</c:choose>
			
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/sidebarFooter.jsp"%>