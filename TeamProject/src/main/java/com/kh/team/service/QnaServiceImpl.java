package com.kh.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.QnaVo;
import com.kh.team.persistence.QnaDao;

@Service
public class QnaServiceImpl implements QnaService {
	
	@Inject
	private QnaDao qnaDao;

	// QnA 목록
	@Override
	public List<QnaVo> qnaList() throws Exception {
		List<QnaVo> list = qnaDao.qnaList();
		return list;
	}

	// QnA 내용보기
	@Override
	public QnaVo qnaRead(int qno) throws Exception {
		QnaVo qnaVo = qnaDao.qnaRead(qno);
		return qnaVo;
	}

	// QnA 입력
	@Override
	public void insertQna(QnaVo qnaVo) throws Exception {
		int qno = qnaDao.getNextVal();
		qnaDao.insertQna(qnaVo);
		
		String[] files = qnaVo.getFiles();
		for (String file_name : files) {
			qnaDao.insertQUpload(file_name, qno);
		}
	}

	// QnA 수정
	@Override
	public void updateQna(QnaVo qnaVo) throws Exception {
		qnaDao.updateQna(qnaVo);
	}

	// QnA 삭제
	@Override
	public void deleteQna(int qno) throws Exception {
		qnaDao.deleteQna(qno);
	}

}
