<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
  margin: 0;
  text-align: center;
  padding-top: 120px;
  font-family: "open sans", sans-serif;
  background: #ddd;
  height: 100%;
}

div {
  height: 100px;
  margin: 0 auto;
  position: relative;
}

i {
  cursor: pointer;
  padding: 10px 12px 8px;
  background: #fff;
  border-radius: 50%;
  display: inline-block;
  margin: 0 0 15px;
  color: #aaa;
  transition: 0.2s;
}

i:hover {
  color: #666;
}

i:before {
  font-family: fontawesome;
  content: "\f004";
  font-style: normal;
}

span {
  position: absolute;
  bottom: 70px;
  left: 0;
  right: 0;
  visibility: hidden;
  transition: 0.6s;
  z-index: -2;
  font-size: 2px;
  color: transparent;
  font-weight: 400;
}

i.press {
  animation: size 0.4s;
  color: #e23b3b;
}

span.press {
  bottom: 120px;
  font-size: 14px;
  visibility: visible;
  animation: fade 1s;
}

@keyframes fade {
  0% {
    color: #transparent;
  }
  50% {
    color: #e23b3b;
  }
  100% {
    color: #transparent;
  }
}

@keyframes size {
  0% {
    padding: 10px 12px 8px;
  }
  50% {
    padding: 14px 16px 12px;
    margin-top: -4px;
  }
  100% {
    padding: 10px 12px 8px;
  }
}
/* 0810 active */
.inner-header .main-menu ul li a.active {
	color: #F9AD81;
}
</style>
<link rel="stylesheet" href="/resources/css/product/like_heart.css" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Lato"rel="stylesheet' rel='stylesheet' type='text/css' />
<link href='https://fonts.googleapis.com/icon?family=Material+Icons' rel='stylesheet' type='text/css' />
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
  

<div class="container">
	<div>
		<i></i> 
		<span>liked!</span> 
	</div>
</div>

<!-- <div class="add-product-set"> -->
<!-- 	<div class="row"> -->
<!-- 		<div class="col-lg-12"> -->
<!-- 			<h3>해당 상품 브랜드의 다른 상품</h3> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- 	<div class="row" style="display: none"> -->
<!-- 		<div class="col-lg-12"> -->
<!-- 		</div> -->
<!-- 		<div class="col-lg-2 col-xs-4"> -->
<!-- 			<div class="item-list"> -->
<!-- 				<img src="" alt="" /> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div class="col-lg-2 col-xs-4"> -->
<!-- 			<div class="item-list"> -->
<!-- 				<img src="" alt="" /> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div class="col-lg-2 col-xs-4"> -->
<!-- 			<div class="item-list"> -->
<!-- 				<img src="" alt="" /> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div class="col-lg-2 col-xs-4"> -->
<!-- 			<div class="item-list"> -->
<!-- 				<img src="" alt="" /> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div class="col-lg-2 col-xs-4"> -->
<!-- 			<div class="item-list"> -->
<!-- 				<img src="" alt="" /> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div class="col-lg-2 col-xs-4"> -->
<!-- 			<div class="item-list"> -->
<!-- 				<img src="" alt="" /> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->

<script>
$(function() {
    $( "i" ).click(function() {
      $( "i,span" ).toggleClass( "press", 1000 );
    }); 
    
 // 0810 active
    $(".nav2").addClass("active");
});
</script>

</body>
</html>