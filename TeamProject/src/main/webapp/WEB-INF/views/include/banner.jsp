<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<style>
.carousel-inner > .carousel-item > img { 
	width: 1903px; height: 938px; 
}
</style>
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script> 
		$('.carousel').carousel({ interval: 2000 }) 
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
					                <div class="col-lg-12">
					                    <form action="#" class="check-form">
					                        <h4>최근 등록 상품</h4>
					                        <div class="datepicker"> 
					                            <p>From</p>
					                            <input type="text" class="datepicker-1" value="dd / mm / yyyy">
					                            <img src="/resources/img/calendar.png" alt="">
					                        </div>
					                        <div class="datepicker">
					                            <p>To</p>
					                            <input type="text" class="datepicker-2" value="dd / mm / yyyy">
					                            <img src="/resources/img/calendar.png" alt="">
					                        </div>
					                        <div class="room-quantity">
					                            <div class="single-quantity">
					                                <p>Adults</p>
					                                <div class="pro-qty"><input type="text" value="0"></div>
					                            </div>
					                            <div class="single-quantity">
					                                <p>Children</p>
					                                <div class="pro-qty"><input type="text" value="0"></div>
					                            </div>
					                            <div class="single-quantity last">
					                                <p>Rooms</p>
					                                <div class="pro-qty"><input type="text" value="0"></div>
					                            </div>
					                        </div>
					                        <div class="room-selector">
					                            <p>Room</p>
					                            <select class="suit-select">
					                                <option>Eg. Master suite</option>
					                                <option value="">Double Room</option>
					                                <option value="">Single Room</option>
					                                <option value="">Special Room</option>
					                            </select>
					                        </div>
					                        <button type="submit">Go</button>
					                    </form>
					                </div>
					            </div>
					        </div>
					    </section>
					<!-- Search Filter Section End -->
                    
				</div>
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="/resources/img/banner/banner2.jpg" alt="Second slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="/resources/img/banner/banner4.jpg" alt="Third slide">
			</div>
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
				<li data-target="#demo" data-slide-to="1"></li>
				<li data-target="#demo" data-slide-to="2"></li>
			</ul>
			<!-- 인디케이터 끝 -->
		</div>
</body>
</html>

