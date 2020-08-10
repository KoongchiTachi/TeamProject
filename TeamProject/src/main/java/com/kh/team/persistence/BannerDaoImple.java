package com.kh.team.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.AdminBannerVo;

@Repository
public class BannerDaoImple implements BannerDao {

	private static final String NAMESPACE = "mappers.banner-mapper.";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void insertBanner(AdminBannerVo adminBannerVo) throws Exception {
		sqlSession.insert(NAMESPACE + "insertBanner", adminBannerVo);
	}

	@Override
	public List<AdminBannerVo> bannerList() throws Exception {
		return sqlSession.selectList(NAMESPACE + "bannerList");
	}

	@Override
	public void deleteBanner(int bnno) throws Exception {
		sqlSession.delete(NAMESPACE + "deleteBanner", bnno);
	}
	
	@Override
	public int getBannerCount() throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getBannerCount");
	}

	@Override
	public int getBannerName(AdminBannerVo adminBannerVo) throws Exception {
		String b_name = adminBannerVo.getB_name(); 
		return sqlSession.selectOne(NAMESPACE + "getBannerName", b_name);
	}

}
