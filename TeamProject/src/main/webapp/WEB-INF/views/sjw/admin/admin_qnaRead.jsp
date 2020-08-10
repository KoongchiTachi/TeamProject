<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/include/sidebarHeader.jsp"%>
<%@ include file="/WEB-INF/views/include/sjw/admin_frmPage.jsp" %>
<script src="http://code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>
<style>
th {
	background-color: #f5f5f5;
	width: 170px;
}
input[type="text"]:disabled,
textarea.form-control:disabled {
 	background: white;
}
#qReplyList textarea {
	border: 3px double #c4c4c4;
}
</style>
<script>
$(function() {
	
		qReplyList();
		
	function qReplyList(){

		var url = "/qreply/qReplyList";
		var paramData = {"qno" : "${qnaVo.qno}"};
		$.ajax({
			"type" : "POST",
			"url" : url,
			"data" : paramData,
			"dataType" : "json",
			"success": function(result) {
        	console.log(result);
           		var html = "";
					if(result.length < 1){
						html += '<textarea class="form-control" name="q_reply" placeholder="답변을 작성해 주세요." cols="20" rows="3" wrap="hard" style="height: 150px; backgroud-color: #EEEEEE;" required>';
						html += '</textarea>';
						html += '<div align="center">';
						html += '<button type="submit" class="btn btn-secondary btnSubmit" id="btnSubmit" style="margin-top: 10px;">등록</button>&nbsp;';
						html += '<a href="/sjw/admin/admin_qnaList" class="btn btn-secondary" style="margin-top: 10px;">목록</a>';
						html += '</div>';
					} else {
                    	$(result).each(function(){
                    	html += '<textarea class="form-control" id="qreply" style="height: 150px;" disabled>' + this.q_reply + '</textarea>';
                     	html += '<div align="center">';
                     	html += '<a id="modal-310487" href="#modal-container-310487" role="button" class="btn btn btn-secondary modal-310487 btnCommentModify" data-toggle="modal" style="margin-top: 10px;" data-qrno="'+this.qrno+'">수정</a>&nbsp;';
                     	html += '<a href="/sjw/admin/admin_qnaList" class="btn btn-secondary" style="margin-top: 10px;">목록</a>';
                     	html += '</div>';
                	});
				}
				$("#qReplyList").append(html);
        	}	   
		});	
	}
	
	// 답변 수정 버튼
	$("#qReplyList").on("click", ".btnCommentModify", function() {
		//console.log("수정버튼");
 		var qrno = $(this).attr("data-qrno");
 		//console.log(qrno);
 		var qreply = $("#qreply").val();
 		//console.log(qreply);
  		$("#modal_content").val(qreply);
  		$("#btnModifyModal").attr("data-qrno", qrno);
	});
	
	// 답변 수정 완료 버튼
	$("#btnModifyModal").click(function () {
		var qreply = $("#modal_content").val();
		console.log(qreply);
		var qrno = $(this).attr("data-qrno");
		var sendData = {
			"q_reply" : qreply,
			"qrno" : qrno
		};
		//console.log("sendData:", sendData);
		var url = "/qreply/qReplyUpdate";
		$.ajax({
			"type" : "put",
			"url" : url,
			"dataType" : "text",
			"data" : JSON.stringify(sendData),
			"headers" : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "put"
			},
			"success" : function(rData) {
				console.log(rData);
				alert("수정되었습니다.");
				location.reload();
				$("#btnCancelModal").trigger("click");
			}
		});
	});
	
	$("#qReplyList").on("click", ".btnSubmit", function() {
		var check = $("input:radio[name='q_answer']:checkbox[value='Y']").size();
		console.log(check);
		if(check == 0){
            $("input[name='q_answer']").eq(1).attr("checked", true);
		}
	});

});

</script>

<div class="row">
		<div class="col-md-12">
<!-- 			 <a id="modal-310487" href="#modal-container-310487" role="button" class="btn modal-310487" data-toggle="modal">Launch demo modal</a> -->
			<div class="modal fade" id="modal-container-310487" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" id="myModal">
				<div class="modal-dialog" role="document">
					<div class="modal-content" style="height: 500px;">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">
								답변 수정
							</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							<label>답변내용</label>
							<textarea id="modal_content" class="form-control" cols="20" rows="3" wrap="hard" style="height: 270px;"></textarea><br/>
						</div>
						<div class="modal-footer">
							 
							<button type="button" class="btn btn-primary" id="btnModifyModal">
								수정완료
							</button> 
							<button type="button" class="btn btn-secondary" data-dismiss="modal" id="btnCancelModal">
								취소
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<form role="form" action="/sjw/admin/qReplyInsert" method="post" style="background-color: white;">
					<input type="hidden" name="qno" value="${qnaVo.qno}">
						<table class="table table-bordered">
							<tbody>
								<tr>
									<th>회원ID</th>
									<td><input type="text" class="form-control" value="${qnaVo.m_id}" disabled></td>
								</tr>
								<tr>
									<th>문의제목</th>
									<td><input type="text" class="form-control" value="${qnaVo.q_title}" disabled></td>
								</tr>
								<tr>
									<th>문의내용</th>
									<td>
										<textarea class="form-control" style="height: 120px;" wrap="hard" disabled>${qnaVo.q_content}</textarea>
									</td>
								</tr>
								<tr>
									<th>작성일</th>
									<td><input type="text" class="form-control" value="${qnaVo.q_date}" disabled></td>
								</tr>
								<tr>
									<th>첨부파일</th>
									<c:choose> 
										<c:when test="${fn:length(list) > 0}">
											<c:forEach items="${list}" var="qnaVo" varStatus="vs">
												<td style="display: table-row; border: none;">
												<a id="modal-201171" href="#modal-container-201171" role="button" class="btn" data-toggle="modal" data-target="#myModal${vs.index}"
													style="font-size: 13px;">${qnaVo.file_name}</a>
												<div class="modal fade" id="myModal${vs.index}" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
													<div class="modal-dialog" role="document">
														<div class="modal-content" style="width: 835px;">
															<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal">
																<span aria-hidden="true">×</span>
															</button>
														</div>
														<div class="modal-body">
															<img src="/upload/displayFile?fileName=${qnaVo.file_name}" style="width: 800px;">
														</div>
														</div>
													</div>
												</div>
												</td>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<td>첨부파일이 없습니다.</td>
										</c:otherwise>
									</c:choose>
								</tr>
								<tr>
									<th>답변상태</th> 
									<td>
									<input type="radio" name="q_answer" disabled="disabled" value="N"
										<c:if test="${qnaVo.q_answer == 'N'}">checked</c:if>
											>&nbsp;답변대기&nbsp;&nbsp;
									<input type="radio" name="q_answer" required value="Y"
										<c:if test="${qnaVo.q_answer == 'Y'}">checked</c:if>
											>&nbsp;답변완료
 									</td>
								</tr>
								<tr>
									<th>관리자 답변</th>
									<td>
										<div id="qReplyList"></div>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
				<div class="col-md-2"></div>
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/sidebarFooter.jsp"%>