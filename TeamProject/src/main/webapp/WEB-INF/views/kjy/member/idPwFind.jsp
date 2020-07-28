<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<style>
.title {
	margin-top : 200px;
	margin-bottom : 50px;
	text-align: center;
	font-size : 50px;
	font-weight: bold;
}
.col-md-12 {
	min-height: 50vh; 
}
.col-md-3 input {
	border: 1px solid #55504c;
	-webkit-border-radius: 10px;
 	-moz-border-radius: 10px;
 	border-radius: 10px;
}
#btnIdFind {
	background : #f9ad81;
	position:relative;
	color : #ffffff;
	width : auto;
	height : 70px;
	line-height : 60px;
	bottom : 30px;
	left : 20px;
	cursor : pointer;
	border : none;
	transition-duration: 0.4s;
	text-align: center;
	vertical-align: middle;  
} 
#btnIdFind:hover {
	color : #000000; 
}
#btnPwFind {
	background : #f9ad81;
	position:relative;
	color : #ffffff;
	width : auto;
	height : 70px; 
	line-height : 60px;
	bottom : 30px;
	left : 20px;
	cursor : pointer;
	border : none;
	transition-duration: 0.4s;
	text-align: center;
}
#btnPwFind:hover {
	color : #000000;
}
</style>

<script>
$(function() {
	// 아이디 찾기
	$("#btnIdFind").click(function() {
		var m_name = $("#m_name").val();
		var m_email = $("#m_email").val();
		if (m_name == "" || m_email == "") {
			alert("이름 또는 이메일을 입력해주세요.");
			return;
		}
		var sendData = {
			"m_name" : m_name,
			"m_email" : m_email
		};
		var url = "/kjy/member/findId";
		$.ajax({
			"type" : "post",
			"url" : url,
			"data" : sendData,
			"success" : function(result) {
				alert(m_name + " 회원님의 ID는 " + result + " 입니다.");
			},
			"error" : function(data) {
				alert("에러가 발생했습니다.");
				return false;
			}
		});
	});
	
	// 비밀번호 찾기
	$("#btnPwFind").click(function() {
		var m_id = $("#m_id").val();
		var m_email = $("#m_email2").val();
		if (m_id == "" || m_email == "") {
			alert("아이디 또는 이메일을 입력해주세요.");
			return;
		}
		var sendData = {
				"m_id" : m_id,
				"m_email" : m_email
			};
		var url = "/kjy/member/findPw";
		$.ajax({
			"type" : "post",
			"url" : url,
			"data" : sendData,
			"success" : function(result) {
				alert("회원님의 메일주소로 임시 패스워드가 발송되었습니다.");
			},
			"error" : function(data) {
				alert("에러가 발생했습니다.");
				return false;
			}
		});
	});
});
</script>

<h2 class="title">아이디/비밀번호 찾기</h2>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-2">
				</div>
				<div class="col-md-3">
				<h3 style="margin: 20px;">아이디 찾기</h3>
				<div>
					<label for="m_name">이름&emsp;&nbsp;</label> 
					<input type="text" id="m_name" name="m_name"><br/>
					<label for="m_email">이메일&nbsp;</label>
					<input type="email" id="m_email" name="m_email">
					<button type="button" class="btn btn-primary" id="btnIdFind">아이디 찾기</button>
				</div>
				</div>
				<div class="col-md-2"></div>
				<div class="col-md-3">
				<h3 style="margin: 20px;">비밀번호 찾기</h3>
				<div>
					<label for="m_id">아이디&nbsp;</label>
					<input type="text" id="m_id" name="m_id"><br/>
					<label for="m_email">이메일&nbsp;</label>
					<input type="email" id="m_email2" name="m_email2">
					<button type="button" class="btn btn-primary" id="btnPwFind">비밀번호 찾기</button>
				</div>
				</div>
				<div class="col-md-2"> 
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>