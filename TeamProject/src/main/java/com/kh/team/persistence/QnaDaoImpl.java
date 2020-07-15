package com.kh.team.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.kh.team.domain.QnaVo;

@Repository
public class QnaDaoImpl implements QnaDao {
	
	private static final String NAMESPACE = "mappers.qna-mapper.";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public int getNextVal() throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getNextVal");
	}

	// QnA 목록
	@Override
	public List<QnaVo> qnaList() throws Exception {
		return sqlSession.selectList(NAMESPACE + "qnaList");
	}

	// QnA 내용보기
	@Override
	public QnaVo qnaRead(int qno) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "qnaRead", qno);
	}

	// QnA 입력
	@Override
	public void insertQna(QnaVo qnaVo) throws Exception {
		sqlSession.insert(NAMESPACE + "insertQna", qnaVo);
	}

	// QnA 수정
	@Override
	public void updateQna(QnaVo qnaVo) throws Exception {
		sqlSession.update(NAMESPACE + "updateQna", qnaVo);
	}

	// QnA 삭제
	@Override
	public void deleteQna(int qno) throws Exception {
		sqlSession.delete(NAMESPACE + "deleteQna", qno);
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
