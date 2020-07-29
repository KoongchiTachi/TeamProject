<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/include/sidebarHeader.jsp"%>

<style>
h2 {
	margin : 50px;
}
.col-md-12 {
	min-height: 70vh;
	text-align: center;
}
</style>

<script>
$(function() {
	$("#btnDeleteMember").click(function() {
		console.log("클릭");
	});
});
</script>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-1">
				</div>
				<div class="col-md-10">
				<h2>전체 회원 목록</h2>
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
					<c:forEach items="${list}" var="memberVo" varStatus="vs" begin="1"> 
						<tr>
							<td>${list[vs.index].m_id}</td> 
							<td>${list[vs.index].m_name}</td>
							<td>${list[vs.index].m_phone}</td>
							<td>${list[vs.index].m_address} ${list[vs.index].m_address2}</td>
							<td>${list[vs.index].m_email}</td>
							<c:choose>
								<c:when test="${list[vs.index].m_grade == 'g1001'}"><td>prime</td></c:when>
								<c:when test="${list[vs.index].m_grade == 'g1002'}"><td>vip</td></c:when>
								<c:otherwise><td>vvip</td></c:otherwise>
							</c:choose>
							<td>${list[vs.index].m_trade}</td>
							<td>${list[vs.index].m_warn}</td>
							<td><button type="button" class="btn btn-sm btn-danger" id="btnDeleteMember">회원 삭제</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
				</div>
				<div class="col-md-1">
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/sidebarFooter.jsp"%>