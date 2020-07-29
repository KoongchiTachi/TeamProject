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
#spanPwLength {
	position: relative;
	margin-top: 10px;
  	left: -110px; 
}
#spanPw {
	position: relative;
	margin-top: 10px;
  	left: -90px; 
}
#spanName {
	position: relative;
	margin-top: 10px;
	right : 130px;
}
.mobile{
/* 	outline: none; */
/*   	margin: 0; */
/*     border: none; */
/*     -webkit-box-shadow: none; */
/*  	-moz-box-shadow: none; */
/*  	box-shadow: none; */
/*  	width: 23%; */
/*  	font-size: 14px; */
/*  	font-family: inherit; */
/* 	background: #e5e5e5; */
/* 	line-height: 50px; */
/* 	-webkit-border-radius: 5px; */
/* 	-moz-border-radius: 5px; */
/* 	border-radius: 5px; */
/* 	padding: 0 -22px; */
/* 	font-size: 16px; */
/* 	color: #555; */
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
	cursor : pointer;
	background: #f9ad81;
	position: relative;
  	left: 20px; 
}
#btnHomecode:hover {
	color : #000000;
}
#btnEmailAuth {
	cursor : pointer;
	margin-top : 7px;
	height : 40px;
	background: #f9ad81;
	position: relative;
  	left: 20px; 
}
#btnEmailAuth:hover {
	color : #000000;
}
#btnAuthCode {
	color : #ffffff; 
	cursor : pointer;
	height : 40px;
	margin-top : 14px;
	background: #f9ad81;
	position: relative;
  	left: 20px;
}
#btnAuthCode:hover {
	color : #000000;
}
#spanAuthCode {
  	margin-top : 20px;
}
</style>

<script>
//이름 영어, 한글 유효성 
function chkword(obj, maxByte) {
	var strValue = obj.value;
	var strLen = strValue.length;
	var totalByte = 0;
	var oneChar = "";
	var str2 = "";
	
	for (var i = 0; i < strLen; i++) {
		oneChar = strValue.charAt(i);
		if (escape(oneChar).length > 8) {
			totalByte += 2;
		} else {
			totalByte++;
		}

		// 입력한 문자 길이보다 넘치면 잘라내기 위해서 저장
		if (totalByte <= maxByte) {
			len = i + 1;
		}
	}
	// 넘어가는 글자 자르기
	if (totalByte > maxByte) {
		alert("이름은 " + maxByte + "자를 초과하여 입력할 수 없습니다.");
		str2 = strValue.substr(0, len);
		obj.value = str2;
		chkword(obj, 4000);
	}
}

$(function() {
	// 아이디 유효성, 중복 확인
	$("#btnJoinDupId").click(function() {
		var m_id = $("#m_id").val();
		console.log("m_id:" + m_id);
		
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
			if (rData == "available") {
				$("#spanDup").text("사용 가능한 아이디입니다.").css("color", "blue");
			} else {
				$("#spanDup").text("이미 사용중인 아이디 입니다.").css("color", "red");
			}
		});
	}); // 아이디 유효성, 중복 확인
	
	// 비밀번호 길이 확인
	$("#m_pw").blur(function() {
		var pw_length = $(this).val().length;
		if (pw_length <= 7) {
			$("#spanPwLength").text("비밀번호는 8~16자 입니다.").css("color", "red");
			return;
		} else if (pw_length >= 17) {
			$("#spanPwLength").text("비밀번호는 8~16자 입니다.").css("color", "red");
			return;
		} else {
			$("#spanPwLength").text("");
		}
	});
	
	// 비밀번호 일치 확인
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
	});
	
	// 이름 길이 확인
	$("#m_name").blur(function() {
		var m_name = $(this).val();
		if (m_name == "") {
			$("#spanName").text("이름을 입력해 주십시오.").css("color", "red");
			return;
		} else {
			$("#spanName").text("");
		}
	});
	
	// 휴대전화
	$("#m_phone2").blur(function() {
		var phone1 = $("#m_phone1").val();
		var phone2 = $("#m_phone2").val();
		var phone3 = $("#m_phone3").val();
		var m_phone = phone1.concat(phone2, phone3);
		$("#m_phone").val(m_phone);
	});
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
				$('[name=m_zip]').val(data.zonecode); // 우편번호 (5자리)
				$('[name=m_address]').val(data.address);
				$('[name=m_address2]').val(data.buildingName);
			}
		}).open();
	});
	
	// 이메일 인증코드 보내기
	$("#btnEmailAuth").click(function() {
		var m_email = $("#m_email").val();
		var result = m_email.indexOf("@");
		if (result == -1) {
			alert("이메일의 형식을 확인해 주세요.");
			return;
		}
		
		var url = "/kjy/member/emailAuth";
		$.ajax({
			"type" : "get",
			"url" : url,
			"data" : "m_email=" + $("#m_email").val(),
			"success" : function(result) {
				alert("사용가능한 이메일입니다. 인증 코드를 입력해주세요.");
				$("m_email2").focus();
				obj = jQuery.parseJSON(result);
				$("#authCode").val(obj);
			},
			"error" : function(data) {
				alert("에러가 발생했습니다.");
				return false;
			}
		});
	});
	// 이메일 인증하기
	$("#btnAuthCode").click(function() {
		var authCode = $("#authCode").val();
		var m_email2 = $("#m_email2").val();
		if (authCode == "") {
			$("#spanAuthCode").text("인증 번호를 입력해주세요.").css("color", "red");
			return;
		} else if (authCode == m_email2) {
			$("#spanAuthCode").text("인증이 완료되었습니다.").css("color", "blue");
			$("#keep").val("success");
			$("#m_email2").prop("disabled", "false");
		} else {
			$("#spanAuthCode").text("인증 번호를 잘못 입력하셨습니다.").css("color", "red");
			return;
		} 
	});
	
	// 공란 확인
	$("#joinForm").submit(function() {
		if ($("#m_id").val() == "") {
			alert("아이디를 입력해주세요.");
			return false;
		}
		if ($("#spanDup").text() == "") {
			alert("아이디 중복 확인이 필요합니다.");
			$("#btnJoinDupId").focus();
			return false;
		}
		if ($("#m_pw").val() == "") {
			alert("비밀번호를 입력해주세요.");
			return false;
		}
		if ($("#m_name").val() == "") {
			alert("이름을 입력해주세요.");
			return false;
		}
		if ($("#m_phone").val() == "") {
			alert("휴대전화를 입력해주세요.");
			return false;
		}
		if ($("#m_address").val() == "") {
			alert("주소를 입력해주세요.");
			return false;
		}
		if ($("#m_bank").val() == "" || $("#m_account").val() == "") {
			alert("은행정보와 계좌번호를 입력해주세요.");
			return false;
		}
		if ($("#keep").val() == "") {
			alert("인증코드를 확인해주세요.");
			return false;
		}
	});
	
});
</script>
<input type="hidden" id="authCode">
<input type="hidden" id="keep">
<div class="page-wrapper bg-gra-03 p-t-45 p-b-50" style="margin-top : 120px;">
    <div class="wrapper wrapper--w790">
        <div class="card card-5">
            <div class="card-heading">
                <h2 class="title">회원 가입</h2>
            </div>
            <div class="card-body">
                <form id="joinForm" action="/kjy/member/joinRun" method="post">
                <input type="hidden" name="m_grade" value="g1001">
                <input type="hidden" id="m_phone" name="m_phone">
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
                                <span id="spanPwLength"></span>
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
                                    <input class="input--style-5" type="text" id="m_name" name="m_name" maxlength="15" onkeyup="chkword(this, 4)">
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
                               	   <select id="m_phone1">
                               	   		<option value="010">010</option>
                               	   		<option value="011">011</option>
                               	   		<option value="016">016</option>
                               	   		<option value="017">017</option>
                               	   		<option value="018">018</option>
                               	   		<option value="019">019</option>
                               	   </select> - 
                                   <input class="input--style-5" type="tel" id="m_phone2" maxlength="4" style="width : 23%;"> - 
                                   <input class="input--style-5" type="tel" id="m_phone3" maxlength="4" style="width : 23%;">
                               </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="name">주소</div>
                        <div class="value">
                             <div class="row row-space">
                                <div class="input-group-desc">
                                    <input class="input--style-5" type="text" id="m_zip" name="m_zip" style="width:120px; height:40px;">
									<button type="button" class="btn-sm btn-primary" id="btnHomecode">우편번호</button><br>  
									<input class="input--style-5" type="text" id="m_address" name="m_address" style="width:350px; height:40px; margin-top:10px;" readonly/>&nbsp;&nbsp;기본주소<br>
									<input class="input--style-5" type="text" id="m_address2" name="m_address2" style="width:350px; height:40px; margin-top:10px;"/>&nbsp;&nbsp;상세주소 
                                </div> 
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="name">은행, 계좌번호</div>
                        <div class="value">
                            <div class="row row-refine">
                                <input class="input--style-5" type="text" id="m_bank" name="m_bank" maxlength="15" style="width : 25%;" placeholder="ex)농협">
                                <input class="input--style-5" type="text" id="m_account" name="m_account" maxlength="20" style="width : 40%; margin-left: 5px;" placeholder="ex)000-00-000000">
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="name">이메일</div>
                        <div class="value">
                            <div class="row row-refine">
                                <input class="input--style-5" type="email" id="m_email" name="m_email" style="width : 50%;">
                                <button type="button" class="btn-sm btn-primary" id="btnEmailAuth">인증번호 보내기</button>
                            </div>
                            <div class="row row-refine">
                                <input class="input--style-5" type="text" id="m_email2" style="width:50%; margin-top:10px;">
                                <button type="button" class="btn-sm btn-primary" id="btnAuthCode">인증하기</button>
                            </div>
                        <span id="spanAuthCode"></span>
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