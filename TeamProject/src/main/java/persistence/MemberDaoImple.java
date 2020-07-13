package persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.MemberVo;

@Repository
public class MemberDaoImple implements MemberDao {

	private static final String NAMESPACE = "mappers.board-mapper.";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public MemberVo selectMemberByIdAndPw(String m_id, String m_pw) throws Exception {
		Map<String, String> paramMap = new HashMap<>();
		paramMap.put("m_id", m_id);
		paramMap.put("m_pw", m_pw);
		return sqlSession.selectOne(NAMESPACE + "selectMemberByIdAndPw", paramMap); 
	}
	
	@Override
	public List<MemberVo> memberList() throws Exception {
		return sqlSession.selectList(NAMESPACE + "memberList");
	}

	@Override
	public void insertMember(MemberVo memberVo) throws Exception {
		sqlSession.insert(NAMESPACE + "insertMember", memberVo);
	}

	@Override
	public MemberVo selectMember(String m_id) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "selectMember", m_id);
	}

	@Override
	public void updateMember(MemberVo memberVo) throws Exception {
		sqlSession.update(NAMESPACE + "updateMember", memberVo);
	}

	@Override
	public void deleteMember(MemberVo memberVo) throws Exception {
		sqlSession.delete(NAMESPACE + "deleteMember", memberVo);
	}

}
