package com.kh.team.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.jdbc.SQL;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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
	public List<ProductVo> premiumProduct() throws Exception {
		return null; 
	}

	@Override
	public List<ProductVo> normalProduct() throws Exception {
		return null;
	}

}
