<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/include/header.jsp"%>

<style>
.wishList {
	min-height: 70vh;
}

.titleArea {
	margin-top: 200px;
	margin-bottom: 100px;
}
.btn_consign {
	border : none;
	color : #ffffff;
	background-color: #f9ad81;
}
.btn_consign:hover {
	color : #000000;
	background-color: #ffffff;
}
.btn_wish_del {
	width : 72px;
	height : 29px;
	margin-top : 10px;
	border: 1px solid #55504c;
}
.btn_wish_del:hover {
	background-color: #f9ad81;
} 
</style>

<div class="wishList">
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
				<table class="table">
					<thead>
						<tr>
							<th scope="col"><input type="checkbox"
								onclick="NewWishlist.checkAll(this);"></th>
							<th colspan="3">이미지</th>
							<th colspan="3">상품정보</th>
							<th colspan="1">현재가</th>
							<th colspan="1">선택</th>
						</tr>
					</thead>
					<tbody>
<%-- 					<c:choose> --%>
<%-- 						<c:when test="${wishListVo.pno == 0}"> --%>
<!-- 							<td colspan="5"> -->
<!-- 								<p class="text_font" style="text-align : center;">리스트에 담긴 상품이 없습니다.</p> -->
<!-- 							</td> -->
<%-- 						</c:when> --%>
					<c:forEach items="${list}" var="wishlistVo">
						<tr>
							<td><input name="wish_idx[]" id="wish_idx_0"
								enable-order="1" reserve-order="N" enable-purchase="1" class=""
								is-set-product="F" value="881321" type="checkbox"></td>
							<td class="thumb" colspan="3">
								<a href="">
									<img src="/resources/img/bag/${wishlistVo.p_img}" alt="${wishlistVo.p_img}" style="width : 120px; height : 120px;">
								</a>
							</td>
							<td class="left" colspan="3"><a href="">${wishlistVo.p_info}</a></td>
							<td class="price" colspan="1"><strong class="">${wishlistVo.p_price}</strong><br>
							<td class="button" colspan="1">
								<div> 
								<a href="#none" onclick="NewWishlist.actionOrder('order', 0)" class="btn btn-sm btn-outline-dark btn_consign">응찰하기</a>  
								</div>
								<div>
								<a href="#none" class="btn btn-sm btn-outline-dark btn_wish_del" rel="10474||000B||">&nbsp;X 삭제&nbsp;</a>
								</div>  
							</td>
						</tr>
					</c:forEach>
						
<%-- 					</c:choose> --%>
					</tbody>
				</table>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>