<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<style>
#admin { 
	margin-top : 150px;
 	min-height : 90vh;
 }
</style>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12" id="admin">
				<h3 class="text-center">
				공지사항 입력 (관리자)
				</h3>
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<form role="form" action="/sjw/admin/admin_noticeForm" method="post">
							<div class="form-group">
								<label for="n_title">제목</label> <input type="text"
									class="form-control" id="n_title" name="n_title" />
							</div>
							<div class="form-group">
								<label for="n_content">내용</label>
								<textarea class="form-control" id="n_content" name="n_content" style="height: 200px;"></textarea>
							</div>
							<button type="submit" class="btn btn-success">등록</button>
							<a href="/sjw/admin/admin_noticeList"><button type="button" class="btn btn-primary">목록</button></a>
						</form>
					</div>
					<div class="col-md-2"></div>
				</div>
			</div>
		</div>
	</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>