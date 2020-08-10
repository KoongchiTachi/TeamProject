<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<style>
.noticeList {
 	min-height : 50vh;
}
.table {
	border-top: 2px solid #888888;
	border-bottom: 2px solid #888888;
}
.table td {
	font-size : 19px;
}
.blog-right {
	float: right;
 	margin-top: -10px;
}

.blog-right .blog-search input {
	color : #5E5E5E;
	width: 64%;
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
.blog-search input::placeholder { 
	color: #BDBDBD;
}
.inner-header .main-menu ul li a.active {
	color: #F9AD81;
}
</style>
<script>
$(function() {
	
	// 검색
	$("#btnSearch").click(function () {
		var searchType = $("select[name=searchType]").val();
		var keyword = $("#keyword").val();
		$("#frmPage > input[name=searchType]").val(searchType);
		$("#frmPage > input[name=keyword]").val(keyword);
		$("#frmPage").submit();
	});
	
	// 제목 클릭 -> 공지내용보기
	$("a.n_title").click(function(e) {
		e.preventDefault();
		var nno = $(this).attr("data-nno");
		$("#frmPage > input[name=nno]").val(nno);
		$("#frmPage").attr("action", $(this).attr("href"));
		$("#frmPage").submit();
	});
	
	// 페이지 번호
	$("a.page-link").click(function(e) {
		e.preventDefault();
		var page = $(this).attr("href").trim();
		$("#frmPage > input[name=page]").val(page);
		$("#frmPage").submit();
	});
	

	$(".nav4").addClass("active");

});
</script>

<%@ include file="/WEB-INF/views/include/sjw/frmPage.jsp" %>

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
						<div class="col-md-1"></div>
						<div class="col-md-10">

							<table class="table table-hover">
								<tbody>
									<c:forEach items="${list}" var="noticeVo">
										<tr style="text-align: center;">
											<td>${noticeVo.nno}</td>
											<td><a href="/sjw/about/noticeRead" class="n_title" style="color: #525252;" data-nno="${noticeVo.nno}">${noticeVo.n_title}</a></td>
											<td>${noticeVo.n_date}</td>
											<td>${noticeVo.view_cnt}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div class="row">
								<div class="col-md-5"></div>
								<div class="col-md-2">
									<div class="blog-pagination">
									<c:forEach begin="${noticePagingDto.startPage}" end="${noticePagingDto.endPage}" var="v">
										<a class="page-link" href="${v}">${v}</a>
									</c:forEach>
									</div>
								</div>
								<div class="col-md-5">
									<div class="blog-right">
										<div class="blog-search">
											<select class="mdb-select md-form colorful-select dropdown-primary" name="searchType" style="width: 100px; height: 42px; border: none; border-bottom: 1px solid gray;">
												<option value="tc"
													<c:if test="${noticePagingDto.searchType == 'tc'}">selected</c:if>
												>전체</option>
												<option value="t"
													<c:if test="${noticePagingDto.searchType == 't'}">selected</c:if>
												>제목</option>
												<option value="c"
													<c:if test="${noticePagingDto.searchType == 'c'}">selected</c:if>
												>내용</option>
											</select>&nbsp;
											<input type="text" id="keyword" name="keyword" placeholder="제목/내용 입력" value="${noticePagingDto.keyword}">
											<button type="button" id="btnSearch">검색</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-1"></div>
					</div>
				</div>
			</div>
		</div>        
</section>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>