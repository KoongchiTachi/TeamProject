<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ include file="/WEB-INF/views/include/sidebarHeader.jsp"%>
<script>
$(function() {
	
	var msg = "${msg}";
	if (msg == "updateSuccess") {
		alert("수정되었습니다.");
	}
	
	// 목록
	$("#btnList").click(function(e) {
		e.preventDefault();
		$("#adminFrmPageF").submit();
	});
	
	// 수정
	$("#btnUpdate").click(function(e) {
		e.preventDefault();
		$("#adminFrmPageF").attr("action", $(this).attr("href")).submit();
	});
	
	// 삭제
	$("#btnDelete").click(function(e) {
		e.preventDefault();
		if (confirm("삭제하시겠습니까?")) {
		$("#adminFrmPageF").attr("action", $(this).attr("href")).submit();
		}
	});
	
});	
</script>
<%@ include file="/WEB-INF/views/include/sjw/admin_frmPage.jsp" %>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<h3 class="text-center">
						FAQ 조회
				</h3>
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<form role="form" action="/sjw/admin/admin_faqForm" method="post">
							<div class="form-group">
								<label for="f_cate">카테고리</label>
								<select class="form-control" id="f_cate" name="f_cate" required="required" disabled="disabled">
									<option value="f1001"
										<c:if test="${faqVo.f_cate == 'f1001'}">selected</c:if>
									>회원</option>
									<option value="f1002"
										<c:if test="${faqVo.f_cate == 'f1002'}">selected</c:if>
									>경매</option>
									<option value="f1003"
										<c:if test="${faqVo.f_cate == 'f1003'}">selected</c:if>
									>낙찰</option>
									<option value="f1004"
										<c:if test="${faqVo.f_cate == 'f1004'}">selected</c:if>
									>위탁</option>
									<option value="f1005"
										<c:if test="${faqVo.f_cate == 'f1005'}">selected</c:if>
									>기타</option>
								</select>
							</div>
							<div class="form-group">
								<label for="f_title">제목</label> <input
									type="text" class="form-control" id="f_title" name="f_title" value="${faqVo.f_title}" readonly>
							</div>
							<div class="form-group">
								<label for="f_content">내용</label>
								<textarea class="form-control" id="f_content" name="f_content" rows="3" style="height: auto; min-height: 300px;" readonly>${faqVo.f_content}</textarea>
							</div>
							<a href="/sjw/admin/admin_faqList" class="btn btn-secondary" id="btnList">목록</a> 
							<a href="/sjw/admin/admin_faqUpdate" class="btn btn-secondary" id="btnUpdate">수정</a> 
							<a href="/sjw/admin/admin_faqDelete" class="btn btn-secondary" id="btnDelete">삭제</a>
						</form>
					</div>
					<div class="col-md-2"></div>
				</div>
			</div>
		</div>
	</div>
<%@ include file="/WEB-INF/views/include/sidebarFooter.jsp"%>