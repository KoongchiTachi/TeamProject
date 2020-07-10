<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="/resources/css/product.css" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700' rel='stylesheet' type='text/css' />

<%@ include file="/WEB-INF/views/include/header.jsp" %>

<script>
	var yourDateToGo2 = new Date();
	var yD = yourDateToGo2.getDate() + 3;
	console.log(yD);
	yourDateToGo2.setDate(yourDateToGo2.getDate() + 3);
	
	var timing2 = setInterval(
		function() {
			for (var i = 0 ; i <= 7 ; i++) { 
				var currentDate2 = new Date().getTime();
// 				console.log("cD : ", currentDate2);
				var timeLeft2 = yourDateToGo2 - currentDate2;
// 				console.log("tD : ", timeLeft2); 
// 				var days2 = Math.floor(timeLeft2 / (1000 * 60 * 60 * 24));
// 				if (days2 < 10) days2 = "0" + days2;
				
// 				var hours2 = Math.floor((timeLeft2 % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
// 				if (hours2 < 10) hours2 = "0" + hours2;
				
// 				var minutes2 = Math.floor((timeLeft2 % (1000 * 60 * 60)) / (1000 * 60));
// 				if (minutes2 < 10) minutes2 = "0" + minutes2;
				
				var seconds2 = Math.floor((timeLeft2 % (1000 * 60)) / 1000);
				if (seconds2 < 10) seconds2 = "0" + seconds2;
				
				document.getElementById("countdown"+ i +"").innerHTML = "<strong>마감</strong>" /* + days2 + " : " + hours2 + " : " + minutes2 + " : " */ + seconds2; 
 
				if (seconds2 <= 0) {
					clearInterval(timing2);
					document.getElementById("countdown" + i + "").innerHTML = "경매 종료";
			}
		}
	}, 1000);
</script> 
<!------ Include the above in your HEAD tag ---------->

<div class="container-fluid" style="margin-top: 120;">
	<div class="row">
		<div class="col-md-12">
			<div class="jumbotron">
				<h2>
					카테고리 
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