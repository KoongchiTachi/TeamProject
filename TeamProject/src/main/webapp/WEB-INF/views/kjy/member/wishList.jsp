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
});
</script>

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
	</div>
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>