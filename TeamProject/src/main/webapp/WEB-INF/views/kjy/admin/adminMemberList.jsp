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
function changeSelect() {
	var sel = $("#select").val();
	console.log(sel);
	if (sel == "g") {
		$("#keyword").val("");
	}
}
</script>

<script>
$(function() {
	// 회원 삭제 모달창
	$(".btnDel").click(function() {
		var that = $(this);
		var m_id = $(this).attr("data-id");
		var td = that.parent().parent().find("td");
		var grade = td.eq(5).text();
		var trade = td.eq(6).text();
		$("#modal_id").val(m_id);
		$("#modal_grade").val(grade);
		$("#modal_trade").val(trade);
	
		$("#btnModal").click(function() {
			var m_id = $("#modal_id").val();
			var sendData = { 
				"m_id" : m_id
			};
			var url = "/kjy/admin/deleteMember";
			$.get(url, sendData, function(rData) {
				if (rData == "success") {
					that.parent().parent().hide("slow");
					$("#btnCancelModal").trigger("click");
				} else if (rData == "failure") {
					alert("현재 " + m_id + " 회원이 경매 진행 중인 상품이 있습니다.\n경매가 끝난 후 삭제해주세요.");
				}
			});
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
					<select id="select" class="mdb-select md-form colorful-select dropdown-primary" name="searchType" onchange="changeSelect()" style="width: 100px; height: 38px; border: 1px solid #cfcfcf; border-radius: 5px 5px 5px 5px;">
						<option value="g"
							<c:if test="${adminMemberListPagingDto.searchType == 'g'}">selected</c:if>
						>전체</option>
						<option value="id"
							<c:if test="${adminMemberListPagingDto.searchType == 'id'}">selected</c:if>
						>아이디</option>
						<option value="name"
							<c:if test="${adminMemberListPagingDto.searchType == 'name'}">selected</c:if>
						>이름</option>
						<option value="grade"
							<c:if test="${adminMemberListPagingDto.searchType == 'grade'}">selected</c:if>
						>등급</option>
					</select>&nbsp;&nbsp;
					<input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search" id="keyword"
							name="keyword" value="${adminMemberListPagingDto.keyword}">
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
							<td><a id="modal-42884" href="#modal-container-42884" role="button" class="btn btn-sm btn-secondary btnDel" data-toggle="modal" data-id="${memberVo.m_id}">회원 삭제</a></td>
<%-- 							<button type="button" class="btn btn-sm btn-secondary btnDel" data-id="${memberVo.m_id}" data-toggle="modal" data-target="#modal-42884">회원 삭제</button> --%>
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
	
	<!-- 회원 삭제 모달 창 -->
	<div class="row">
		<div class="col-md-12" style="min-height: 5vh;">
			<!-- <a id="modal-42884" href="#modal-container-42884" role="button" class="btn" data-toggle="modal">Launch demo modal</a> -->
			<div class="modal fade" id="modal-container-42884" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content del">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">
								회원 삭제
							</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							<label for="modal_id" style="width : 30%; float: left; margin-top : 7px;">아이디</label>
							<input type="text" value="" id="modal_id" class="form-control" style="width : 60%;"/><br/>
							<label for="modal_grade" style="width : 30%; float: left; margin-top : 7px;">등급</label>
							<input type="text" value="" id="modal_grade" class="form-control" style="width : 60%;"/><br/>
							<label for="modal_trade" style="width : 30%; float: left; margin-top : 7px;">거래횟수</label>
							<input type="text" value="" id="modal_trade" class="form-control" style="width : 60%;"/>
						</div>
						<div class="modal-footer">
							<a class="col-sm-6 text-left">회원을 삭제하시겠습니까?</a>
							<div class="col-sm-6 text-right">
								<button type="button" class="btn btn-primary" id="btnModal">
									확인
								</button> 
								<button type="button" class="btn btn-secondary" data-dismiss="modal" id="btnCancelModal">
									취소
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 회원 삭제 모달 창 -->
	
</div>

<%@ include file="/WEB-INF/views/include/sidebarFooter.jsp"%>