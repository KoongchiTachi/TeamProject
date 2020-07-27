<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>faq 입력 폼</title>
<meta name="viewport" content="width=device-width, initial-scale=1">									
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">									
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>									
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>									
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>									
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="jumbotron">
					<h2>faq 입력 폼</h2>
				</div>
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<form role="form" action="/sjw/admin/admin_faqForm" method="post">
							<div class="form-group">
								<label for="f_cate">faq 카테고리 선택</label>
								<select class="form-control" id="f_cate" name="f_cate" required="required">
									<option value="" selected disabled="disabled">카테고리를 선택해 주세요.</option>
									<option value="f1001">회원</option>
									<option value="f1002">경매</option>
									<option value="f1003">낙찰</option>
									<option value="f1004">위탁</option>
									<option value="f1005">기타</option>
								</select>
							</div>
							<div class="form-group">
								<label for="f_title">제목</label> <input
									type="text" class="form-control" id="f_title" name="f_title"
									placeholder="제목을 입력해 주세요." required>
							</div>
							<div class="form-group">
								<label for="f_content">내용</label>
								<textarea class="form-control" id="f_content" name="f_content"
									rows="3" placeholder="내용을 입력해 주세요." required></textarea>
							</div>
							<button type="submit" class="btn btn-success">등록</button>
							<a href="/sjw/admin/admin_faqList"><button type="button" class="btn btn-primary">취소</button></a>
						</form>
					</div>
					<div class="col-md-2"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>