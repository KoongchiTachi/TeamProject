package com.kh.team.domain;

import java.sql.Timestamp;

public class WishVo {
	private String pno;
	private String m_id;
	private int wno;

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

	@Override
	public String toString() {
		return "WishVo [pno=" + pno + ", m_id=" + m_id + ", wno=" + wno + "]";
	}

}
