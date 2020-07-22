package com.kh.team.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.WishlistVo;

@Repository
public class WishlistDaoImple implements WishlistDao {

	private static final String NAMESPACE = "mappers.wishlist-mapper.";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void insertWishlist(WishlistVo wishlistVo) throws Exception {
		sqlSession.insert(NAMESPACE + "insertWishlist", wishlistVo);
	}
	
	@Override
	public List<WishlistVo> wishList(String m_id) throws Exception {
		return sqlSession.selectList(NAMESPACE + "wishList", m_id);
	}

	@Override
	public void deleteWishlist(int wno) throws Exception {
		sqlSession.delete(NAMESPACE + "deleteWishlist", wno);
	}

	@Override
	public void deleteWishMulti(WishlistVo wnos) {
		sqlSession.delete(NAMESPACE + "deleteWishMulti", wnos);
	}


}
