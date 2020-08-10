<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<script src="https://rawgit.com/jackmoore/autosize/master/dist/autosize.min.js"></script>
<style>
.notice {
	min-height : 70vh;
}
.contact-form textarea {
	font-size: 18px;
	padding-top: 65px;
	padding-bottom: 65px;
 	color: #5E5E5E;
 }
.contact-form input.title {
	margin-bottom: 0px;
	border-top: 1px solid #000000;
	border-bottom: 1px solid #000000;
	background-color : #f2f2f2;
	font-size: 20px;
	color: #5E5E5E;
}
.inner-header .main-menu ul li a.active {
	color: #F9AD81;
}
</style>
<script>
$(function() {
	
	autosize($("textarea"));
	
	$(".nav4").addClass("active");
	
});
</script>

<%@ include file="/WEB-INF/views/include/sjw/frmPage.jsp" %>

<section class="contact-section spad">
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
                    <form action="#" class="contact-form" style="width: 155%;">
                        <div class="row">
                            <div class="col-lg-12" style="margin-bottom: 0px;">
                                <input type="text" class="title" style="padding-left: 40px; padding-right: 40px;" value="${noticeVo.n_title}" readonly/>
                                <input type="text" style="margin-bottom: 0px; padding-left: 40px; padding-right: 40px; font-size: 15px;" value="${noticeVo.n_date}" readonly/>
                                <textarea style="overflow:hidden; padding-left: 40px; padding-right: 40px;" readonly>${noticeVo.n_content}</textarea>
                            </div>
                        </div>
                        <a href="/sjw/about/noticeList" style="float: right;" class="primary-btn">목록으로</a>
                    </form>
                </div>
            </div>
		</div>
</section>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>