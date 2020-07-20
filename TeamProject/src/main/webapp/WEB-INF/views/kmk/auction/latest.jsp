<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="/resources/css/product.css" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700' rel='stylesheet' type='text/css' />

<%@ include file="/WEB-INF/views/include/header.jsp" %> 

<div class="container-fluid" style="margin-top: 120;">
	<div class="row">
		<div class="col-md-12">
			<div class="jumbotron">
				<h2>
					최근 등록 상품
				</h2>
			</div>
		</div>
	</div>
</div>
<div class="container-fluid">
	<div class="row">
		<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">   
			<div class="tile">  
				<div class="wrapper">   
					<div class="title">GUCCI</div>
					<div class="banner-img">
						<img src="/resources/img/bag/gucci01.jpg" alt="Image 1"> 
					</div>
					<div class="dates">    
						<div class="start" id="countdown0" style="margin-left: 100px;">  
						</div>
					</div>
					<div class="stats">
						<div>
							<strong>시작가</strong> 10,000,000원
						</div>
					</div>
					<div class="stats">
						<div>
							<strong>최고 입찰가</strong> 15,000,000원
						</div>
					</div>
					<div class="footer">
						<a href="#" class="Cbtn Cbtn-primary">상품보기</a>
						<a href="#" class="Cbtn Cbtn-danger Cbtn-cs">응찰하기</a>
					</div>
				</div>
			</div>
		</div>

		<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
			<div class="tile">
				<div class="wrapper">
					<div class="title">GUCCI</div>
					<div class="banner-img">
						<img src="/resources/img/bag/gucci02.jpg" alt="Image 1">
					</div>
					<div class="dates">   
						<div class="start" id="countdown1" style="margin-left: 100px;">  
						</div>
					</div>
					<div class="stats">
						<div>
							<strong>시작가</strong> 10,000,000원
						</div>
					</div>
					<div class="stats">
						<div>
							<strong>최고 입찰가</strong> 15,000,000원
						</div>
					</div>
					<div class="footer">
						<a href="#" class="Cbtn Cbtn-primary">상품보기</a> <a href="#"
							class="Cbtn Cbtn-danger">응찰하기</a>
					</div>
				</div>
			</div>
		</div>

		<div class="col-lg-3 ">
			<div class="tile">
				<div class="wrapper">
					<div class="title">GUCCI</div>
					<div class="banner-img">
						<img src="/resources/img/bag/gucci03.jpg" alt="Image 1">
					</div>
					<div class="dates">   
						<div class="start" id="countdown2" style="margin-left: 100px;">  
						</div>
					</div>
					<div class="stats">
						<div>
							<strong>시작가</strong> 10,000,000원
						</div>
					</div>
					<div class="stats">
						<div>
							<strong>최고 입찰가</strong> 15,000,000원
						</div>
					</div>
					<div class="footer">
						<a href="#" class="Cbtn Cbtn-primary">상품보기</a> <a href="#"
							class="Cbtn Cbtn-danger">응찰하기</a>
					</div>
				</div>
			</div>
		</div>

		<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
			<div class="tile">
				<div class="wrapper">
					<div class="title">GUCCI</div> 
					<div class="banner-img">
						<img src="/resources/img/bag/gucci04.jpg" alt="Image 1">
					</div> 
					<div class="dates">   
						<div class="start" id="countdown3" style="margin-left: 100px;">  
						</div>
					</div>
					<div class="stats">
						<div>
							<strong>시작가</strong> 10,000,000원
						</div>
					</div>
					<div class="stats">
						<div>
							<strong>최고 입찰가</strong> 15,000,000원
						</div> 
					</div>
					<div class="footer">
						<a href="#" class="Cbtn Cbtn-primary">상품보기</a> <a href="#"
							class="Cbtn Cbtn-danger">응찰하기</a>
					</div>
				</div>
			</div>
		</div>
		
		<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
			<div class="tile">
				<div class="wrapper">
					<div class="title">PRADA</div>
					<div class="banner-img">
						<img src="/resources/img/bag/prada01.jpg" alt="Image 1">
					</div>
					<div class="dates">   
						<div class="start" id="countdown4" style="margin-left: 100px;">  
						</div>
					</div>
					<div class="stats">
						<div>
							<strong>시작가</strong> 10,000,000원
						</div>
					</div>
					<div class="stats">
						<div>
							<strong>최고 입찰가</strong> 15,000,000원
						</div> 
					</div>
					<div class="footer">
						<a href="#" class="Cbtn Cbtn-primary">상품보기</a> <a href="#"
							class="Cbtn Cbtn-danger">응찰하기</a>
					</div>
				</div>
			</div>
		</div>
		
		<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
			<div class="tile">
				<div class="wrapper">
					<div class="title">PRADA</div>
					<div class="banner-img">
						<img src="/resources/img/bag/prada02.jpg" alt="Image 1">
					</div>
					<div class="dates">   
						<div class="start" id="countdown5" style="margin-left: 100px;">  
						</div>
					</div>
					<div class="stats">
						<div>
							<strong>시작가</strong> 10,000,000원
						</div>
					</div>
					<div class="stats">
						<div>
							<strong>최고 입찰가</strong> 15,000,000원
						</div> 
					</div>
					<div class="footer">
						<a href="#" class="Cbtn Cbtn-primary">상품보기</a> <a href="#"
							class="Cbtn Cbtn-danger">응찰하기</a>
					</div>
				</div>
			</div>
		</div>
		
		<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
			<div class="tile">
				<div class="wrapper">
					<div class="title">PRADA</div> 
					<div class="banner-img">
						<img src="/resources/img/bag/prada03.jpg" alt="Image 1">
					</div>
					<div class="dates">   
						<div class="start" id="countdown6" style="margin-left: 100px;">  
						</div>
					</div>
					<div class="stats">
						<div>
							<strong>시작가</strong> 10,000,000원
						</div>
					</div>
					<div class="stats">
						<div>
							<strong>최고 입찰가</strong> 15,000,000원
						</div> 
					</div>
					<div class="footer">
						<a href="#" class="Cbtn Cbtn-primary">상품보기</a> <a href="#"
							class="Cbtn Cbtn-danger">응찰하기</a>
					</div>
				</div>
			</div>
		</div>
		
		<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
			<div class="tile">
				<div class="wrapper">
					<div class="title">PRADA</div>
					<div class="banner-img">
						<img src="/resources/img/bag/prada04.jpg" alt="Image 1">
					</div>
					<div class="dates">   
						<div class="start" id="countdown7" style="margin-left: 100px;">  
						</div>
					</div>
					<div class="stats">
						<div>
							<strong>시작가</strong> 10,000,000원
						</div>
					</div>
					<div class="stats">
						<div> 
							<strong>최고 입찰가</strong> 15,000,000원
						</div> 
					</div>
					<div class="footer">
						<a href="#" class="Cbtn Cbtn-primary">상품보기</a> <a href="#"
							class="Cbtn Cbtn-danger">응찰하기</a>
					</div>
				</div>
			</div>
		</div>
		
		<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
			<div class="tile">
				<div class="wrapper">
					<div class="title">GUCCI</div>
					<div class="banner-img">
						<img src="http://via.placeholder.com/640x360" alt="Image 1">
					</div>
					<div class="dates">   
						<div class="start" id="countdown" style="margin-left: 100px;">  
						</div>
					</div>
					<div class="stats">
						<div>
							<strong>시작가</strong> 10,000,000원
						</div>
					</div>
					<div class="stats">
						<div>
							<strong>최고 입찰가</strong> 15,000,000원
						</div> 
					</div>
					<div class="footer">
						<a href="#" class="Cbtn Cbtn-primary">상품보기</a> <a href="#"
							class="Cbtn Cbtn-danger">응찰하기</a>
					</div>
				</div>
			</div>
		</div>
		
		<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
			<div class="tile">
				<div class="wrapper">
					<div class="title">GUCCI</div>
					<div class="banner-img">
						<img src="http://via.placeholder.com/640x360" alt="Image 1">
					</div>
					<div class="dates">   
						<div class="start" id="countdown" style="margin-left: 100px;">  
						</div>
					</div>
					<div class="stats">
						<div>
							<strong>시작가</strong> 10,000,000원
						</div>
					</div>
					<div class="stats">
						<div>
							<strong>최고 입찰가</strong> 15,000,000원
						</div> 
					</div>
					<div class="footer">
						<a href="#" class="Cbtn Cbtn-primary">상품보기</a> <a href="#"
							class="Cbtn Cbtn-danger">응찰하기</a>
					</div>
				</div>
			</div>
		</div>
		
		<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
			<div class="tile">
				<div class="wrapper">
					<div class="title">GUCCI</div>
					<div class="banner-img">
						<img src="http://via.placeholder.com/640x360" alt="Image 1">
					</div>
					<div class="dates">   
						<div class="start" id="countdown" style="margin-left: 100px;">  
						</div>
					</div>
					<div class="stats">
						<div>
							<strong>시작가</strong> 10,000,000원
						</div>
					</div>
					<div class="stats">
						<div>
							<strong>최고 입찰가</strong> 15,000,000원
						</div> 
					</div>
					<div class="footer">
						<a href="#" class="Cbtn Cbtn-primary">상품보기</a> <a href="#"
							class="Cbtn Cbtn-danger">응찰하기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>