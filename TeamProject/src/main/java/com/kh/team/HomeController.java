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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.persistence.ProductDao;

@Controller
public class HomeController/* implements Runnable*/ {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	private ProductDao productDao;
	
	private boolean isCheckP_until = false;
	
	private List<Timestamp> p_untilList;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale) throws Exception {
		logger.info("정상 작동됨.", locale);
		if (isCheckP_until == false) {
			p_untilList = productDao.selectP_until();
//			System.out.println("p_untilList"+ p_untilList);
			Thread th = new Thread(new Runnable() {
				@Override
				public void run() {
					while (true) {
						try {
							Thread.sleep(10000);
							for (Timestamp time : p_untilList) {
								long p_until = time.getTime();
								long now = new Date().getTime();
								String pno = productDao.findPno(time);
								if (p_until < now) {
									productDao.updateP_state("s02");
									productDao.bidWhether(pno);
									String m_id = productDao.topBidding(pno);
									System.out.println(("time : " + time));
									System.out.println("pno : " + pno);
									System.out.println("m_id : " + m_id);
									if (m_id != null) productDao.matchingBidding(m_id, pno);
									System.out.println("m_ id , pno : " + m_id + "/" + pno);
									p_untilList = productDao.selectP_until();
									System.out.println("p_until Changed : p_untilList:" + p_untilList);
									break;
								}
							}
						} catch (Exception e1) {
							e1.printStackTrace();
						}
					}
				}
			});
			th.start();
			isCheckP_until = true;
		}
		return "home";
	}
}
