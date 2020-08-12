<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/banner/banner.css" type="text/css">
	 
<style>
.carousel-inner > .carousel-item > img { 
	width: 1903px; height: 938px;
}
ul, ol {
    padding: 0;
    margin: 0;
}
html, body {
    height: 100%;
    font-family: "Montserrat Alternates", sans-serif;
    -webkit-font-smoothing: antialiased;
    font-smoothing: antialiased;
    background: none;
}
</style>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<script>
$('.carousel').carousel({
	interval : 2000
})
</script>
<div class="container"> 
</div>
	<div id="demo" class="carousel slide" data-ride="carousel">
		<div class="carousel-inner">
			<!-- 슬라이드 쇼 -->
				<div class="carousel-item active">
					<!--가로-->
					<img class="d-block w-100" src="/resources/img/main-bg.jpg" alt="First slide">
					<div class="carousel-caption d-none d-md-block" style="top : 400px;">
						<div class="hero-text">
	                        <h1>A Luxury Auction</h1>
	                    </div>
	                    <!-- Search Filter Section Begin -->
						    <section class="search-filter">
						        <div class="container" style="margin-top : 450px;">
						            <div class="row">
						                <div class="col-lg-12 check-form">
					                        <h4>최근 등록 상품</h4>
					                        <c:forEach items="${items}" var="item">
												<div class="datepicker col-3" data-pno="${item.pno}">
													<div class='img-wrapper hov-img-scale'>
														<div class='img-container'>
															<img src="/resources/img/bag/${item.p_img1}" class="img-hover-item" alt='sample'>
														</div>
													</div>
													<div class='img-overlay'>
														<p style="color: red;">${fn:toUpperCase(item.b_name)}</p> 
														<p>${item.p_name}</p>
														<p>
															<fmt:setLocale value="ko_KR" /> 
															<c:choose>
																<c:when test="${item.p_price != 0}">
																	<fmt:formatNumber type="currency" value="${item.p_price}" />
																</c:when> 
																<c:otherwise>  
																	<fmt:formatNumber type="currency" value="${item.s_price}" />
																</c:otherwise>
															</c:choose>
														</p>
														<span>(현재가 기준)</span>
													</div>
												</div>
					                        </c:forEach>
						                </div>  
						            </div>
						        </div>
						    </section>
						<!-- Search Filter Section End -->
					</div>
				</div>
				<c:forEach items="${list}" var="adminBannerVo"> 
					<div class="carousel-item">
						<img class="d-block w-100" src="/uploadBanner/displayFile?bn_img=${adminBannerVo.bn_img}">
					</div>
				</c:forEach>
			<!-- / 슬라이드 쇼 끝 -->
			
			<!-- 왼쪽 오른쪽 화살표 버튼 -->
			<a class="carousel-control-prev" href="#demo" data-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			</a> 
			<a class="carousel-control-next" href="#demo" data-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
			</a>
			<!-- / 화살표 버튼 끝 -->
			
			<!-- 인디케이터 -->
			<ul class="carousel-indicators">
				<li data-target="#demo" data-slide-to="0" class="active"></li>
				<c:choose>
					<c:when test="${count == 2}">
						<li data-target="#demo" data-slide-to="1"></li>
						<li data-target="#demo" data-slide-to="2"></li>
					</c:when>
					<c:when test="${count == 1}">
						<li data-target="#demo" data-slide-to="1"></li>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose> 
			</ul>
			<!-- 인디케이터 끝 -->
		</div>
	</div>
<script>
$( ".datepicker" ).each(function(index) {
 	var that = $(this);
 	var pno = $(this).attr("data-pno"); 
 	that.click(function() { 
		var url = "/kmk/auction/product/";
		var sendData = { 
				"pno" : pno
		};
		$.ajax({ 
			"type" : "GET",
			"url"  : url,  
			"dataType" 	: "text", 
			"data" : sendData,    
			"success"	: function(rData) {
				window.location.href= "/kmk/auction/product?pno=" + pno; 
			},
			"error"		: function(request,status,error) { 
             	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			} 
		});	 
 	});
});
</script>
	
</body>
</html>

