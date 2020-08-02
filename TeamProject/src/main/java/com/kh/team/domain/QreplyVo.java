package com.kh.team.domain;

import java.sql.Timestamp;

public class QreplyVo {
	private int qrno;
	private int qno;
	private String q_reply;
	private Timestamp qr_date;
	private String q_answer;

	public QreplyVo() {
		super();
	}

	public QreplyVo(int qrno, int qno, String q_reply, Timestamp qr_date, String q_answer) {
		super();
		this.qrno = qrno;
		this.qno = qno;
		this.q_reply = q_reply;
		this.qr_date = qr_date;
		this.q_answer = q_answer;
	}

	public int getQrno() {
		return qrno;
	}

	public void setQrno(int qrno) {
		this.qrno = qrno;
	}

	public int getQno() {
		return qno;
	}

	public void setQno(int qno) {
		this.qno = qno;
	}

	public String getQ_reply() {
		return q_reply;
	}

	public void setQ_reply(String q_reply) {
		this.q_reply = q_reply;
	}

	public Timestamp getQr_date() {
		return qr_date;
	}

	public void setQr_date(Timestamp qr_date) {
		this.qr_date = qr_date;
	}

	public String getQ_answer() {
		return q_answer;
	}

	public void setQ_answer(String q_answer) {
		this.q_answer = q_answer;
	}

	@Override
	public String toString() {
		return "QreplyVo [qrno=" + qrno + ", qno=" + qno + ", q_reply=" + q_reply + ", qr_date=" + qr_date
				+ ", q_answer=" + q_answer + "]";
	}
	
}
