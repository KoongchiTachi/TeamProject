<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<style>
.myQnaList {
 	min-height : 50vh;
}
</style>

<section class="contact-section spad">
<div class="container myQnaList">
	<div class="row">
                <div class="col-lg-12">
                    <div class="contact-title">
                        <div class="section-title">
                            <h2>1:1문의 내역</h2>
                        </div>
                    </div>
                </div>
            </div>
 			<div class="row">
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-10">

							<table class="table table-hover">
								<thead>
									<tr>
										<th>문의유형</th>
										<th>제목</th>
										<th>작성일</th>
										<th>답변여부</th>
									</tr>
								</thead>
							<tbody>
								<tr>
									<td>배송문의</td>
									<td>배송언제되나요</td>
									<td>2020-07-20</td>
									<td>답변완료</td>
								</tr>
							</tbody>
						</table>
						</div>
						<div class="col-md-1"></div>
					</div>
				</div>
			</div>
		</div>        
</section>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>