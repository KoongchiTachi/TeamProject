<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<%@ include file="/WEB-INF/views/include/kjy/login_css.jsp" %>
<script>
$(function() {
	var msg = "${msg}";
	if (msg == "fail") {
		alert("로그인에 실패했습니다.\n아이디와 비밀번호를 다시 확인해주세요.");
	}
});
</script>
<style>
html, body {
    height: 100%;
    font-family: "Montserrat Alternates", sans-serif;
    -webkit-font-smoothing: antialiased;
     font-smoothing: antialiased; 
    background: none;
}
</style>

<div class="limiter" style="margin-top:120px;">
	<div class="container-login100">
		<div class="wrap-login100 p-t-50 p-b-90">
			<form class="login100-form validate-form flex-sb flex-w" action="/kjy/member/login" method="post">
				<span class="login100-form-title p-b-51">
					Login
				</span>
				<div class="wrap-input100 validate-input m-b-16" data-validate = "Username is required">
					<input class="input100" type="text" name="m_id" placeholder="아이디">
					<span class="focus-input100"></span>
				</div>
				<div class="wrap-input100 validate-input m-b-16" data-validate = "Password is required">
					<input class="input100" type="password" name="m_pw" placeholder="비밀번호">
					<span class="focus-input100"></span>
				</div>
				<div class="flex-sb-m w-full p-t-3 p-b-24">
					<div>
						<a href="/kjy/member/idPwFind" class="txt1" style="position : relative; left : 230px;">아이디/비밀번호 찾기</a> 
					</div>
				</div>
				<div class="container-login100-form-btn m-t-17">
					<button class="login100-form-btn" style="margin : 10px">로그인</button>
					<a href="/kjy/member/joinForm" class="btn login100-form-btn" style="margin : 10px" id="btnJoin">회원가입</a>
				</div>
			</form>
		</div>
	</div>
</div>
 
<%@ include file="/WEB-INF/views/include/footer.jsp" %>