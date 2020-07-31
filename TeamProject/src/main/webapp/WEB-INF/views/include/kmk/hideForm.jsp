<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 페이지 정보 폼(링크용) -->
<form id="hideForm" action="//listProduct" method="get">
	<input type="hidden" name="pno" value="${productVo.pno}"/>
	<%-- <input type="hidden" name="m_id" value="${sessionScope.m_id}"/>
	<input type="hidden" name="page" value="${pagingDto.page}"/> 
	<input type="hidden" name="perPage" value="${pagingDto.perPage}"/>
	<input type="hidden" name="searchType" value="${pagingDto.searchType}"/>
	<input type="hidden" name="keyword" value="${pagingDto.keyword}"/> --%>
</form>