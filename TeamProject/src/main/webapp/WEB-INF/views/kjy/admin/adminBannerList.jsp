<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/include/sidebarHeader.jsp"%>
<script src="http://code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>

<style>
h2 {
	margin-top : 50px;
}
.col-md-12 table {
	text-align: center;
}
</style>

<script>
$(function() {
	$(".btnImg").click(function() {
		var that = $(this).text();
		$(".modal-body > img").attr("src", "/uploadBanner/displayFile?bn_img=" + that);
	});
	
	$(".btnDelBan").click(function() {
		var that = $(this);
		var bnno = that.attr("data-bnno");
		var sendData = { 
			"bnno" : bnno
		};
		var url = "/kjy/admin/deleteBanner";
		$.get(url, sendData, function(rData) {
			if (rData == "success") {
				that.parent().parent().hide("slow");
				alert("배너를 삭제하였습니다.");
			} 
		});
	});
});
</script>

<%@ include file="/WEB-INF/views/include/kjy/adminForm.jsp" %>

<div class="container-fluid" style="min-height: 70vh;">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-2">
				</div>
				<div class="col-md-8">
				<h2 style="margin-bottom : 70px; font-weight: bold; font-size: 45px;">배너 목록</h2>
<!-- 				<h5 style="margin-bottom : 50px;">배너 이미지는 메인 이미지 포함 3개까지 보입니다.</h5>  -->
				<table class="table table-hover">
				<thead>
					<tr>
						<th>배너명</th>
						<th>배너 이미지</th>
						<th>배너 삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="adminBannerVo"> 
						<tr>
							<td style="font-size: 18px;">${adminBannerVo.b_name}</td>
							<td>
							
								<!-- 배너 이미지 모달창 -->
								<a id="modal-771401" href="#modal-container-771401" role="button" class="btn btnImg" data-toggle="modal">${adminBannerVo.bn_img}</a>
								<div class="modal fade" id="modal-container-771401" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="myModalLabel">
													배너 이미지
												</h5> 
												<button type="button" class="close" data-dismiss="modal">
													<span aria-hidden="true">×</span>
												</button>
											</div>
											<div class="modal-body">
												<img src="" style="width: 400px;">
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary" data-dismiss="modal">
													확인
												</button>
											</div>
										</div>
									</div>
								</div>
								<!-- 배너 이미지 모달창 -->
							
							</td>
							<td><button type="button" class="btn btn-secondary btnDelBan" data-bnno="${adminBannerVo.bnno}">삭제</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
				</div>
				<div class="col-md-2">
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/sidebarFooter.jsp"%>