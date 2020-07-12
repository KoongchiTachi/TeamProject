<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<style>
.contact-form #inputFile {
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
}
#fileDrop {
	width : 100%;
	height : 130px;
	margin : 20px auto;
	border : 1px dashed gray;
}
.help-block { 
 	font-size : 16px; 
}
#uploadedList > div {
	float : left;
	margin : 20px;
}
#btnDiv {
	clear : both;
}
.contact-form textarea {
	color: #5E5E5E;
	resize : vertical;
	font-size: 20px;
	margin-bottom: 100px;
}
.contact-form textarea::placeholder {
	color: #BDBDBD;
	font-size: 20px;
	font-weight: 600;
	letter-spacing: 0.4px;
}

.contact-form input {
	color: #5E5E5E;
	font-size: 20px;
	margin-bottom: 50px;
}
.contact-form input::placeholder {
	color: #BDBDBD;
	font-size: 20px;
	font-weight: 600;
	letter-spacing: 0.4px;
}
.contact-form button { 
 	font-size: 18px; 
 	letter-spacing: 0.5px; 
 	font-weight: 600; 
 	border: none; 
 	padding: 20px 100px;
 	display: inline-block; 
 	cursor: pointer; 
 }
.contact-form a { 
 	color: #ffffff; 
 	background: #bfbfbf; 
 	font-size: 18px; 
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

#btnDiv {
	margin-top : 10%;
}
.check-form {
	padding-left: 28px;
	margin-bottom: 90px;
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
	width : 91%;
	font-size : 20px;
 	position: absolute;
}
.check-form .room-selector .nice-select span {
	font-size: 20px;
	color: #717171;
}
</style>

<script>

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
                    <form action="#" class="contact-form">
                        <div class="row">
                            <div class="col-lg-12">
                                <input type="text" placeholder="userId 넘어오게 할 거예요" id="userId" readonly>
                                	<div class="check-form">
										<div class="room-selector">
												<select class="suit-select">
													<option selected disabled>문의유형을 선택해 주세요.</option>
													<option value="">주문/배송</option>
									 				<option value="">상품</option>
													<option value="">경매</option>
													<option value="">낙찰</option>
													<option value="">위탁</option>
												</select>
											</div>
										</div>
							<input type="text" class="subject" placeholder="제목을 입력해 주세요.">
                            <textarea placeholder="내용을 입력해 주세요." style="height: auto;"></textarea>
							
							<div class="row">
									<div class="col-md-12">
										<div class="row">
										
											<div class="col-md-4" style="padding: 25px">
												<span class="badge badge-default">파일첨부</span>
												<p class="help-block">※ 10MB 미만의 파일 4개까지 첨부 가능</p>
											</div>
											
											<div class="col-md-8">
												<input type="file" class="form-control-file" id="inputFile"></input>
												<div id="fileDrop"></div>
												<div id="uploadedList"></div>
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