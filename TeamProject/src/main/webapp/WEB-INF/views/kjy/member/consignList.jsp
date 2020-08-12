<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<style>
.bidList {
	min-height: 100vh;
}
.titleArea {
	margin-top: 200px;
	margin-bottom: 100px;
}
.btnConsign {
	border : none;
	color : #ffffff;
	background-color: #f9ad81;
}
.btnConsign:hover {
	color : #000000;
	background-color: #ffffff;
}
.pagination > li > a {
    background-color: white;
    color: black;
}
.pagination > .page-item.active > .page-link {
  	background-color: #f9ad81;
  	border : solid 1px #f9ad81;
}
</style>

<script>
$(function() {
	// 페이징
	$("a.page-link").click(function(e) {
		e.preventDefault();
		var page = $(this).attr("href").trim();
		$("#frmPage > input[name=page]").val(page);
		$("#frmPage").submit();
	});
	
	$("a.page-link").each(function () {
		var page = $(this).attr("href");
		if (page == "${consignListPagingDto.page}") {
			$(this).parent().addClass("active");
			return;
		}
	});
});
</script>

<form id="frmPage" action="/kjy/member/consignList" method="get">
	<input type="hidden" name="page" value="${consignListPagingDto.page}"/>
	<input type="hidden" name="perPage" value="${consignListPagingDto.perPage}"/>
</form>

<div class="bidList" style="margin-bottom : 200px;">
	<div class="titleArea">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<h2>CONSIGN LIST</h2>
				<h5>&emsp;${m_name}님의 위탁 내역입니다.</h5>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<table class="table" style="text-align: center;">
					<thead>
						<tr>
							<th scope="col" style="width : 200px;">이미지</th>
							<th scope="col" style="width : 200px;">상품명</th>
							<th scope="col" style="width : 400px;">상품정보</th>
							<th scope="col" style="width : 200px;">위탁일시</th>
							<th scope="col" style="width : 200px;">비고</th>
						</tr>
					</thead>
					<tbody>
					<c:choose>
						<c:when test="${listSize == 0}">
							<td colspan="5">
								<p class="text_font" style="text-align : center;">위탁하신 상품이 없습니다.</p>
							</td>
						</c:when>
						<c:when test="${listSize != 0}">
							<c:forEach items="${list}" var="consignListVo">
								<tr>
									<td class="thumb" style="width : 200px; vertical-align: middle;">
										<img src="/resources/img/bag/${consignListVo.cs_img1}" alt="${consignListVo.cs_img1}" style="width : 120px; height : 120px;">
									</td>
									<td class="price" style="width : 200px; vertical-align : middle;"><strong class="">${consignListVo.cs_name}</strong><br>
									<td class="left" style="width : 400px; vertical-align : middle;"><a href="">${consignListVo.cs_info}</a></td>
									<td class="price" style="width : 200px; vertical-align : middle;"><strong class="">${consignListVo.cs_date}</strong><br>
									<td class="price" style="width : 200px; vertical-align : middle;"><strong class="">${consignListVo.p_name}</strong><br>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>
					</tbody>
				</table>
			</div>
			<div class="col-md-2"></div>
		</div>
		
		<c:choose>
			<c:when test="${listSize != 0}">
			<div class="row">
				<div class="col-md-4">
				</div>
				<div class="col-md-4">
					<nav>
						<ul class="pagination" style="justify-content: center;">
							<!-- 이전 -->
							<c:if test="${consignListPagingDto.startPage != 1}">
							<li class="page-item">
								<a class="page-link" href="${consignListPagingDto.startPage - 1}">&laquo;</a>
							</li>
							</c:if>
							<!-- 페이지 넘버링 -->
							<c:forEach begin="${consignListPagingDto.startPage}" end="${consignListPagingDto.endPage}" var="v">
							<li class="page-item">
								<a class="page-link" href="${v}">${v}</a>
							</li>
							</c:forEach>
							<!-- 다음 -->
							<c:if test="${consignListPagingDto.endPage < consignListPagingDto.totalPage}">
							<li class="page-item">
								<a class="page-link" href="${consignListPagingDto.endPage + 1}">&raquo;</a>
							</li>
							</c:if>
						</ul>
					</nav>
				</div>
				<div class="col-md-4">
				</div>
			</div>
			</c:when>
		</c:choose>

	</div>
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>