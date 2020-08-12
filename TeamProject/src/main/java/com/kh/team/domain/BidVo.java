package com.kh.team.domain;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonFormat.Shape;

public class BidVo {
	private int bno;
	private String m_id;
	private int b_price;
	@JsonFormat(shape = Shape.STRING, pattern = "YY.MM.dd HH:mm:ss", timezone = "GMT+9")
	private Timestamp b_date;
	private String b_note;
	private String pno;
	private String p_img1;
	private String p_info;
	private int p_price;
	private String s_name;
	private String p_name;
	private String b_name;
	private int g_discount;

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public int getB_price() {
		return b_price;
	}

	public void setB_price(int b_price) {
		this.b_price = b_price;
	}

	public Timestamp getB_date() {
		return b_date;
	}

	public void setB_date(Timestamp b_date) {
		this.b_date = b_date;
	}

	public String getB_note() {
		return b_note;
	}

	public void setB_note(String b_note) {
		this.b_note = b_note;
	}

	public String getPno() {
		return pno;
	}

	public void setPno(String pno) {
		this.pno = pno;
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

	public String getS_name() {
		return s_name;
	}

	public void setS_name(String s_name) {
		this.s_name = s_name;
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

	public String getB_name() {
		return b_name;
	}

	public void setB_name(String b_name) {
		this.b_name = b_name;
	}

	public int getG_discount() {
		return g_discount;
	}

	public void setG_discount(int g_discount) {
		this.g_discount = g_discount;
	}

	@Override
	public String toString() {
		return "BidVo [bno=" + bno + ", m_id=" + m_id + ", b_price=" + b_price + ", b_date=" + b_date + ", b_note="
				+ b_note + ", pno=" + pno + ", p_img1=" + p_img1 + ", p_info=" + p_info + ", p_price=" + p_price
				+ ", s_name=" + s_name + ", p_name=" + p_name + ", b_name=" + b_name + ", g_discount=" + g_discount
				+ "]";
	}

}
