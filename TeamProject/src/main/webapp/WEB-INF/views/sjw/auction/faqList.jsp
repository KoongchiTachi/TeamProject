<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style>
.faq {min-height : 50vh;}
.tab {width:100%; background:#F6F9FB;}
.tab ul {text-align:center; font-size:0; line-height:0;}
.tab ul li {display:inline; margin:0 0 0 -1px;}
.tab ul li a {display:inline-block; font-size:20px; color:#333; letter-spacing:1.6px; padding:0 30px; margin:0 0 10px 0; border-left:1px #333 solid; border-right:1px #333 solid;}
.tab ul li.on a {color:#F9AD81; font-weight:600;}
/*******************************
* Does not work properly if "in" is added after "collapse".
*******************************/
.panel-group {
	border-top: 1px solid #888888;
	border-bottom: 1px solid #888888;
	width: 98%;
	margin-left: 8px;
}
.panel-group .panel {
  border-radius: 0;
  box-shadow: none;
  border-color: #EEEEEE;
  border-left-color: #ffffff;
  border-right-color: #ffffff; 
}
.panel-default > .panel-heading {
  padding: 0;
  border-radius: 0;
  color: #212121;
  background-color: #ffffff;
  border-color: #EEEEEE;
}
.panel-title {
  font-size: 20px;
}
.panel-title > a {
	display: block;
	padding: 15px;
	text-decoration: none;
    color:#212121;
}
.more-less {
  float: right;
  color: #212121;
}
.panel-default > .panel-heading + .panel-collapse > .panel-body {
  border-top-color: #EEEEEE;
  font-size: 20px;
  color: #9e9e9e;
}

/* ----- v CAN BE DELETED v ----- */
.demo {
  padding-top: 60px;
  padding-bottom: 60px;
}
p {
  font-size: 16px;
}
.faq {
	min-width: 90%;
	padding-left: 250px;
}
</style>


<section class="contact-section spad">
	<div class="container faq">
		<div class="row">
			<div class="col-lg-12">
				<div class="contact-title">
					<div class="section-title">
						<h2>FAQ</h2>
					</div>
				</div>
			</div>
		</div>

		<div class="col-lg-10">
			<div class="info-box">
				<div class="tab">
					<ul>
						<li><a href="?">전체</a></li>
						<li><a href="?cate=1">회원</a></li>
						<li><a href="?cate=2">경매</a></li>
						<li><a href="?cate=3">낙찰</a></li>
						<li><a href="?cate=4">위탁</a></li>
						<li><a href="?cate=5">기타</a></li>
					</ul>
				</div>
			</div>

			<div class="container demo">
	<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
		<div class="panel panel-default">
			<div class="panel-heading" role="tab" id="headingOne">
				<h4 class="panel-title">
					<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
						<i class="more-less glyphicon glyphicon-chevron-down"></i>
						Collapsible Group Item #1
					</a>
				</h4>
			</div>
			<div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
				<div class="panel-body">
					  Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
				</div>
			</div>
		</div>

		<div class="panel panel-default">
			<div class="panel-heading" role="tab" id="headingTwo">
				<h4 class="panel-title">
					<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
						<i class="more-less glyphicon glyphicon-chevron-down"></i>
						Collapsible Group Item #2
					</a>
				</h4>
			</div>
			<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
				<div class="panel-body">
					Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
				</div>
			</div>
		</div>

		<div class="panel panel-default">
			<div class="panel-heading" role="tab" id="headingThree">
				<h4 class="panel-title">
					<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
						<span class="more-less glyphicon glyphicon-chevron-down"></span>
						Collapsible Group Item #3
					</a>
				</h4>
			</div>
			<div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
				<div class="panel-body">
					Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
				</div>
			</div>
		</div>
	</div>
</div>

			<div class="row">
				<div class="col-md-5"></div>
				<div class="col-md-2">
					<div class="blog-pagination">
						<a href="#">01.</a> <a href="#">02.</a> <a href="#">03.</a>
					</div>
				</div>
				<div class="col-md-5"></div>
			</div>
		</div>
	</div>


	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-6">
		</div>
		<div class="col-md-4">
			<div class="moreFaq" style="margin: 10px;">
				<p>· 더 궁금하신 사항은 1:1문의를 이용해 주세요.
				<a href="/sjw/auction/qnaForm" class="primary-btn">1:1문의 바로가기</a>
				</p>
			</div>
		</div>
	</div>

</section>

<script>

// function toggleIcon(e) {
//     $(e.target)
//         .prev('.panel-heading')
//         .find(".more-less")
//         .toggleClass('glyphicon-chevron-up glyphicon-chevron-down');
// }
//   	$('.panel-group').on('hidden.bs.collapse', toggleIcon);
//  	$('.panel-group').on('shown.bs.collapse', toggleIcon);

</script>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>