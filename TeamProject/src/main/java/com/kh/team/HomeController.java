package com.kh.team;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.domain.AdminBannerVo;
import com.kh.team.domain.ProductVo;
import com.kh.team.persistence.ProductDao;
import com.kh.team.service.BannerService;

@Controller
public class HomeController/* implements Runnable*/ {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	private ProductDao productDao;
	
	@Inject
	private BannerService bannerService;
	
	private boolean isCheckP_until = false;
	
	private List<Timestamp> p_untilList;
	
	Thread th = new Thread(new Runnable() {
		@SuppressWarnings("deprecation")
		@Override
		public void run() {
			while (true) {
				try {
					for (Timestamp time : p_untilList) {
						long p_until = time.getTime();
						long now = new Date().getTime();
						String pno = productDao.findPno(time);
						if (p_until < now) {
							productDao.updateP_state("s02");
							productDao.bidWhether(pno);
							String m_id = productDao.topBidding(pno);
							if (m_id != null) productDao.matchingBidding(m_id, pno);
							p_untilList = productDao.selectP_until();
							System.out.println("마감상품 변경");
							break;
						}
					} th.sleep(1000);
				} catch (Exception e1) {
					e1.printStackTrace();
				} 
			} 
		}
	}); 
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception {
		logger.info("정상 작동됨.", locale);
		if (isCheckP_until == false) {
			p_untilList = productDao.selectP_until();
			th.start();
			isCheckP_until = true;
		}
		List<AdminBannerVo> list = bannerService.bannerList();
		int count = bannerService.getBannerCount();
		List<ProductVo> items = bannerService.bannerItems();
		model.addAttribute("items", items);
		model.addAttribute("list", list);
		model.addAttribute("count", count);
		return "home";
	}
}
