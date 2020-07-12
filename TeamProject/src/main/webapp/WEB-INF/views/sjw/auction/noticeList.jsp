<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<style>
.noticeList {
 	min-height : 50vh;
}
.blog-pagination {
	margin-top : 50%;
}
.table {
	border-top: 3px solid #888888;
	border-bottom: 3px solid #888888;
}
.table td {
	font-size : 20px;
}
.blog-right .blog-search {
	position: relative;
	margin-bottom: 66px;
}
.blog-right {
	float: right;
	margin-top: 30px;
}

.blog-right .blog-search input {
	color : #5E5E5E;
	width: 63%;
	height: 40px;
	border: none;
	border-bottom: 1px solid #888888;
	font-size: 15px;
	font-weight: 600;
}

.blog-right .blog-search button {
	color: #ffffff;
	font-size: 14px;
	font-weight: 600;
	padding: 0 24px;
	height: 100%;
	position: absolute;
	right: 0;
	top: 0;
	background: #F9AD81;
	border: none;
	cursor: pointer;
}
</style>

<body>
<section class="contact-section spad">
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
 					 <div class="blog-right">
                         <form action="#" class="blog-search">
                            <input type="text">
                            <button type="submit">검색</button>
                         </form>
                     </div>
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