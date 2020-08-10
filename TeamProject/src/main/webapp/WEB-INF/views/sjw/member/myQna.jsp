<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<link rel="stylesheet" href="/resources/css/bootstrap-table-expandable.css">
<script src="/resources/js/bootstrap-table-expandable.js"></script>
<style>
.myQnaList {
 	min-height : 60vh;
}
.section-title {
	margin-bottom: 35px;
}
p {
	font-size: 15px;
}
table.table-expandable > tbody > tr:nth-child(odd) {
    cursor: pointer;
}

table.table-expandable.table-hover > tbody > tr:nth-child(even):hover td {
    background-color: white;
}

table.table-expandable > tbody > tr div.table-expandable-arrow {
    background:transparent url(/resources/img/arrows.png) no-repeat scroll 0px -16px; width:16px; height:16px; display:block;
}
table.table-expandable > tbody > tr div.table-expandable-arrow.up {
    background-position:0px 0px;
}
</style>
<script>
$(function() {
	
	var msg = "${msg}";
	if (msg == "insertSuccess") {
		alert("1:1문의가 접수 되었습니다.");
	}
	
	$(".btnDelete").click(function() { 
		//console.log("클릭");
		var r = confirm("삭제하시겠습니까?");
		if (r == false) {
			return;
		}
		var that = $(this);
		var qno = that.attr("data-qno");
		var sendData = {
			"qno" : qno
		};
		var url = "/sjw/member/qnaDelete";
		$.ajax({
			"type" : "post",
			"url" : url,
			"data" : sendData,
			"success" : function(result) {
				alert("삭제되었습니다.");
 				that.parent().parent().parent().prev().hide(500);
 				that.parent().parent().parent().hide(500);
			},
			"error" : function(data) {
				alert("에러발생.");
				return false;
			}
		});
	});
	
});	
</script>

<section class="contact-section spad">
	<div class="container myQnaList">
		<div class="row">
			<div class="col-lg-12">
				<div class="contact-title">
					<div class="section-title">
						<h2>1:1문의 내역</h2>
						<h5>${m_id} 님의 문의 내역입니다.</h5>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<table class="table table-hover table-expandable table-striped">
				<thead>
					<tr style="text-align: center;">
						<th>문의유형</th>
						<th>제목</th>
						<th>작성일</th>
						<th>답변여부</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${listSize == 0}">
						<td colspan="5">
							<p align="center">1:1문의 내역이 없습니다.</p>
						</td>
					</c:when>
					<c:when test="${listSize != 0}">
					<c:forEach items="${list}" var="qnaVo">
						<tr style="text-align: center;">
							<td>${qnaVo.q_kind}</td>
							<td>${qnaVo.q_title}</td>
							<td>${qnaVo.q_date}</td>
							<c:choose>
								<c:when test="${qnaVo.q_answer == 'N'}">
									<td>답변대기</td>
								</c:when>
								<c:otherwise>
									<td>답변완료</td>
								</c:otherwise>
							</c:choose>
							<td></td>
						</tr>
						<tr>
							<td colspan="5"><br/><h6 style="font-weight: bold;">질문</h6>
								<p>${qnaVo.q_date}</p><br/>
								<p style="white-space: pre-line;">${qnaVo.q_content}</p><br/>
								<div class="row">
									<button type="button" class="btn btn-danger btn-sm btnDelete" style="margin-left: 15px; margin-top: 25px;" data-qno="${qnaVo.qno}">삭제</button>
								</div>
									<c:forEach items="${allList}" var="entry">
										<c:forEach items="${entry}" var="v">
											<c:set var="li" value="${v.value}"/>
											<c:if test="${v.key == qnaVo.qno}">
												<c:set var="rList" value="${v.value}"/>
												<c:forEach items="${rList}" var="rVo">
													<hr style="width: 108%;"><br/>
			 										<h6 style="font-weight: bold;">답변</h6>
			 										<c:out value="${rVo.qr_date}"></c:out><br/><br/><br/>
													<span style="white-space: pre-line;"><c:out value="${rVo.q_reply}"></c:out></span><br/><br/><br/>
												</c:forEach>
											</c:if>
										</c:forEach>
									</c:forEach>
								</td>
							</tr>
						</c:forEach>
						</c:when>
					</c:choose>
				</tbody>
			</table>
		</div>
	</div>
</section>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>