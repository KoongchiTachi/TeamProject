<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<style>
body{ 
/* 	background: -webkit-linear-gradient(left, #dddddd, #ffffff);  */
}
div {
	font-size : 25px;
}
div p {
	font-size : 25px;
}
#home > div {
	margin-top : 25px; 
}
#profile > div {
	margin-top : 25px; 
}
.emp-profile{
    padding: 3%;
    margin-top: 3%;
    margin-bottom: 3%;
    border-radius: 0.5rem;
    background: #fff;
    background: #fff;
  -webkit-border-radius: 10px;
  -moz-border-radius: 10px;
  border-radius: 10px;
  -webkit-box-shadow: 0px 8px 20px 0px rgba(0, 0, 0, 0.15);
  -moz-box-shadow: 0px 8px 20px 0px rgba(0, 0, 0, 0.15);
  box-shadow: 0px 8px 20px 0px rgba(0, 0, 0, 0.15);
}
.profile-img{
    text-align: center;
}
.profile-img img{
/*     width: 70%; */
/*     height: 100%; */
	width : 150px;
	heigth : 150px;
	margin-top : 50px;
}
.profile-img .file {
    position: relative;
    overflow: hidden;
    margin-top: -20%;
    width: 70%;
    border: none;
    border-radius: 0;
    font-size: 15px;
    background: #212529b8;
}
.profile-img .file input {
    position: absolute;
    opacity: 0;
    right: 0;
    top: 0;
}
.profile-head h5{
    color: #333;
}
.profile-head h6{
    color: #0062cc;
}
.profile-edit-btn{
/*     border: none; */
    border-radius: 1.5rem;
    width: 100%;
    padding: 2%;
    font-weight: 200;
    color: #ffffff;
    cursor: pointer;
    font-size : 20px; 
    background: #f9ad81;
}
.proile-rating{
    font-size: 12px;
    color: #818182;
    margin-top: 5%;
}
.proile-rating span{
    color: #495057;
    font-size: 15px;
    font-weight: 200;
}
.profile-head .nav-tabs{
    margin-bottom:5%;
}
.profile-head .nav-tabs .nav-link{
    font-weight:200;
    border: none;
    color : #000000;
}
.profile-head .nav-tabs .nav-link.active{
    border: none;
    border-bottom:2px solid #f9ad81;
    color : #f9ad81;
    font-weight : 400; 
}
.profile-work{
    padding: 14%;
    margin-top: -5%;
}
.profile-work p{
    font-size: 20px;
    color: #818182;
    font-weight: 200;
    margin-top: 10%;
}
.profile-work p > a{
	font-size: 20px;
}
.profile-work a{
    text-decoration: none;
    color: #495057;
    font-weight: 200;
    font-size: 15px;
}
.profile-work ul{
    list-style: none;
}
.profile-tab label{
    font-weight: 200;
}
.profile-tab p{
    font-weight: 200;
    color: #312219;
}
#myTab {
	margin-top : 50px;
}
.profile-head {
	margin-top : 50px;
}
#btnHomecode {
	background : #f9ad81;
	cursor : pointer;
	position: relative;
	left: 10px; 
	border: 3px solid #f9ad81;
}
#btnHomecode:hover {
	color : #000000;
}
#home input {
	border: 2px solid #eeedec;
	-webkit-border-radius: 10px;
  	-moz-border-radius: 10px;
 	border-radius: 10px;
  	font-weight: 10;
  	font-size: 20px;
}
#m_pw2::placeholder {
	font-size : 15px;
}
#auctionList {
	cursor: pointer;
}
#auctionA {
	display: none;
}
html, body {
    height: 100%;
    font-family: "Montserrat Alternates", sans-serif;
    -webkit-font-smoothing: antialiased;
    font-smoothing: antialiased;
    background: none;
}
</style>

<script>
$(function() {
	// actionList toggle
	$("#auctionList").click(function() {
		$("#auctionA").toggle("slow").show();
	});
	
	// 불러오기 
	// 휴대전화
	var m_phone = "${memberVo.m_phone}";
	var phone1 = m_phone.substring(3,7);
	var phone2 = m_phone.substring(7);
	$("#m_phone2").val(phone1);
	$("#m_phone3").val(phone2);
	
	// 전송하기
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
		var phone1 = $("#m_phone1").val();
		var phone2 = $("#m_phone2").val();
		var phone3 = $("#m_phone3").val();
		var m_phone = phone1.concat(phone2, phone3);
		$("#m_phone").val(m_phone);
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
	
	// 공란 확인
	$("#modifyForm").submit(function() {
		if ($("#m_pw").val() == "") {
			alert("비밀번호를 입력해주세요.");
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
		if ($("#m_email").val() == "") {
			alert("이메일을 입력해주세요.");
			return false;
		}
		if ($("#m_bank").val() == "" || $("#m_account").val() == "") {
			alert("은행정보와 계좌번호를 입력해주세요.");
			return false;
		}
	});
});
</script>

<div class="container emp-profile" style="margin-top : 170px;">
    <form id="modifyForm" action="/kjy/member/modifyInfo" method="post">
    <input type="hidden" name="m_id" value="${memberVo.m_id}">
    <input type="hidden" id="m_phone" name="m_phone">
        <div class="row">
            <div class="col-md-4">
                <div class="profile-img">
                    <img src="/resources/img/grade/${memberVo.g_name}.png" alt="vip"/>
                </div>
            </div>
            <div class="col-md-6">
                <div class="profile-head">
                            <h5 style="font-size : 40px;">
                               	${memberVo.m_name} 님의 MY PAGE
                            </h5>
                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">MY INFO</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-md-2">
            	<button type="submit" class="btn profile-edit-btn" name="btnModifyInfo">정보 변경</button>
            	<a href="/kjy/member/myPage" class="btn profile-edit-btn" style="margin-top: 20px; background: #bfbfbf;">취소</a> 
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="profile-work">
                    <p id="auctionList">AUCTION LIST</p>
                    <div id="auctionA">
                    	<a href="/kjy/member/consignList"> 위탁</a><br/> 
	                    <a href="/kjy/member/myBidList"> 응찰 </a><br/> 
	                    <a href="/kjy/member/successBidList"> 낙찰 </a><br/>
                    </div>
                    <p><a href="/kjy/member/wishList">WISH LIST</a></p>
                    <p><a href="/sjw/member/myQna">1 : 1 문의 내역</a></p>
                    <p><a href="/kjy/member/deleteMemberForm">회원 탈퇴</a></p>
                </div>
            </div>
            <div class="col-md-8">
                <div class="tab-content profile-tab" id="myTabContent">
                    <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                          <div class="row">
                              <div class="col-md-4">
                                  <label>아이디</label>
                              </div>
                              <div class="col-md-8">
                                  <p>${memberVo.m_id}</p>
                              </div>
                          </div>
                          <div class="row">
                              <div class="col-md-4">
                                  <label>이름</label>
                              </div>
                              <div class="col-md-8">
                                  <p style="font-size: 20px;">${memberVo.m_name}</p>
                              </div>
                          </div>
                          <div class="row">
                              <div class="col-md-4">
                                  <label>비밀번호</label>
                              </div>
                              <div class="col-md-8">
                                	<input type="password" id="m_pw" name="m_pw" style="width : 40%;" maxlength="30"/>
                                	<input type="password" id="m_pw2" style="width : 40%;" maxlength="30" placeholder="비밀번호 확인"/><br/>
                                	<span id="spanPw"></span>
                              </div>
                          </div>
                          <div class="row">
                              <div class="col-md-4">
                                  <label>휴대전화</label>
                              </div>
                              <div class="col-md-8">
                                  <select id="m_phone1" style="font-size: 20px;">
                          	   		<option value="010">010</option>
                          	   		<option value="011">011</option>
                          	   		<option value="016">016</option>
                          	   		<option value="017">017</option>
                          	   		<option value="018">018</option>
                          	   		<option value="019">019</option>
                          	   </select> - 
                              <input type="tel" id="m_phone2" maxlength="4" style="width : 23%;"> - 
                              <input type="tel" id="m_phone3" maxlength="4" style="width : 23%;">
                              </div>
                          </div>
                          <div class="row">
                              <div class="col-md-4">
                                  <label>주소</label>
                              </div>
                              <div class="col-md-8">
                                  <input type="text" name="m_zip" style="width:120px; height:40px;" value="${memberVo.m_zip}">
								  <button type="button" class="btn-sm btn-primary" id="btnHomecode">우편번호</button><br>  
								  <input type="text" id="m_address" name="m_address" style="width:70%; height:40px; margin-top:10px;" value="${memberVo.m_address}" readonly/>&nbsp;&nbsp;<span style="font-size: 15px;">기본주소</span><br>
								  <input type="text" id="m_address2" name="m_address2" style="width:70%; height:40px; margin-top:10px;" value="${memberVo.m_address2}"/>&nbsp;&nbsp;<span style="font-size: 15px;">상세주소</span> 
                              </div>
                          </div>
                          <div class="row">
                              <div class="col-md-4">
                                  <label>이메일</label>
                              </div>
                              <div class="col-md-8">
                                 	<input type="email" id="m_email" name="m_email" value="${memberVo.m_email}">
                              </div>
                          </div>
                          <div class="row">
                              <div class="col-md-4">
                                  <label>은행 계좌번호</label>
                              </div>
                              <div class="col-md-8">
                                  <input type="text" id="m_bank" name="m_bank" style="width: 30%;" value="${memberVo.m_bank}">
                                  <input type="text" id="m_account" name="m_account" style="width: 65%;" value="${memberVo.m_account}">
                              </div>
                          </div>
                    </div>
                </div>
            </div>
        </div>
    </form>           
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>