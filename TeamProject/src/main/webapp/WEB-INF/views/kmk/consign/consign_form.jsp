<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">

<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" href="/resources/css/consign/consign.css" type="text/css">

<%@ include file="/WEB-INF/views/include/header.jsp" %>
<style>
/* active 0810 */
.inner-header .main-menu ul li a.active {
	color: #F9AD81;
}
</style>
<script>
// active 0810
$(function() {
	$(".nav3").addClass("active");
});
</script>
<script type="text/javascript"> 
$(function($) {
	function floatLabel(inputType) { 
		$(inputType).each(function() {
			var $this = $(this);
			// on focus add cladd active to label
			$this.focus(function() {
				$this.next().addClass("active");
			});
			//on blur check field and remove class if needed
			$this.blur(function() {
				if ($this.val() === "" || $this.val() === "blank") {
					$this.next().removeClass(); 
				}
			});
		});
	} 
	floatLabel(".floatLabel");
});
</script>

	<form action="" style="margin: 120px;"> 
		<div class="form-group">
			<h2 class="heading">위탁 신청</h2>
			<div class="controls">
				<input type="text" id="name" class="floatLabel" name="name" value="${memberVo.m_name}" readonly>
				<label for="name" class="active">이름</label>
			</div>
			<div class="controls">
				<input type="text" id="email" class="floatLabel" name="email" value="${memberVo.m_email}" readonly>
				<label for="email" class="active">이메일</label>
			</div>
			<div class="controls">
				<input type="tel" id="phone" class="floatLabel" name="phone" value="${memberVo.m_phone}" readonly>
				<label for="phone" class="active">휴대전화</label>
			</div>
			<div class="grid">
				<div class="col-2-3">
					<div class="controls">
						<input type="text" id="street" class="floatLabel" name="street" value="${memberVo.m_address}" readonly>
						<label for="street" class="active">주소</label>
					</div>
				</div>
				<div class="col-1-3">
					<div class="controls"> 
						<input type="text" id="street-number" class="floatLabel" name="street-number" value="${memberVo.m_address2}" readonly>
						<label for="street-number" class="active">나머지</label>
					</div>
				</div>
			</div> 
		</div>
		<!--  Details -->
		<div class="form-group">
			<h2 class="heading">위탁 물품</h2>
			<div class="grid"> 
				<div class="col-1-3 col-1-3-sm">
					<div class="controls">
						<i class="fa fa-sort"></i> <select class="floatLabel">
							<option value="blank"></option> 
							<option value="1001">GUCCI</option>
							<option value="1002">PRADA</option>
							<option value="1003">CHANEL</option>
							<option value="1006">HERMES</option> 
							<option value="1004">BURBERRY</option>
							<option value="1005">LOUIS VUITTON</option>
							<option value="1007">YVES SAINT LAURENT</option>
						</select><label for="brand"><i class="fa fa-shopping-bag"></i>&nbsp;&nbsp;브랜드</label>
					</div>
				</div>
				<div class="col-1-3 col-1-3-sm">
					<div class="controls">
						<input type="text" id="itemName" class="floatLabel" name="itemName">
						<label for="itemName" class="label-date"><i class="fa fa-tag"></i>&nbsp;&nbsp;상품명</label>
					</div>  
				</div>   
				<div class="col-1-3 col-1-3-sm">
					<div class="controls">
						<input type="tel" id="size" class="floatLabel" name="size" value=''>
						<label for="size" class="label-date"><i class="fas fa-ruler"></i>사이즈</label>
					</div>  
				</div>   
			</div>
			<div class="grid">
				<div class="col-1-3 col-1-3-sm"> 
					<div class="controls">
						<i class="fa fa-sort"></i> <select class="floatLabel">
							<option value="blank"></option>
							<option value="3">3일</option>
							<option value="5">5일</option>
							<option value="7">7일</option>
						</select><label for="fewDays"><i class="fa fa-hourglass"></i>&nbsp;&nbsp;경매기간</label>
					</div>
				</div>
				<div class="col-1-3 col-1-3-sm"> 
					<div class="controls">
						<input type="date" id="when_buy" class="floatLabel" name="when_buy" value="<?php echo date('Y-m-d'); ?>"/> 
						<label for="when_buy" class="label-date"><i class="fa fa-calendar"></i>&nbsp;&nbsp;상품 구매일</label>
					</div>
				</div>
				<div class="col-1-3 col-1-3-sm">
					<div class="controls"> 
						<select class="floatLabel">
							<option value="blank"></option>
							<option value="single-bed"></option>
							<option value="double-bed"></option>
						</select>
						<label for="fruit"><i class="fa fa-money"></i>&nbsp;&nbsp;구매가격</label>
					</div>
				</div>
			</div>
			<div class="grid">
				<p class="info-text">사실에 근거하여 기입해 주십시오. 허위 기재시 불이익이 발생할 수 있습니다.</p>
				<br>
				<div class="controls">
					<textarea name="comments" class="floatLabel" id="comments"></textarea>
					<label for="comments">기타 설명</label> 
				</div>
				<button type="submit" value="Submit" class="col-1-4">Submit</button>
			</div>
		</div>
	</form>
 
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
