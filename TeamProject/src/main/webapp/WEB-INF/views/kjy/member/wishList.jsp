<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<style>
.wishList {
	min-height: 70vh;
}

.titleArea {
	margin-top: 200px;
	margin-bottom: 100px;
}
.button {

}
.btn_consign {
	margin : 5px; 
	color : #ffffff;
	background-color: #f9ad81;
}
.btn_consign:hover {
	color : #000000;
	background-color: #ffffff;
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
							<th scope="col">이미지</th>
							<th scope="col">상품정보</th>
							<th scope="col">현재가</th>
							<th scope="col">선택</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input name="wish_idx[]" id="wish_idx_0"
								enable-order="1" reserve-order="N" enable-purchase="1" class=""
								is-set-product="F" value="881321" type="checkbox"></td>
							<td class="thumb"><a href="" alt=""></a></td>
							<td class="left"><a href=""></a></td>
							<td class="price"><strong class="">14,000 won</strong><br>
							<td class="button">
								<div> 
								<a href="#none" onclick="NewWishlist.actionOrder('order', 0)" class="btn btn-sm btn-outline-dark btn_consign">응찰하기</a>  
								</div>
								<div>
								<a href="#none" class="btn btn-sm btn-outline-dark btn_wish_del" rel="10474||000B||" style="margin : 10px;">&nbsp;X 삭제&nbsp;</a>
								</div>  
							</td>
						</tr>
						<tr>
							<td><input name="wish_idx[]" id="wish_idx_0"
								enable-order="1" reserve-order="N" enable-purchase="1" class=""
								is-set-product="F" value="881321" type="checkbox"></td>
							<td class="thumb"><a href="" alt=""></a></td>
							<td class="left"><a href=""></a></td>
							<td class="price"><strong class="">20,000 won</strong><br> 
							<td class="button">
								<div> 
								<a href="#none" onclick="NewWishlist.actionOrder('order', 0)" class="btn btn-sm btn-outline-dark btn_consign">응찰하기</a> 
								</div>
								<div>
								<a href="#none" class="btn btn-sm btn-outline-dark btn_wish_del" rel="10474||000B||" style="margin : 10px;">&nbsp;X 삭제&nbsp;</a>
								</div>  
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>