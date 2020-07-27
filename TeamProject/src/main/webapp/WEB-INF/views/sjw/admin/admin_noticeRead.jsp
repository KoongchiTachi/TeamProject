<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 읽기</title>
<meta name="viewport" content="width=device-width, initial-scale=1">									
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">									
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>									
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>									
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>	
</head>
<script>
$(function() {
	
	var msg = "${msg}";
	if (msg == "updateSuccess") {
		alert("공지사항 수정 성공");
	}
	
	// 목록
	$("#btnList").click(function(e) {
		e.preventDefault();
		$("#adminFrmPageN").submit();
	});
	
	// 수정
	$("#btnUpdate").click(function(e) {
		e.preventDefault();
		$("#adminFrmPageN").attr("action", $(this).attr("href")).submit();
	});
	
	// 삭제
	$("#btnDelete").click(function(e) {
		e.preventDefault();
		$("#adminFrmPageN").attr("action", $(this).attr("href")).submit();
	});
	
});	
</script>
<%@ include file="/WEB-INF/views/include/sjw/admin_frmPage.jsp"%>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="jumbotron">
					<h2>공지사항 내용보기</h2>
				</div>
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<form role="form" action="/sjw/admin/admin_noticeForm" method="post">
							<div class="form-group">
								<label for="n_title"> 제목 </label> <input type="text"
									class="form-control" id="n_title" name="n_title"
									value="${noticeVo.n_title}" readonly />
							</div>

							<div class="form-group">
								<label for="n_content"> 내용 </label>
								<textarea id="n_content" name="n_content" class="form-control"
									readonly>${noticeVo.n_content}</textarea>
							</div>

							<a href="/sjw/admin/admin_noticeList" class="btn btn-primary" id="btnList">목록</a> 
							<a href="/sjw/admin/admin_noticeUpdate" class="btn btn-warning" id="btnUpdate">수정</a> 
							<a href="/sjw/admin/admin_noticeDelete" class="btn btn-danger" id="btnDelete">삭제</a>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>