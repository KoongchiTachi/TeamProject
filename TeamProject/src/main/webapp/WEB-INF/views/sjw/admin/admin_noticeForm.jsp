<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/sidebarHeader.jsp"%>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<h3 class="text-center">
				공지사항 작성
				</h3>
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<form role="form" action="/sjw/admin/admin_noticeForm" method="post">
							<div class="form-group">
								<label for="n_title">제목</label> <input type="text"
									class="form-control" id="n_title" name="n_title" required/>
							</div>
							<div class="form-group">
								<label for="n_content">내용</label>
								<textarea class="form-control" id="n_content" name="n_content" style="height: 300px;" required></textarea>
							</div>
							<button type="submit" class="btn btn-secondary">등록</button>
							<a href="/sjw/admin/admin_noticeList" class="btn btn-secondary">취소</a>
						</form>
					</div>
					<div class="col-md-2"></div>
				</div>
			</div>
		</div>
	</div>

<%@ include file="/WEB-INF/views/include/sidebarFooter.jsp"%>