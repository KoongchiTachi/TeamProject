package com.kh.team.domain;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonFormat.Shape;

public class ProductVo {

	private String pno;
	private String m_id;
	private String p_name;
	private String p_img1;
	private String p_img2;
	private String p_img3;
	private String p_img4;
	private int s_price;
	private int p_price;
	private String p_info;
	private String p_brand;
	@JsonFormat(shape = Shape.STRING, pattern = "dd HH:mm:ss", timezone = "GMT+9")
	private Timestamp p_until;
	private String p_progress;
	private String p_state;
	private String b_name;
	private int bid_cnt;
	private String p_size;

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

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_img1() {
		return p_img1;
	}

	public void setP_img1(String p_img1) {
		this.p_img1 = p_img1;
	}

	public String getP_img2() {
		return p_img2;
	}

	public void setP_img2(String p_img2) {
		this.p_img2 = p_img2;
	}

	public String getP_img3() {
		return p_img3;
	}

	public void setP_img3(String p_img3) {
		this.p_img3 = p_img3;
	}

	public String getP_img4() {
		return p_img4;
	}

	public void setP_img4(String p_img4) {
		this.p_img4 = p_img4;
	}

	public int getS_price() {
		return s_price;
	}

	public void setS_price(int s_price) {
		this.s_price = s_price;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public String getP_info() {
		return p_info;
	}

	public void setP_info(String p_info) {
		this.p_info = p_info;
	}

	public String getP_brand() {
		return p_brand;
	}

	public void setP_brand(String p_brand) {
		this.p_brand = p_brand;
	}

	public Timestamp getP_until() {
		return p_until;
	}

	public void setP_until(Timestamp p_until) {
		this.p_until = p_until;
	}

	public String getP_progress() {
		return p_progress;
	}

	public void setP_progress(String p_progress) {
		this.p_progress = p_progress;
	}

	public String getP_state() {
		return p_state;
	}

	public void setP_state(String p_state) {
		this.p_state = p_state;
	}

	public String getB_name() {
		return b_name;
	}

	public void setB_name(String b_name) {
		this.b_name = b_name;
	}

	public int getBid_cnt() {
		return bid_cnt;
	}

	public void setBid_cnt(int bid_cnt) {
		this.bid_cnt = bid_cnt;
	}

	public String getP_size() {
		return p_size;
	}

	public void setP_size(String p_size) {
		this.p_size = p_size;
	}

	@Override
	public String toString() {
		return "ProductVo [pno=" + pno + ", m_id=" + m_id + ", p_name=" + p_name + ", p_img1=" + p_img1 + ", p_img2="
				+ p_img2 + ", p_img3=" + p_img3 + ", p_img4=" + p_img4 + ", s_price=" + s_price + ", p_price=" + p_price
				+ ", p_size=" + p_size + ", p_info=" + p_info + ", p_brand=" + p_brand + ", p_until=" + p_until
				+ ", p_progress=" + p_progress + ", p_state=" + p_state + ", b_name=" + b_name + ", bid_cnt=" + bid_cnt
				+ "]";
	}

}
