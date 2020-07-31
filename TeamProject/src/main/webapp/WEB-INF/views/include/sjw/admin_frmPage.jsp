<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 페이지 정보 폼(링크용) -->
<form id="adminFrmPageN" action="/sjw/admin/admin_noticeList" method="get">
	<input type="hidden" name="nno" value="${noticeVo.nno}"/>
	<input type="hidden" name="page" value="${noticePagingDto.page}"/>
	<input type="hidden" name="perPage" value="${noticePagingDto.perPage}"/>
	<input type="hidden" name="searchType" value="${noticePagingDto.searchType}"/>
	<input type="hidden" name="keyword" value="${noticePagingDto.keyword}"/>
</form>

<form id="adminFrmPageF" action="/sjw/admin/admin_faqList" method="get">
	<input type="hidden" name="fno" value="${faqVo.fno}"/>
	<input type="hidden" name="page" value="${faqPagingDto.page}"/>
	<input type="hidden" name="perPage" value="${faqPagingDto.perPage}"/>
	<input type="hidden" name="searchType" value="${faqPagingDto.searchType}"/>
	<input type="hidden" name="keyword" value="${faqPagingDto.keyword}"/>
</form> 

<form id="adminFrmPageQ" action="/sjw/admin/admin_qnaList" method="get">
	<input type="hidden" name="qno" value="${qnaVo.qno}"/>
	<input type="hidden" name="page" value="${qnaPagingDto.page}"/>
	<input type="hidden" name="perPage" value="${qnaPagingDto.perPage}"/>
	<input type="hidden" name="searchType" value="${qnaPagingDto.searchType}"/>
	<input type="hidden" name="keyword" value="${qnaPagingDto.keyword}"/>
</form> 