<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<style>
.noticeList {
 	min-height : 50vh;
}
</style>

<body>
<section class="about-us spad">
<div class="container noticeList">
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
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-1">
				</div>
				<div class="col-md-10">
					<table class="table table-hover">
						<tbody>
								<tr>
									<td>2</td>
									<td><a href="/sjw/auction/notice">코로나 19 바이러스 관련 안내입니다.</a></td>
									<td>2020.03.24</td>
									<td>Hit 552</td>
								</tr>
								<tr>
									<td>1</td>
									<td>럭션에서 새롭게 선보입니다.</td>
									<td>2020.03.01</td>
									<td>Hit 722</td>
								</tr>
							</tbody>
					</table>
				</div>
				<div class="col-md-1">
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-5">
		</div>
		<div class="col-md-2">
			<div class="blog-pagination">
                <a href="#">01.</a>
                <a href="#">02.</a>
                <a href="#">03.</a>
            </div>
		</div>
		<div class="col-md-5">
		</div>
	</div>
</div>        
</section>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>