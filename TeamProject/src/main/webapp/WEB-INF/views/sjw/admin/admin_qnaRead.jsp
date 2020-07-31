<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/include/sidebarHeader.jsp"%>
<%@ include file="/WEB-INF/views/include/sjw/admin_frmPage.jsp" %>

<style>
th {
	background-color: #f5f5f5;
}
input[type="text"]:disabled,
textarea.form-control:disabled {
 	background: white;
}

</style>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<form role="form" action="/sjw/admin/replyInsert" method="post" style="background-color: white;">
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
<!-- 									<textarea onkeydown="resize(this)" rows="20" cols="10" -->
<!-- 											placeholder="내용을 입력하세요. " name="content" class="form-control"></textarea> -->
										<textarea class="form-control" style="height: 120px;" disabled>${qnaVo.q_content}</textarea>
									</td>
								</tr>
								<tr>
									<th>작성일</th>
									<td><input type="text" class="form-control" value="${qnaVo.q_date}" disabled></td>
								</tr>
								<tr>
									<th>첨부파일</th>
									<td><input type="file" class="form-control" /></td>
								</tr>
								<tr>
									<th>답변상태</th>
									<td>
									<input type="radio" name="q_answer" disabled="disabled" value="N"
										<c:if test="${qnaVo.q_answer == 'N'}">checked</c:if>
											>&nbsp;답변대기&nbsp;&nbsp;
									<input type="radio" name="q_answer" id="check" required value="Y"
										<c:if test="${qnaVo.q_answer == 'Y'}">checked</c:if>
											>&nbsp;답변완료
 									</td>
								</tr>
								<tr>
									<th>관리자 답변</th>
									<td>
 									<textarea class="form-control" name="q_reply" placeholder="답변을 작성해 주세요." style="height: 120px;" required></textarea>
									</td>
								</tr>
								<tr>
									<td colspan="3" align="center">
									<button type="submit" class="btn btn-secondary">등록</button>
									<a href="/sjw/admin/admin_qnaList" class="btn btn-secondary">취소</a>
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