<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/include/header.jsp"%>

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
}
.btnDeleteWish:hover {
	background-color: #f9ad81;
} 
#btnCheckWish {
	
}
#btnCheckWish:hover {
	background-color: #f9ad81;
}
.pagination > li > a
{
    background-color: white;
    color: black;
}
.pagination li.page-item active {
	background-color: #f9ad81;
  	color: white;
}
</style>

<script>
$(function() {
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
	$("#btnDeleteWishlist").click(function() {
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
			$(this).parent().addClass("active").css("background-color", "#f9ad81");
			return;
		}
	});
});
</script>

<form id="frmPage" action="/kjy/member/wishList" method="get">
	<input type="hidden" name="page" value="${wishlistPagingDto.page}"/>
	<input type="hidden" name="perPage" value="${wishlistPagingDto.perPage}"/>
</form>
aa
<div class="wishList" style="margin-bottom : 200px;">
	<div class="titleArea">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<h2>WISH LISTaaa</h2>
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
							<th scope="col" style="width : 200px;">이미지</th>
							<th scope="col" style="width : 500px;">상품정보</th>
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
									<td class="thumb" style="width : 200px; vertical-align: middle;">
										<a href="">
											<img src="/resources/img/bag/${wishlistVo.p_img}" alt="${wishlistVo.p_img}" style="width : 120px; height : 120px;">
										</a>
									</td>
									<td class="left" style="width : 500px; vertical-align : middle;"><a href="">${wishlistVo.p_info}</a></td>
									<td class="price" style="width : 200px; vertical-align : middle;"><strong class="">${wishlistVo.p_price}원</strong><br>
									<td class="button" style="width : 200px; vertical-align : middle;">
										<div> 
											<a href="#none" onclick="NewWishlist.actionOrder('order', 0)" class="btn btn-sm btn-outline-dark btnConsign">응찰하기</a>  
										</div>
										<div>
											<button type="button" class="btn btn-sm btn-outline-dark btnDeleteWish" rel="10474||000B||" id="btnDeleteWishlist" data-wno="${wishlistVo.wno}">&nbsp;X 삭제&nbsp;</button>
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

	</div>
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>