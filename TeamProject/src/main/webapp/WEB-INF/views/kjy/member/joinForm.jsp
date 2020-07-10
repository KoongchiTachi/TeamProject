<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<%@ include file="/WEB-INF/views/include/kjy/joinForm_css.jsp" %>

<div class="page-wrapper bg-gra-03 p-t-45 p-b-50" style="margin-top : 120px;">
    <div class="wrapper wrapper--w790">
        <div class="card card-5">
            <div class="card-heading">
                <h2 class="title">회원 가입</h2>
            </div>
            <div class="card-body">
                <form action="/kjy/member/joinRun" method="post">
                    <div class="form-row m-b-55">
                        <div class="name">아이디</div>
                        <div class="value">
                            <div class="row row-space">
                                <div class="input-group-desc">
                                    <input class="input--style-5" type="text" name="m_id">
                                </div>
                        		<button type="button" class="btn-sm btn-info" id="btnJoinDupId">아이디 중복 확인</button>
                            </div>
                        </div> 
                    </div>
                    <div class="form-row m-b-55">
                        <div class="name">비밀번호</div>
                        <div class="value">
                            <div class="row row-space">
                                <div class="input-group-desc">
                                    <input class="input--style-5" type="password" name="m_pw">
                                </div>
                            </div> 
                        </div>
                    </div>
                    <div class="form-row m-b-55">
                        <div class="name">비밀번호 확인</div>
                        <div class="value">
                            <div class="row row-space">
                                <div class="input-group-desc">
                                    <input class="input--style-5" type="password" name="m_pw2">
                                </div>
	                            <div>비밀번호 일치 여부 넣을 것!</div>
                            </div> 
                        </div>
                    </div>
                    <div class="form-row m-b-55">
                        <div class="name">이름</div>
                        <div class="value">
                            <div class="row row-space">
                                <div class="input-group-desc">
                                    <input class="input--style-5" type="text" name="m_name">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-row m-b-55">
                        <div class="name">전화번호</div>
                        <div class="value">
                            <div class="row row-refine">
                               <div class="input-group-desc">
                                   <input class="input--style-5" type="text" name="m_phone">
                               </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="name">주소</div>
                        <div class="value">
                            <div class="row row-refine">
                                <input class="input--style-5" type="text" name="m_address">
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="name">계좌정보</div>
                        <div class="value">
                            <div class="row row-refine">
                                <input class="input--style-5" type="text" name="m_account">
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="name">이메일</div>
                        <div class="value">
                            <div class="row row-refine">
                                <input class="input--style-5" type="email" name="m_email">
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