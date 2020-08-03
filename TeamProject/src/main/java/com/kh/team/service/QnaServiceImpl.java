package com.kh.team.service;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.kh.team.domain.QnaPagingDto;
import com.kh.team.domain.QnaVo;
import com.kh.team.domain.QreplyVo;
import com.kh.team.persistence.QnaDao;

@Service
public class QnaServiceImpl implements QnaService {
	
	@Inject
	private QnaDao qnaDao;
	
	// QnA 1:1문의 목록 - 회원
	@Override
	public List<QnaVo> myQna(String m_id) throws Exception {
		return qnaDao.myQna(m_id);
	}

	// QnA 1:1문의 목록 (페이징) - 관리자
	@Override
	public List<QnaVo> qnaList(QnaPagingDto qnaPagingDto) throws Exception {
		return qnaDao.qnaList(qnaPagingDto);
	}
	// 게시글 수
	@Override
	public int getCount(QnaPagingDto qnaPagingDto) throws Exception {
		return qnaDao.getCount(qnaPagingDto);
	}
	
	// QnA 1:1문의 답변 목록
	@Override
	public List<QreplyVo> qReplyList(int qno) throws Exception {
		return qnaDao.qReplyList(qno);
	}

	// QnA 1:1문의 조회 - 관리자
	@Override
	public QnaVo qnaRead(int qno) throws Exception {
		QnaVo qnaVo = qnaDao.qnaRead(qno);
		return qnaVo;
	}

	// QnA 1:1문의 입력 - 회원
	@Transactional
	@Override
	public void qnaInsert(QnaVo qnaVo) throws Exception {
		int qno = qnaDao.getNextVal();
		qnaVo.setQno(qno);
		String[] files = qnaVo.getFiles();
		qnaDao.qnaInsert(qnaVo);
		if (files != null) {
			for (String file_name : files) {
				qnaDao.insertQUpload(file_name, qno);
			}
		}
	}
	
	// QnA 1:1문의 답변 입력 - 관리자
	@Transactional
	@Override
	public void qReplyInsert(QreplyVo qreplyVo) throws Exception {
		int qno = qreplyVo.getQno();
		String q_answer = qreplyVo.getQ_answer();
		qnaDao.qReplyInsert(qreplyVo);
		qnaDao.qnaUpdate(q_answer, qno);
	}

	// QnA 1:1문의 답변 수정 - 관리자
	@Override
	public void qReplyUpdate(QreplyVo qreplyVo) throws Exception {
		qnaDao.qReplyUpdate(qreplyVo);
	}

	// QnA 1:1문의 삭제 - 회원
	@Override
	public void qnaDelete(int qno) throws Exception {
		qnaDao.qnaDelete(qno);
	}

	// QnA 1:1문의 삭제 (체크박스) - 관리자
	@Override
	public void qnaDeleteChk(QnaVo qnos) throws Exception {
		qnaDao.qnaDeleteChk(qnos);
	}

	// QnA 1:1문의 첨부파일 목록
	@Override
	public List<QnaVo> qUploadList(int qno) throws Exception {
		return qnaDao.qUploadList(qno);
	}

}
