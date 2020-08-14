package com.kh.team.service;

import java.util.List;

import com.kh.team.domain.BidVo;
import com.kh.team.domain.ProductVo;
import com.kh.team.domain.WishVo;

public interface ProductService {
	// 상품 등록
	public void insertProduct() throws Exception;
	// 상품 수정
	public void updateProduct() throws Exception;
	// 상품 삭제
	public void deleteProduct() throws Exception;
	// 상품 내용
	public ProductVo selectByPno(String pno) throws Exception;
	// 상품 응찰 카운트
	public int bidCountByPno(String pno) throws Exception; 
	// 상품 목록 ( 경매 종료 )
	public List<ProductVo> endProduct(String p_state) throws Exception; 
	// 상품 목록 ( 프리미엄 )
	public List<ProductVo> premiumProduct(int p_value) throws Exception;
	// 상품 목록 ( 일반 )
	public List<ProductVo> normalProduct(int p_value) throws Exception;
	// 관심상품 목록
	public List<WishVo> attentionItems(String m_id) throws Exception;
	// 응찰 내역
	public List<BidVo> bidList(String pno) throws Exception;
	// 마감 확인
	public String checkstate(String pno) throws Exception;
}
