package com.kh.team.persistence;

import java.util.List;
import com.kh.team.domain.QnaVo;

public interface QnaDao {
	
	// nextval
	public int getNextVal() throws Exception;

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
	
	// 첨부파일 추가
	public void insertQUpload(String file_name, int qno) throws Exception;
		
}
