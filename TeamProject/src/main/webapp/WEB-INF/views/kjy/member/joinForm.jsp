<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<%@ include file="/WEB-INF/views/include/kjy/joinForm_css.jsp" %>

<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>

<style>
#btnJoinDupId {
	cursor : pointer;
	color: #ffffff;
	background: #f9ad81;
}
#btnJoinDupId:hover {
	color: #000000;
}
#spanPw {
	position: relative;
	margin-top: 10px;
  	left: -90px; 
}
#spanName {
	position: relative;
	margin-top: 10px;
  	left: -90px;  
}
.mobile{
	outline: none;
  	margin: 0;
    border: none;
    -webkit-box-shadow: none;
 	-moz-box-shadow: none;
 	box-shadow: none;
 	width: 23%;
 	font-size: 14px;
 	font-family: inherit;
	background: #e5e5e5;
	line-height: 50px;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	padding: 0 -22px;
	font-size: 16px;
	color: #555;
}
select {
	-webkit-appearance: none; /* 네이티브 외형 감추기 */ 
	-moz-appearance: none; 
	appearance: none; 
	background: url(이미지 경로) no-repeat 95% 50%; /* 화살표 모양의 이미지 */
	width: 18%; /* 원하는 너비설정 */
	padding: .8em .5em; /* 여백으로 높이 설정 */ 
	font-family: inherit; /* 폰트 상속 */ 
	background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%; /* 네이티브 화살표 대체 */ 
	border: 1px solid #999; 
	border-radius: 0px; /* iOS 둥근모서리 제거 */ 
	-webkit-appearance: none; /* 네이티브 외형 감추기 */ 
	-moz-appearance: none; 
	appearance: none;
}
#btnHomecode {
	background: #f9ad81;
	position: relative;
  	left: 20px; 
}
</style>

<script>
$(function() {
	// 아이디 중복 확인
	$("#btnJoinDupId").click(function() {
		var m_id = $("#m_id").val();
		
		for (var v = 0; v < m_id.length; v++) {
			var ch = m_id.charCodeAt(v);
			if (v == 0) {
				if (!(97 <= ch && ch <= 122)) {
					$("#spanDup").text("아이디의 첫글자는 영문소문자만 가능합니다.").css("color", "red");
					return;
				}
			}
			if (!(97 <= ch && ch <= 122 || 48 <= ch && ch <= 57)) {
				$("#spanDup").text("유효하지 않은 문자가 포함되어 있습니다. (영문소문자/숫자, 4~16자)").css("color", "red");
				return;
			}
		}
		
		if (m_id.length <= 3) {
			$("#spanDup").text("아이디는 영문소문자/숫자, 4~16자 입니다.").css("color", "red");
			return;
		} else if (m_id.length >= 17) {
			$("#spanDup").text("아이디는 영문소문자/숫자, 4~16자 입니다.").css("color", "red");
			return;
		}

		var url = "/kjy/member/checkDupId";
		var sendData = {
			"m_id" : m_id
		};
		$.get(url, sendData, function(rData) {
			console.log(rData);
			if (rData == "available") {
				$("#spanDup").text("사용 가능한 아이디입니다.").css("color", "blue");
			} else {
				$("#spanDup").text("이미 사용중인 아이디 입니다.").css("color", "red");
			}
		});
	}); // 아이디 중복 확인
	
	// 비밀번호 확인
	$("#m_pw2").blur(function() {
		var m_pw = $("#m_pw").val();
		var m_pw2 = $("#m_pw2").val();
		
		if (m_pw != m_pw2) {
			$("#spanPw").text("비밀번호가 일치하지 않습니다.").css("color", "orange");
			$("#m_pw").focus();
			return;
		} else {
			$("#spanPw").text("");
		}
	}); // 비밀번호 확인
	
	// 이름 길이 확인
	$("#m_name").blur(function() {
		var m_name = $(this).val();
		if (m_name == "") {
			$("#spanName").text("이름을 입력해 주십시오.").css("color", "orange");
			return;
		} else {
			$("#spanName").text("");
		}
		if (m_name.length > 12) {
			$("#spanName").text("이름은 한글4자, 영문15까지 입력가능합니다.").css("color", "orange");
			return;
		}
	});
	
	// 휴대전화
	$("#m_phone3").blur(function() {
		var phone1 = $("#m_phone1").val();
		var phone2 = $("#m_phone2").val();
		var phone3 = $("#m_phone3").val();
		var m_phone = phone1.concat(phone2, phone3);
		$("#m_phone").val(m_phone);
	});
	
	// 주소
	$("#btnHomecode").click(function() {
		new daum.Postcode({
			oncomplete: function(data) {
				$('[name=homecode]').val(data.zonecode); // 우편번호 (5자리)
				$('[name=addr1]').val(data.address);
				$('[name=addr2]').val(data.buildingName);
			}
		}).open();
	});
	$("#addr2").blur(function() {
		var addr1 = $("#addr1").val();
		var addr2 = $("#addr2").val();
		var m_address = addr1.concat(addr2);
		$("#m_address").val(m_address);
	});
});
</script>

<div class="page-wrapper bg-gra-03 p-t-45 p-b-50" style="margin-top : 120px;">
    <div class="wrapper wrapper--w790">
        <div class="card card-5">
            <div class="card-heading">
                <h2 class="title">회원 가입</h2>
            </div>
            <div class="card-body">
                <form action="/kjy/member/joinRun" method="post">
                <input type="hidden" name="m_grade" value="g1001">
                <input type="hidden" id="m_phone" name="m_phone">
                <input type="hidden" id="m_address" name="m_address">
                    <div class="form-row m-b-55">
                        <div class="name">아이디</div>
                        <div class="value row row-space">
                            <div class="input-group-desc">
                                <input class="input--style-5" type="text" id="m_id" name="m_id" maxlength="30">
                            </div>
                    		<button type="button" class="btn-sm" id="btnJoinDupId">아이디 중복 확인</button>
                        </div>
                        <span id="spanDup" style="margin-top : 10px;"></span> 
                    </div>
                    <div class="form-row m-b-55">
                        <div class="name">비밀번호</div>
                        <div class="value">
                            <div class="row row-space">
                                <div class="input-group-desc">
                                    <input class="input--style-5" type="password" id="m_pw" name="m_pw" maxlength="30">
                                </div>
                            </div> 
                        </div>
                    </div>
                    <div class="form-row m-b-55">
                        <div class="name">비밀번호 확인</div>
                        <div class="value">
                            <div class="row row-space">
                                <div class="input-group-desc">
                                    <input class="input--style-5" type="password" id="m_pw2" maxlength="30">
                                </div>
	                            <span id="spanPw"></span> 
                            </div> 
                        </div>
                    </div>
                    <div class="form-row m-b-55">
                        <div class="name">이름</div>
                        <div class="value">
                            <div class="row row-space">
                                <div class="input-group-desc">
                                    <input class="input--style-5" type="text" id="m_name" name="m_name" maxlength="15">
                                </div>
                                <span id="spanName"></span>
                            </div>
                        </div>
                    </div>
                    <div class="form-row m-b-55">
                        <div class="name">휴대전화</div>
                        <div class="value">
                            <div class="row row-space">
                               <div class="input-group-desc">
                               	   <select id="m_phone1" name="m_phone[]">
                               	   		<option value="010">010</option>
                               	   		<option value="011">011</option>
                               	   		<option value="016">016</option>
                               	   		<option value="017">017</option>
                               	   		<option value="018">018</option>
                               	   		<option value="019">019</option>
                               	   </select> - 
                                   <input class="mobile" type="tel" id="m_phone2" name="m_phone[]" maxlength="4"> - 
                                   <input class="mobile" type="tel" id="m_phone3" name="m_phone[]" maxlength="4">
                               </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="name">주소</div>
                        <div class="value">
                             <div class="row row-space">
                                <div class="input-group-desc">
                                    <input class="input--style-5" type="text" name="homecode" style="width:120px; height:40px;">
									<button type="button" class="btn-sm btn-primary" id="btnHomecode">우편번호</button><br>  
									<input class="input--style-5" type="text" id="addr1" name="addr1" style="width:350px; height:40px; margin-top:10px;" readonly/>&nbsp;&nbsp;기본주소<br>
									<input class="input--style-5" type="text" id="addr2" name="addr2" style="width:350px; height:40px; margin-top:10px;"/>&nbsp;&nbsp;상세주소 
                                </div> 
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="name">은행</div>
                        <div class="value">
                            <div class="row row-refine">
                           		<select name="m_bank"> 
                               	   		<option value="삼성">삼성</option>
                               	   		<option value="롯데">롯데</option>
                               	   		<option value="신한">신한</option>
                               	   		<option value="우리">우리</option>
                               	   		<option value="국민">국민</option>
                               	   		<option value="농협">농협</option>
                               	 </select>
                                <input class="input--style-5" type="text" id="m_bank" name="m_bank" maxlength="15">
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="name">계좌번호</div>
                        <div class="value">
                            <div class="row row-refine">
                                <input class="input--style-5" type="text" id="m_account" name="m_account" maxlength="20">
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="name">이메일</div>
                        <div class="value">
                            <div class="row row-refine">
                                <input class="input--style-5" type="email" id="m_email" name="m_email">
                            </div>
                        </div>
                    </div>
                    <div>
                        <button class="btn btn--radius-2 btn--red" type="submit">가입하기</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>