package com.kh.team.service;

import java.util.List;

import com.kh.team.domain.AdminBannerVo;
import com.kh.team.domain.ProductVo;

public interface BannerService {
	// 배너 등록
	public void insertBanner(AdminBannerVo adminBannerVo) throws Exception;
	
	// 배너 목록
	public List<AdminBannerVo> bannerList() throws Exception;
	
	// 배너 삭제
	public void deleteBanner(int bnno) throws Exception;
	
	// 배너 개수 확인
	public int getBannerCount() throws Exception;
	
	// 배너 이름 확인
	public boolean getBannerName(AdminBannerVo adminBannerVo) throws Exception;
	
	// 최근 등록 상품
	public List<ProductVo> bannerItems() throws Exception;

}
