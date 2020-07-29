package com.kh.team.domain;

public class WishlistVo {

	private String pno;
	private String m_id;
	private int wno;
	private String p_img1;
	private String p_info;
	private int p_price;

	public String getPno() {
		return pno;
	}

	public void setPno(String pno) {
		this.pno = pno;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public int getWno() {
		return wno;
	}

	public void setWno(int wno) {
		this.wno = wno;
	}

	public String getP_info() {
		return p_info;
	}

	public void setP_info(String p_info) {
		this.p_info = p_info;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public String getP_img1() {
		return p_img1;
	}

	public void setP_img1(String p_img1) {
		this.p_img1 = p_img1;
	}

	@Override
	public String toString() {
		return "WishlistVo [pno=" + pno + ", m_id=" + m_id + ", wno=" + wno + ", p_img1=" + p_img1 + ", p_info="
				+ p_info + ", p_price=" + p_price + "]";
	}

}
