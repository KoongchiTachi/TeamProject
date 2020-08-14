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
	
	.p_logo {
		padding: 10px;
		position: relative;
		z-index: 2;
	}
	
	.banner-img {
		position: relative;
		z-index: 1;
		text-align: center;
	}
	
	.table td, .table th {
		vertical-align: middle; 
	}
	
	#modal_table {
		overflow-y:auto; 
		overflow-x:hidden; 
	}

	/*only for centering on the page*/
	.btn {
	  margin: 0 auto;
	  display: block;
	}
	/*removes ugly bootstrap border button*/
	*.btn:active,
	.btn:focus,
	.btn:active:focus,
	.btn:focus {
	  outline: none !important;
	}
	
	button > span {
	  color: red;
	  font-size:20px;
	}
	
	.btn:active {
	  box-shadow: none;
	}
	
	.btn:active, .btn:hover, .btn:focus {
	  background-color:white;
	}
/* 0810 active */
.inner-header .main-menu ul li a.active {
	color: #F9AD81;
} 
</style>

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="/resources/css/product/product_list.css" type="text/css">
<link rel="stylesheet" href="/resources/css/product/like_heart.css" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700' rel='stylesheet' type='text/css' />

<script> 
</script>

<%@ include file="/WEB-INF/views/include/header.jsp" %>
<%@ include file="/WEB-INF/views/include/kmk/hideForm.jsp" %>
 
<!------ Include the above in your HEAD tag ---------->

<div class="container mt-5" style="max-width: 1440px; margin-top: 400;">  
  
	<!--Section: Content-->
	<section class="dark-grey-text text-xs-center">

		<!-- Section heading -->
		<h3 class="font-weight-bold mb-4 pb-2"><!-- Our bestsellers --></h3>
		<!-- Section description --> 
		<p class="grey-text w-responsive mx-auto mb-5"><br/><!-- GUCCI PRADA CHANEL LOUISVUITTON HERMES CARTIER --></p>

		<!-- Grid row --> 
		<div class="row">
			<!-- Grid column --> 
			<c:forEach items="${list}" var="premium">
			<div class="col-lg-3 col-md-6 mb-4 d-flex align-items-stretch">
				<!-- Card -->
				<div class="tile align-items-center" data-pno="${premium.pno}" id="tile">
					<!-- Card image --> 
					<div class="wrapper">
					<div class="title" >${premium.b_name}</div>
					<div class="p_logo">
						<img alt="premium" src="/resources/img/logo/premium_icon.png">
						<button class="like-button
						<c:forEach items="${wish}" var="wishVo">
							<c:if test="${wishVo.pno == premium.pno}">
								liked 
							</c:if>
						</c:forEach>
						" style="border: 0px;" data-pno="${premium.pno}"></button>
					</div>  
					<div class="banner-img"> 
						<img style="width: 85%;" src="/resources/img/bag/${premium.p_img1}" alt="Image 1"> 
					</div>  
					<div class="dates">    
						<div class="start" id="countdown" data-until="${premium.p_until}"></div> 
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
							<strong>현재가</strong> 
							<fmt:setLocale value="ko_KR"/> 
							<c:choose>
								<c:when test="${premium.p_price != 0}">
									<fmt:formatNumber type="currency" value="${premium.p_price}" />
								</c:when>
								<c:otherwise>
									<fmt:formatNumber type="currency" value="${premium.s_price}" />
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="footer">
						<a href="/kmk/auction/product" class="Cbtn Cbtn-primary" data-pno="${premium.pno}">응찰하기</a>
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
	<!-- onclick="location.href='online-auction-bid.php?owcode=OW2007250001&oacode=O2007001&page=1'" -->
</div>

<!-- body side -->

<script>
$(function() { 
	// product timecount
	const countDownTimer = function (c_tag, date) {
		var untilDate = new Date(date);
		var timer;
		function showRemaining() { 
			var currentDate = new Date().getTime();
			var timeLeft = untilDate - currentDate;
	
			var days = Math.floor(timeLeft / (1000 * 60 * 60 * 24));
 			//if (days < 10) days = "0" + days; 
			
			var hours = Math.floor((timeLeft % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
			if (hours < 10) hours = "0" + hours;
			
			var minutes = Math.floor((timeLeft % (1000 * 60 * 60)) / (1000 * 60));
			if (minutes < 10) minutes = "0" + minutes;
			
			var seconds = Math.floor((timeLeft % (1000 * 60)) / 1000);
			if (seconds < 10) seconds = "0" + seconds;
 			//if (days < 1) {} else {}
			c_tag.html(days + '일' + hours + '시' + minutes + '분' + seconds + '초');
			if (timeLeft <= 0) {
				clearInterval(timer);
				c_tag.html('경매 종료');
				return;
			}
		}    
		timer = setInterval(showRemaining, 1000);  
	}
	
	// product apply timer
	$("div.start").each(function(index) {
		var that = $(this);
		var endDate = that.attr("data-until"); 
		var dateObj = new Date(endDate); 
		countDownTimer(that, dateObj);
	});
	
 	// product bid page
	$("a.Cbtn-primary").click(function(e) {
		e.preventDefault(); 
		var pno = $(this).attr("data-pno");
		console.log(pno);
		$.ajax({ 
			"type" : "POST",
			"url"  : "/kmk/auction/checkstate/" + pno,  
			"dataType" 	: "text",
			"data" : pno,
			"success"	: function(rData) {
				if (rData == "no") {
					console.log(rData);
					alert("이미 마감된 상품입니다.");
					window.location.href= "/kmk/auction/premium";
					return; 
				} else {
					console.log(rData);
				}
			},
			"error"		: function(request,status,error) { 
             	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			} 
		});	 
		$("#hideForm > input[name=pno]").val(pno); 
		$("#hideForm").attr("action", $(this).attr("href")); 
		$("#hideForm").submit(); 
	});
 	
 	// product like button
	$( ".like-button" ).each(function(index) {
     	var that = $(this);
     	var pno = $(this).attr("data-pno"); 
		var m_id = "${sessionScope.m_id}";
     	that.click(function() { 
			if (m_id == "") {
				alert("관심상품 등록은 로그인 이후 가능합니다.");
				document.location = '/kjy/member/login';
				return;
			}
			var url = "/kmk/auction/check/" + pno + "/" + m_id;
			var sendData = { 
					"m_id" : m_id,
					"pno" : pno
			};
			$.ajax({ 
				"type" : "POST",
				"url"  : url,  
				"dataType" 	: "text", 
				"data" : sendData,    
				"success"	: function(rData) {
					if (rData == "not") {   
						that.removeClass("liked");  
					} else if (rData == "ok") { 
						that.addClass("liked");  
					}
				},
				"error"		: function(request,status,error) { 
	             	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				} 
			});	 
     	});
    });
 	
 	// Home menu active
	$(".nav2").addClass("active");
	
}); 


</script>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>