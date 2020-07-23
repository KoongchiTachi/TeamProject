<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<style>
.notice {
	min-height : 80vh;
	min-width: 100%;
	padding-left: 450px;
}
.contact-form textarea {
	font-size: 20px;
  	min-height: 60%;
 	color: #5E5E5E;
 }
.contact-form input.subject {
	border-bottom: 1px solid #000000;
	margin-bottom: 100px;
	font-size: 20px;
	color: #5E5E5E;
}
</style>
<script>
$(function() {
	$("#noticeUpdate").submit(function() {
		$("#frmPage > input").prependTo("#noticeUpdate");
		$("#noticeUpdate").submit();
		return false;
	});
});
</script>

<%@ include file="/WEB-INF/views/include/sjw/frmPage.jsp" %>

<section class="about-us spad">
<div class="container notice">
	<div class="row">
                <div class="col-lg-12">
                    <div class="contact-title">
                        <div class="section-title">
                            <h2>공지사항 수정</h2>
                        </div>
                    </div>
                </div>
            </div>
             
            <div class="row">
                <div class="col-lg-8">
                    <form id="noticeUpdate" role="form" action="/sjw/about/noticeUpdate" class="contact-form" method="post">
                        <div class="row">
                            <div class="col-lg-12">
                                <input type="text" class="subject" value="${noticeVo.n_title}"/>
                                <textarea style="height: auto;">${noticeVo.n_content}</textarea>
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
			<button type="submit" class="primary-btn">수정완료</button>
			</div>
			<div class="col-md-2">
				
			</div>
		</div>
</section>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>