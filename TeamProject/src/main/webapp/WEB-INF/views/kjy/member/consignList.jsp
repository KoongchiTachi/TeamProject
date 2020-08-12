<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
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
.btnCancel:hover {
	cursor : pointer;
}
</style>

<script>
$(function() {
	// 입금될 금액
	$(".btnConsign").click(function() {
		var that = $(this);
		var oPrice = that.attr("data-oPrice");
		var price = that.attr("data-price");
		$("#modal_oPrice").val(oPrice);
		$("#modal_price").val(price);
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
							<th scope="col" style="width : 200px;">브랜드</th>
							<th scope="col" style="width : 200px;">상품명</th>
							<th scope="col" style="width : 300px;">위탁일시</th>
							<th scope="col" style="width : 300px;">비고</th>
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
									<td class="price" style="width : 200px; vertical-align : middle;"><strong class="">${consignListVo.b_name}</strong></td>
									<td class="left" style="width : 400px; vertical-align : middle;"><strong class="">${consignListVo.cs_name}</strong></td>
									<td class="price" style="width : 200px; vertical-align : middle;"><strong class="">${consignListVo.cs_date}</strong></td>
									<td class="price" style="width : 200px; vertical-align : middle;">
									<c:if test="${consignListVo.p_name != '낙찰'}">
										<strong class="">${consignListVo.p_name}</strong>
									</c:if>
									<c:if test="${consignListVo.p_name == '낙찰'}">
										<a id="modal-511431" href="#modal-container-511431" role="button" class="btn btnConsign" data-toggle="modal" 
											data-oPrice="<fmt:formatNumber type="currency" value="${consignListVo.b_price}"></fmt:formatNumber>"
											data-price="<fmt:formatNumber type="currency" value="${consignListVo.b_price - (consignListVo.b_price * (consignListVo.g_discount/100))}"/>">낙찰
										</a>
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
	
	<!-- 입금 금액 모달창 -->
		<div class="modal fade" id="modal-container-511431" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="myModalLabel">
							판매 금액 확인
						</h5> 
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						<label for="modal_oPrice" style="width : 30%; float: left; margin-top : 15px;">낙찰 금액</label>
						<input type="text" id="modal_oPrice" class="form-control" style="width : 70%; margin-top : 8px;" readonly/><br/>
						<label for="modal_price" style="width : 30%; float: left; margin-top : 7px;">실 입금액</label>
						<input type="text" id="modal_price" class="form-control" style="width : 70%;" readonly/><br/>
					</div>
					<div class="modal-footer">
						<span class="col-sm-8 text-left" style="color : red;">입금될 금액은 낙찰금액에서<br/>수수료가 제외됩니다.</span>
						<div class="col-sm-4 text-right">
							<button type="button" class="btn btn-secondary btnCancel" data-dismiss="modal">확인</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	<!-- 입금 금액 모달창 -->
	
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>