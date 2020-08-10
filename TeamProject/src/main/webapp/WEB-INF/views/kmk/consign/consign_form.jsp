<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">

<link rel="stylesheet" href="/resources/css/consign/consign.css" type="text/css">

<%@ include file="/WEB-INF/views/include/header.jsp" %>

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
				<input type="text" id="name" class="floatLabel" name="name" value="">
				<label for="name">이름</label>
			</div>
			<div class="controls">
				<input type="text" id="email" class="floatLabel" name="email">
				<label for="email">이메일</label>
			</div>
			<div class="controls">
				<input type="tel" id="phone" class="floatLabel" name="phone">
				<label for="phone">휴대전화</label>
			</div>
			<div class="grid">
				<div class="col-2-3">
					<div class="controls">
						<input type="text" id="street" class="floatLabel" name="street">
						<label for="street">주소</label>
					</div>
				</div>
				<div class="col-1-3">
					<div class="controls">
						<input type="number" id="street-number" class="floatLabel" name="street-number">
						<label for="street-number">나머지</label>
					</div>
				</div>
			</div> 
		</div>
		<!--  Details -->
		<div class="form-group">
			<h2 class="heading">위탁 물품</h2>
			<div class="grid"> 
				<div class="col-1-4 col-1-4-sm"> 
					<div class="controls">
						<input type="date" id="size" class="floatLabel" name="size" value="<?php echo date('m-m-m'); ?>">
						<label for="size" class="label-date"><i class="fa"></i>&nbsp;&nbsp;사이즈</label>
					</div>  
				</div>
				<div class="col-1-4 col-1-4-sm">
					<div class="controls">
						<input type="date" id="when_buy" class="floatLabel" name="when_buy" value="<?php echo date('Y-m-d'); ?>"/> 
						<label for="when_buy" class="label-date"><i class="fa"></i>&nbsp;&nbsp;구매일</label>
					</div>
				</div> 
			</div>
			<div class="grid">
				<div class="col-1-3 col-1-3-sm">
					<div class="controls">
						<i class="fa fa-sort"></i> <select class="floatLabel">
							<option value="blank"></option>
							<option value="1">GUCCI</option>
							<option value="2">PRADA</option>
chanel
burberry
louis vuitton
hermes
Yves Saint Laurent</option>
							<option value="3">3</option>
						</select><label for="fruit"><i class="fa fa-shopping-bag"></i>&nbsp;&nbsp;브랜드</label>
					</div>
				</div>
				<div class="col-1-3 col-1-3-sm">
					<div class="controls">
						<i class="fa fa-sort"></i> <select class="floatLabel">
							<option value="blank"></option>
							<option value="deluxe" selected>With Bathroom</option>
							<option value="Zuri-zimmer">Without Bathroom</option>
						</select> <label for="fruit">Room</label>
					</div>
				</div>
				<div class="col-1-3 col-1-3-sm">
					<div class="controls">
						<i class="fa fa-sort"></i> <select class="floatLabel">
							<option value="blank"></option>
							<option value="single-bed">Zweibett</option>
							<option value="double-bed" selected>Doppelbett</option>
						</select> <label for="fruit">Bedding</label>
					</div>
				</div>
			</div>
			<div class="grid">
				<p class="info-text">Please describe your needs e.g. Extra beds,
					children's cots</p>
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