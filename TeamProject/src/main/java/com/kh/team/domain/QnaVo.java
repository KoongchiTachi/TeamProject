package com.kh.team.domain;

import java.sql.Timestamp;
import java.util.Arrays;

public class QnaVo {
	private int qno;
	private String m_id;
	private String q_kind;
	private String q_title;
	private String q_content;
	private Timestamp q_date;
	private String q_answer;
	private String[] files;
	private String m_name;
	private String file_name;
	
	public QnaVo() {
		super();
	}

	public QnaVo(int qno, String m_id, String q_kind, String q_title, String q_content, Timestamp q_date,
			String q_answer, String[] files, String m_name, String file_name) {
		super();
		this.qno = qno;
		this.m_id = m_id;
		this.q_kind = q_kind;
		this.q_title = q_title;
		this.q_content = q_content;
		this.q_date = q_date;
		this.q_answer = q_answer;
		this.files = files;
		this.m_name = m_name;
		this.file_name = file_name;
	}

	public int getQno() {
		return qno;
	}

	public void setQno(int qno) {
		this.qno = qno;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getQ_kind() {
		return q_kind;
	}

	public void setQ_kind(String q_kind) {
		this.q_kind = q_kind;
	}

	public String getQ_title() {
		return q_title;
	}

	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}

	public String getQ_content() {
		return q_content;
	}

	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}

	public Timestamp getQ_date() {
		return q_date;
	}

	public void setQ_date(Timestamp q_date) {
		this.q_date = q_date;
	}

	public String getQ_answer() {
		return q_answer;
	}

	public void setQ_answer(String q_answer) {
		this.q_answer = q_answer;
	}

	public String[] getFiles() {
		return files;
	}

	public void setFiles(String[] files) {
		this.files = files;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	@Override
	public String toString() {
		return "QnaVo [qno=" + qno + ", m_id=" + m_id + ", q_kind=" + q_kind + ", q_title=" + q_title + ", q_content="
				+ q_content + ", q_date=" + q_date + ", q_answer=" + q_answer + ", files=" + Arrays.toString(files)
				+ ", m_name=" + m_name + ", file_name=" + file_name + "]";
	}
	
}