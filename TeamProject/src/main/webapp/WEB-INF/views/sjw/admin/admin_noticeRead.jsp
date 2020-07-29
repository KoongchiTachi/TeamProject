<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		if (confirm("삭제하시겠습니까?")) {
			$("#adminFrmPageN").attr("action", $(this).attr("href")).submit();
		}
	});
	
});	
</script>
<%@ include file="/WEB-INF/views/include/sjw/admin_frmPage.jsp"%>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<h3 class="text-center">
					공지사항 조회
				</h3>
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
								<textarea id="n_content" name="n_content" class="form-control" style="height:auto; min-height: 300px;"
									readonly>${noticeVo.n_content}</textarea>
							</div>

							<a href="/sjw/admin/admin_noticeList" class="btn btn-secondary" id="btnList">목록</a> 
							<a href="/sjw/admin/admin_noticeUpdate" class="btn btn-secondary" id="btnUpdate">수정</a> 
							<a href="/sjw/admin/admin_noticeDelete" class="btn btn-secondary" id="btnDelete">삭제</a>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

<%@ include file="/WEB-INF/views/include/sidebarFooter.jsp"%>