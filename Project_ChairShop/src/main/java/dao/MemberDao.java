package dao;

import java.util.List;
import java.util.Map;

import vo.MemberVo;

public interface MemberDao {
	List<MemberVo> selectList();
	List<MemberVo> selectList(Map map);
	MemberVo selectOne(int m_idx);
	MemberVo selectOne(String m_id);
	MemberVo selectOne(MemberVo vo);
	
	int insert(MemberVo vo);
	int delete(int m_idx);
	int update(MemberVo vo);
	int update_pwd(MemberVo vo);
	int selectRowTotal(Map map);


	
}
