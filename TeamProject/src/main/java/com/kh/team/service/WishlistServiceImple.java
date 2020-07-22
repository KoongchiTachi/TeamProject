package com.kh.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.WishlistVo;
import com.kh.team.persistence.WishlistDao;

@Service
public class WishlistServiceImple implements WishlistService {

	@Inject
	private WishlistDao wishlistDao;
	
	@Override
	public void insertWishlist(WishlistVo wishlistVo) throws Exception {
		wishlistDao.insertWishlist(wishlistVo);
	}
	
	@Override
	public List<WishlistVo> wishList(String m_id) throws Exception {
		return wishlistDao.wishList(m_id);
	}

	@Override
	public void deleteWishlist(int wno) throws Exception {
		wishlistDao.deleteWishlist(wno);
	}

	@Override
	public void deleteWishMulti(WishlistVo wnos) throws Exception {
		wishlistDao.deleteWishMulti(wnos);
	}


}
