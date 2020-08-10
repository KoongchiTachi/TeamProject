<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="/WEB-INF/views/include/header.jsp"%>

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
	// 휴대전화 정보 가져오기
	var m_phone = "${memberVo.m_phone}";
	var phone1 = m_phone.substring(0, 3);
	var phone2 = m_phone.substring(3,7);
	var phone3 = m_phone.substring(7);
	$("#phone").text(phone1 + "-" + phone2 + "-" + phone3);
	
	// actionList toggle
	$("#auctionList").click(function() {
		$("#auctionA").toggle("slow").show();
	});
});
</script>

<div class="container emp-profile" style="margin-top : 170px;">
    <form method="post">
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
                        <li class="nav-item">
                            <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">MY GRADE</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-md-2">
            	<a href="/kjy/member/modifyInfo" class="btn profile-edit-btn" name="btnModifyInfo">회원 정보 수정</a>
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
                                        <p>${memberVo.m_name}</p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <label>휴대전화</label>
                                    </div>
                                    <div class="col-md-8">
                                        <p id="phone">
                                        </p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <label>주소</label>
                                    </div>
                                    <div class="col-md-8">
                                        <p>${memberVo.m_address}&nbsp;${memberVo.m_address2}</p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <label>이메일</label>
                                    </div>
                                    <div class="col-md-8">
                                        <p>${memberVo.m_email}</p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <label>은행 계좌번호</label>
                                    </div>
                                    <div class="col-md-8">
                                        <p>${memberVo.m_bank} ${memberVo.m_account}</p>
                                    </div>
                                </div>
                    </div>
                    <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                        <div class="row">
                            <div class="col-md-4">
                                <label>등급</label>
                            </div>
                            <div class="col-md-8">
                                <p>${memberVo.g_name}</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label>거래 횟수</label>
                            </div>
                            <div class="col-md-8">
                                <p>${memberVo.m_trade}</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label>수수료율</label>
                            </div>
                            <div class="col-md-8">
                                <p>${memberVo.g_discount}%</p>  
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>           
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>