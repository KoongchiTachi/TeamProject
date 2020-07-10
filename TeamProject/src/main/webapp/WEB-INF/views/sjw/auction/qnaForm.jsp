<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<!-- <head> -->
<!--  <!-- Css Styles --> -->
<!--     <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"> -->
<!--     <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css"> -->
<!--     <link rel="stylesheet" href="css/flaticon.css" type="text/css"> -->
<!--     <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css"> -->
<!--     <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css"> -->
<!--     <link rel="stylesheet" href="css/nice-select.css" type="text/css"> -->
<!--     <link rel="stylesheet" href="css/magnific-popup.css" type="text/css"> -->
<!--     <link rel="stylesheet" href="css/slicknav.min.css" type="text/css"> -->
<!--     <link rel="stylesheet" href="css/style.css" type="text/css"> -->
<!-- </head> -->
<style>
.contact-form #inputFile {
	padding: 25px;
	width: 50%;
	height: 56px;
	border: none;
	font-size: 13px;
	font-weight: 600;
	margin-bottom: 20px;
}

.contact-form span {
	font-size: 14px; 
}

.contact-form #btnCancel {
	background-color : #bfbfbf; 
}

#fileDrop {
	width : 85%;
	height : 100px;
	margin : 20px auto;
	border : 1px dashed gray;
}
.help-block { 
 	font-size : 11px; 
}

#uploadedList > div {
	float : left;
	margin : 20px;
}

#btnDiv {
	clear : both;
}

</style>
    
<body>   
    
    <!-- Contact Section Begin -->
    <section class="contact-section spad">
        <div class="container">
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
                                <input type="text" placeholder="회원아이디 넘어오게" readonly>
                            </div>
                            
                            <div class="col-lg-12">
                            
                                <input type="text" class="subject" placeholder="제목">
                                <textarea placeholder="문의내용"></textarea>
                                
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
								<div id="#btnDiv">
									<button type="submit" class="primary-btn" id="btnSubmit" style="margin: 5px">등록</button>
                               		<a href="/sjw/auction/faq" class="primary-btn" id="btnCancel" style="margin: 5px">취소</a>
                               	</div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
    <!-- Contact Section End -->
    
         <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>
  
    </body>
   


<%@ include file="/WEB-INF/views/include/footer.jsp" %>