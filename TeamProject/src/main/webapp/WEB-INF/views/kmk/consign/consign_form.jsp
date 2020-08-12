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

/* File Upload 0812 */
.contact-form #file_name {
	padding: 25px;
	width: 50%;
	height: 56px;
	border: none;
	font-size: 16px;
	font-weight: 600;
	margin-bottom: 20px;
}
.contact-form span {
	font-size: 18px;
}
#fileDrop { 
 	width : 95%;
 	height : 130px; 
 	margin : 20px auto; 
 	border : 1px dashed gray; 
 } 
#uploadedList > span {
	/* float : left; */
	margin : 20px;
}
.help-block { 
 	font-size : 15px; 
}
#btnDiv {
	clear : both;
	margin-top : 0;
}
#btnCancel { 
 	color: #ffffff; 
 	background: #bfbfbf; 
 	font-size: 17px; 
 	letter-spacing: 0.5px; 
 	font-weight: 600; 
 	border: none; 
 	padding: 20px 100px; 
 	display: inline-block; 
 	cursor: pointer; 
 }
 #btnSubmit {
  	color: #ffffff; 
 	background: #F9AD81; 
 	font-size: 17px; 
 	letter-spacing: 0.5px; 
 	font-weight: 600; 
 	border: none; 
 	padding: 20px 100px; 
 	display: inline-block; 
 	cursor: pointer; 
 }
.contact-container {
	margin-left : 25%;
}
.fileName {
	font-size: 10px;
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
					<input type="tel" id="size" class="floatLabel" name="size" value=''>
					<label for="size" class="label-date"><i class="fa fa-money"></i>&nbsp;&nbsp;희망 거래가격</label>
				</div>  
			</div>   
		</div>
		<div class="grid"> 
			<div class="col-1-3 col-1-3-sm">
				<div class="controls">
					<input type="text" id="itemName" class="floatLabel" name="itemName">
					<label for="itemName" class="label-date"><i class="fa fa-tag"></i>&nbsp;&nbsp;상품명</label>
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
					<input type="text" id="buy_price" class="floatLabel" name="buy_price">
					<label for="buy_price"><i class="fa fa-money"></i>&nbsp;&nbsp;구매가격</label>
				</div>
			</div>
		</div>
		<div class="grid">
			<div class="col-1-2 col-1-2-sm">
				<p class="info-text">· 사실에 근거하여 기입해 주십시오. 허위 기재시 불이익이 발생할 수 있습니다.</p>
				<p class="info-text">· 개인정보 수정은 마이페이지에서 가능합니다.</p>
				<br> 
			</div>
			<div class="col-1-2 col-1-2-sm">
				<input type="file" class="form-control-file" name="file_name"
					id="file_name" accept=".jpg, .jpeg, .png, .gif" />
				<div id="fileDrop">
					<span id="uploadedList"></span>
				</div>
			</div>
		</div>
		</div>
		<div class="grid">
			<div class="controls">
				<textarea name="comments" class="floatLabel" id="comments"></textarea>
				<label for="comments">기타 (사이즈 및 상품 상태 설명)</label> 
			</div>
			<button type="submit" value="Submit" class="col-1-4">Submit</button>
		</div>
	</div>
</form>

<script>
$("#file_name").on("change", function(e) {
	var maxSize = 10485760;
	var maxFile = 4;
	
		var file = e.target.files[0];
		//console.log(file);
		var fileSize = file.size;
	var fileCount = $("#uploadedList > div").length;
		//console.log(fileCount);
		
		if (fileSize > maxSize) {
			alert("10MB 미만의 이미지 파일만 등록 가능합니다.");
			$("#file_name").val("");
			return false;
		}
		
		if (fileCount >= maxFile) {
			alert("이미지 파일 첨부는 4개까지 등록 가능합니다.");
			$("#file_name").val("");
			return false; 
		}
		
		var formData = new FormData();
			formData.append("file", file);
		//console.log("formData", formData);
	var url = "/c_upload/uploadAjax";
	$.ajax({
		"processData" : false,
		"contentType" : false,
		"type" : "post",
		"url" : url,
		"data" : formData,
		"success" : function(rData) {
			console.log(rData);
			var slashIndex = rData.lastIndexOf("/");
			var front = rData.substring(0, slashIndex + 1);
			var rear = rData.substring(slashIndex + 1);
			var thumbnailName = front + "sm_" + rear;
			
			var originalFilename = rData.substring(rData.indexOf("_") + 1);
			
			var html = "<div data-filename='"+ rData + "'>";
			var result = isImage(originalFilename);
			if (result == true) {
				html += "<img class='img-rounded' src='/c_upload/displayFile?fileName=" + thumbnailName + "'/><br/>";
			} else {
				html += "<img class='img-rounded' src='/resources/img/image.png'/><br/>";
			}
			html += "<span style='font-size: 10px;'>"+ originalFilename +"</span>";
			html += "<a href='"+ rData +"' class='file-del'><span class='pull-right'>×</span></a>";
			html += "</div>";
			$("#uploadedList").append(html);
		}
	});
	});

$("#uploadedList").on("click", ".file-del", function(e) {
	e.preventDefault();
	var that = $(this);
	var filename = $(this).attr("href");
	var url = "/c_upload/deleteFile";
	var sendData = {
		"filename" : filename	
	};
	$.get(url, sendData, function(rData) {
		console.log(rData)
		that.parent().remove();
	});
});

$("#contact-form").submit(function() {
	var upDiv = $("#uploadedList > div"); 
	upDiv.each(function(index) {
		var filename = $(this).attr("data-filename");
		var hiddenInput = "<input type='hidden' name='files["+index+"]' value='"+filename+"'/>";
		$("#contact-form").prepend(hiddenInput);
	});
	//return false;
	});
</script>
 
<%@ include file="/WEB-INF/views/include/footer.jsp" %>