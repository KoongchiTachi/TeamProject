<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="/WEB-INF/views/include/header.jsp"%>

<%@ include file="/WEB-INF/views/include/kmk/hideForm.jsp" %>

<style>
.wishList {
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
.btnDeleteWish {
	width : 72px;
	height : 29px;
	margin-top : 10px;
	border: 1px solid #55504c;
	cursor : pointer;
}
.btnDeleteWish:hover {
	background-color: #f9ad81;
} 
#btnCheckWish:hover {
	background-color: #f9ad81;
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
	
	// chkAll
	$("#chkAll").click(function() {
		var chk = $(this).prop("checked");
		if (chk) {
			$(".chkWish").prop("checked", true);
		} else {
			$(".chkWish").prop("checked", false);
		}
	});
	$(".chkWish").click(function() {
		$("#chkAll").prop("checked", false);
	});
	
	// 체크된 상품 삭제
	$("#btnCheckWish").click(function() {
		var checkArr = new Array();
		$(".chkWish:checked").each(function() {			
			checkArr.push($(this).attr("data-wno"));
		});
		if (checkArr == null || checkArr == "") {
			alert("상품을 선택해주십시오.");
			return;
		}
		
		var url = "/kjy/member/deleteWishMulti";
		$.ajax({
			"type" : "post",
			"url" : url,
			"data" : { chbox : checkArr },
			"success" : function(result) {
				alert("선택하신 상품을 삭제하였습니다.");
				$(".chkWish:checked").parent().parent().hide();
			},
			"error" : function(data) {
				alert("에러가 발생했습니다.");
				return false;
			}
		});
	});
	
	// 상품 삭제
	$(".btnDeleteWish").click(function() {
		var that = $(this);
		var wno = that.attr("data-wno");
		var sendData = {
			"wno" : wno
		};
		var url = "/kjy/member/deleteWishlist";
		$.ajax({
			"type" : "post",
			"url" : url,
			"data" : sendData,
			"success" : function(result) {
				alert("선택하신 상품을 삭제하였습니다.");
				that.parent().parent().parent().hide();
			},
			"error" : function(data) {
				alert("에러가 발생했습니다.");
				return false;
			}
		});
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
		if (page == "${wishlistPagingDto.page}") {
			$(this).parent().addClass("active");
			return;
		}
	});
});
</script>

<form id="frmPage" action="/kjy/member/wishList" method="get">
	<input type="hidden" name="page" value="${wishlistPagingDto.page}"/>
	<input type="hidden" name="perPage" value="${wishlistPagingDto.perPage}"/>
</form>

<div class="wishList" style="margin-bottom : 200px;">
	<div class="titleArea">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<h2>WISH LIST</h2>
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
							<th scope="col"><input type="checkbox" id="chkAll"></th>
							<th scope="col" style="width : 300px;">이미지</th>
							<th scope="col" style="width : 300px;">브랜드</th>
							<th scope="col" style="width : 300px;">상품명</th>
							<th scope="col" style="width : 200px;">현재가</th>
							<th scope="col" style="width : 200px;">선택</th>
						</tr>
					</thead>
					<tbody>
					<c:choose>
						<c:when test="${listSize == 0}">
							<td colspan="5">
								<p class="text_font" style="text-align : center;">리스트에 담긴 상품이 없습니다.</p>
							</td>
						</c:when>
						<c:when test="${listSize != 0}">
							<c:forEach items="${list}" var="wishlistVo">
								<tr>
									<td><input type="checkbox" class="chkWish" data-wno="${wishlistVo.wno}"></td>
									<td class="thumb" style="width : 300px; vertical-align: middle;">
										<a>
											<img src="/resources/img/bag/${wishlistVo.p_img1}" alt="${wishlistVo.p_img1}" style="width : 120px; height : 120px;">
										</a>
									</td>
									<td class="price" style="width : 300px; vertical-align : middle;"><strong class="">${wishlistVo.b_name}</strong><br>
									<td class="left" style="width : 300px; vertical-align : middle;"><strong class="">${wishlistVo.p_name}</strong></td>
									<td class="price" style="width : 200px; vertical-align : middle;"><strong class="">
									<c:choose>
										<c:when test="${wishlistVo.p_price == 0 }">
											<fmt:formatNumber type="currency" value="${wishlistVo.s_price}" />
										</c:when>
										<c:otherwise>
											<fmt:formatNumber type="currency" value="${wishlistVo.p_price}" />
										</c:otherwise>
									</c:choose>
									</strong><br>
									<td class="button" style="width : 200px; vertical-align : middle;">
										<c:if test="${wishlistVo.p_state == 's01'}">
											<div> 
												<a href="/kmk/auction/product" onclick="NewWishlist.actionOrder('order', 0)" class="btn btn-sm btn-outline-dark btnConsign" data-pno="${wishlistVo.pno}">응찰하기</a>  
											</div>
										</c:if>
										<c:if test="${wishlistVo.p_state == 's02'}">
											<div>경매 종료</div>
										</c:if>
										<div>
											<button type="button" class="btn btn-sm btn-outline-dark btnDeleteWish" rel="10474||000B||" data-wno="${wishlistVo.wno}">&nbsp;X 삭제&nbsp;</button>
										</div>  
									</td>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>
					</tbody>
				</table>
				<button type="button" class="btn btn-sm btn-outline-dark" id="btnCheckWish">선택한 상품 삭제</button>
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
							<c:if test="${wishlistPagingDto.startPage != 1}">
							<li class="page-item">
								<a class="page-link" href="${wishlistPagingDto.startPage - 1}">&laquo;</a>
							</li>
							</c:if>
							<!-- 페이지 넘버링 -->
							<c:forEach begin="${wishlistPagingDto.startPage}" end="${wishlistPagingDto.endPage}" var="v">
							<li class="page-item">
								<a class="page-link" href="${v}">${v}</a>
							</li>
							</c:forEach>
							<!-- 다음 -->
							<c:if test="${wishlistPagingDto.endPage < wishlistPagingDto.totalPage}">
							<li class="page-item">
								<a class="page-link" href="${wishlistPagingDto.endPage + 1}">&raquo;</a>
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