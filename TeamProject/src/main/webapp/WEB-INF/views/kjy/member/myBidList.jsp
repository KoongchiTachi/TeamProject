<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<%@ include file="/WEB-INF/views/include/kmk/hideForm.jsp" %>

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
	// 응찰하기 버튼 클릭
	$(".btnConsign").click(function(e) {
		e.preventDefault(); 
		var pno = $(this).attr("data-pno"); 
		$("#hideForm > input[name=pno]").val(pno); 
		$("#hideForm").attr("action", $(this).attr("href")); 
		$("#hideForm").submit(); 
	});
	
	// 페이징
	$("a.page-link").click(function(e) {
		e.preventDefault();
		var page = $(this).attr("href").trim();
		$("#frmPage > input[name=page]").val(page);
		$("#frmPage").submit();
	});
	
	$("a.page-link").each(function () {
		var page = $(this).attr("href");
		if (page == "${bidListPagingDto.page}") {
			$(this).parent().addClass("active");
			return;
		}
	});
});
</script>

<form id="frmPage" action="/kjy/member/myBidList" method="get">
	<input type="hidden" name="page" value="${bidListPagingDto.page}"/>
	<input type="hidden" name="perPage" value="${bidListPagingDto.perPage}"/>
</form>

<div class="bidList" style="margin-bottom : 200px;">
	<div class="titleArea">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<h2>BID LIST</h2>
				<h5>&emsp;${m_name}님의 응찰 내역입니다.</h5>
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
							<th scope="col" style="width : 300px;">브랜드</th>
							<th scope="col" style="width : 300px;">상품명</th>
							<th scope="col" style="width : 200px;">응찰가격</th>
							<th scope="col" style="width : 200px;">응찰일시</th>
							<th scope="col" style="width : 200px;">현재가격</th>
							<th scope="col" style="width : 200px;">비고</th>
						</tr>
					</thead>
					<tbody>
					<c:choose>
						<c:when test="${listSize == 0}">
							<td colspan="6">
								<p class="text_font" style="text-align : center;">응찰중인 상품이 없습니다.</p>
							</td>
						</c:when>
						<c:when test="${listSize != 0}">
							<c:forEach items="${list}" var="bidVo">
								<tr>
									<td class="thumb" style="width : 200px; vertical-align: middle;">
										<a>
											<img src="/resources/img/bag/${bidVo.p_img1}" alt="${bidVo.p_img1}" style="width : 120px; height : 120px;">
										</a>
									</td>
									<td class="price" style="width : 300px; vertical-align : middle;"><strong class="">${bidVo.b_name}</strong><br>
									<td class="left" style="width : 300px; vertical-align : middle;"><strong class="">${bidVo.p_name}</strong></td>
									<td class="price" style="width : 200px; vertical-align : middle;"><strong class=""><fmt:formatNumber type="currency" value="${bidVo.b_price}" /></strong><br>
									<td class="price" style="width : 200px; vertical-align : middle;"><strong class="">${bidVo.b_date}</strong><br>
									<td class="price" style="width : 200px; vertical-align : middle;"><strong class=""><fmt:formatNumber type="currency" value="${bidVo.p_price}" /></strong><br>
									<td class="button" style="width : 200px; vertical-align : middle;">
										<c:if test="${bidVo.s_name == '진행'}">
											<div>
												<a href="/kmk/auction/product" onclick="NewWishlist.actionOrder('order', 0)" class="btn btn-sm btn-outline-dark btnConsign" data-pno="${bidVo.pno}">응찰하기</a>
											</div>  
										</c:if>
										<c:if test="${bidVo.s_name == '종료'}">
											<div>경매 종료</div>
										</c:if>
									</td>
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
							<c:if test="${bidListPagingDto.startPage != 1}">
							<li class="page-item">
								<a class="page-link" href="${bidListPagingDto.startPage - 1}">&laquo;</a>
							</li>
							</c:if>
							<!-- 페이지 넘버링 -->
							<c:forEach begin="${bidListPagingDto.startPage}" end="${bidListPagingDto.endPage}" var="v">
							<li class="page-item">
								<a class="page-link" href="${v}">${v}</a>
							</li>
							</c:forEach>
							<!-- 다음 -->
							<c:if test="${bidListPagingDto.endPage < bidListPagingDto.totalPage}">
							<li class="page-item">
								<a class="page-link" href="${bidListPagingDto.endPage + 1}">&raquo;</a>
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