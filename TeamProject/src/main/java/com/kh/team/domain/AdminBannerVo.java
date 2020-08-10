package com.kh.team.domain;

public class AdminBannerVo {
	private String b_name;
	private int bnno;
	private String bn_img;

	public String getB_name() {
		return b_name;
	}

	public void setB_name(String b_name) {
		this.b_name = b_name;
	}

	public int getBnno() {
		return bnno;
	}

	public void setBnno(int bnno) {
		this.bnno = bnno;
	}

	public String getBn_img() {
		return bn_img;
	}

	public void setBn_img(String bn_img) {
		this.bn_img = bn_img;
	}

	@Override
	public String toString() {
		return "AdminBannerVo [b_name=" + b_name + ", bnno=" + bnno + ", bn_img=" + bn_img + "]";
	}

}
