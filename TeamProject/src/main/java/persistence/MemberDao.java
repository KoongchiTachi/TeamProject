package persistence;

import java.util.List;

import com.kh.team.domain.MemberVo;

public interface MemberDao {
	
	public List<MemberVo> memberList() throws Exception;
	
	public void insertMember(MemberVo memberVo) throws Exception;
	
	public void selectMember(String m_id) throws Exception;
	
	public void updateMember(MemberVo memberVo) throws Exception;
	
	public void deleteMember(MemberVo memberVo) throws Exception;
	
}
