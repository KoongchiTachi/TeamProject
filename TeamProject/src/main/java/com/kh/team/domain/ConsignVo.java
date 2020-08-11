package com.kh.team.domain;

import java.sql.Timestamp;

public class ConsignVo {
	private String csno;
	private String m_id;
	private String cs_name;
	private int cs_price;
	private int cs_start;
	private String cs_info;
	private String cs_period;
	private String cs_img;
	private String cs_etc;
	private String cs_state;
	private Timestamp cs_date;
	private String p_name;

	public String getCsno() {
		return csno;
	}

	public void setCsno(String csno) {
		this.csno = csno;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getCs_name() {
		return cs_name;
	}

	public void setCs_name(String cs_name) {
		this.cs_name = cs_name;
	}

	public int getCs_price() {
		return cs_price;
	}

	public void setCs_price(int cs_price) {
		this.cs_price = cs_price;
	}

	public int getCs_start() {
		return cs_start;
	}

	public void setCs_start(int cs_start) {
		this.cs_start = cs_start;
	}

	public String getCs_info() {
		return cs_info;
	}

	public void setCs_info(String cs_info) {
		this.cs_info = cs_info;
	}

	public String getCs_period() {
		return cs_period;
	}

	public void setCs_period(String cs_period) {
		this.cs_period = cs_period;
	}

	public String getCs_img() {
		return cs_img;
	}

	public void setCs_img(String cs_img) {
		this.cs_img = cs_img;
	}

	public String getCs_etc() {
		return cs_etc;
	}

	public void setCs_etc(String cs_etc) {
		this.cs_etc = cs_etc;
	}

	public String getCs_state() {
		return cs_state;
	}

	public void setCs_state(String cs_state) {
		this.cs_state = cs_state;
	}

	public Timestamp getCs_date() {
		return cs_date;
	}

	public void setCs_date(Timestamp cs_date) {
		this.cs_date = cs_date;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	@Override
	public String toString() {
		return "ConsignVo [csno=" + csno + ", m_id=" + m_id + ", cs_name=" + cs_name + ", cs_price=" + cs_price
				+ ", cs_start=" + cs_start + ", cs_info=" + cs_info + ", cs_period=" + cs_period + ", cs_img=" + cs_img
				+ ", cs_etc=" + cs_etc + ", cs_state=" + cs_state + ", cs_date=" + cs_date + ", p_name=" + p_name + "]";
	}

}
