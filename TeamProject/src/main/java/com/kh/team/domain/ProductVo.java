package com.kh.team.domain;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonFormat.Shape;

public class ProductVo {

	private String pno;
	private String m_id;
	private String p_name;
	private String p_img;
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

	public String getP_img() {
		return p_img;
	}

	public void setP_img(String p_img) {
		this.p_img = p_img;
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

	@Override
	public String toString() {
		return "ProductVo [pno=" + pno + ", m_id=" + m_id + ", p_name=" + p_name + ", p_img=" + p_img + ", s_price="
				+ s_price + ", p_price=" + p_price + ", p_info=" + p_info + ", p_brand=" + p_brand + ", p_until="
				+ p_until + ", p_progress=" + p_progress + ", p_state=" + p_state + ", b_name=" + b_name + ", bid_cnt="
				+ bid_cnt + "]";
	}

}
