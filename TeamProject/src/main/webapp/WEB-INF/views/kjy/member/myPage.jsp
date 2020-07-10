<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<style>
body{ 
	background: -webkit-linear-gradient(left, #dddddd, #ffffff); 
}
div {
	font-size : 25px;
}
div p {
	font-size : 25px;
}
.row {
	margin-top : 30px;
}
.emp-profile{
    padding: 3%;
    margin-top: 3%;
    margin-bottom: 3%;
    border-radius: 0.5rem;
    background: #fff;
}
.profile-img{
    text-align: center;
}
.profile-img img{
    width: 70%;
    height: 100%;
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
    border: none;
    border-radius: 1.5rem;
    width: 100%;
    padding: 2%;
    font-weight: 200;
    color: #6c757d;
    cursor: pointer;
    font-size : 20px; 
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
    margin-top: -15%;
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
</style>

<div class="container emp-profile" style="margin-top : 170px;">
    <form method="post">
        <div class="row">
            <div class="col-md-4">
                <div class="profile-img">
                    <img src="/resources/img/grade/vip.png" alt="vip"/>
                </div>
            </div>
            <div class="col-md-6">
                <div class="profile-head">
                            <h5 style="font-size : 40px;">
                               	이름
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
                <input type="submit" class="profile-edit-btn" name="btnAddMore" value="회원 정보 수정"/>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="profile-work">
                    <p>ACUTION LIST</p>
                    <a href=""> 응찰 </a><br/> 
                    <a href=""> 낙찰 </a><br/>
                    <p><a href="">WISH LIST</a></p>
                    <p><a href="">1 : 1 문의 내역</a></p>
                </div>
            </div>
            <div class="col-md-8">
                <div class="tab-content profile-tab" id="myTabContent">
                    <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                <div class="row">
                                <!-- 다음 개인정보변경페이지 참고 -->
                                    <div class="col-md-6">
                                        <label>아이디</label>
                                    </div>
                                    <div class="col-md-6">
                                        <p>m_id</p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>이름</label>
                                    </div>
                                    <div class="col-md-6">
                                        <p>mname</p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>전화번호</label>
                                    </div>
                                    <div class="col-md-6">
                                        <p>m_phone</p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>주소</label>
                                    </div>
                                    <div class="col-md-6">
                                        <p>m_address</p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>이메일</label>
                                    </div>
                                    <div class="col-md-6">
                                        <p>m_email</p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>계좌번호</label>
                                    </div>
                                    <div class="col-md-6">
                                        <p>m_account</p>
                                    </div>
                                </div>
                    </div>
                    <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                        <div class="row">
                            <div class="col-md-6">
                                <label>등급</label>
                            </div>
                            <div class="col-md-6">
                                <p>g_name</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>거래 횟수</label>
                            </div>
                            <div class="col-md-6">
                                <p>c_trade</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>할인율</label>
                            </div>
                            <div class="col-md-6">
                                <p>g_discount</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>           
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>