<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
<meta name="viewport" content="width=device-width, initial-scale=1">									
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">									
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>									
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>									
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>	
</head>
<script>
$(function() {
	
	$("#noticeUpdate").submit(function() {
		$("#adminFrmPageN > input").prependTo("#noticeUpdate");
		$("#noticeUpdate").submit();
		return false;
	});
});
</script>

<%@ include file="/WEB-INF/views/include/sjw/admin_frmPage.jsp" %>

<body>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<form id="noticeUpdate" role="form" action="/sjw/admin/admin_noticeUpdate" method="post">
				<div class="form-group">
					<label for="n_title">제목</label>
					<input type="text" class="form-control" id="n_title" name="n_title"
						value="${noticeVo.n_title}" required/>
				</div>
				<div class="form-group">
					<label for="n_content">내용</label>
					<textarea id="n_content" name="n_content" 
					 class="form-control" required>${noticeVo.n_content}</textarea>
				</div>
				<button type="submit" class="btn btn-primary">수정완료</button>
			</form>
		</div>
	</div>
</div>
</body>
</html>