<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 페이지 정보 폼(링크용) -->
<form id="frmPage" action="/sjw/about/noticeList" method="get">
	<input type="hidden" name="nno" value="${noticeVo.nno}"/>
	<input type="hidden" name="page" value="${noticePagingDto.page}"/>
	<input type="hidden" name="perPage" value="${noticePagingDto.perPage}"/>
	<input type="hidden" name="searchType" value="${noticePagingDto.searchType}"/>
	<input type="hidden" name="keyword" value="${noticePagingDto.keyword}"/>
</form> 