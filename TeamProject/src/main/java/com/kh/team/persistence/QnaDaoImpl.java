package com.kh.team.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.kh.team.domain.QnaVo;
import com.kh.team.domain.QreplyVo;

@Repository
public class QnaDaoImpl implements QnaDao {
	
	private static final String NAMESPACE = "mappers.qna-mapper.";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public int getNextVal() throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getNextVal");
	} 
	
	// QnA 질문 목록 - 회원
	@Override
	public List<QnaVo> myQna(String m_id) throws Exception {
		return sqlSession.selectList(NAMESPACE + "myQna", m_id);
	}
	
	// QnA 전체 질문 목록 - 관리자
	@Override
	public List<QnaVo> qnaList() throws Exception {
		return sqlSession.selectList(NAMESPACE + "qnaList");
	}
	
	// QnA 답변 목록
	@Override
	public List<QreplyVo> qReplyList(int qno) throws Exception {
		return sqlSession.selectList(NAMESPACE + "qReplyList", qno);
	}

	// QnA 내용보기
	@Override
	public QnaVo qnaRead(int qno) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "qnaRead", qno);
	}

	// QnA 입력
	@Override
	public void qnaInsert(QnaVo qnaVo) throws Exception {
		sqlSession.insert(NAMESPACE + "qnaInsert", qnaVo);
	}

	// QnA 수정
	@Override
	public void qnaUpdate(QnaVo qnaVo) throws Exception {
		sqlSession.update(NAMESPACE + "qnaUpdate", qnaVo);
	}

	// QnA 삭제
	@Override
	public void qnaDelete(int qno) throws Exception {
		sqlSession.delete(NAMESPACE + "qnaDelete", qno);
	}

	// QnA 첨부파일 추가
	@Override
	public void insertQUpload(String file_name, int qno) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("file_name", file_name);
		paramMap.put("qno", qno);
		sqlSession.insert(NAMESPACE + "insertQUpload", paramMap);
	}

}