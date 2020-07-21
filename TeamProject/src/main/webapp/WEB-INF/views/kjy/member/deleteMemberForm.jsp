<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<style>
.col-md-12 {
	margin-top: 200px; 
	min-height: 50vh;
	text-align: center;
}
h3 {
	position:relative;
	margin: 40px;
	font-size : 40px;
	font-weight: bold;
	left : 50px;
}
#btnDeleteMember {
	background: #f9ad81;
	color : #ffffff;
	position:relative;
	border : none;
	height : 60px;
	bottom : 67px;
	left : 200px;
	transition-duration: 0.4s;
	cursor : pointer; 
}
#btnDeleteMember:hover {
	color : #000000; 
}
.col-md-5 input {
	border: 1px solid #55504c;
	-webkit-border-radius: 10px;
 	-moz-border-radius: 10px;
 	border-radius: 10px;
}
</style>

<script>
$(function() {
	$("#btnDeleteMember").click(function() {
		if ($("#m_pw").val() == "") {
			alert("회원 탈퇴를 원하시면 비밀번호를 입력해주세요.");
			return;
		}
		
		var r = confirm("정말 회원 탈퇴하시겠습니까?");
		if (r == true) {
			$("#frmDelete").submit();
		} else {
			alert("취소하셨습니다.");
		}
	});
});
</script>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-3">
				</div>
				<div class="col-md-5">
				<form id="frmDelete" role="form" action="/kjy/member/deleteMemberRun" method="post">
				<h3>회원 탈퇴</h3>
				<div>
					<label for="m_id">아이디&emsp;&nbsp;</label> 
					<input type="text" name="m_id" value="${m_id}" readonly><br/>
					<label for="m_pw">비밀번호&nbsp;</label>
					<input type="password" id="m_pw" name="m_pw">
				</div>
				<button type="button" class="btn btn-primary" id="btnDeleteMember">탈퇴하기</button>
				</form>
				</div>
				<div class="col-md-4">
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>