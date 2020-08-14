<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="/WEB-INF/views/include/header.jsp"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">

<style>
.table th {
	text-align: center;
}

.table td {
	vertical-align: middle;
}

.figure figcaption {
	vertical-align: middle;
}

.param {
	margin-bottom: 7px;
	line-height: 1.4;
} 

.param-inline dt {
	display: inline-block;
}

.param dt {
	margin: 0;
	margin-right: 7px;
	font-weight: 600;
}

.param-inline dd {
	vertical-align: baseline;
	display: inline-block;
}

.param dd {
	margin: 0;
	vertical-align: baseline;
}

.shopping-cart-wrap .price {
	color: #007bff;
	font-size: 18px;
	font-weight: bold;
	margin-right: 5px;
	display: block;
}

var {
	font-style: normal;
}

.media img {
	margin-right: 1rem;
}

.media-body { 
	vertical-align: bottom; 
}

.img-sm {
	width: auto;
	height: auto;
	max-width: 240px;
	max-height: 225px;
	object-fit: cover;
}

.description {
	height: 225px
}

.figcaption {
	margin : auto
}

.title {
	text-transform : uppercase;
}
/* 0810 active */
.inner-header .main-menu ul li a.active {
	color: #F9AD81;
}
</style>
<script>
//0810 active
$(function() {
	$(".nav2").addClass("active");
});
</script>

<div class="container" style="margin-top: 150px; margin-bottom: 50px;"> 
	<br> 
		<!-- <p class="text-center">지난 경매 내역입니다.</p> -->
		<div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold" style="text-align: center;">지난 경매 내역</div>
	<hr>
	<div class="card col-lg-12 mx-auto">
		<table class="table table-hover shopping-cart-wrap">
			<thead class="text-muted">
				<tr>
					<th scope="col">Product</th>
					<th scope="col" width="120"></th>
					<th scope="col" width="120">Price</th>
					<th scope="col" class="text-xs-center">Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="product" items="${list}">
					<tr>
						<td class="text-center description">
							<figure class="media"> 
								<div class="img-wrap">
									<img src="/resources/img/bag/${product.p_img1}" class="img-thumbnail img-sm">
								</div>
								<figcaption class="media-body figcaption">
									<h6 class="title text-truncate">${product.b_name}</h6>
									<dl class="param param-inline small">
										<dt>상품명</dt>
										<dd>${product.p_name}</dd>
									</dl>
									<dl class="param param-inline small">   
										<dt>사이즈</dt>
										<dd>${product.p_size}</dd> 
									</dl>
									<dl class="param param-inline small">
										<dt>색상</dt>
										<dd>블랙</dd>
									</dl>
								</figcaption>
							</figure>
						</td>
						<td></td>
						<td><c:choose>
								<c:when test="${product.p_price == 0}">
									<div class="price-wrap text-center">
										<var class="price">
											<fmt:setLocale value="ko_KR" />
											<fmt:formatNumber type="currency" value="${product.s_price}" />
										</var>
										<small class="text-muted">(시작가)</small>
									</div> 
								</c:when>
								<c:otherwise>
									<div class="price-wrap text-center">
										<var class="price">
											<fmt:setLocale value="ko_KR" />
											<fmt:formatNumber type="currency" value="${product.p_price}" />
										</var>
										<small class="text-muted">(최고가)</small> 
									</div>
								</c:otherwise>
							</c:choose></td>
						<td class="text-center"><c:choose>
								<c:when test="${product.p_progress eq 'p06'}">
									<a href="" class="btn btn-outline-danger">낙찰</a>
								</c:when>
								<c:otherwise>
									<a href="" class="btn btn-outline-info">유찰</a>
								</c:otherwise>
							</c:choose></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- card.// -->
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>