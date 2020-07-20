package com.kh.team.domain;

import java.sql.Date;

public class NoticeVo {
	private int nno;
	private String n_title;
	private String n_content;
	private Date n_date;
	private int view_cnt;

	public NoticeVo() {
		super(); 
	}

	public NoticeVo(int nno, String n_title, String n_content, Date n_date, int view_cnt) {
		super();
		this.nno = nno;
		this.n_title = n_title;
		this.n_content = n_content;
		this.n_date = n_date;
		this.view_cnt = view_cnt;
	}

	public int getNno() {
		return nno;
	}

	public void setNno(int nno) {
		this.nno = nno;
	}

	public String getN_title() {
		return n_title;
	}

	public void setN_title(String n_title) {
		this.n_title = n_title;
	}

	public String getN_content() {
		return n_content;
	}
 
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}

	public Date getN_date() {
		return n_date;
	}

	public void setN_date(Date n_date) {
		this.n_date = n_date;
	}

	public int getView_cnt() {
		return view_cnt;
	}

	public void setView_cnt(int view_cnt) {
		this.view_cnt = view_cnt;
	}
	
	@Override
	public String toString() {
		return "NoticeVo [nno=" + nno + ", n_title=" + n_title + ", n_content=" + n_content + ", n_date=" + n_date
				+ ", view_cnt=" + view_cnt + "]";
	}

}
