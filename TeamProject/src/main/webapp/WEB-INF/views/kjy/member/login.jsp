<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<%@ include file="/WEB-INF/views/include/kjy/login_css.jsp" %>

<style>
.container-login100-form-btn {
  width: 100%;
  display: -webkit-box;
  display: -webkit-flex;
  display: -moz-box;
  display: -ms-flexbox;
  display: flex;
  flex-wrap: wrap;
}

.primary-btn {
  font-family: poppins-bold;    
  font-size: 16px;
  color: #fff;
  line-height: 1.2; 

  display: -webkit-box;
  display: -webkit-flex;
  display: -moz-box;
  display: -ms-flexbox;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 0 20px;
  width: 100%;
  height: 62px;
  background-color: #f9ad81; 
  border-radius: 3px;

  -webkit-transition: all 0.4s;
  -o-transition: all 0.4s;
  -moz-transition: all 0.4s;
  transition: all 0.4s;
}

.primary-btn:hover {
  background-color: #9b3d07;
}
</style>



<div class="limiter">
	<div class="container-login100">
		<div class="wrap-login100 p-t-50 p-b-90">
			<form class="login100-form validate-form flex-sb flex-w">
				<span class="login100-form-title p-b-51">
					Login
				</span>
				<div class="wrap-input100 validate-input m-b-16" data-validate = "Username is required">
					<input class="input100" type="text" name="username" placeholder="아이디">
					<span class="focus-input100"></span>
				</div>
				<div class="wrap-input100 validate-input m-b-16" data-validate = "Password is required">
					<input class="input100" type="password" name="pass" placeholder="비밀번호">
					<span class="focus-input100"></span>
				</div>
				<div class="flex-sb-m w-full p-t-3 p-b-24">
					<div class="contact100-form-checkbox">
						<input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
						<label class="label-checkbox100" for="ckb1">
							로그인 상태 유지
						</label>
					</div>
					<div>
						<a href="#" class="txt1">
							비밀번호 찾기
						</a>
					</div>
				</div>
				<div class="container-login100-form-btn m-t-17">
					<button class="login100-form-btn" style="margin : 10px">
						로그인
					</button>
					<a href="/kjy/member/joinForm" class="btn login100-form-btn" style="margin : 10px" id="btnJoin">
						회원가입
					</a>
				</div>
			</form>
		</div>
	</div>
</div>
 
<%@ include file="/WEB-INF/views/include/footer.jsp" %>