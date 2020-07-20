<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<script src="/resources/js/sjw_script.js"></script>

<style>
.contact-form #file_name {
	padding: 25px;
	width: 50%;
	height: 56px;
	border: none;
	font-size: 18px;
	font-weight: 600;
	margin-bottom: 20px;
}
.contact-form span {
	font-size: 18px;
	color: #5E5E5E; 
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
.contact-form textarea {
	color: black;
	resize : vertical;
	font-size: 17px;
	min-height : 80px;
	margin-bottom: 30px;
}
.contact-form textarea::placeholder {
	color: #BDBDBD;
	font-size: 17px;
	font-weight: 600;
	letter-spacing: 0.4px;
}
.contact-form input {
	color: black;
	font-size: 17px;
	margin-bottom: -30px;
}
.contact-form input::placeholder {
	color: #BDBDBD;
	font-size: 17px;
	font-weight: 600;
	letter-spacing: 0.4px;
}
.contact-form button { 
 	font-size: 17px; 
 	letter-spacing: 0.5px; 
 	font-weight: 600; 
 	border: none; 
 	padding: 20px 100px;
 	display: inline-block; 
 	cursor: pointer; 
 }
.contact-form #btnCancel { 
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
.contact-container {
	margin-left : 25%;
}
.check-form {
	padding-left: 28px;
	margin-bottom: 23px;
}
.check-form:after {
	position: absolute;
	left: 0;
	top: 0;
	width: 0%;
	height: 0%;
	background: #000000;
	content: "";
	opacity: 0;
	z-index: 0;
}
.suit-select {
	width : 90%;
	font-size : 17px;
 	position: absolute;
}
.check-form .room-selector .nice-select span {
	font-size: 17px;
/*  	color: black; */
}
.fileName {
	font-size: 10px;
}
contact-form .subject {
	margin-bottom: -100px;
}

</style>

<script>
$(function () {
	
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
	
	$("#btnSubmit").click(function() {
		if($("#q_kind > option:selected").val()==""){
			alert("문의 유형을 선택해 주세요.");
			return false;
		}
	});
	
	$("#contact-form").submit(function() {
		var upDiv = $("#uploadedList > div");
		upDiv.each(function(index) {
			var filename = $(this).attr("data-filename");
			console.log("filename: " + filename);
			var hiddenInput = "<input type='hidden' name='files["+index+"]' value='"+filename+"'/>";
			$("#contact-form").prepend(hiddenInput);
		});
 	});
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
                <div class="col-lg-8">
                    <form action="/sjw/auction/qnaForm" class="contact-form" id="contact-form" method="post">
                        <div class="row">
                            <div class="col-lg-12">
                                <input type="text" name="m_id" placeholder="회원아이디" value="${m_id}" readonly>
                                	<div class="check-form">
										<div class="room-selector">
												<select class="suit-select" name="q_kind" id="q_kind" required>
													<option value="" selected disabled>문의유형을 선택해 주세요.</option>
													<option value="주문">주문</option>
													<option value="배송">배송</option>
									 				<option value="상품">상품</option>
													<option value="경매">경매</option>
													<option value="위탁">위탁</option>
													<option value="낙찰">낙찰</option>
												</select>
											</div>
										</div>
							<input type="text" class="subject" name="q_title" placeholder="제목을 입력해 주세요." required>
                            <textarea placeholder="내용을 입력해 주세요." name="q_content" required style="height: auto;"></textarea>
                            <input type="hidden" name="q_answer" value="x">
							
							<div class="row">
									<div class="col-md-12">
										<div class="row">
										
											<div class="col-md-4" style="padding: 25px">
												<span class="badge badge-default">파일첨부</span>
												<p class="help-block">※ 10MB 미만의 이미지 파일 4개까지<br/> 첨부 가능합니다.</p>
											</div>
											
											<div class="col-md-8">
												<input type="file" class="form-control-file" name="file_name" id="file_name" accept=".jpg, .jpeg, .png, .gif"/>
												<div id="fileDrop">
												<div id="uploadedList"></div>
												</div>
												
											</div>
											
										</div>
									</div>
								</div>
								<div id="btnDiv" style="text-align:center;">
									<button type="submit" class="primary-btn" id="btnSubmit" style="margin: 20px">등록</button>
                               		<a href="/sjw/auction/faqList" class="submit-btn" id="btnCancel" style="margin: 20px">취소</a>
                               	</div>
                            </div>
                        </div>
                    </form>
                </div>
              </div>
             </div>
    </section>
    <!-- Contact Section End -->
   
<%@ include file="/WEB-INF/views/include/footer.jsp" %>