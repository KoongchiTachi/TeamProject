<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<style>
#map { 
 	width: 100%;
 }
 
h4 {
	margin-top : 30px;
	margin-bottom : 70px;
}

p {
	font-size: 19px;
	color: #737272;
	font-family: "Montserrat Alternates", sans-serif;
	font-weight: 500;
	line-height: 28px;
	margin: 0 0 15px 0;
}

hr {
	margin-top : 50px;
	margin-bottom : 50px;
}

h3 {
	margin-top : 20px;
	margin-bottom : 20px;
}

/* .contact-section { */
/* 	min-width: 800px; */
/* 	padding-right: 150px; */
/* 	padding-left: 150px; */
/* 	margin-right: 150px; */
/* 	margin-left: 150px; */
/* } */

</style>

   <section class="contact-section spad">
     <div class="container">
           <div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-12">
                    <div class="section-title">
                       <h2>오시는 길</h2>
                       <hr>
                    </div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-2">
				</div>
				<div class="col-md-8">
				<h4><img src="/resources/img/placeholder.png" width = "18px" alt="위치">주소 : (446-77) 울산광역시 남구 삼산로35번길 19(신정동)</h4>
				</div>
				<div class="col-md-2">
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-7">
				<iframe src="http://wooripage.co.kr/__naver.map.php?lat=35.5350071&lng=129.3108307&height=700" height="700" scrolling="no" frameborder="0" id="map"></iframe>
				</div>
				<div class="col-md-5">
					<img alt="버스" src="/resources/img/bus.png/">
								<h3>버스</h3>
								<p>
								- 지선 : 921  |  922  |  928 <br/> 
								- 일반 : 106  |  107  |  124  |  126  |  127  |  134  <br/> 
								- 좌석 : 1127  |  1137  |  1401  |  1703 <br/>
								- 급행 : 5004 <br/><br/>공업탑 버스 정류장 하차 도보 400m
							</p>
							<hr>
							<img alt="자동차" src="/resources/img/car.png/" />
								<h3>주차 안내</h3>
								<p>본관 1층 주차 가능<br/>본관 맞은편 별관 1층 주차 가능
								</p>
					</div>
				</div>
			</div>
		</div>
  	</div>
  	
    </section>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>