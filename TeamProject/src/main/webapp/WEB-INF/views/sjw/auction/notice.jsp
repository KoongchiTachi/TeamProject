<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<style>
.notice {
	min-height : 70vh;
	min-width: 100%;
	padding-left: 450px;
}
.contact-form textarea {
	font-size: 20px;
  	min-height: 50%;
 	height : 330px;
 	color: #5E5E5E;
 }
.contact-form input.subject {
	border-bottom: 1px solid #000000;
	margin-bottom: 100px;
	font-size: 20px;
	color: #5E5E5E;
}
</style>



<section class="about-us spad">
<div class="container notice">
	<div class="row">
                <div class="col-lg-12">
                    <div class="contact-title">
                        <div class="section-title">
                            <h2>공지사항</h2>
                        </div>
                    </div>
                </div>
            </div>
             
            <div class="row">
                <div class="col-lg-8">
                    <form action="#" class="contact-form">
                        <div class="row">
                            <div class="col-lg-12">
                                <input type="text" class="subject" value="${noticeVo.n_title}" readonly/>
                                <textarea readonly>${noticeVo.n_content}</textarea>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
	</div>
	
	<div class="row">
			<div class="col-md-8">
			</div>
			<div class="col-md-2">
			<a href="/sjw/auction/noticeList" class="primary-btn">목록으로</a>
			</div>
			<div class="col-md-2">
				
			</div>
		</div>
</section>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>