package com.kh.team.persistence;

import java.sql.Timestamp;
import java.util.List;

import com.kh.team.domain.BidVo;
import com.kh.team.domain.ProductVo;
import com.kh.team.domain.WishVo;

public interface ProductDao {
	// 상품 등록
	public void insertProduct() throws Exception;
	// 상품 수정
	public void updateProduct(String pno) throws Exception;
	// 상품 삭제
	public void deleteProduct() throws Exception;
	// 상품 내용
	public ProductVo selectByPno(String pno) throws Exception;
	// 상품 응찰 횟수
	public int bidCountByPno(String pno) throws Exception;
	// 상품 목록 (경매 종료)
	public List<ProductVo> endProduct(String p_state) throws Exception; 
	// 상품 목록 (프리미엄)
	public List<ProductVo> premiumProduct(int p_value) throws Exception;
	// 상품 목록 (일반)
	public List<ProductVo> normalProduct(int p_value) throws Exception;
	// 관심상품 목록
	public List<WishVo> attentionItems(String m_id) throws Exception;
	// 현재가 변경 (응찰)
	public void updateP_price(int b_price, String pno) throws Exception;
	// 응찰 내역
	public List<BidVo> bidList(String pno) throws Exception;
	// 경매 종료 ( 시간 마감 )
	public void updateP_state(String p_state) throws Exception;
	// 경매 진행 상태 ( 유찰 / 낙찰 )
	public void bidWhether(String pno) throws Exception;
	// 최고 입찰자 찾기 ( 응찰 목록 )
	public String topBidding(String pno) throws Exception;
	// 낙찰자 선정 ( 상품 )
	public void matchingBidding(String m_id,String pno) throws Exception;
	// 실시간 날짜 업데이트
	public List<Timestamp> selectP_until() throws Exception;
	// 마감된 상품 번호 조회 ( 날짜 )
	public String findPno(Timestamp time) throws Exception;
	// 최근 등록 상품 ( 5개 )
	public List<ProductVo> bannerItems() throws Exception;
	// 마감 확인
	public String checkstate(String pno) throws Exception;
}
