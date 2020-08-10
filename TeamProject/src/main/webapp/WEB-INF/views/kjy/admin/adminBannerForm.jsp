<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/sidebarHeader.jsp" %>
<script src="http://code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>
<script src="/resources/js/banner_script.js"></script>

<style>
.form-group {
	margin : 50px;
}
#fileImg { 
	float : left;
 	width : 70%;
 	height : 330px; 
 	margin : 20px auto; 
 	border : 1px dotted gray; 
} 
#uploadedImg > div {
	margin : 20px;
	margin-left : 20px;
	width : 85%;
	height : 190px;
} 
#btnBanner {
	position: relative;
	top : 230px;
	right: 20px;
}
</style>

<script>
$(function() {
	var msg = "${msg}";
	if (msg == "failure") {
		alert("업로드한 배너 이미지의 이름과 같은 이미지가 존재합니다.\n업로드할 배너 이미지의 이름을 바꾸고 등록해주세요.");
	}
	
	if (msg == "fail") {
		alert("배너는 3개까지 등록 가능합니다.\n기존 배너를 삭제하고 등록해주세요.");
	}
	
	// 사진 썸네일
	$("#bn_img").on("change", function(e) {
		var file = e.target.files[0];
		var formData = new FormData();
		formData.append("file", file);
		var url = "/uploadBanner/uploadAjax";
		$.ajax({
			"processData" : false,
			"contentType" : false,
			"type" : "post",
			"url" : url,
			"data" : formData,
			"success" : function(rData) {
				var slashIndex = rData.lastIndexOf("/");
				var front = rData.substring(0, slashIndex + 1);
				var rear = rData.substring(slashIndex + 1);
				var thumbnailName = front + "sm_" + rear;
				
				var originalFilename = rData.substring(rData.indexOf("_") + 1);
				
				var html = "<div data-filename='"+ rData + "'>";
				
				var result = isImage(originalFilename);
				if (result == true) {
					html += "<img class='img-rounded' src='/uploadBanner/displayFile?bn_img=" + thumbnailName + "'/><br/>";
				} else {
					html += "<img class='img-rounded' src='/resources/img/image.png'/><br/>";
				}
				html += "<span style='font-size: 20px;'>"+ originalFilename +"</span>";
				html += "<a href='"+ rData +"' class='file-del'><span class='pull-right' style='font-size: 20px;'> ×</span></a>";
				html += "</div>";
				$("#uploadedImg").append(html);
				var index = originalFilename.lastIndexOf(".");
				var name = originalFilename.substring(0, index);
				$("#b_name").val(name);
			}
		});
	});
	
	// 썸네일 이미지 삭제
	$("#uploadedImg").on("click", ".file-del", function(e) {
		e.preventDefault();
		var that = $(this);
		var filename = $(this).attr("href");
		var url = "/upload/deleteFile";
		var sendData = {
			"filename" : filename	
		};
		$.get(url, sendData, function(rData) {
			that.parent().remove();
		});
	});
	
	// 배너 등록
	$("#frmBanner").submit(function() {
		if ($("#b_name").val() == "") {
			alert("배너명을 입력해주세요.");
			return false;
		}
		if ($("#uploadedImg").text() == "") {
			alert("배너 이미지를 등록해주세요.");
			return false;
		}
		
		var upDiv = $("#uploadedImg > div");
		upDiv.each(function(index) {
			var filename = $(this).attr("data-filename");
			var hiddenInput = "<input type='hidden' name='files["+index+"]' value='"+filename+"'/>";
			$("#frmBanner").prepend(hiddenInput);
		});
 	});
});
</script>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-3">
				</div>
				<div class="col-md-6">
				<h2 style="margin-bottom : 50px; font-weight: bold; font-size: 50px;">배너 등록</h2> 
					<form id="frmBanner" role="form" action="/kjy/admin/insertBanner" method="get">
						<div class="form-group">
							<label for="b_name">배너명</label>
							<input type="text" class="form-control" id="b_name" name="b_name" placeholder="배너명은 이미지를 업로드하면 자동으로 등록됩니다." readonly/>
						</div>
						<div class="form-group">
							<label for="bn_img">배너 이미지</label>
							<input type="file" class="form-control-file" id="bn_img" name="bn_img" accept=".jpg, .jpeg, .png, .gif"/>
							<div id="fileImg">
								<div id="uploadedImg"></div>
							</div>
						</div>
						<button type="submit" class="btn btn-secondary" style="margin : 20px; margin-left : 50px;" id="btnBanner">저장</button>
					</form>
				</div>
				<div class="col-md-3">
				</div>
			</div>
		</div>
	</div>
</div>
   
<%@ include file="/WEB-INF/views/include/sidebarFooter.jsp" %>