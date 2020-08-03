package com.kh.team.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.kh.team.domain.QnaPagingDto;
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
	
	// QnA 1:1문의 목록 - 회원
	@Override
	public List<QnaVo> myQna(String m_id) throws Exception {
		return sqlSession.selectList(NAMESPACE + "myQna", m_id);
	}
	
	// QnA 1:1문의 목록 (페이징) - 관리자
	@Override
	public List<QnaVo> qnaList(QnaPagingDto qnaPagingDto) throws Exception {
		List<QnaVo> list = sqlSession.selectList(NAMESPACE + "qnaList", qnaPagingDto);
		return list;
	}
	// 게시글 수
	@Override
	public int getCount(QnaPagingDto qnaPagingDto) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getCount", qnaPagingDto);
	}
	
	// QnA 1:1문의 답변 목록
	@Override
	public List<QreplyVo> qReplyList(int qno) throws Exception {
		return sqlSession.selectList(NAMESPACE + "qReplyList", qno);
	}

	// QnA  1:1문의 조회 - 관리자 
	@Override
	public QnaVo qnaRead(int qno) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "qnaRead", qno);
	}

	// QnA 1:1문의 입력 - 회원
	@Override
	public void qnaInsert(QnaVo qnaVo) throws Exception {
		sqlSession.insert(NAMESPACE + "qnaInsert", qnaVo);
	}
	
	// QnA 1:1문의 답변 입력 - 관리자
	@Override
	public void qReplyInsert(QreplyVo qreplyVo) throws Exception {
		sqlSession.insert(NAMESPACE + "qReplyInsert", qreplyVo);
	}
	
	// QnA 1:1문의 답변 상태 수정 - 관리자
	@Override
	public void qnaUpdate(String q_answer, int qno) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("q_answer", q_answer);
		paramMap.put("qno", qno);
		System.out.println("q_answer:" + q_answer);
		System.out.println("qno:" + qno);
		sqlSession.update(NAMESPACE + "qnaUpdate", paramMap);
	}

	// QnA  1:1문의 답변 수정 - 관리자 
	@Override
	public void qReplyUpdate(QreplyVo qreplyVo) throws Exception {
		sqlSession.update(NAMESPACE + "qReplyUpdate", qreplyVo);
	}

	// QnA 1:1문의 삭제 - 회원
	@Override
	public void qnaDelete(int qno) throws Exception {
		sqlSession.delete(NAMESPACE + "qnaDelete", qno);
	}
	
	// QnA 1:1문의 삭제 (체크박스) - 관리자
	@Override
	public void qnaDeleteChk(QnaVo qnos) throws Exception {
		sqlSession.delete(NAMESPACE + "qnaDeleteChk", qnos);
	}
	
	// QnA 첨부파일 추가
	@Override
	public void insertQUpload(String file_name, int qno) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("file_name", file_name);
		paramMap.put("qno", qno);
		sqlSession.insert(NAMESPACE + "insertQUpload", paramMap);
	}

	// QnA 첨부파일 목록
	@Override
	public List<QnaVo> qUploadList(int qno) throws Exception {
		return sqlSession.selectList(NAMESPACE + "qUploadList", qno);
	}

}