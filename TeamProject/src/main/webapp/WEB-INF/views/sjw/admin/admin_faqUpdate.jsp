<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>faq 수정</title>
<meta name="viewport" content="width=device-width, initial-scale=1">									
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">									
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>									
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>									
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>									
</head>
<script>
$(function() {
	
	$("#faqUpdate").submit(function() {
		$("#adminFrmPageF > input").prependTo("#faqUpdate");
		$("#faqUpdate").submit();
		return false;
	});
});
</script>
<%@ include file="/WEB-INF/views/include/sjw/admin_frmPage.jsp" %>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="jumbotron">
					<h2>faq 수정</h2>
				</div>
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<form id="faqUpdate" role="form" action="/sjw/admin/admin_faqUpdate" method="post">
							<div class="form-group">
								<label for="f_cate">faq 카테고리</label>
								<select class="form-control" id="f_cate" name="f_cate" required="required">
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
									type="text" class="form-control" id="f_title" name="f_title" value="${faqVo.f_title}" required>
							</div>
							<div class="form-group">
								<label for="f_content">내용</label>
								<textarea class="form-control" id="f_content" name="f_content" rows="3" required>${faqVo.f_content}</textarea>
							</div>
							<button type="submit" class="btn btn-primary">수정완료</button>
						</form>
					</div>
					<div class="col-md-2"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>