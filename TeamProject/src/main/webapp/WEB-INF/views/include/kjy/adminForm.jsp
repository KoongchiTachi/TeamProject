<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!-- 관리자 - 회원 검색 -->
<form id="adminFrmPage" action="/kjy/admin/adminMemberList" method="get">
	<input type="hidden" name="page" value="${adminMemberListPagingDto.page}"/>
	<input type="hidden" name="perPage" value="${adminMemberListPagingDto.perPage}"/>
	<input type="hidden" name="searchType" value="${adminMemberListPagingDto.searchType}"/>
	<input type="hidden" name="keyword" value="${adminMemberListPagingDto.keyword}"/>
</form>

