package com.kh.team.util;

import com.kh.team.domain.NoticePagingDto;

public class NoticeUrlUtil {
	public static String makePagingUrl(String url, NoticePagingDto noticePagingDto, int nno) {
		url += "?";
		url += "nno=" + nno;
		url += "&page=" + noticePagingDto.getPage();
		url += "&perPage=" + noticePagingDto.getPerPage();
		url += "&keyword=" + noticePagingDto.getKeyword();
		return url;
	}
	
	public static String makePagingUrl(String url, NoticePagingDto noticePagingDto) {
		url += "?";
		url += "page=" + noticePagingDto.getPage();
		url += "&perPage=" + noticePagingDto.getPerPage();
		url += "&keyword=" + noticePagingDto.getKeyword();
		return url;
	}
}