package com.kh.team.domain;

public class FaqVo {
	private int fno;
	private String f_title;
	private String f_content;
	private String f_cate;

	public FaqVo() {
		super();
	}

	public FaqVo(int fno, String f_title, String f_content, String f_cate) {
		super();
		this.fno = fno;
		this.f_title = f_title;
		this.f_content = f_content;
		this.f_cate = f_cate;
	}

	public int getFno() {
		return fno;
	}

	public void setFno(int fno) {
		this.fno = fno;
	}

	public String getF_title() {
		return f_title;
	}

	public void setF_title(String f_title) {
		this.f_title = f_title;
	}

	public String getF_content() {
		return f_content;
	}

	public void setF_content(String f_content) {
		this.f_content = f_content;
	}

	public String getF_cate() {
		return f_cate;
	}

	public void setF_cate(String f_cate) {
		this.f_cate = f_cate;
	}

	@Override
	public String toString() {
		return "FaqVo [fno=" + fno + ", f_title=" + f_title + ", f_content=" + f_content + ", f_cate=" + f_cate + "]";
	}

}
