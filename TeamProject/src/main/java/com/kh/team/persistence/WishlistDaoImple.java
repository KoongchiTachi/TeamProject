package com.kh.team.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.WishVo;
import com.kh.team.domain.WishlistPagingDto;
import com.kh.team.domain.WishlistVo;

@Repository
public class WishlistDaoImple implements WishlistDao {

	private static final String NAMESPACE = "mappers.wishlist-mapper.";

	@Inject
	private SqlSession sqlSession;

	@Override
	public void insertWishlist(String pno, String m_id) throws Exception {
		Map<String, Object> param = new HashMap<>();
		param.put("pno", pno); 
		param.put("m_id", m_id);
		sqlSession.insert(NAMESPACE + "insertWishlist", param);
	}

	@Override
	public List<WishlistVo> wishList(String m_id, int startRow, int endRow) throws Exception {
		Map<String, Object> param = new HashMap<>();
		param.put("m_id", m_id);
		param.put("startRow", startRow);
		param.put("endRow", endRow);
		return sqlSession.selectList(NAMESPACE + "wishList", param);
	}

	@Override
	public void deleteWishlist(int wno) throws Exception {
		sqlSession.delete(NAMESPACE + "deleteWishlist", wno);
	}

	@Override
	public void deleteWishMulti(WishlistVo wnos) {
		sqlSession.delete(NAMESPACE + "deleteWishMulti", wnos);
	}

	@Override
	public int getCount(WishlistPagingDto wishlistPagingDto, String m_id) throws Exception {
		Map<String, Object> param = new HashMap<>();
		param.put("wishlistPagingDto", wishlistPagingDto);
		param.put("m_id", m_id);
		return sqlSession.selectOne(NAMESPACE + "getCount", param);
	}

	@Override
	public WishVo getAttentionCheck(String pno, String m_id) throws Exception {
		Map<String, Object> param = new HashMap<>();
		param.put("pno", pno);
		param.put("m_id", m_id); 
		return sqlSession.selectOne(NAMESPACE + "getAttentionCheck", param);
	}

}
