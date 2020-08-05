package com.kh.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.WishVo;
import com.kh.team.domain.WishlistPagingDto;
import com.kh.team.domain.WishlistVo;
import com.kh.team.persistence.WishlistDao;

@Service
public class WishlistServiceImple implements WishlistService {

	@Inject
	private WishlistDao wishlistDao;
	
	@Override
	public void insertWishlist(String pno, String m_id) throws Exception {
		wishlistDao.insertWishlist(pno, m_id);
	}
	
	@Override
	public List<WishlistVo> wishList(String m_id, int startRow, int endRow) throws Exception {
		return wishlistDao.wishList(m_id, startRow, endRow);
	}

	@Override
	public void deleteWishlist(int wno) throws Exception {
		wishlistDao.deleteWishlist(wno);
	}

	@Override
	public void deleteWishMulti(WishlistVo wnos) throws Exception {
		wishlistDao.deleteWishMulti(wnos);
	}

	@Override
	public int getCount(WishlistPagingDto wishlistPagingDto, String m_id) throws Exception {
		return wishlistDao.getCount(wishlistPagingDto, m_id);
	}

	@Override
	public WishVo getAttentionCheck(String pno, String m_id) throws Exception {
		return wishlistDao.getAttentionCheck(pno, m_id);
	}


}
