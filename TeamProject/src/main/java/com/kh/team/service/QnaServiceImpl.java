package com.kh.team.service;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.kh.team.domain.QnaVo;
import com.kh.team.domain.QreplyVo;
import com.kh.team.persistence.QnaDao;

@Service
public class QnaServiceImpl implements QnaService {
	
	@Inject
	private QnaDao qnaDao;
	
	// QnA 목록 - 회원
	@Override
	public List<QnaVo> myQna(String m_id) throws Exception {
		return qnaDao.myQna(m_id);
	}
	
	// QnA 목록 - 관리자
	@Override
	public List<QnaVo> qnaList() throws Exception {
		List<QnaVo> list = qnaDao.qnaList();
		return list;
	}
	
	// QnA 답변 목록
	@Override
	public List<QreplyVo> qReplyList(int qno) throws Exception {
		return qnaDao.qReplyList(qno);
	}


	// QnA 내용보기
	@Override
	public QnaVo qnaRead(int qno) throws Exception {
		QnaVo qnaVo = qnaDao.qnaRead(qno);
		return qnaVo;
	}

	// QnA 입력
	@Transactional
	@Override
	public void insertQna(QnaVo qnaVo) throws Exception {
		int qno = qnaDao.getNextVal();
		qnaVo.setQno(qno);
		
		String[] files = qnaVo.getFiles();
		if (files == null) {
			qnaDao.insertQna(qnaVo);
			return;
		}
		for (String file_name : files) {
			qnaDao.insertQUpload(file_name, qno);
		}
	}

	// QnA 수정 - 관리자
	@Override
	public void updateQna(QnaVo qnaVo) throws Exception {
		qnaDao.updateQna(qnaVo);
	}

	// QnA 삭제 - 관리자
	@Override
	public void deleteQna(int qno) throws Exception {
		qnaDao.deleteQna(qno);
	}

}
