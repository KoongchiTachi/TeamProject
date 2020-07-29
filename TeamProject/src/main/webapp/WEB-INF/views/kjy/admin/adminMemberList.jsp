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

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-1">
				</div>
				<div class="col-md-10">
				<h2>전체 회원 목록</h2>
				<table class="table">
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
							<td><button type="button" class="btn btn-sm btn-danger">회원 삭제</button></td>
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