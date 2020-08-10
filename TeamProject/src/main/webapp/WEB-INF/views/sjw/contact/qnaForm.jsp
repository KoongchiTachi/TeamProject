<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<script src="/resources/js/sjw_script.js"></script>
<link rel="stylesheet" href="/resources/css/consign/consign.css" type="text/css">
<style>
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
#uploadedList > div {
	float : left;
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
form {
/*   	margin-left: 10px; */
 	max-width : 80%; 
 	padding-left: 80px;
}
button { 
	float: none;
} 
a {
	text-align: left;
}
html, body {
    height: 100%;
    font-family: "Montserrat Alternates", sans-serif;
    -webkit-font-smoothing: antialiased;
    font-smoothing: antialiased;
    background: none;
}
.inner-header .main-menu ul li a.active {
	color: #F9AD81;
}
</style>
<script type="text/javascript"> 
$(function($) {
	function floatLabel(inputType) { 
		$(inputType).each(function() {
			var $this = $(this);
			// on focus add cladd active to label
			$this.focus(function() {
				$this.next().addClass("active");
			});
		});
	} 
	floatLabel(".floatLabel");
});
</script>
<script>
$(function() {
	
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
		var url = "/upload/uploadAjax";
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
					html += "<img class='img-rounded' src='/upload/displayFile?fileName=" + thumbnailName + "'/><br/>";
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
		var url = "/upload/deleteFile";
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
	
	$(".nav5").addClass("active");
	
 });

</script>
    <!-- Contact Section Begin -->
<section class="contact-section spad">
	<div class="contact-container">
		<div class="row">
			<div class="col-lg-12">
				<div class="contact-title">
					<div class="section-title">
						<h2>1:1 문의</h2>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<form action="/sjw/contact/qnaForm" role="form" class="contact-form" id="contact-form" method="post" style="margin: -70px;">
					<div class="form-group">
						<div class="row" align="left">
							<input type="text" name="m_id" value="${m_id}"
								style="color: #424242; width: auto; text-align: center; font-size: 18px; margin-left: 18px; margin-bottom: 40px;" readonly>
						</div>
						<div class="grid">
							<div class="col-1-3 col-1-3-sm">
								<div class="controls">
									<i class="fa fa-sort"></i> <select class="floatLabel"
										style="width: 320px;" name="q_kind" id="q_kind"
										required="required">
<!-- 										<option value="blank" disabled></option> -->
										<option value="" disabled selected></option>
										<option value="주문">주문</option>
										<option value="배송">배송</option>
										<option value="상품">상품</option>
										<option value="경매">경매</option>
										<option value="위탁">위탁</option>
										<option value="낙찰">낙찰</option>
									</select> <label for="q_kind" style="width: 220px;">문의유형을 선택해
										주세요.</label>
								</div>
							</div>
						</div>
						<div class="grid">
							<div class="form-group">
								<div class="controls">
									<input type="text" id="q_title" class="floatLabel"
										name="q_title" style="font-size: 18px;" required> <label for="q_title">제목</label>
								</div>
							</div>
							<div class="controls">
								<textarea name="q_content" class="floatLabel" id="q_content" cols="40" wrap="hard" style="font-size: 18px;" 
									required></textarea>
								<label for="q_content">문의 내용</label>
							</div>
							<input type="hidden" name="q_answer" value="N">
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="row">
									<div class="col-md-4" style="padding: 25px">
										<br/><br/><br/><br/>
										<span class="badge badge-default">파일첨부</span>
										<p class="help-block">
											<br/>※ 10MB 미만의 이미지 파일<br /> 4개까지 첨부 가능합니다.
										</p>
									</div>
									<div class="col-md-8">
										<input type="file" class="form-control-file" name="file_name"
											id="file_name" accept=".jpg, .jpeg, .png, .gif" />
										<div id="fileDrop">
											<div id="uploadedList"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div id="btnDiv" align="right" style="text-align: center; margin-top: 70px;">
							<button type="submit" id="btnSubmit">등록</button>
							<a href="/sjw/contact/faqList" class="submit-btn" id="btnCancel"
								style="margin: 20px">취소</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>
   
<%@ include file="/WEB-INF/views/include/footer.jsp" %>