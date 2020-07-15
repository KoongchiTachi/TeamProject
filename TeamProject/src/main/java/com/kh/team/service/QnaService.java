package com.kh.team.service;

import java.util.List;
import com.kh.team.domain.QnaVo;

public interface QnaService {
	
	// QnA 목록
	public List<QnaVo> qnaList() throws Exception;
		
	// QnA 내용보기
	public QnaVo qnaRead(int qno) throws Exception;
		
	// QnA 입력
	public void insertQna(QnaVo qnaVo) throws Exception;
		
	// QnA 수정
	public void updateQna(QnaVo qnaVo) throws Exception;
		
	// QnA 삭제
	public void deleteQna(int qno) throws Exception;

}
