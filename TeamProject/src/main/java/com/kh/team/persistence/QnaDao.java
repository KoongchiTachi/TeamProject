package com.kh.team.persistence;

import java.util.List;
import com.kh.team.domain.QnaPagingDto;
import com.kh.team.domain.QnaVo;
import com.kh.team.domain.QreplyVo;

public interface QnaDao {
	
	// nextval
	public int getNextVal() throws Exception;
	
	// QnA 1:1문의 목록 - 회원
	public List<QnaVo> myQna(String m_id) throws Exception;
	
	// QnA 1:1문의 목록 (페이징) - 관리자
	public List<QnaVo> qnaList(QnaPagingDto qnaPagingDto) throws Exception;
	// 게시글 수
	public int getCount(QnaPagingDto qnaPagingDto) throws Exception;
	
	// QnA 1:1문의 답변 목록
	public List<QreplyVo> qReplyList(int qno) throws Exception;
	
	// QnA 1:1문의 조회 - 관리자
	public QnaVo qnaRead(int qno) throws Exception;
		
	// QnA 1:1문의 입력 - 회원
	public void qnaInsert(QnaVo qnaVo) throws Exception;
	
	// QnA 1:1문의 답변 입력 - 관리자
	public void qReplyInsert(QreplyVo qreplyVo) throws Exception;
	
	// QnA 1:1문의 답변 상태 수정 - 관리자
	public void qnaUpdate(String q_answer, int qno) throws Exception;
		
	// QnA 1:1문의 답변 수정 - 관리자
	public void qReplyUpdate(QreplyVo qreplyVo) throws Exception;
	
	// QnA 1:1문의 삭제 - 회원
	public void qnaDelete(int qno) throws Exception;
	
	// QnA 1:1문의 삭제 (체크박스) - 관리자
	public void qnaDeleteChk(QnaVo qnos) throws Exception;
	
	// QnA 1:1문의 첨부파일 추가
	public void insertQUpload(String file_name, int qno) throws Exception;
	
	// QnA 1:1문의 첨부파일 목록
	public List<QnaVo> qUploadList(int qno) throws Exception;
		
}
