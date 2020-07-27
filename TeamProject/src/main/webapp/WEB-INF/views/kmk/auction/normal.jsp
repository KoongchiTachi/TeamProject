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
} 
</style>

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="/resources/css/product.css" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700' rel='stylesheet' type='text/css' />

<script>
</script>

<%@ include file="/WEB-INF/views/include/header.jsp" %>
<%@ include file="/WEB-INF/views/include/kmk/hideForm.jsp" %>
 
<!------ Include the above in your HEAD tag ---------->


<div class="modal fade" id="biding-list" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">×</button>
				<h4 class="modal-title">응찰현황 리스트</h4>
				<span class="title-header-bt">
					<button class="btn-repage" type="button"
						onclick="javascript:bid_list('OW2007250001');">
						<span class="glyphicon glyphicon-refresh"></span> 새로고침
					</button>
				</span>
			</div>
			<div class="modal-body"
				style="background: #fff; max-height: 500px; overflow-y: scroll;">
				<div class="bid-right">
					<table class="bidding-table">
						<tr>
							<th style="width: 10%">No.</th>
							<th style="width: 20%">아이디</th>
							<th style="width: 20%">응찰금액</th>
							<th style="width: 30%">응찰일시</th>
							<th style="width: 20%">상태</th>
						</tr>
						<tbody id="bid_tr">
						</tbody>
					</table>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>


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
                        <img class="img-fluid" alt="Invoce Template" src="/resources/img/bag/g_01.jpg" />
                    </div>
                    <div class="col-md-8 text-xs-right">  
                        <h4 style="color: #F81D2D;"><strong id="b_name"></strong></h4>
                        <p id="p_kind"></p>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-12 text-xs-center">
                        <h2 style="font-size:20px; margin-left: 10px">응찰현황</h2> 
                    </div>
                </div>
                <br />
                <div class="text-center">
                    <table class="table text-center">
                        <thead>
                            <tr>
                                <th class="cell1"><h5>회원 ID</h5></th>
                                <th class="cell2"><h5>일시</h5></th>
                                <th class="cell3"><h5>응찰가</h5></th> 
                            </tr> 
                        </thead> 
                        <tbody id="modal_table" style="vertical-align: middle;">
                            <tr>
                                <td class="col-md-3 cell1"></td>  
                                <td class="col-md-3 cell2"></td> 
                                <td class="col-md-3 cell3"></td>
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
		<p class="grey-text w-responsive mx-auto mb-5">GUCCI PRADA CHANEL LOUISVUITTON HERMES CARTIER</p>

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
					<div class="p_logo"><img alt="premium" src="/resources/img/logo/premium_icon.png"></div> 
					<div class="banner-img"> 
						<img style="width: 85%;" src="/resources/img/bag/${premium.p_img}" alt="Image 1"> 
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
							<strong>현재 입찰가</strong> 
							<fmt:setLocale value="ko_KR" /> 
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
						<a href="/kmk/auction/bid" class="Cbtn Cbtn-primary" data-pno="${premium.pno}">응찰하기</a> 
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
// product timecount
$(function() { 
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
	
	// 상품 모달
	/* $("a.Cbtn-danger").each(function(index) {
		var that = $(this); 
		var pno = that.attr("data-pno");		
		that.click(function() {
			$.ajax({
				"type" : "post",
				"url" : "/kmk/auction/bidList/" + pno,
				"success" : function(rData) {
					$("#modal_table tr.cl_tr").remove();
					if (rData != null) {
						$.each(rData, function(index) {
							var tr = $("#modal_table tr:eq(0)").clone();;
							console.log(tr);
							tr.addClass("cl_tr"); 
							console.log(tr); 
							var td = tr.find("td");
							td.eq(0).text(this.m_id);
							td.eq(1).text(this.b_date); 
							td.eq(2).text(this.b_price);
							$("table tbody").append(tr);
						});
					}
				},
				"error" : function(request,status,error) {
			    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			    } 
			});
		});
	}); */
	
// 	// 상품 응찰 페이지
	$("a.Cbtn-primary").click(function(e) {
		e.preventDefault(); 
		var pno = $(this).attr("data-pno"); 
		$("#hideForm > input[name=pno]").val(pno); 
		$("#hideForm").attr("action", $(this).attr("href")); 
		$("#hideForm").submit(); 
	});
});


</script>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>