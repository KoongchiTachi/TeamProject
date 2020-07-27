package com.kh.team.service;

import java.util.List;
import com.kh.team.domain.QnaVo;
import com.kh.team.domain.QreplyVo;

public interface QnaService {
	
	// QnA 질문 목록 - 회원
	public List<QnaVo> myQna(String m_id) throws Exception;
	
	// QnA 전체 질문 목록 - 관리자
	public List<QnaVo> qnaList() throws Exception;
	
	// 답변 목록
	public List<QreplyVo> qReplyList(int qno) throws Exception;
	
	// QnA 내용보기 - 관리자
	public QnaVo qnaRead(int qno) throws Exception;
		
	// QnA 입력
	public void qnaInsert(QnaVo qnaVo) throws Exception;
		
	// QnA 수정
	public void qnaUpdate(QnaVo qnaVo) throws Exception;
		
	// QnA 삭제
	public void qnaDelete(int qno) throws Exception;

}
