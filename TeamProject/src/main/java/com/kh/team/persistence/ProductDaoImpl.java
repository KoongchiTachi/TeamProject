package com.kh.team.persistence;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.jdbc.SQL;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.BidVo;
import com.kh.team.domain.ProductVo;

@Repository
public class ProductDaoImpl implements ProductDao {

	@Inject
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "mappers.product-mapper.";
	
	@Override
	public void insertProduct() throws Exception {
		sqlSession.insert(NAMESPACE + "insertProduct");
	}

	@Override
	public void updateProduct() throws Exception {

	}

	@Override
	public void deleteProduct() throws Exception {

	} 
	
	@Override
	public List<ProductVo> endProduct(String p_state) throws Exception {
		List<ProductVo> list = sqlSession.selectList(NAMESPACE + "endProduct", p_state);
		return list; 
	}

	@Override
	public List<ProductVo> premiumProduct(int p_value) throws Exception {
		List<ProductVo> list = sqlSession.selectList(NAMESPACE + "premiumProduct" , p_value);
		return list;  
	}

	@Override
	public List<ProductVo> normalProduct() throws Exception {
		return null;
	}

	@Override
	public List<BidVo> bidList(String pno) throws Exception {
		List<BidVo> list = sqlSession.selectList(NAMESPACE + "bidList", pno);
		return list;
	}

	@Override
	public ProductVo selectByPno(String pno) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "selectByPno", pno);
	}

	@Override
	public void updateP_state(String p_state) throws Exception {
		sqlSession.update(NAMESPACE + "updateP_state", p_state);
		
	}

	@Override
	public List<Timestamp> selectP_until() throws Exception {
		return sqlSession.selectList(NAMESPACE + "selectP_until");
	}

	@Override
	public int bidCountByPno(String pno) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "bidCountByPno", pno);
	}

}
