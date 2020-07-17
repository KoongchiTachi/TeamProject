package com.kh.team.domain;

import java.sql.Timestamp;

public class BidVo {
	private int bno;
	private String m_id;
	private int b_price;
	private Timestamp b_date;
	private String b_note;
	private String pno;

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

	@Override
	public String toString() {
		return "BidVo [bno=" + bno + ", m_id=" + m_id + ", b_price=" + b_price + ", b_date=" + b_date + ", b_note="
				+ b_note + ", pno=" + pno + "]";
	}

}
