package com.kh.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.BidVo;
import com.kh.team.domain.ProductVo;
import com.kh.team.domain.WishVo;
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
	public List<ProductVo> premiumProduct(int p_value) throws Exception {
		List<ProductVo> list = productDao.premiumProduct(p_value);
		return list;
	}

	@Override
	public List<ProductVo> normalProduct(int p_value) throws Exception {
		List<ProductVo> list = productDao.normalProduct(p_value);
		return list;
	}

	@Override
	public List<BidVo> bidList(String pno) throws Exception {
		List<BidVo> list = productDao.bidList(pno);
		return list;
	}

	@Override
	public ProductVo selectByPno(String pno) throws Exception {
		return productDao.selectByPno(pno);
	}

	@Override
	public int bidCountByPno(String pno) throws Exception {
		return productDao.bidCountByPno(pno);
	}

	@Override
	public List<WishVo> attentionItems(String m_id) throws Exception {
		List<WishVo> wish = productDao.attentionItems(m_id);
		return wish;
	}

	@Override
	public String checkstate(String pno) throws Exception {
		System.out.println(pno);
		return productDao.checkstate(pno);
	}

}
