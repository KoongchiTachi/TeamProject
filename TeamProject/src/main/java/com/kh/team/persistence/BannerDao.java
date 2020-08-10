package com.kh.team.persistence;

import java.util.List;

import com.kh.team.domain.AdminBannerVo;

public interface BannerDao {

	// 배너 등록
	public void insertBanner(AdminBannerVo adminBannerVo) throws Exception;
	
	// 배너 목록
	public List<AdminBannerVo> bannerList() throws Exception;
	
	// 배너 삭제
	public void deleteBanner(int bnno) throws Exception;
	
	// 배너 개수 확인
	public int getBannerCount() throws Exception;
	
	// 배너 이름 확인
	public int getBannerName(AdminBannerVo adminBannerVo) throws Exception;
	
}
