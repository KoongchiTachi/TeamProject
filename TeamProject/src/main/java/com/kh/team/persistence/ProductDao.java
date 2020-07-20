package com.kh.team.persistence;

import java.util.List;

import com.kh.team.domain.BidVo;
import com.kh.team.domain.ProductVo;

public interface ProductDao {
	// 상품 등록
	public void insertProduct() throws Exception;
	// 상품 수정
	public void updateProduct() throws Exception;
	// 상품 삭제
	public void deleteProduct() throws Exception;
	// 상품 목록 ( 경매 종료 )
	public List<ProductVo> endProduct(String p_state) throws Exception; 
	// 상품 목록 ( 프리미엄 )
	public List<ProductVo> premiumProduct(int p_value) throws Exception;
	// 상품 목록 ( 일반 )
	public List<ProductVo> normalProduct() throws Exception;
	// 응찰 내역
	public List<BidVo> bidList(String pno) throws Exception;
}
