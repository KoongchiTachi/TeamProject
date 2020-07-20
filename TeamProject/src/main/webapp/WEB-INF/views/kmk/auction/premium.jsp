<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style>
    .main {
        background: #ffffff;
        border-bottom: 15px solid #F81D2D;
        border-top: 15px solid #1E1F23;
        margin-top: 30px;
        margin-bottom: 30px;
        padding: 40px 30px !important;
        position: relative;
        box-shadow: 0 1px 21px #808080;
        font-size:10px;
    }

    .thead {  
		background: #1E1F23;
        font-style: #fff;  
		}
		
	#myModal .modal-dialog {
    -webkit-transform: translate(0,-50%);
    -o-transform: translate(0,-50%);  
    transform: translate(0,-50%);    
    top: 50%; 
    margin: 0 auto;
	}	
	
	.tile{
	width: 90%;
	background:#fff; 
	border-radius:10px; 
	box-shadow:3px 5px 6px -1px rgba(151, 171, 187, 0.7);
	float:left; 
  	transform-style: preserve-3d;
  	margin: 10px 5px;
	}
	
	.offset-md-3 {
		margin-left: auto; 
	}
	
	.title {
		text-transform: uppercase;
	}
} 
</style>

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="/resources/css/product.css" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700' rel='stylesheet' type='text/css' />

<%@ include file="/WEB-INF/views/include/header.jsp" %>

<!------ Include the above in your HEAD tag ---------->

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-full" role="document">
        <div class="modal-content col-md-12 offset-md-3 main" style="margin-left: auto;"> 
            <div class="modal-header"> 
                <h5 class="modal-title">상품보기</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="col-md-12"> 
            	<div class="row">
                    <div class="col-md-4">
                        <img class="img-fluid" alt="Invoce Template" src="/resources/img/bag/molemole.jpg" />
                    </div>
                    <div class="col-md-8 text-xs-right"> 
                        <h4 style="color: #F81D2D;"><strong>GUCCI</strong></h4>
                        <p>핸드백</p>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-12 text-xs-center">
                        <h2 style="font-size:24px;">응찰현황</h2> 
                    </div>
                </div>
                <br />
                <div>
                    <table class="table">
                        <thead class="text-center">
                            <tr>
                                <th><h5>ID</h5></th>
                                <th colspan="2"><h5>DATE</h5></th>
                                <th><h5>Price</h5></th> 
                            </tr> 
                        </thead>
                        <tbody>
                            <tr>
                                <td class="col-md-3">KJY</td>
                                <td colspan="2" class="col-md-3"><i class="fa fa-usd" aria-hidden="true"></i> 1일 </td>
                                <td class="col-md-3"><i class="fa fa-usd" aria-hidden="true"></i> 12,000,000 </td>
                            </tr>
                            <tr>
                                <td class="col-md-3">KMK</td>
                                <td colspan="2" class="col-md-3"><i class="fa fa-usd" aria-hidden="true"></i> 1일 </td>
                                <td class="col-md-3"><i class="fa fa-usd" aria-hidden="true"></i> 11,000,000 </td>
                            </tr>
                            <tr>
                                <td class="col-md-3">SJW</td>
                                <td colspan="2" class="col-md-3"><i class="fa fa-usd" aria-hidden="true"></i> 1일 </td>
                                <td class="col-md-3"><i class="fa fa-usd" aria-hidden="true"></i> 10,000,000 </td>
                            </tr>
                            <tr style="color: #F81D2D;">
                                <td class="text-xs-right"><h4><strong>Total: </strong></h4></td>
                                <td class="text-xs-left"><h4><strong><i class="fa fa-usd" aria-hidden="true"> 2365,00</i></strong></h4></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div> 
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">OK</button>
            </div>
        </div>
    </div>
</div>
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

<div class="container mt-5" style="max-width: 1440px;">  

  
	<!--Section: Content-->
	<section class="dark-grey-text text-xs-center">

		<!-- Section heading -->
		<h3 class="font-weight-bold mb-4 pb-2">Our bestsellers</h3>
		<!-- Section description -->
		<p class="grey-text w-responsive mx-auto mb-5">Lorem ipsum dolor
			sit amet, consectetur adipisicing elit fugit, error amet numquam iure
			provident voluptate esse quasi nostrum quisquam eum porro a pariatur
			veniam.</p>

		<!-- Grid row --> 
		<div class="row">

			<!-- Grid column -->
			<c:forEach items="${list}" var="premium"> 
			<div class="col-lg-3 col-md-6 mb-4 d-flex align-items-stretch">
				<!-- Card -->
				<div class="tile align-items-center">
					<!-- Card image -->
					<div class="wrapper">
					<div class="title">${premium.b_name}</div> 
					<div class="banner-img"> 
						<img src="/resources/img/bag/${premium.p_img}" alt="Image 1"> 
					</div>
					
					<div class="dates">
						<div class="start" id="countdown">${premium.p_until}</div>
					</div>
					<div class="stats s_price">
						<div>
							<strong>시작가</strong>
							<fmt:setLocale value="ko_KR" />
							<fmt:formatNumber type="currency" value="${premium.s_price}" />
						</div> 
					</div> 
					<div class="stats h_price">
						<div>
							<strong>현재 입찰가</strong> 
							<fmt:setLocale value="ko_KR" /> 
							<fmt:formatNumber type="currency" value="${premium.p_price}" />
						</div>
					</div>
					<div class="footer">
						<a href="#myModal" role="button" class="Cbtn Cbtn-danger Cbtn-cs" data-toggle="modal">상품보기</a>
						<a href="/kmk/auction/bids" class="Cbtn Cbtn-primary">응찰하기</a>
					</div>
				</div>
					<!-- Card content -->
				</div>
				<!-- Card -->
			</div>
			</c:forEach>
			<!-- Grid column --> 
		</div>
		<!-- Grid row -->

	</section>
	<!--Section: Content-->

</div>

<script>
	// 타이머
	var p_until = $("#countdown").text; 
	console.log(p_until);
	var yourDateToGo2 = new Date();
	var yD = yourDateToGo2.getDate() + 3;
// 	console.log(yD);
	yourDateToGo2.setDate(yourDateToGo2.getDate() + 3);
	
	var timing2 = setInterval(
		function() {
				var currentDate2 = new Date().getTime();
// 				console.log("cD : ", currentDate2);
				var timeLeft2 = yourDateToGo2 - currentDate2;
// 				console.log("tD : ", timeLeft2); 
				var days2 = Math.floor(timeLeft2 / (1000 * 60 * 60 * 24));
				if (days2 < 10) days2 = "0" + days2;
				
				var hours2 = Math.floor((timeLeft2 % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
				if (hours2 < 10) hours2 = "0" + hours2;
				
				var minutes2 = Math.floor((timeLeft2 % (1000 * 60 * 60)) / (1000 * 60));
				if (minutes2 < 10) minutes2 = "0" + minutes2;
				
				var seconds2 = Math.floor((timeLeft2 % (1000 * 60)) / 1000);
				if (seconds2 < 10) seconds2 = "0" + seconds2; 
				 
// 				document.getElementById("countdown"+ i +"").innerHTML = days2 + "일 " + hours2 + "시 " + minutes2 + "분 "  + seconds2;
 
				if (seconds2 <= 0) { 
					clearInterval(timing2); 	
// 					 document.getElementById("countdown" + i + "").innerHTML = "경매 종료";
			}
	}, 1000);
	
</script> 

<%@ include file="/WEB-INF/views/include/footer.jsp" %>