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
	padding-top: 60px;
	padding-bottom: 40px;
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
</style>
<script>
	
</script>

<%@ include file="/WEB-INF/views/include/sjw/frmPage.jsp" %>

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
                            <div class="col-lg-12" style="margin-bottom: 0px;">
                                <input type="text" class="title" style="padding-left: 25px; padding-right: 25px;" value="${noticeVo.n_title}" readonly/>
                                <input type="text" style="margin-bottom: 0px; padding-left: 25px; padding-right: 25px;" value="${noticeVo.n_date}" readonly/>
                                <textarea style="height: auto; min-height: 400px; padding-left: 25px; padding-right: 25px;" readonly>${noticeVo.n_content}</textarea>
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
				<a href="/sjw/about/noticeList" class="primary-btn" id="btnList">목록으로</a>
			</div>
			<div class="col-md-2">
			</div>
		</div>
</section>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>