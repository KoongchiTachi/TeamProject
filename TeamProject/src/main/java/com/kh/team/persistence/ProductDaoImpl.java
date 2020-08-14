package com.kh.team.persistence;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.jdbc.SQL;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.BidVo;
import com.kh.team.domain.ProductVo;
import com.kh.team.domain.WishVo;

@Repository
public class ProductDaoImpl implements ProductDao {

	@Inject
	private SqlSession sqlSession;

	private final String PRODUCT = "mappers.product-mapper.";
	private final String WISH = "mappers.wishlist-mapper.";

	@Override
	public void insertProduct() throws Exception {
		sqlSession.insert(PRODUCT + "insertProduct");
	}

	@Override
	public void updateProduct(String pno) throws Exception {

	}

	@Override
	public void deleteProduct() throws Exception {

	}

	@Override
	public List<ProductVo> endProduct(String p_state) throws Exception {
		List<ProductVo> list = sqlSession.selectList(PRODUCT + "endProduct", p_state);
		return list;
	}

	@Override
	public List<ProductVo> premiumProduct(int p_value) throws Exception {
		List<ProductVo> list = sqlSession.selectList(PRODUCT + "premiumProduct", p_value);
		return list;
	}

	@Override
	public List<ProductVo> normalProduct(int p_value) throws Exception {
		List<ProductVo> list = sqlSession.selectList(PRODUCT + "normalProduct", p_value);
		return list;
	}

	@Override
	public void updateP_price(int b_price, String pno) throws Exception {
		Map<String, Object> param = new HashMap<>();
		param.put("b_price", b_price);
		param.put("pno", pno);
		sqlSession.update(PRODUCT + "updateP_price", param);
	}

	@Override
	public List<BidVo> bidList(String pno) throws Exception {
		List<BidVo> list = sqlSession.selectList(PRODUCT + "bidList", pno);
		return list;
	}

	@Override
	public ProductVo selectByPno(String pno) throws Exception {
		return sqlSession.selectOne(PRODUCT + "selectByPno", pno);
	}

	@Override
	public void updateP_state(String p_state) throws Exception {
		sqlSession.update(PRODUCT + "updateP_state", p_state);

	}

	@Override
	public List<Timestamp> selectP_until() throws Exception {
		return sqlSession.selectList(PRODUCT + "selectP_until");
	}

	@Override
	public int bidCountByPno(String pno) throws Exception {
		return sqlSession.selectOne(PRODUCT + "bidCountByPno", pno);
	}

	@Override
	public List<WishVo> attentionItems(String m_id) throws Exception {
		return sqlSession.selectList(WISH + "wishItems", m_id);
	}

	@Override
	public String findPno(Timestamp time) throws Exception {
		return sqlSession.selectOne(PRODUCT + "findPno", time);
	}

	@Override
	public void bidWhether(String pno) throws Exception {
		sqlSession.update(PRODUCT + "bidWhether", pno);
	}

	@Override
	public String topBidding(String pno) throws Exception {
		return sqlSession.selectOne(PRODUCT + "topBidding", pno);
	}

	@Override
	public void matchingBidding(String m_id, String pno) throws Exception {
		Map<String, Object> param = new HashMap<>();
		param.put("m_id", m_id);
		param.put("pno", pno);
		sqlSession.update(PRODUCT + "matchingBidding", param);
	}

	@Override
	public List<ProductVo> bannerItems() throws Exception {
		return sqlSession.selectList(PRODUCT + "bannerItems");
	}

	@Override
	public String checkstate(String pno) throws Exception {
		return sqlSession.selectOne(PRODUCT + "checkstate", pno);
	}

}
