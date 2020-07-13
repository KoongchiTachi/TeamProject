package com.kh.team.domain;

import java.sql.Timestamp;

public class MemberVo {
	
	private String m_id;
	private String m_pw;
	private String m_name;
	private int m_phone;
	private String m_address;
	private String m_account;
	private String m_bank;
	private String m_email;
	private Timestamp join_date;
	private String m_grade;
	private int m_trade;

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_pw() {
		return m_pw;
	}

	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public int getM_phone() {
		return m_phone;
	}

	public void setM_phone(int m_phone) {
		this.m_phone = m_phone;
	}

	public String getM_address() {
		return m_address;
	}

	public void setM_address(String m_address) {
		this.m_address = m_address;
	}

	public String getM_account() {
		return m_account;
	}

	public void setM_account(String m_account) {
		this.m_account = m_account;
	}

	public String getM_bank() {
		return m_bank;
	}

	public void setM_bank(String m_bank) {
		this.m_bank = m_bank;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public Timestamp getJoin_date() {
		return join_date;
	}

	public void setJoin_date(Timestamp join_date) {
		this.join_date = join_date;
	}

	public String getM_grade() {
		return m_grade;
	}

	public void setM_grade(String m_grade) {
		this.m_grade = m_grade;
	}

	public int getM_trade() {
		return m_trade;
	}

	public void setM_trade(int m_trade) {
		this.m_trade = m_trade;
	}

	@Override
	public String toString() {
		return "MemberVo [m_id=" + m_id + ", m_pw=" + m_pw + ", m_name=" + m_name + ", m_phone=" + m_phone
				+ ", m_address=" + m_address + ", m_account=" + m_account + ", m_bank=" + m_bank + ", m_email="
				+ m_email + ", join_date=" + join_date + ", m_grade=" + m_grade + ", m_trade=" + m_trade + "]";
	}

}
