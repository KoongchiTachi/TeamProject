<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/sidebarHeader.jsp"%>

<script>
$(function() {
	
	// 취소 버튼
	$("#btnCancel").click(function(e) {
		e.preventDefault();
		$("#adminFrmPageN").attr("action", $(this).attr("href"))
        .submit();
	});
	
	$("#noticeUpdate").submit(function() {
		$("#adminFrmPageN > input").prependTo("#noticeUpdate");
		$("#noticeUpdate").submit();
		return false;
	});
});
</script>

<%@ include file="/WEB-INF/views/include/sjw/admin_frmPage.jsp" %>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<h3 class="text-center">
					공지사항 수정
				</h3>
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<form id="noticeUpdate" role="form" action="/sjw/admin/admin_noticeUpdate" method="post">
							<div class="form-group">
								<label for="n_title"> 제목 </label> <input type="text"
									class="form-control" id="n_title" name="n_title"
									value="${noticeVo.n_title}" required />
							</div>

							<div class="form-group">
								<label for="n_content"> 내용 </label>
								<textarea id="n_content" name="n_content" class="form-control" style="height:auto; min-height: 300px;"
									required>${noticeVo.n_content}</textarea>
							</div>
							<button type="submit" class="btn btn-secondary">수정완료</button>
							<a href="/sjw/admin/admin_noticeRead" class="btn btn-secondary" id="btnCancel">취소</a> 
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

<%@ include file="/WEB-INF/views/include/sidebarFooter.jsp"%>