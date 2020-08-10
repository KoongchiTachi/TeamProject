package com.kh.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.AdminBannerVo;
import com.kh.team.persistence.BannerDao;

@Service
public class BannerServiceImple implements BannerService {

	@Inject
	private BannerDao bannerDao;
	
	@Override
	public void insertBanner(AdminBannerVo adminBannerVo) throws Exception {
		bannerDao.insertBanner(adminBannerVo);
	}

	@Override
	public List<AdminBannerVo> bannerList() throws Exception {
		return bannerDao.bannerList();
	}

	@Override
	public void deleteBanner(int bnno) throws Exception {
		bannerDao.deleteBanner(bnno);
	}

	@Override
	public int getBannerCount() throws Exception {
		return bannerDao.getBannerCount();
	}

	@Override
	public boolean getBannerName(AdminBannerVo adminBannerVo) throws Exception {
		int count = bannerDao.getBannerName(adminBannerVo);
		if (count == 1) {
			return false;
		} else {
			return true;
		}
	}

}
