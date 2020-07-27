package com.kh.team.persistence;

import java.util.List;
import com.kh.team.domain.QnaVo;
import com.kh.team.domain.QreplyVo;

public interface QnaDao {
	
	// nextval
	public int getNextVal() throws Exception;
	
	// QnA 목록 - 회원
	public List<QnaVo> myQna(String m_id) throws Exception;
	
	// 답변 목록
	public List<QreplyVo> qReplyList(int qno) throws Exception;
	
	// 답변 갯수
	public int countReply(int qno) throws Exception;

	// QnA 목록 - 관리자
	public List<QnaVo> qnaList() throws Exception;
		
	// QnA 내용보기
	public QnaVo qnaRead(int qno) throws Exception;
		
	// QnA 입력
	public void qnaInsert(QnaVo qnaVo) throws Exception;
		
	// QnA 수정
	public void qnaUpdate(QnaVo qnaVo) throws Exception;
		
	// QnA 삭제
	public void qnaDelete(int qno) throws Exception;
	
	// 첨부파일 추가
	public void insertQUpload(String file_name, int qno) throws Exception;
		
}
