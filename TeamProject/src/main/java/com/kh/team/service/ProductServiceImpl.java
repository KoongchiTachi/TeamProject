package com.kh.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.BidVo;
import com.kh.team.domain.ProductVo;
import com.kh.team.persistence.ProductDao;

@Service
public class ProductServiceImpl implements ProductService {

	@Inject
	private ProductDao productDao;
	
	@Override
	public void insertProduct() throws Exception {
		
	}

	@Override
	public void updateProduct() throws Exception {

	}

	@Override
	public void deleteProduct() throws Exception {

	}

	@Override
	public List<ProductVo> endProduct(String p_state) throws Exception {
		List<ProductVo> list = productDao.endProduct(p_state);
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

	@Override
	public List<BidVo> bidList(String pno) throws Exception {
		List<BidVo> list = productDao.bidList(pno);
		return list;
	}

}
