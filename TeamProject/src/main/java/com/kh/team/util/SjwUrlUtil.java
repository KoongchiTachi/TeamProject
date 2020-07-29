package com.kh.team.util;

import com.kh.team.domain.FaqPagingDto;
import com.kh.team.domain.NoticePagingDto;

public class SjwUrlUtil {
	public static String makePagingUrlN(String url, NoticePagingDto noticePagingDto, int nno) {
		url += "?";
		url += "nno=" + nno;
		url += "&page=" + noticePagingDto.getPage();
		url += "&perPage=" + noticePagingDto.getPerPage();
		url += "&searchType=" + noticePagingDto.getSearchType();
		url += "&keyword=" + noticePagingDto.getKeyword();
		return url;
	}
	
	public static String makePagingUrlN(String url, NoticePagingDto noticePagingDto) {
		url += "?";
		url += "page=" + noticePagingDto.getPage();
		url += "&perPage=" + noticePagingDto.getPerPage();
		url += "&searchType=" + noticePagingDto.getSearchType();
		url += "&keyword=" + noticePagingDto.getKeyword();
		return url;
	}
	
	public static String makePagingUrlF(String url, FaqPagingDto faqPagingDto, int fno) {
		url += "?";
		url += "fno=" + fno;
		url += "&page=" + faqPagingDto.getPage();
		url += "&perPage=" + faqPagingDto.getPerPage();
		url += "&searchType=" + faqPagingDto.getSearchType();
		url += "&keyword=" + faqPagingDto.getKeyword();
		return url;
	}
	
	public static String makePagingUrlF(String url, FaqPagingDto faqPagingDto) {
		url += "?";
		url += "page=" + faqPagingDto.getPage();
		url += "&perPage=" + faqPagingDto.getPerPage();
		url += "&searchType=" + faqPagingDto.getSearchType();
		url += "&keyword=" + faqPagingDto.getKeyword();
		return url;
	}
}