package com.kh.team.persistence;

import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.kh.team.domain.NoticePagingDto;
import com.kh.team.domain.NoticeVo;

@Repository
public class NoticeDaoImpl implements NoticeDao {
	
	private static final String NAMESPACE = "mappers.notice-mapper.";

	@Inject
	private SqlSession sqlSession;
	
	// 공지사항 목록 (페이징)
	@Override
	public List<NoticeVo> noticeList(NoticePagingDto noticePagingDto) throws Exception {
		List<NoticeVo> list = sqlSession.selectList(NAMESPACE + "noticeList", noticePagingDto);
		return list;
	}

	// 게시글 수
	@Override
	public int getCount(NoticePagingDto noticePagingDto) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getCount", noticePagingDto);
	}
  
	// 공지사항 내용보기
	@Override
	public NoticeVo noticeRead(int nno) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "noticeRead", nno);
	}

	// 공지사항 입력 - 관리자
	@Override
	public void noticeInsert(NoticeVo noticeVo) throws Exception {
		sqlSession.insert(NAMESPACE + "noticeInsert", noticeVo);
	}

	// 공지사항 수정 - 관리자
	@Override
	public void noticeUpdate(NoticeVo noticeVo) throws Exception {
		sqlSession.update(NAMESPACE + "noticeUpdate", noticeVo);
	}

	// 공지사항 삭제 - 관리자
	@Override
	public void noticeDelete(int nno) throws Exception {
		sqlSession.delete(NAMESPACE + "noticeDelete", nno);
	}
	
	// 공지사항 삭제 (체크박스) - 관리자
	@Override
	public void noticeDeleteChk(NoticeVo nnos) throws Exception {
		sqlSession.delete(NAMESPACE + "noticeDeleteChk", nnos);
	}
	
	// 공지사항 조회수 증가
	@Override
	public void updateViewCnt(int nno) throws Exception {
		sqlSession.update(NAMESPACE + "updateViewCnt", nno);
	}

}
